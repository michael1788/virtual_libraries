FILENAME=$1

if [ $# -eq 0 ] ; then
    echo "Filename not supplied."
else

sh run_processing.sh $FILENAME &&
sh run_training.sh $FILENAME &&
sh run_generation.sh $FILENAME &&
sh run_analysis.sh $FILENAME

fi
