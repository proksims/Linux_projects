#! /bin/bash

integer='^[1-6]$'
if [ $# != 4 ]
then
    echo "Error: should be 4 parameters. Try again"

elif ! [[ $1 =~ $integer  && $2 =~ $integer && $3 =~ $integer && $4 =~ $integer ]]
then
    echo "Error: 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black. Try again"

elif [[ $1 = $2 || $3 = $4 ]]
then
    echo "Error: the font and background colors must not match"

elif ! [[ -f 'set_info.sh' && -f 'print_info.sh' && -f 'set_colors.sh' ]]
then
    echo "Error: no files.sh"

else
    echo "OK"
    source ./set_info.sh
    source ./set_colors.sh
    source ./print_info.sh
fi
