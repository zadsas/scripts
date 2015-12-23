#!/bin/bash
sudo lsof -i -n | egrep '\<ssh\>'
