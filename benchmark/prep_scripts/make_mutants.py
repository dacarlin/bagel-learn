# 1- to 3-letter residue translation 
aa1 = list("ACDEFGHIKLMNPQRSTVWY")
aa3 = "ALA CYS ASP GLU PHE GLY HIS ILE LYS LEU MET ASN PRO GLN ARG SER THR VAL TRP TYR".split()
aa1to3 = dict( zip( aa1, aa3 ) ) 

with open( 'bagel.pdb' ) as wt:
  wt = wt.readlines()

with open( 'list.txt' ) as l:
  l = l.readlines()

for line in l:
  with open( 'out/' + line.strip() + '.pdb' , 'w' ) as target:
    orig, i, new = line[0], line[1:-2], line[-2] #-2 since there's a newline char
    for atom in wt:
      atom = atom.strip()
      atm = atom.split()
      if atm[0] == 'ATOM' or atm[0] == 'HETATM':
        if atm[5] != i:
          target.write( atom + '\n' )
        else:
          if atm[2] in [ 'N', 'C', 'CA', 'O' ]:
            target.write( atom[:17] + aa1to3[new] + atom[20:] + '\n' ) 
      elif atm[0] == 'REMARK':
        target.write( atom + '\n' )
