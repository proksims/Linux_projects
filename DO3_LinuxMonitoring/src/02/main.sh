#! /bin/bash

if [ $# != 0 ]
then
    echo "Error: should be 0 parameter. Try again"
elif ! [[ -f 'set_info.sh' && -f 'print_info.sh' ]]
then
    echo "Error: no info"
else
    source ./set_info.sh
    source ./print_info.sh
    
    f_set_info
    f_print_info

    read -p "Do you want to save info? [Y/N] " result
    if [[ $result == y ]] || [[ $result == Y ]];
    then
        echo "Save!"
        f_print_info >> $(date "+%d_%m_%y_%H_%M_%S").status
    else echo "Not save!"
    fi
fi
