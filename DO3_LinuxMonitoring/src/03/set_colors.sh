#! /bin/bash

# Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)

WHITE="\033[97m"
RED="\033[91m"
GREEN="\033[92m"
BLUE="\033[94m"
PURPLE="\033[95m"
BLACK="\033[30m"

BGWHITE="\033[107m"
BGRED="\033[101m"
BGGREEN="\033[102m"
BGBLUE="\033[104m"
BGPURPLE="\033[105m"
BGBLACK="\033[40m"
DEFAULT='\033[0m'
OFF='\033[0m'

# Параметр 1 - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
  column1_background=$DEFAULT;
    if [[ $1 == 1 ]] ; then column1_background=$BGWHITE
    elif [[ $1 == 2 ]] ; then column1_background=$BGRED
    elif [[ $1 == 3 ]] ; then column1_background=$BGGREEN
    elif [[ $1 == 4 ]] ; then column1_background=$BGBLUE
    elif [[ $1 == 5 ]] ; then column1_background=$BGPURPLE
    elif [[ $1 == 6 ]] ; then column1_background=$BGBLACK
    fi

# Параметр 2 - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
  column1_font_color=$DEFAULT;
    if [[ $2 == 1 ]] ; then column1_font_color=$WHITE
    elif [[ $2 == 2 ]] ; then column1_font_color=$RED
    elif [[ $2 == 3 ]] ; then column1_font_color=$GREEN
    elif [[ $2 == 4 ]] ; then column1_font_color=$BLUE
    elif [[ $2 == 5 ]] ; then column1_font_color=$PURPLE
    elif [[ $2 == 6 ]] ; then column1_font_color=$BLACK
    fi

# Параметр 3 - это фон значений (после знака '=')
  column2_background=$DEFAULT;
    if [[ $3 == 1 ]] ; then column2_background=$BGWHITE
    elif [[ $3 == 2 ]] ; then column2_background=$BGRED
    elif [[ $3 == 3 ]] ; then column2_background=$BGGREEN
    elif [[ $3 == 4 ]] ; then column2_background=$BGBLUE
    elif [[ $3 == 5 ]] ; then column2_background=$BGPURPLE
    elif [[ $3 == 6 ]] ; then column2_background=$BGBLACK
    fi

# Параметр 4 - это цвет шрифта значений (после знака '=')
  column2_font_color=$DEFAULT;
    if [[ $4 == 1 ]] ; then column2_font_color=$WHITE
    elif [[ $4 == 2 ]] ; then column2_font_color=$RED
    elif [[ $4 == 3 ]] ; then column2_font_color=$GREEN
    elif [[ $4 == 4 ]] ; then column2_font_color=$BLUE
    elif [[ $4 == 5 ]] ; then column2_font_color=$PURPLE
    elif [[ $4 == 6 ]] ; then column2_font_color=$BLACK
    fi
