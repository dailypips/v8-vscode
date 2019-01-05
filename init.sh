#!/bin/sh
fetch v8
cd v8
gn gen out.gn/x64.debug
ninja -j6 -C out.gn/x64.debug
cd ..
ninja -C v8/out.gn/x64.debug -t compdb cxx cc > compile_commands.json
