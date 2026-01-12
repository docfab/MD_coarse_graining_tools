Tools for martini coarse graining using gromacs Software.

make_ndx.sh create the index file with grips of atoms corresponding to each CG particle

Usage:

$ sudo chmod + x make_ndx.sh
$ ./make_ndx.sh


analyse_bond_angle_dih.sh analyse bond, angle and dihedral from MD simulation. 
Require 3 index files with groups of atoms corresponding to each type of bonds, angles and dihedral.

$ sudo chmod + x analyse_bond_angle_dih.sh
$ ./analyse_bond_angle_dih.sh

output : xvg graphs of bond, angle and dihedral dstribution.
