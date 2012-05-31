#!/usr/bin/python

import io

class LsDynaFile(io.TextIOWrapper):
    def __init__(self, *args, **kw):
        buffered = open(args[0], 'wb')
        super(LsDynaFile,self).__init__(buffered, *args[1:], **kw)
    def __repr__(self):
        return '<' + str(self.__class__).split("'")[1] + '>'
    
    def hi(self):
        pass

class D3hsp(LsDynaFile):
    
    def hi(self):
        return 'hi'

