FILENAME=$1

if [ $# -eq 0 ] ; then
    echo "Filename not supplied."
else

python do_novo.py --filename $FILENAME --verbose True &&
python do_novo_analysis.py --filename $FILENAME --verbose True &&
python do_novo_scaffolds.py --filename $FILENAME --verbose True --scaffolds_type 'scaffolds' &&
python do_novo_scaffolds.py --filename $FILENAME --verbose True --scaffolds_type 'generic_scaffolds' &&
python do_draw_scaffolds.py --filename $FILENAME --verbose True --scaffolds_type 'scaffolds' &&
python do_draw_scaffolds.py --filename $FILENAME --verbose True --scaffolds_type 'generic_scaffolds' &&
python do_umap_plot.py --filename $FILENAME --verbose True &&
python do_umap_plot_interactive.py --filename $FILENAME --verbose True &&
python do_plot_descriptor.py --filename $FILENAME --verbose True &&
python do_frechet_distance.py --filename $FILENAME --verbose True
python do_plot_frechet.py --filename $FILENAME --verbose True &&
python do_resume.py --filename $FILENAME --verbose True

fi
