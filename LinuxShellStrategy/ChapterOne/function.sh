#!/bin/bash


#recursion

f() { echo $1; f hello; sleep 1;}
# f hello


#for bomb  :() { :|:& };:
