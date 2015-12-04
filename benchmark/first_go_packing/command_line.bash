#$ -S /bin/bash 
#$ -cwd 
#$ -o logs
#$ -e logs 
#$ -N benchmark 

L=$( sed -n ${SGE_TASK_ID}p list.txt )
N=$( echo $L | tr -d [a-z][A-Z]/._ ) 

echo $N
~/rosetta/source/bin/rosetta_scripts.linuxgccrelease @ flags -s $L -parser:script_vars resnum=$N
