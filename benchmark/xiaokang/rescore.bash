#$ -cwd 
#$ -S /bin/bash
#$ -e logs
#$ -o logs

export ROSETTA_DB3=/share/tmp-data-2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/tmp-data-2/siegellab/Rosetta/main/source/bin

STRUCTURE=$( awk 'NR=="'${SGE_TASK_ID}'" { print $0 }' list.txt )

rosetta_scripts.linuxgccrelease @ repack.enzdes.flags -in:file:s $STRUCTURE.pdb 
