# -*- coding: utf-8 -*-
"""
Created on Fri Feb 20 11:28:22 2015
"""
import sys,os
f = open('output.txt','w')
outstr = u""
i = 0
for arg in sys.argv:
    if arg:
        if arg == "d":
            arg = u"\u0001" + u"d" + u"\u0002"
        if i > 0:
            outstr += u"@[" + arg + u"@]"
    i = i + 1    
print outstr
f.write(outstr)
f.close()
os.system("notepad output.txt")
"""
FLATNESS:

STRAIGHTNESS:

CYLINDRICITY:

CIRCULARITY:

PERPENDICULARITY
l

PARALLELISM:
f

ANGULARITY
a

POSITION:
j

PROFILE OF SURFACE:
d

PROFILE OF LINE:

TOTAL RUNOUT:

CIRCULAR RUNOUT:

CONCENTRICITY:

SYMMETRY:



"""