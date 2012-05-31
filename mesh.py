#!/usr/bin/python

from eng.math import space

class Node():
    
    def __init__(self, id=None, pos=None):
        self.id = id
        if pos:
            self.pos = space.Vector(pos)
        else:
            self.pos = pos

class Element():
    type = None
    connect = None
    __nodal_connectivity_definition = None
    id = None
    
    def __init__(self, id=None, connect=None):
        self.id = id
        self.connect = connect
        
    def get_centroid(self):
        pass
    

class ShellElement(Element):
    pass

class SolidElement(Element):
    pass


class Part(dict):
    
    def find_neighbors(self, element):
        pass