#start: 1398/12/13 by --Mojtaba Jafargholizadeh--
# -*- coding: utf-8 -*-

import tkinter as tk
from tkinter.filedialog import askopenfilename
from colorama import init
from colorama import Fore, Back, Style
import os
import shutil


#---------- Initializing ----------
init()
#------------------------- Workspace

tk.Tk().withdraw()
script_file = open('Script-Convert-git2xml.asm.txt', mode='w', encoding='utf8')
script_file.write('; Set breakpoint before call, then run script :)\n')
script_file.write('mov befor_call, eip\n')
script_file.write('mov git_addr, enter git addr on mem\n')
script_file.write('mov xml_addr, enter xml addr on mem\n\n')
script_file.write('Start:\n')
script_file.write('\tmov addr, git_addr\n')
script_file.write('\tmov count, 0\n')
Main_dir = tk.filedialog.askdirectory(title='Select Node Directory')
for _node in os.listdir(Main_dir):
    if _node[6:] == '.git':
        name = _node[:6]
        # print(name)
        script_file.write(name + ':\n')
        for i in name:
            script_file.write('\tFILL addr, 1, ' + str(hex(ord(i)))[2:] + '\n')
            script_file.write('\tinc addr\n')
        
        script_file.write('\tmov addr, xml_addr\n')
        script_file.write('\tinc count\n')
        script_file.write('\tcmp count, 1\n')
        script_file.write('\tje ' + name + '\n')
        script_file.write('\tcall F8\n')
        script_file.write('\tlog "' + name + ' done "\n\n')
    
    else:
        print(_node)
        



script_file.write('F8:\n')
script_file.write('\tsto\n')
script_file.write('\tcmp eip, befor_call\n')
script_file.write('\tje F8\n')
script_file.write('\tmov eip, befor_call\n')
script_file.write('\tmov addr, git_addr\n')
script_file.write('\tmov count, 0\n')
script_file.write('\tret\n')

    

