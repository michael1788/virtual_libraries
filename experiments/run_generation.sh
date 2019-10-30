FILENAME=$1

if [ $# -eq 0 ] ; then
    echo "Filename not supplied."
else

EXPNAME=$(echo $FILENAME | cut -d '/' -f 3)
EXPNAME=${EXPNAME//$'.txt'/}

for model in results/$EXPNAME/models/*h5;
    do python do_data_generation.py --filename $FILENAME --model_path $model --verbose True &
done

wait

fi
