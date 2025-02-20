#!/bin/bash
# Batch script to iterate over different k-points grids for silicon SCF calculation

k_list="1 2 3 4 5"




for k in $k_list
do
    cat > Si.scf.k$k.in << EOF

&control
    calculation = 'scf'
    restart_mode = 'from_scratch'
    prefix = 'Si32'
    tstress = .true.
    tprnfor = .true.
    pseudo_dir = './'
/
&system
    ibrav = 0,
    nat = 32, ntyp = 1,
    ecutwfc = 30
/
&electrons
    mixing_beta = 0.7
/
ATOMIC_SPECIES
Si 28.086 Si.pbe-rrkj.UPF
ATOMIC_POSITIONS (angstroms)
   Si    2.7339940480    2.7339940480    0.0000000000
   Si    0.0000000000    0.0000000000    0.0000000000
   Si    2.7339940480    0.0000000000    2.7339940480
   Si    0.0000000000    2.7339940480    2.7339940480
   Si    4.1009910720    4.1009910720    1.3669970240
   Si    1.3669970240    1.3669970240    1.3669970240
   Si    4.1009910720    1.3669970240    4.1009910720
   Si    1.3669970240    4.1009910720    4.1009910720
   Si    2.7339940480    2.7339940480    5.4679880960
   Si    0.0000000000    0.0000000000    5.4679880960
   Si    2.7339940480    0.0000000000    8.2019821440
   Si    0.0000000000    2.7339940480    8.2019821440
   Si    4.1009910720    4.1009910720    6.8349851200
   Si    1.3669970240    1.3669970240    6.8349851200
   Si    4.1009910720    1.3669970240    9.5689791680
   Si    1.3669970240    4.1009910720    9.5689791680
   Si    2.7339940480    8.2019821440    0.0000000000
   Si    0.0000000000    5.4679880960    0.0000000000
   Si    2.7339940480    5.4679880960    2.7339940480
   Si    0.0000000000    8.2019821440    2.7339940480
   Si    4.1009910720    9.5689791680    1.3669970240
   Si    1.3669970240    6.8349851200    1.3669970240
   Si    4.1009910720    6.8349851200    4.1009910720
   Si    1.3669970240    9.5689791680    4.1009910720
   Si    2.7339940480    8.2019821440    5.4679880960
   Si    0.0000000000    5.4679880960    5.4679880960
   Si    2.7339940480    5.4679880960    8.2019821440
   Si    0.0000000000    8.2019821440    8.2019821440
   Si    4.1009910720    9.5689791680    6.8349851200
   Si    1.3669970240    6.8349851200    6.8349851200
   Si    4.1009910720    6.8349851200    9.5689791680
   Si    1.3669970240    9.5689791680    9.5689791680

CELL_PARAMETERS (angstroms)
    10.935976192    0.0000000000    0.0000000000
    0.0000000000    10.935976192    0.0000000000
    0.0000000000    0.0000000000    10.935976192

K_POINTS (automatic)
$k $k $k 1 1 1
EOF

    
pw.x -in Si.scf.k$k.in > Si.scf.k$k.out
done


