// Generated by gencpp from file crazyflie_gazebo/Takeoff.msg
// DO NOT EDIT!


#ifndef CRAZYFLIE_GAZEBO_MESSAGE_TAKEOFF_H
#define CRAZYFLIE_GAZEBO_MESSAGE_TAKEOFF_H

#include <ros/service_traits.h>


#include <crazyflie_gazebo/TakeoffRequest.h>
#include <crazyflie_gazebo/TakeoffResponse.h>


namespace crazyflie_gazebo
{

struct Takeoff
{

typedef TakeoffRequest Request;
typedef TakeoffResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Takeoff
} // namespace crazyflie_gazebo


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::crazyflie_gazebo::Takeoff > {
  static const char* value()
  {
    return "b665b6c83a196e4774268cc26329b159";
  }

  static const char* value(const ::crazyflie_gazebo::Takeoff&) { return value(); }
};

template<>
struct DataType< ::crazyflie_gazebo::Takeoff > {
  static const char* value()
  {
    return "crazyflie_gazebo/Takeoff";
  }

  static const char* value(const ::crazyflie_gazebo::Takeoff&) { return value(); }
};


// service_traits::MD5Sum< ::crazyflie_gazebo::TakeoffRequest> should match 
// service_traits::MD5Sum< ::crazyflie_gazebo::Takeoff > 
template<>
struct MD5Sum< ::crazyflie_gazebo::TakeoffRequest>
{
  static const char* value()
  {
    return MD5Sum< ::crazyflie_gazebo::Takeoff >::value();
  }
  static const char* value(const ::crazyflie_gazebo::TakeoffRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::crazyflie_gazebo::TakeoffRequest> should match 
// service_traits::DataType< ::crazyflie_gazebo::Takeoff > 
template<>
struct DataType< ::crazyflie_gazebo::TakeoffRequest>
{
  static const char* value()
  {
    return DataType< ::crazyflie_gazebo::Takeoff >::value();
  }
  static const char* value(const ::crazyflie_gazebo::TakeoffRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::crazyflie_gazebo::TakeoffResponse> should match 
// service_traits::MD5Sum< ::crazyflie_gazebo::Takeoff > 
template<>
struct MD5Sum< ::crazyflie_gazebo::TakeoffResponse>
{
  static const char* value()
  {
    return MD5Sum< ::crazyflie_gazebo::Takeoff >::value();
  }
  static const char* value(const ::crazyflie_gazebo::TakeoffResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::crazyflie_gazebo::TakeoffResponse> should match 
// service_traits::DataType< ::crazyflie_gazebo::Takeoff > 
template<>
struct DataType< ::crazyflie_gazebo::TakeoffResponse>
{
  static const char* value()
  {
    return DataType< ::crazyflie_gazebo::Takeoff >::value();
  }
  static const char* value(const ::crazyflie_gazebo::TakeoffResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // CRAZYFLIE_GAZEBO_MESSAGE_TAKEOFF_H
