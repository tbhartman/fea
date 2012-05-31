#/usr/bin/python

from fea import lsdyna
import unittest
import os

class D3hsp(unittest.TestCase):
    
    def __init__(self):
        test_file = os.sep.join(__path__[0], 'test_files', 'd3hps')
        self.test_file = open(test_file)
        self.test_str = self.test_file.read()

    def test_nodes(self):
        
