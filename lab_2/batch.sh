#!/bin/bash

# Simple script to iterate over a list of cutoffs

ecut_list="10 20 30"
for ecut in $ecut_list
do

cat > Si.scf.$ecut.in << EOF
&control
	calculation = 'scf'
	restart_mode = 'from_scratch'
	prefix = 'Si2'
	tstress = .true.
	tprnfor = .true.
	pseudo_dir = './'
/

&system
	ibrav = 2,
	celldm(1) = 10.333,
	nat = 2, ntyp = 1,
	ecutwfc=$ecut
/

&electrons
	mixing_beta = 0.7
/

ATOMIC_SPECIES
Si 28.086 Si.pbe-rrkj.UPF
ATOMIC_POSITIONS (alat)
Si 0.0 0.0 0.0
Si 0.25 0.25 0.25
K_POINTS (automatic)
6 6 6 1 1 1
EOF

pw.x -in Si.scf.$ecut.in > Si.scf.$ecut.out
done

