#!/usr/bin/python

import yaml
import os
from collections import Counter

_kw_def_file = open(__path__[0] + os.sep + 'keyword_definitions.yaml')

kw_def = yaml.load(''.join(_kw_def_file.readlines()))

def write(keyword, parameters=[], data=[]):
    ret = []
    ret.append('*{:s}'.format(keyword))
    cards = kw_def['keywords'][keyword]['cards']
    if cards is None:
        cards = []
    line_value_repeats = []
    count = Counter()
    for i in cards:
        fields = [j['name'] for j in i['fields']]
        if not i['repeat']:
            #if not cards['optional'] or len(set(fields) & set(parameters)) > 0:
            line_comment = ''
            line_value = ''
            for j in i['fields']:
                type = j['format'][0]
                length = int(j['format'][1:])
                line_comment += ('{:>' + str(length) + 's}').format(j['name'].lower())
                if j['name'] in parameters:
                    value = parameters[j['name']]
                    form = {'F':'G', 'S':'s', 'I':'d'}
                    line_value += (' {:>' + str(length-1) + form[type] + '}').format(value)
                else:
                    line_value += ' ' * length
            line_comment = kw_def['comment'] + line_comment[1:]
            ret.append(line_comment)
            ret.append(line_value)
        else:
            line_value = ['']
            for j in i['fields']:
                type = j['format'][0]
                length = int(j['format'][1:])
                line_value[0] += ('{:>' + str(length) + 's}').format(j['name'].lower())
            line_value[0] = kw_def['comment'] + line_value[0][1:]
            for j in data:
                #import pdb; pdb.set_trace()
                try:
                    length_line_data = len(j)
                    line_value.append('')
                except:
                    length_line_data = 0
                for k in range(length_line_data):
                    type = i['fields'][k]['format'][0]
                    length = int(i['fields'][k]['format'][1:])
                    value = j[k]
                    form = {'F':'.' + (str(length-6) + 'G'), 'S':'s', 'I':'d'}
                    
                    line_value[-1] += ((' {:>' + str(length-1) + form[type] + '}').format(value))
            line_value_repeats.append(line_value)
            #ret.append(line_value)
            count['repeats'] += 1
        
    #import pdb; pdb.set_trace()
    while len(line_value_repeats) > 0:
        try:
            for i in range(len(line_value_repeats)):
                ret.append(line_value_repeats[i].pop(0))
        except:
            break
        
    ret = '\n'.join(ret)
    return ret
    
    
    
