# Predict the functional effects of point mutations to the glycoside hydrolase BglB

## Training set

The training set consists of kinetic constants (kcat, 1/KM, and kcat/KM) and expression (boolean) for 101 single point mutants of BglB (log scale, relative to wild type) that have been experimentally determined. 

## Test set

The test set is 42 designed point mutants for which the kinetic constants (kcat, 1/KM, and kcat/KM) and expression have been determined but will be kept secret by the Siegel Lab until the results of this challenge are out.

## Challenge

Predict the log relative kinetic constants and/or expression of the test set mutants by modeling them. 

## Files included

* rosetta_input_files/
   * Rosetta model of BglB wild type (bagel.pdb)
   * Ligand params files (cid92930.params, cid92930.conf.pdb)
   * Enzdes-style constraint file (cid92930.enzdes.cst)
   * Rosetta flags file (flags)
   * RosettaScripts protocol that was used in publication (repack.xml)
   * Example command line (command_line.bash) 
* data/
   * Kinetic constants for 101 point mutants, log relative to WT (train_set.csv)
   * List of mutants in the test set (test_set.csv)
* example_scripts/
   * Python script to generate mutant starting structures (make_mutants.py) 

## Notes

* You will need to decide how to make the mutations to the wild type protein (rosetta_input_files/bagel.pdb). I have tried munging the PDB (replacing the three-letter code of the residue on backbone CA, C, N, and O atoms with the desired residue and deleting any other atoms in the native residue, which was what was used in production) and using the MutateResidue mover in RosettaScripts

* In the publication Carlin et al. “Kinetic characterization of over 100 glycoside hydrolase mutants enables the discovery of structural features correlated with kinetic constants” PLOS ONE (accepted), we found that some of the 59 structural features generated by the flag -jd2:enzdes_out produced structural features that correlated to our experimental data. Correlation of the average calculated structural features to each kinetic constant was assessed using Pearson Correlation Coefficient (PCC) and Spearman Rank Correlation (SRC). For both kcat and kcat/KM, the strongest correlation observed is to the total number of non-local contacts (count of residues separated by more than 8 sequence positions that interact with each other), with a PCC of 0.56 and 0.43, respectively. For 1/KM, the highest PCC is 0.29 to the total number of hydrogen bonds in each BglB model. It would be really interesting to think of alternative ways to generate potentially informative features 

## Contact information

* Alex Carlin (carlin@ucdavis.edu)
* Justin Siegel (jbsiegel@ucdavis.edu)