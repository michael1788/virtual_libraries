FILENAME=$1

if [ $# -eq 0 ] ; then
    echo "Filename not supplied."
else

EXPNAME=$(echo $FILENAME | cut -d '/' -f 3)
EXPNAME=${EXPNAME//$'.txt'/}

# We allow a maximum of four jobs
# to run in parallel to avoid using
# too much resources
declare -A pids=( )
num_procs=4

for model in results/$EXPNAME/models/*h5; do
    while (( ${#pids[@]} >= num_procs )); do
        #wait -n
        sleep 0.2
        for pid in "${!pids[@]}"; do
          kill -0 "$pid" &>/dev/null || unset "pids[$pid]"
        done
    done
    python do_data_generation.py --filename $FILENAME --model_path $model --verbose True & pids["$!"]=1
done

wait

fi
