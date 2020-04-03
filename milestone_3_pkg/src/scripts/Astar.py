#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# ______Author____________
# Name: Ilian Corneliussen
# Email: ilianc@kth.se

from math import hypot,pi,sqrt,isinf
import random
import matplotlib.pyplot as plt
import time
import sys
import os
import json

import numpy as np
from mpl_toolkits.mplot3d import Axes3D


class hashtable():
    def __init__(self):
        self.table = {}

    def __getitem__(self, key):
        try:
            value = self.table[key].pop(-1)
            if self.table[key] == []:
                del self.table[key]
            return value
        except:
            print("Invalid key!")
            return None

    def __setitem__(self, key, value):
        try:
            if self.table[key]:
                self.table[key].append(value)
        except:
            self.table[key] = []
            self.table[key].append(value)

def cuboid_data(o, size=(1,1,1)):
    # code taken from
    # https://stackoverflow.com/a/35978146/4124317
    # Includes cuboid_data and plotCubeAt.
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
        self.cSpace = 0.2

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
        ax.set_xlim3d(self.X_limit["min"], self.X_limit["max"])
        ax.set_ylim3d(self.Y_limit["min"], self.Y_limit["max"])
        ax.set_zlim3d(self.Z_limit["min"], self.Z_limit["max"])
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
            if pos_start[0]-pos_stop[0] == 0: size[0] = self.cSpace
            if pos_start[1]-pos_stop[1] == 0: size[1] = self.cSpace
            if pos_start[2]-pos_stop[2] == 0: size[2] = self.cSpace
            plotCubeAt(pos=pos_start, size=size, ax=ax, color=self.WALL["color"])

        x_line = []
        y_line = []
        z_line = []
        for p in self.path:
            x_line.append(p[0]*self.discretization + self.X_limit["min"])
            y_line.append(p[1]*self.discretization + self.Y_limit["min"])
            z_line.append(p[2]*self.discretization + self.Z_limit["min"])
            x = p[0]*self.discretization + self.X_limit["min"]
            y = p[1]*self.discretization + self.Y_limit["min"]
            z = p[2]*self.discretization + self.Z_limit["min"]
            path_pos = [x, y, z]
            plotCubeAt(pos=path_pos, size=(0.2,0.2,0.1), ax=ax, color=self.PATH["color"])
        ax.plot3D(x_line, y_line, z_line, linewidth=5, color='blue')

        plt.draw()
        plt.pause(0.001)

    def ifValid(self, gridPoss):
        if gridPoss[0] < self.rows and gridPoss[0] >= 0:
            if gridPoss[1] < self.cols and gridPoss[1] >= 0:
                if gridPoss[2] < self.depth and gridPoss[2] >= 0:
                    if self.grid[gridPoss[0]][gridPoss[1]][gridPoss[2]] == 0.0:
                        return True     
        return False

    def getGrid(self):
        with open(self.jsonfile, 'rb') as f:
            self.world = json.load(f)

        # Setting limits
        self.X_limit["min"] = self.world["airspace"]["min"][0]
        self.X_limit["max"] = self.world["airspace"]["max"][0]

        self.Y_limit["min"] = self.world["airspace"]["min"][1]
        self.Y_limit["max"] = self.world["airspace"]["max"][1]

        self.Z_limit["min"] = self.world["airspace"]["min"][2]
        self.Z_limit["max"] = self.world["airspace"]["max"][2]

        self.rows = int((self.X_limit["max"] - self.X_limit["min"])/self.discretization) + 1
        self.cols = int((self.Y_limit["max"] - self.Y_limit["min"])/self.discretization) + 1
        self.depth = int((self.Z_limit["max"] - self.Z_limit["min"])/self.discretization) + 1
        self.grid = np.zeros((self.rows, self.cols, self.depth))

        # If we want prints set VEROSE to True.
        if self.VERBOSE == True:          
            print("Rows: ", self.rows)
            print("Cols: ", self.cols)
            print("Depth: ", self.depth)
            print("Grid shape(X, Y, Z): ", self.grid.shape)

        self.addWalls()

    def map2grid(self, position):
        if self.X_limit['min'] != 0:
            position[0] = position[0] - self.X_limit['min']
        
        if self.Y_limit['min'] != 0:
            position[1] = position[1] - self.Y_limit['min']
        
        if self.Z_limit['min'] != 0:
            position[2] = position[2] - self.Z_limit['min']
    
        return position

    def grid2map(self, position):
        if self.X_limit['min'] != 0:
            position[0] = position[0] + self.X_limit['min']
        
        if self.Y_limit['min'] != 0:
            position[1] = position[1] + self.Y_limit['min']
        
        if self.Z_limit['min'] != 0:
            position[2] = position[2] + self.Z_limit['min']
    
        return position
    

    def addWalls(self):
        # Adding wall to the grid. 
        for wall in self.world["walls"]:
            
            # delta_x = (wall["plane"]["stop"][0] - wall["plane"]["start"][0])/self.discretization
            # delta_y = (wall["plane"]["stop"][1] - wall["plane"]["start"][1])/self.discretization
            # if self.VERBOSE == True:
            #         print("WALL:    start", wall["plane"]["start"], "   stop", wall["plane"]["stop"])
            #         print("delta_x = {}, delta_y = {}".format(delta_x,delta_y))
            # if delta_x != 0 and delta_y != 0: # SNEA VÄGGAR
            #     x_start = (wall["plane"]["start"][0])/self.discretization
            #     x_stop = (wall["plane"]["stop"][0])/self.discretization
            #     y_start = (wall["plane"]["start"][1])/self.discretization
            #     y_stop = (wall["plane"]["stop"][1])/self.discretization
            #     z_start = (wall["plane"]["start"][2] - self.cSpace)/self.discretization
            #     z_stop = (wall["plane"]["stop"][2] + self.cSpace)/self.discretization
            #     tmp = [x_start, x_stop]
            #     x_start = min(tmp)
            #     x_stop = max(tmp)
            #     tmp = [y_start, y_stop]
            #     y_start = min(tmp)
            #     y_stop = max(tmp)
            #     tmp = [z_start, z_stop]
            #     z_start = min(tmp)
            #     z_stop = max(tmp)
            #     # Line equation to estract lines on the walls. 
            #     k = delta_y/delta_x
            #     m = y_start - k*x_start
            #     for z in range(int(z_start), int(z_stop)):
            #         x_line = x_start
            #         while x_line < x_stop:
            #             y_line = k*x_line + m
            #             for x in range(int(x_line - self.cSpace/self.discretization), int(x_line + self.cSpace/self.discretization)):
            #                 for y in range(int(y_line - self.cSpace/self.discretization), int(y_line + self.cSpace/self.discretization)):
            #                     if self.ifValid([x,y,z]):
            #                         self.grid[x][y][z] = self.WALL["index"]
            #                         # if z == 0:
            #                         #     print("x: {}, y: {}, z: {}".format(x,y,z))
            #             x_line += self.discretization/4
            # else:
            
            if self.VERBOSE == True:
                print("WALL:    start", wall["plane"]["start"], "   stop", wall["plane"]["stop"])

            start = [0,0,0]
            stop = [0,0,0]
            start[0] = wall["plane"]["start"][0] - self.cSpace
            stop[0] = wall["plane"]["stop"][0] + self.cSpace
            start[1] = wall["plane"]["start"][1] - self.cSpace
            stop[1] = wall["plane"]["stop"][1] + self.cSpace
            start[2] = wall["plane"]["start"][2] - self.cSpace
            stop[2] = wall["plane"]["stop"][2] + self.cSpace
            start = self.map2grid(start)
            stop = self.map2grid(stop)
            x_start = start[0]/self.discretization
            x_stop = stop[0]/self.discretization
            y_start = start[1]/self.discretization
            y_stop = stop[1]/self.discretization
            z_start = start[2]/self.discretization
            z_stop = stop[2]/self.discretization

            for x in range(int(x_start), int(x_stop)):
                for y in range(int(y_start), int(y_stop)):
                    for z in range(int(z_start), int(z_stop)):
                        if self.VERBOSE == True and z == 0:
                                print("x={}, y={}, z={}".format(x,y,z))
                                print('X_limit=',abs(self.X_limit['min'])/self.discretization)
                        if self.ifValid([x,y,z]):
                            self.grid[x][y][z] = self.WALL["index"]

    def getWayPoints(self):
        for p in self.path:
            point = []
            point.append(p[0]*self.discretization)
            point.append(p[1]*self.discretization)
            point.append(p[2]*self.discretization)
            point = self.grid2map(point)
            self.droneWayPoints.insert(0,point)

    class Astar_node():
        def __init__(self, position, parent = None, cost = 0):
            self.position = position
            self.cost = cost
            self.costToHome = 0
            self.parent = parent

    def reconstruct_path(self, current):
        while current.parent != None:
            self.path.append(current.position)
            current = current.parent
        self.getWayPoints()
        print("Path found!")

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
                        pos = [x_pos, y_pos, z_pos]
                        if self.ifValid(pos):
                            if (x == 1 or x == -1) and (y == 1 or y == -1) and z == 0: 
                                D = sqrt(2)
                            elif (x == 1 or x == -1) and y == 0 and (z == 1 or z == -1): 
                                D = sqrt(2) 
                            elif x == 0 and (y == 1 or y == -1) and (z == 1 or z == -1): 
                                D = sqrt(2) 
                            elif (x == 1 or x == -1) and (y == 1 or y == -1) and (z == 1 or z == -1): 
                                D = 2*sqrt(2)
                            else: 
                                D = 1
                            N = self.Astar_node(pos, current)
                            N.costToHome = current.costToHome + D
                            neigh.append( N )
        return neigh

    def heuristic(self, current, START, GOAL):
        dx = abs(GOAL[0]-current.position[0])
        dy = abs(GOAL[1]-current.position[1])
        dz = abs(GOAL[2]-current.position[2])
        costToGo = min([dx,dy,dz])     
        current.costToHome = current.costToHome

        return costToGo + current.costToHome

    def getPath(self):
        self.getGrid()

        # Initilizing goal and start point, depending on our discretization
        START = []
        GOAL = []
        START.append(self.start[0])
        START.append(self.start[1])
        START.append(self.start[2])

        GOAL.append(self.goal[0])
        GOAL.append(self.goal[1])
        GOAL.append(self.goal[2])

        START = self.map2grid(START)
        START[0] = int(START[0]/self.discretization)
        START[1] = int(START[1]/self.discretization)
        START[2] = int(START[2]/self.discretization)
        GOAL = self.map2grid(GOAL)
        GOAL[0] = int(GOAL[0]/self.discretization)
        GOAL[1] = int(GOAL[1]/self.discretization)
        GOAL[2] = int(GOAL[2]/self.discretization)

        if self.VERBOSE == True:
            print("START: ", START)
            print("GOAL: ", GOAL)
            
        if not self.ifValid(GOAL):
            print("NOT A VALID GOAL POINT")
            print(GOAL)
            return False
        elif not self.ifValid(START):
            print("NOT A VALID START POINT!")
            print(START)
            return False

        # Initilizing start node.
        start = self.Astar_node(START)
        start.cost = self.heuristic(start, START, GOAL)
        openSet = hashtable()
        openSet[start.cost] = start


        tol = 2 # number of grids from. 
        while openSet.table != {}:
            current = openSet[min(openSet.table)]

            if sqrt( (current.position[0] - GOAL[0])**2 + (current.position[1] - GOAL[1])**2 + (current.position[2] - GOAL[2])**2 ) < tol:
                return self.reconstruct_path(current)

            for neighbor in self.neighbors(current):
                if self.grid[neighbor.position[0]][neighbor.position[1]][neighbor.position[2]] == 0.0:
                    neighbor.cost = self.heuristic(neighbor, START, GOAL)
                    openSet[neighbor.cost] = neighbor
                    self.grid[neighbor.position[0]][neighbor.position[1]][neighbor.position[2]] = self.PATH["index"]
        
        print("OBS! No path found.")
        return False


def main():
    map_world = open(os.path.dirname(__file__) + '/map.txt', 'r').readline()
    jsonfile = os.path.dirname(__file__) + map_world
    nav = Astar(jsonfile, 0.1, VERBOSE=1)
    nav.start =[-0.2, -0.5, 0.4]# demo01:[-0.2, -0.5, 0.4]# demo03:[4.8, -0.5, 0.4] # demo02: [4.8, -4.5, 0.4]
    nav.goal = [-0.2, 0.5, 0.4]# demo01:[-0.2, 0.5, 0.4]# demo03:[4.8, 0.5, 0.4] # demo02: [4.8, -5.5, 0.4]
    nav.getPath()
    nav.printMAP()
    plt.show()

if __name__ == "__main__":
    main()