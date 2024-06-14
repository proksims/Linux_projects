#! /bin/bash

integer='^[1-6]$'

if [ $# != 0 ]
then 
     echo "Error: should be 0 parameter. Try again"
elif ! [[ -f 'conf.conf' ]]
then
    echo "Error: no config file"
elif ! [[ -f 'set_info.sh' && -f 'print_info.sh' && -f 'set_colors.sh' ]]
then
    echo "Error: no files.sh"

else
    echo "Continue ..."
    source ./set_info.sh
    source ./conf.conf
    
    # если цвета повторяются и при этом они не дефолтны
    if [[ ($column1_background  == $column1_font_color && $column1_background != '') || ($column2_font_color == $column2_background && $column2_font_color != '') ]]
    then
        echo "Error: the font and background colors must not match"
    else 
        # проверим вводимые значения из конфиг файла
        if ! [[ $column1_background =~ $integer ]]
        then 
            column1_background=0
        fi

        if ! [[ $column1_font_color  =~ $integer ]]
        then 
            column1_font_color=0
        fi

        if ! [[ $column2_background =~ $integer ]]
        then 
            column2_background=0
        fi

        if ! [[ $column2_font_color  =~ $integer ]]
        then 
            column2_font_color=0
        fi
        
        echo "OK"
        source ./set_colors.sh $column1_background $column1_font_color $column2_background $column2_font_color
        source ./print_info.sh
    fi

fi
