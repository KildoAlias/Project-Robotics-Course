#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# {Ilian Corneliussen}
# {950418-2438}
# {ilianc@kth.se}

from math import hypot,pi,sqrt,isinf
import random
import matplotlib.pyplot as plt
import time
import sys
import json
import numpy as np
from mpl_toolkits.mplot3d import Axes3D



def cuboid_data(o, size=(1,1,1)):
    # code taken from
    # https://stackoverflow.com/a/35978146/4124317
    # suppose axis direction: x: to left; y: to inside; z: to upper
    # get the length, width, and height
    l, w, h = size
    x = [[o[0], o[0] + l, o[0] + l, o[0], o[0]],  
         [o[0], o[0] + l, o[0] + l, o[0], o[0]],  
         [o[0], o[0] + l, o[0] + l, o[0], o[0]],  
         [o[0], o[0] + l, o[0] + l, o[0], o[0]]]  
    y = [[o[1], o[1], o[1] + w, o[1] + w, o[1]],  
         [o[1], o[1], o[1] + w, o[1] + w, o[1]],  
         [o[1], o[1], o[1], o[1], o[1]],          
         [o[1] + w, o[1] + w, o[1] + w, o[1] + w, o[1] + w]]   
    z = [[o[2], o[2], o[2], o[2], o[2]],                       
         [o[2] + h, o[2] + h, o[2] + h, o[2] + h, o[2] + h],   
         [o[2], o[2], o[2] + h, o[2] + h, o[2]],               
         [o[2], o[2], o[2] + h, o[2] + h, o[2]]]               
    return np.array(x), np.array(y), np.array(z)

def plotCubeAt(pos=(0,0,0), size=(1,1,1), ax=None,**kwargs):
    # Plotting a cube element at position pos
    if ax !=None:
        X, Y, Z = cuboid_data( pos, size )
        ax.plot_surface(X, Y, Z, rstride=1, cstride=1, **kwargs)

class Astar():
    def __init__(self, jsonfile, discretization = 1, VERBOSE = False):
        self.jsonfile = jsonfile
        self.world = None
        self.discretization = discretization
        self.VERBOSE = VERBOSE

        self.X_limit = {"min": 0, "max": 0}
        self.Y_limit = {"min": 0, "max": 0}
        self.Z_limit = {"min": 0, "max": 0}

        self.grid = None
        self.rows = None
        self.cols = None
        self.depth = None
        
        self.start = None
        self.goal = None
        self.position = None
        self.path = []
        self.droneWayPoints = []

        self.WALL = {"color": "grey", "index": 1} 
        self.GATE = {"color": "grey", "index": 2} 
        self.PATH = {"color": "red", "index": 3} 
        self.START = {"color": "green", "index": 4} 
        self.GOAL = {"color": "yellow", "index": 5}
        

            
    def printMAP(self):
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')
        ax.set_xlim3d(0, self.X_limit["max"])
        ax.set_ylim3d(0, self.Y_limit["max"])
        ax.set_zlim3d(0, self.Z_limit["max"])
        ax.set_xlabel('X axis')
        ax.set_ylabel('Y axis')
        ax.set_zlabel('Z axis')
        ax.set_title('Navigation with - A*')
        ax.text(self.start[0], self.start[1], self.start[2]+0.2, "START")
        ax.text(self.goal[0], self.goal[1], self.goal[2]+0.2, "GOAL")
        plotCubeAt(pos=self.start, size=(0.2,0.2,0.1), ax=ax, color=self.START["color"])
        plotCubeAt(pos=self.goal, size=(0.2,0.2,0.1), ax=ax, color=self.GOAL["color"])

        for wall in self.world["walls"]:
            pos_start = np.array(wall["plane"]["start"])
            pos_stop = np.array(wall["plane"]["stop"])
            size = np.subtract(pos_stop, pos_start)
            if pos_start[0]-pos_stop[0] == 0: size[0] = 0.2
            elif pos_start[1]-pos_stop[1] == 0: size[1] = 0.25
            elif pos_start[2]-pos_stop[2] == 0: size[2] = 0.2
            plotCubeAt(pos=pos_start, size=size, ax=ax, color=self.WALL["color"])

        for p in self.path:
            x = p[0]*self.discretization
            y = p[1]*self.discretization
            z = p[2]*self.discretization
            path_pos = [x, y, z]
            plotCubeAt(pos=path_pos, size=(0.2,0.2,0.1), ax=ax, color=self.PATH["color"])

        plt.show()

    def getGrid(self):
        with open(self.jsonfile, 'rb') as f:
            self.world = json.load(f)
        self.X_limit["min"] = self.world["airspace"]["min"][0]
        self.X_limit["max"] = self.world["airspace"]["max"][0]

        self.Y_limit["min"] = self.world["airspace"]["min"][1]
        self.Y_limit["max"] = self.world["airspace"]["max"][1]

        self.Z_limit["min"] = self.world["airspace"]["min"][2]
        self.Z_limit["max"] = self.world["airspace"]["max"][2]

        self.rows = int((self.X_limit["max"] - self.X_limit["min"])/self.discretization)
        self.cols = int((self.Y_limit["max"] - self.Y_limit["min"])/self.discretization)
        self.depth = int((self.Z_limit["max"] - self.Z_limit["min"])/self.discretization)
        self.grid = np.zeros((self.rows, self.cols, self.depth))

        if self.VERBOSE == True:          
            print("Rows: ", self.rows)
            print("Cols: ", self.cols)
            print("Depth: ", self.depth)
            print("Grid shape(X, Y, Z): ", self.grid.shape)

        for wall in self.world["walls"]:
            x_start = (wall["plane"]["start"][0] - 0.5)/self.discretization
            x_stop = (wall["plane"]["stop"][0] + 0.5)/self.discretization
            if self.VERBOSE == True:
                print("WALL:    start", wall["plane"]["start"], "   stop", wall["plane"]["stop"])
            for x in range(int(x_start), int(x_stop)):
                y_start = (wall["plane"]["start"][1] - 0.5)/self.discretization
                y_stop = (wall["plane"]["stop"][1] + 0.5)/self.discretization
                for y in range(int(y_start), int(y_stop)):
                    z_start = (wall["plane"]["start"][2] - 0.25)/self.discretization
                    z_stop = (wall["plane"]["stop"][2] + 0.25)/self.discretization
                    for z in range(int(z_start), int(z_stop)):
                        if x < self.rows and x > 0:
                            if y < self.cols and y > 0:
                                if z < self.depth and z > 0:
                                    self.grid[x][y][z] = self.WALL["index"]

    def getWayPoints(self):
        print("gakkp=")
        for p in self.path:
            point = []
            point.append(p[0]*self.discretization)
            point.append(p[1]*self.discretization)
            point.append(p[2]*self.discretization)
            print(point)
            self.droneWayPoints.append(point)

    class Astar_node():
        def __init__(self, position, parent = None, cost = 0):
            self.position = position
            self.cost = cost
            self.parent = parent

    def reconstruct_path(self, current):
        while current.parent != None:
            self.path.append(current.position)
            current = current.parent
        self.getWayPoints()
        print("PATH FOUND")

    def neighbors(self, current):
        neigh = []
        R = [-1, 0, 1]
        for x in R:
            for y in R:
                for z in R:
                    if x == y == z == 0: 
                        continue
                    else:
                        x_pos = current.position[0] + x
                        y_pos = current.position[1] + y
                        z_pos = current.position[2] + z
                        if x_pos < self.rows and x_pos > 0:
                            if y_pos < self.cols and y_pos > 0:
                                if z_pos < self.depth and z_pos > 0:
                                    pos = [x_pos, y_pos, z_pos]
                                    neigh.append( self.Astar_node(pos, current) )
        return neigh

    def heuristic(self, current, START, GOAL):
        costToGo = sqrt( (current.position[0] - GOAL[0])**2 + (current.position[1] - GOAL[1])**2 + (current.position[2] - GOAL[2])**2 )
        costToHome = sqrt( (current.position[0] - START[0])**2 + (current.position[1] - START[1])**2 + (current.position[2] - START[2])**2 )
        return costToGo + costToHome

    def getPath(self):
        self.getGrid()

        # Initilizing goal and start point, depending on our discretization
        START = []
        GOAL = []
        START.append(int(self.start[0]/self.discretization))
        START.append(int(self.start[1]/self.discretization))
        START.append(int(self.start[2]/self.discretization))

        GOAL.append(int(self.goal[0]/self.discretization))
        GOAL.append(int(self.goal[1]/self.discretization))
        GOAL.append(int(self.goal[2]/self.discretization))

        # Initilizing start node.
        start = self.Astar_node(START)
        start.cost = self.heuristic(start, START, GOAL)
        openSet = {}
        openSet[start.cost] = start


        tol = 2 # number of grids from. 
        while openSet != {}:
            current = openSet.pop(min(openSet))

            if sqrt( (current.position[0] - GOAL[0])**2 + (current.position[1] - GOAL[1])**2 + (current.position[2] - GOAL[2])**2 ) < tol:
                return self.reconstruct_path(current)

            for neighbor in self.neighbors(current):
                if self.grid[neighbor.position[0]][neighbor.position[1]][neighbor.position[2]] == 0.0:
                    neighbor.cost = self.heuristic(neighbor, START, GOAL)
                    openSet[neighbor.cost] = neighbor
                    self.grid[neighbor.position[0]][neighbor.position[1]][neighbor.position[2]] = self.PATH["index"]
        
        print("FAILED TO FIND PATH")

        

        
def main():
    nav = Astar("/home/i/l/ilianc/milestone_2_files/maps/comp.world.json",0.25)
    nav.start = [6,4,0]
    nav.goal = [1,4,0.5]
    nav.getPath()
    nav.printMAP()
    print(nav.droneWayPoints)

if __name__ == "__main__":
    main()

