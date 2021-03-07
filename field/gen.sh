#! /bin/bash
#
#
#
timestamp() {
    date +"%s"
}


counter=1
while [ $counter -le 50 ]
do
    echo $counter
    /home/martin/bin/processing/processing-java --force --sketch=/home/martin/code/generative/field/ --run --output=/home/martin/code/generative/field/output

    t=$( timestamp )
    filename="$t.gif"

    convert -delay 50 -loop 0 *.png $filename
    ((counter++))
done
echo All done
