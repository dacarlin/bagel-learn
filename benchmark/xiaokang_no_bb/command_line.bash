#$ -S /bin/bash 
#$ -cwd 
#$ -o logs
#$ -e logs 

/share/work/alex/rosetta/source/bin/rosetta_scripts.linuxgccrelease @ flags -s $( sed -n ${SGE_TASK_ID}p list.txt )
