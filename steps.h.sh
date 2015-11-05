#!/bin/bash

cat << EEE

- adduser newUser
- adduser newUser sudo // add to sudo group
- usermod -d home-folder newUser //
- chown -R newUser.newUser home-folder

EEE
