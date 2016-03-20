#!/bin/bash

array_var=(1 2 3 4 5)

echo ${array_var[0]}
echo ${array_var[*]}
echo ${array_var[@]}
echo "显示index"
echo ${!array_var[@]}

echo "index : value"
echo ${!array_var[@]} : ${array_var[@]]}


echo "number of array" ${#array_var[*]}

