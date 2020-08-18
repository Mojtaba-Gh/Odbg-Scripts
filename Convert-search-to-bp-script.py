#start: 1398/12/05 by --Mojtaba Jafargholizadeh--
# -*- coding: utf-8 -*-

import tkinter as tk
from tkinter.filedialog import askopenfilename
from colorama import init
from colorama import Fore, Back, Style
import xml.etree.ElementTree as ET
import csv
import pyodbc
import sys
import os


def Choose_File(message2show):
	print(Fore.LIGHTYELLOW_EX + message2show + ' ...')
	tk.Tk().withdraw()
	file_path = askopenfilename(filetypes =(("txt File", "*.*"),("All Files","*.*")),
									title = message2show)
	while file_path[len(file_path)-4:] != '.txt' and file_path is not '':
		print(Fore.LIGHTRED_EX + 'Wrong!! File MUST be ".xml"')
		file_path = askopenfilename(filetypes =(("txt File", "*.txt"),("All Files","*.*")),
								title = 'File MUST be ".txt"')
	print(Fore.WHITE + file_path)
	return file_path


#---------- Initializing ----------
init()
#------------------------- Workspace

tk.Tk().withdraw()
file_path = Choose_File('select txt file')
file_2_read = open(file_path, mode='r')
file_2_write = open('script-set-bp-search.asm.txt', mode='w',  encoding = 'utf-8')
lines = file_2_read.readlines()
for i in lines:
    print(i[:8])
    file_2_write.write('mov addr, ' + i[:8] +'\n')
    file_2_write.write('gci addr , SIZE \n')
    file_2_write.write('add addr, $RESULT \n')
    file_2_write.write('bp addr \n')