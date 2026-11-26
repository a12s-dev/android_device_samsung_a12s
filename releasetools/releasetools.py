#!/bin/env python3
#
# Copyright (C) 2020-2026 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common
import re

BANNER = [
    r"____   ____            .__  _____                    .__   ",
    r"\   \ /   /____ _______|__|/ ____\____   ____ _____  |  |  ",
    r" \   Y   /\__  \\_  __ \  \   __\/  _ \_/ ___\\__  \ |  |  ",
    r"  \     /  / __ \|  | \/  ||  | (  <_> )  \___ / __ \|  |__",
    r"   \___/  (____  /__|  |__||__|  \____/ \___  >____  /____/",
    r"               \/                           \/     \/       ",
]

def FullOTA_Assertions(info):
  OTA_Assertions(info)
  return

def FullOTA_InstallBegin(info):
  OTA_InstallBegin(info)
  return

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_Assertions(info):
  OTA_Assertions(info)
  return

def IncrementalOTA_InstallBegin(info):
  OTA_InstallBegin(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImage(info, basename, dest):
  name = basename
  data = info.input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def _getprop(info, key):
  import os
  for attr in ("input_tmp", "target_tmp", "source_tmp"):
    root = getattr(info, attr, None)
    if not root:
      continue
    try:
      with open(os.path.join(root, "SYSTEM", "build.prop")) as f:
        for line in f:
          if line.startswith(key + "="):
            return line.split("=", 1)[1].strip()
    except (IOError, OSError):
      pass
  return ""

def OTA_InstallBegin(info):
  ver = _getprop(info, "ro.lineage.version")
  date = _getprop(info, "ro.build.date")
  for line in BANNER:
    info.script.Print(line.replace("\\", "\\\\").replace('"', '\\"'))
  info.script.Print("")
  info.script.Print("LineageOS %s" % (ver,))
  info.script.Print("Samsung Galaxy A12 (a12s)")
  info.script.Print("Built by varifocal  -  github.com/varifocal")
  info.script.Print("Build date  %s" % (date,))
  info.script.Print("")
  info.script.Print("Installing LineageOS, do not power off...")
  info.script.Print("")
  return

def OTA_Assertions(info):
  return

def PrintInfo(info, dest):
  info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))

def OTA_InstallEnd(info):
  PrintInfo(info, "/dev/block/by-name/dtbo")
  AddImage(info, "dtbo.img", "/dev/block/by-name/dtbo")
  PrintInfo(info, "/dev/block/by-name/vbmeta")
  AddImage(info, "vbmeta.img", "/dev/block/by-name/vbmeta")
  info.script.Print("")
  info.script.Print("Installation complete, reboot to system.")
  return
