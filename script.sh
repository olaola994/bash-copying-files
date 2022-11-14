#!/bin/bash
echo "Welcome to the bash script."
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building" $version
echo "Do you want to continue? (enter "1" for yes, "0" for no)"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  echo "source"
  for filename in source/*
  do 
    if [ "$filename" == "source/secretinfo.md" ]
      then
        echo "not copying" $filename
      else
        echo "copying" $filename
        cp $filename build/.
    fi
  done
  echo "build"
  for filename in build/*
  do
    echo $filename
  done
else 
  echo "Please come back later when you are ready"
fi
