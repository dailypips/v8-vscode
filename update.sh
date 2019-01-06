#!/bin/sh
cd v8
git pull
gclient sync
gn gen out.gn/x64.debug
ninja -j4 -C out.gn/x64.debug
cd ..
ninja -C v8/out.gn/x64.debug -t compdb cxx cc > compile_commands.json
gsed -i 's;/Users/gaoxiaojun/turbofan/vscode-v8/;;' compile_commands.json
