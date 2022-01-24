#! /bin/bash

timestamp() {
    date +"%s"
}


counter=1
while [ $counter -le 4 ]
do
    echo $counter
    ~/bin/processing/processing-java --force --sketch=/home/martins/code/generative/field/ --run --output=/home/martins/code/generative/field/output

    #t=$( timestamp )
    filename="fin_$counter.png"
    mv 000001.png $filename

    #convert -delay 50 -loop 0 *.png $filename
    ((counter++))
done
echo All done
