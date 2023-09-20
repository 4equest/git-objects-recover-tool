#!/bin/bash

mkdir "recovered"
for f in .git/objects/*/*; 
  do prefix=$(echo $f | cut -d / -f 3); 
  obj=$(echo $f | cut -d / -f 4); 
  type=$(git cat-file -t $prefix$obj); 

  if [[ $type == 'tree' ]]; 
  then 
    echo "recovering $prefix$obj"
    mkdir "recovered/$prefix$obj"

    string=$(git cat-file -p $prefix$obj | grep "blob");
    array=(${string//$'\n'/ });
    for i in "${!array[@]}"; do
      if [[ ${array[i]} == blob* ]]; then
        git cat-file blob ${array[i+1]} > "recovered/$prefix$obj/${array[i+2]}"; 
      fi
    done
  fi; 
done;