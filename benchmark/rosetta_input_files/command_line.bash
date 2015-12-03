#$ -S /bin/bash 
#$ -cwd 
#$ -o logs
#$ -e logs 
#$ -N benchmark 

LINE=$( sed -n ${SGE_TASK_ID}p list.txt )
S=$( echo $LINE | cut -d' ' -f1 )
SUF=$( echo $LINE | cut -d' ' -f2 )

~/rosetta/source/bin/rosetta_scripts.linuxgccrelease @ flags -s $S -suffix=$SUF

# need -s to run (flags calls for nstruct=1)
# list should look like 
# input_pdb nstruct
