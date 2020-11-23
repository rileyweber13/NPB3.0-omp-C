#!/bin/bash
classes="S W A B C"
command_output_file=data/bt-output.txt

echo > $command_output_file

for c in $classes; do
  export FHV_OUTPUT=data/bt.$c.json 
  export LD_LIBRARY_PATH=/usr/local/likwid-master/lib:/usr/local/fhv/lib

  make bt CLASS=$c 2> /dev/null

  echo "===== PROGRAM CLASS $c =====" >> $command_output_file
  bin/bt.$c >> $command_output_file
  echo
  echo
done
