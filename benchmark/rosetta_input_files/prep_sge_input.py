from glob import glob 

for i in glob( 'input_pdbs/*pdb' ):
  for j in range( 101 ):
    print '{} {}'.format( i, j ) 
