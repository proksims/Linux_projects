#! /bin/bash

  # Общее число папок, включая вложенные
  COUNT_DIR=$(sudo find $1 -type d | wc -l)
  echo "Total number of folders (including all nested ones) = $COUNT_DIR"
  echo ""

  # Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
  TOP_FOLDERS=$(sudo du -h $1 | sort -hr | head -n 5 | nl | awk '{print $1 " - " $2 ", " $3 }')
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):$TOP_FOLDERS"
  echo ""

  # Общее число файлов
  COUNT_FILES=$(sudo find $1 -type f | wc -l)
  echo "Total number of files = $COUNT_FILES"
  echo "Number of:"
  # Число конфигурационных файлов (с расширением .conf)
  COUNT_CONF_FILES=$(sudo find $1 -type f -name "*.conf" | wc -l)
  # COUNT_CONF_FILES=$(find $1 -type f -name *.conf | wc -l)
  echo "Configuration files (with the .conf extension) = $COUNT_CONF_FILES"
  # текстовых файлов
  COUNT_TEXT_FILES=$(sudo find $1 -type f -name "*.txt" | wc -l)
  echo "Text files = $COUNT_TEXT_FILES"
  # исполняемых файлов
  COUNT_EXECUTABLE_FILES=$(sudo find $1 -type f -executable | wc -l)
  echo "Executable files = $COUNT_EXECUTABLE_FILES"
  # логов (файлов с расширением .log)
  COUNT_LOG_FILES=$(sudo find $1 -type f -name "*.log" | wc -l)
  echo "Log files (with the extension .log) = $COUNT_LOG_FILES"
  # архивов
  COUNT_ARCHIVE_FILES=$(sudo find $1 -type f -name "*.zip" -o -name "*.arj" -o -name "*.rar" -o -name "*.7z" -o -name "*.gzip" -o -name "*.gz" | wc -l)
  echo "Archive files = $COUNT_ARCHIVE_FILES"
  # символических ссылок
  COUNT_SYMBOLIC_FILES=$(sudo find $1 -type l | wc -l)
  echo "Symbolic links = $COUNT_SYMBOLIC_FILES"
  echo ""

  # Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  TOP_LARGE_FILES="$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -n 10 | nl)"
  IFS=$'\n'
  for var in $TOP_LARGE_FILES
  do
    FILE=$(echo "$var" | awk '{print $1 " - " $3 ", " $2 ","}' )
    TYPE=$(echo "$var" | awk '{print  $3}' | awk -F '.' '{print $NF}')
    printf "%s %s\n" $FILE $TYPE
  done
  echo ""

  # Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)  
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  TOP_LARGE_EXFILES="$(sudo find $1 -type f -executable -exec du -Sh {} + | sort -rh | head -n 10 | nl)"
  IFS=$'\n'
  for var in $TOP_LARGE_EXFILES
  do
    FILE=$(echo "$var" | awk '{print $1 " - " $3 ", " $2 ","}' )
    PART=$(echo "$var" | awk '{print $3}')
    HASH=$(md5sum "$PART"|  awk '{print $1}')
    printf "%s %s\n" $FILE $HASH
  done
  echo ""
