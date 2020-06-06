#!/usr/bin/env python 2.x
# -*- coding:utf-8 -*-
# version = 1.4

import file
import os

jit = "/opt/openresty/luajit/bin/luajit"
path = "/opt/openresty/openstar"
ExcludePath = []
ExcludePath.append("/opt/openresty/openstar/lib/plugin/")
ExcludeFile = []
# ExcludeFile.append("/opt/openresty/openstar/lib/xx.lua")


scan = file.ScanFile(path, None, '.lua')
subdirs, files = scan.scan()


for f in files:
    for p in ExcludePath:
        if f.startswith(p):
            ExcludeFile.append(f)
            print("PATH:\t" + f)

for f in files:
    if f in ExcludeFile:
        pass
    else:
        cmd = jit + ' -b ' + f + ' ' + f
        print(cmd)
        os.system(cmd)
