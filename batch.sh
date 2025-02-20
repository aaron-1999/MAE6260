#!/bin/bash

# Simple script to iterate over a list of cutoffs

ecut_list="10 20 30 40 50 60 70 80 90 100 110 120 130 140"
for ecut in $ecut_list
do

cat > Al.scf.$ecut.in << EOF
&control
	calculation = 'scf'
	restart_mode = 'from_scratch'
	prefix = 'Al_relax'
	tstress = .true.
	tprnfor = .true.
	pseudo_dir = './'
/

&system
	ibrav = 2,
	celldm(1) = 7.662175075,
	nat = 1, ntyp = 1,
	ecutwfc = $ecut
	occupations = 'smearing'
	smearing = 'methfessel-paxton'
	degauss = 0.05
/

&electrons
	mixing_beta = 0.7
	conv_thr = 1.0d-8
/

&ions
	ion_dynamics='bfgs'
/

&cell
	cell_dynamics = 'bfgs'
/

ATOMIC_SPECIES
Al 26.981 Al.pbe-n-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS (alat)
Al 0.0 0.0 0.0
K_POINTS (automatic)
4 4 4 0 0 0
EOF

pw.x -in Al.scf.$ecut.in > Al.scf.$ecut.out
done

