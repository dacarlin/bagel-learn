#$ -S /bin/bash 
#$ -cwd 
#$ -o logs
#$ -e logs 

~/rosetta/source/bin/rosetta_scripts.linuxgccrelease @ flags -l list.txt
