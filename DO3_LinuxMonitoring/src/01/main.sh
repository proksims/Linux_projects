#!/bin/bash

# рег выражения
# ^ — начало текста (строки)
# $ — конец текста (строки)

# есть ли 1 параметр
if [ $# != 1 ]
then 
    echo "incorrect, input parameter"
else
    # число ли это
    if [[ $1 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]
    then 
        echo "incorrect, input text"
    else 
        echo $1
    fi
fi
