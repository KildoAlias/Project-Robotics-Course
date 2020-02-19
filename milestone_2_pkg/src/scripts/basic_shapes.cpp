#include <ros/ros.h>
#include <planning_environment/models/collision_models.h>
#include <arm_navigation_msgs/PlanningScene.h>
#include <arm_navigation_msgs/GetPlanningScene.h>
#include <geometric_shapes/shape_operations.h>
#include <planning_environment/util/construct_object.h>

static const std::string SET_PLANNING_SCENE_DIFF_NAME = "/environment_server/set_planning_scene_diff";

class PlanningSceneTest
{
public:
    PlanningSceneTest()
    {
        collision_object_pub_  = nh_.advertise<arm_navigation_msgs::CollisionObject>("collision_object", 10);
        cm_ = new planning_environment::CollisionModels("robot_description");
        kinematic_state_ = new planning_models::KinematicState(cm_->getKinematicModel());
        kinematic_state_->setKinematicStateToDefault();
        while(!ros::service::waitForService(SET_PLANNING_SCENE_DIFF_NAME, ros::Duration(1.0)))
        {
          ROS_INFO_STREAM("Waiting for set_planning_scene_diff service " << SET_PLANNING_SCENE_DIFF_NAME);
        }
        get_planning_scene_client_ = nh_.serviceClient<arm_navigation_msgs::GetPlanningScene> (SET_PLANNING_SCENE_DIFF_NAME);
    }
    ~PlanningSceneTest()
    {

    }

    bool getPlanningScene()
    {
        arm_navigation_msgs::CollisionObject collision_objects;
        collision_objects.operation.operation = arm_navigation_msgs::CollisionObjectOperation::ADD;
        collision_objects.header.stamp = ros::Time::now();
        collision_objects.header.frame_id = "/" + cm_->getWorldFrameId();
        collision_objects.id = "testObj";

        geometry_msgs::Pose cylinderPose;
        cylinderPose.position.x = 0.4;
        cylinderPose.position.y = 0.4;
        cylinderPose.position.z = 0.95;//0.93
        cylinderPose.orientation.x = 0;
        cylinderPose.orientation.y = 0;
        cylinderPose.orientation.z = 0;
        cylinderPose.orientation.w = 1;
        arm_navigation_msgs::Shape cylinder_shape;
        cylinder_shape.type = arm_navigation_msgs::Shape::CYLINDER;
        cylinder_shape.dimensions.resize(2);
        cylinder_shape.dimensions[0] = 0.028;//radius
        cylinder_shape.dimensions[1] = 0.12;//height
        collision_objects.shapes.push_back(cylinder_shape);
        collision_objects.poses.push_back(cylinderPose);

        collision_object_pub_.publish(collision_objects);

        //must call the set_planning_scene_diff service to notify other nodes
        if(kinematic_state_ != NULL)
        {
          ROS_INFO("Reverting planning scene to default.");
          cm_->revertPlanningScene(kinematic_state_);
          kinematic_state_ = NULL;
        }
        arm_navigation_msgs::GetPlanningScene::Request planning_scene_req;
        arm_navigation_msgs::GetPlanningScene::Response planning_scene_res;
        if(!get_planning_scene_client_.call(planning_scene_req, planning_scene_res)) {
            ROS_ERROR("Can't get planning scene");
            return false;
        }
        kinematic_state_ = cm_->setPlanningScene(planning_scene_res.planning_scene);
        if(kinematic_state_ == NULL)
        {
          ROS_ERROR("Something wrong with planning scene");
          return false;
        }

        return true;
    }

    ros::NodeHandle nh_;
    ros::ServiceClient get_planning_scene_client_;
    ros::Publisher collision_object_pub_;

    planning_environment::CollisionModels* cm_;
    planning_models::KinematicState* kinematic_state_;

};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "CollisionObjectPub", ros::init_options::NoSigintHandler);

    PlanningSceneTest* pTest = new PlanningSceneTest();
    ros::Duration(5.0).sleep();//must sleep, otherwise the published info may get lost

    pTest->getPlanningScene();
    ros::waitForShutdown();
    return 0;
}