#!/bin/bash

#md files $md_file_name.gro and $md_file_name.xtc
md_file_name=md

#check corresponding index files
[[ -f bonds.ndx ]] || { echo "bonds.ndx missing"; exit 1; }
[[ -f angles.ndx ]] || { echo "angles.ndx missing"; exit 1; }
[[ -f dihedrals.ndx ]] || { echo "dihedrals.ndx missing"; exit 1; }

#find number of bond, angles and dihedral (nb of group in index files)
nb_bond=grep -E '^\s*\[.*\]\s*$' bonds.ndx | wc -l
nb_angle=grep -E '^\s*\[.*\]\s*$' angles.ndx | wc -l
nb_dihedral=grep -E '^\s*\[.*\]\s*$' dihedrals.ndx | wc -l

for ((i = 1 ; i <= $nb_bond ; i++))
do

	echo $i | gmx distance -f ${md_file_name}.xtc -s ${md_file_name}.gro -n bonds.ndx -oall bond${i}.xvg
	echo $i | gmx analyze -f bond$i.xvg -dist distr-bond_$i.xvg -bw 0.01
done

for ((i = 1 ; i <= $nb_angle ; i++))
do 

	echo $i | gmx angle -f ${md_file_name}.xtc -n angles.ndx -ov angle$i.xvg -type angle
	echo $i | gmx analyze -f angle$i.xvg -dist distr-angle_$i.xvg -bw 1.0

done

for ((i = 1 ; i <= $nb_dihedral ; i++))
do 

	echo $i | gmx angle -f ${md_file_name}.xtc -n dihedrals.ndx -all -type dihedral -ov dihedral$i.xvg
done

rm \#*
