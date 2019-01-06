#!/bin/sh
ninja -C v8/out.gn/x64.debug -t compdb cxx cc > compile_commands.json
gsed -i 's;/Users/gaoxiaojun/turbofan/vscode-v8/;;' compile_commands.json
