#!/bin/bash
programs="bt lu"
classes="S W A B C"

for program in $programs; do
  command_output_file=data/$program-output.txt
  
  echo > $command_output_file
  
  for class in $classes; do
    export FHV_OUTPUT=data/$program.$class.json 
    export LD_LIBRARY_PATH=/usr/local/likwid-master/lib:/usr/local/fhv/lib
  
    make $program CLASS=$class 2> /dev/null
  
    echo "===== PROGRAM CLASS $class =====" >> $command_output_file
    bin/$program.$class >> $command_output_file
    echo
    echo
  done
done

