# -*- coding: utf-8 -*-
"""
Created on Tue Aug 22 10:08:41 2017

@author: XC100082
"""

from Tkinter import *
import tkMessageBox


root = Tk()
root.wm_title("Anaglyph Color Map")

RText=StringVar()
RText.set("R")
labelR=Label(root, textvariable=RText, height=8)
labelR.pack(side="left")

Rvalue=StringVar()
Rvalue.set("0")
entryR=Entry(root,textvariable=Rvalue,width=5)
entryR.pack(side="left")

GText=StringVar()
GText.set("G")
labelG=Label(root, textvariable=GText, height=8)
labelG.pack(side="left")

Gvalue=StringVar()
Gvalue.set("0")
entryG=Entry(root, textvariable=Gvalue, width=5)
entryG.pack(side="left")

BText=StringVar()
BText.set("B")
labelB=Label(root, textvariable=BText, height=8)
labelB.pack(side="left")

Bvalue=StringVar()
Bvalue.set("0")
entryB=Entry(root, textvariable=Bvalue, width=5)
entryB.pack(side="left")

hcolor1=Canvas(root,width=200,height=50)
hcolor1.pack()
h1=hcolor1.create_rectangle(0,0,200,50,fill="white")

hcolor2=Canvas(root,width=200,height=50)
hcolor2.pack()
h2=hcolor2.create_rectangle(0,0,200,50,fill="black")

def error_msg(s1,s2):
    emsg = Tk()
    emsg.withdraw()
    tkMessageBox.showerror(s1,s2)
    emsg.destroy()
    return True

def callback():
    try:
        R=int(Rvalue.get())
        G=int(Gvalue.get())
        B=int(Bvalue.get())
    except ValueError:
        print("Input is not an integer")
        error_msg("Bad value", "Please enter a valid integer")
    else:
        #print(R,G,B)
        if (R < 0 or R > 255) or (G < 0 or G > 255) or (B < 0 or B > 255):
            error_msg("Bad value","Enter a value between 0 and 255")
        R1=255-R
        G1=255-G
        B1=255-B
        color1_string="(" + str(R) + "," + str(G) + "," + str(B) + ")"
        color2_string="(" + str(R1) + "," + str(G1) + "," + str(B1) + ")"
        #print(R1,G1,B1)
        colorhex1=rgb2hex(R,G,B)
        #print colorhex1
        colorhex2=rgb2hex(R1,G1,B1)
        #print colorhex2
        hcolor1.itemconfig(h1, fill=colorhex1)
        hcolor2.itemconfig(h2, fill=colorhex2)


def rgb2hex(r,g,b):
    hex = "#{:02x}{:02x}{:02x}".format(r,g,b)
    return hex
    
b=Button(root,text="Get color", width=15,command=callback)
b.pack(side="left", anchor=CENTER)



root.mainloop()