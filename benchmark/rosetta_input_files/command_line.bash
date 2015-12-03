#$ -S /bin/bash 
#$ -cwd 
#$ -o logs
#$ -e logs 
#$ -N benchmark 

L=$( sed -n ${SGE_TASK_ID}p list.txt )
S=$( echo $LINE | cut -d' ' -f1 )
U=$( echo $LINE | cut -d' ' -f2 )
N=$( echo $S | tr -d [a-z]//. )

~/rosetta/source/bin/rosetta_scripts.linuxgccrelease @ flags -s $S -suffix=$SUF -parser:script_vars resnum=$N
