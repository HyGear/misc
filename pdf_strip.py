# -*- coding: utf-8 -*-
"""
Created on Fri May 29 09:53:12 2015
"""
import os, os.path, sys
from os import listdir
from os.path import isfile, join

start_dir = os.getcwd().replace("\\","\\\\") + "\\\\"
qpdf = 'qpdf.exe'
pwd_string = ""
count = 0
pdf_count = 0
# Need to document this section. Also need to rewrite...what does "count" do?
for arg in sys.argv:
    #If the first ten letters of arg are "--password" then the remaining
    #part of the string is the password (minus the space at the beginning).
    if arg[:10] == "--password" and count == 0:
        pwd_string = arg[11:]
        
    #If the arg is not equal to "--password" and this is the first time in
    #the loop, arg should be a starting directory
    elif arg[:10] != "--password" and count == 0:
        start_dir = arg.replace("\\","\\\\")
    
    #If we have already been through the loop once, then arg should be
    #a starting directory.
    else:
        start_dir = arg.replace("\\","\\\\")        
    #Count lets us know we have already been through the loop at least once.
    count =+1
    
def makeList():
    global start_dir,qpdf,pwd_string,pdf_count 
    
    #Build the list of files from the starting directory
    files = [ f for f in listdir(start_dir) if isfile(join(start_dir,f))]
    for f in files:
        #Make the output name string
        output_set = os.path.splitext(os.path.basename(f))
        if output_set[1] == ".pdf":
            output_file = start_dir + "\\\\" + output_set[0] + "_mod.pdf"
            input_file = start_dir + "\\\\" + f
            #Run the qpdf command:
            command_string = '%s --password=%s --decrypt "%s" "%s"' % (qpdf, pwd_string, input_file, output_file)
            print command_string
            os.system(command_string)
            pdf_count =+1
            
def Main():
    makeList()
    print "%s PDF files processed" % pdf_count
if __name__ == "__main__":
    Main()            