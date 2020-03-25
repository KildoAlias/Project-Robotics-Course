"Basic world.json viewer using PyGame / OpenGL."


import sys
import time
import json

import pygame
import numpy as np
from OpenGL import GL, GLU


def draw_grid(cells=10, cell_size=0.1):
    GL.glColor(0.4, 0.4, 0.4, 0.5)
    for nx in range(-cells//2, cells//2):
        xs = (nx*cell_size, (nx+1)*cell_size)
        for ny in range(-cells//2, cells//2):
            ys = (ny*cell_size, (ny+1)*cell_size)
            GL.glBegin(GL.GL_LINE_STRIP)
            for x, y in ((0, 0), (1, 0), (1, 1), (0, 1), (0, 0)):
                GL.glVertex(xs[x], ys[y], 0.0)
            GL.glEnd()


def draw_airspace(rmin, rmax):
    r = np.array([rmin, rmax])
    GL.glBegin(GL.GL_LINES)
    GL.glColor(1, 0, 0, 1.0)
    for dim in range(3):
        for x in (0, 1):
            for y, z in ((0, 0), (1, 0), (1, 1), (0, 1)):
                rows = np.roll([x, y, z], dim)
                v = r[rows, (0, 1, 2)]
                GL.glVertex(*v)
    GL.glEnd()


def draw_wall(rmin, rmax):
    r = np.array([rmin, rmax])
    GL.glBegin(GL.GL_QUADS)
    GL.glColor(0, 0.7, 0, 0.6)
    for xy, z in ((0, 0), (1, 0), (1, 1), (0, 1)):
        v = r[(xy, xy, z), (0, 1, 2)]
        GL.glVertex(*v)
    GL.glEnd()


def draw_marker(num, position, orientation, w=0.197, h=0.197):
    GL.glColor(0, 0, 0.8, 0.9)
    GL.glPushMatrix()
    tx, ty, tz = position
    GL.glTranslate(tx, ty, tz)
    pitch, roll, yaw = orientation
    GL.glRotate(yaw, 0, 0, 1)
    GL.glRotate(roll, 0, 1, 0)
    GL.glRotate(pitch+90, 1, 0, 0)
    GL.glScale(w, h, 1.0)
    GL.glBegin(GL.GL_QUADS)
    GL.glVertex(-0.5, -0.5, -0.001)
    GL.glVertex(-0.5, +0.5, -0.001)
    GL.glVertex(+0.5, +0.5, -0.001)
    GL.glVertex(+0.5, -0.5, -0.001)
    GL.glEnd()
    GL.glPopMatrix()


def draw_roadsign(sign, position, orientation, w=0.2, h=0.2):
    GL.glColor(0.8, 0, 0.8, 0.9)
    GL.glPushMatrix()
    tx, ty, tz = position
    GL.glTranslate(tx, ty, tz)
    pitch, roll, yaw = orientation
    GL.glRotate(yaw, 0, 0, 1)
    GL.glRotate(roll, 0, 1, 0)
    GL.glRotate(pitch+90, 1, 0, 0)
    GL.glScale(w, h, 1.0)
    GL.glBegin(GL.GL_QUADS)
    GL.glVertex(-0.5, -0.5, -0.001)
    GL.glVertex(-0.5, +0.5, -0.001)
    GL.glVertex(+0.5, +0.5, -0.001)
    GL.glVertex(+0.5, -0.5, -0.001)
    GL.glEnd()
    GL.glPopMatrix()


class AttributeDict(dict):
    "This makes it so that you can do d.foo instead of d['foo']."
    @classmethod
    def object_hook(cls, d):
        self = cls(d)
        self.__dict__ = self
        return self


def main(args=sys.argv[1:]):

    json_fn, = args
    with open(json_fn) as f:
        world = json.load(f, object_hook=AttributeDict.object_hook)

    w, h = 800, 600

    pygame.init()
    pygame.display.set_mode((w, h), pygame.DOUBLEBUF | pygame.OPENGL)

    GL.glMatrixMode(GL.GL_PROJECTION)
    # 45° FoV, aspect ratio, zNear clip, zFar clip.
    GLU.gluPerspective(45, w/h, 0.2, 20.0)
    origin = np.mean(np.array([world.airspace.min, world.airspace.max]), axis=0)

    GL.glEnable(GL.GL_BLEND)
    #GL.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE_MINUS_SRC_ALPHA)
    GL.glEnable(GL.GL_DEPTH_TEST)
    GL.glDepthFunc(GL.GL_LESS)


    GL.glMatrixMode(GL.GL_MODELVIEW)

    # Viewport starts with Y up and Z going away from the camera
    GL.glTranslate(0.0, -0.0, -3)
    GL.glRotate(-75.0, 1, 0, 0)

    t0 = time.time()

    while True:

        t1 = time.time()
        dt = t1-t0
        t0 = t1

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                return

        GL.glClear(GL.GL_COLOR_BUFFER_BIT | GL.GL_DEPTH_BUFFER_BIT)
        GL.glRotate(-30*dt, 0, 0, 1)

        GL.glPushMatrix()
        GL.glTranslate(*-origin)

        draw_grid()
        draw_airspace(world.airspace.min, world.airspace.max)
        for wall in world.walls:
            draw_wall(wall.plane.start, wall.plane.stop)
        for marker in world.markers:
            draw_marker(marker.id, marker.pose.position, marker.pose.orientation)
        for roadsign in world.roadsigns:
            draw_roadsign(roadsign.sign, roadsign.pose.position, roadsign.pose.orientation)

        GL.glPopMatrix()

        pygame.display.flip()
        pygame.time.wait(int(1000/60 - dt))


if __name__ == "__main__":
    main()
