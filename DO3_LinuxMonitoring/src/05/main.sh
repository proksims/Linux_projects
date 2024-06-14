#! /bin/bash

#  Начало таймера
TIME_SCRIPT_START=$(date +%s.%N)

dir=$1
if [ $# != 1 ]
then
    echo "Error: should be 1 parameters. For example: main.sh /var/log/"

elif ! [ -d $dir ]
then
    echo "Error: not directory. For example: main.sh /var/log/"

elif ! [[ ${dir: -1} = '/' ]]
then
    echo "Error: need slash in the end. For example: main.sh /var/log/"

elif ! [[ -f 'print_info.sh' ]]
then
    echo "Error: no print_info.sh"

else
    chmod +x print_info.sh
    source ./print_info.sh $dir
fi

#  Конец таймера
TIME_SCRIPT_END=$(date +%s.%N)
echo "Script execution time (in seconds) = "  `echo "$TIME_SCRIPT_END $TIME_SCRIPT_START" | awk '{printf "%.1lf", $1-$2}'`
