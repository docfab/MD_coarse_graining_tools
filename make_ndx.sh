#!/bin/bash

md_file_name=

n_mol=

group_name1="XXX"
atomes_names1="X1 X2"

group_name2="XXX"
atomes_names2="X3 X4"

rm index_cg.ndx

make_ndx_res() {
	echo "residue $1 and atomname $2" |  gmx select -f $4.gro -s $4.gro -on select.ndx 
	echo "[ $3 ] " >> index_cg.ndx
	cat select.ndx | tail -1 >> index_cg.ndx
}

for ((i = 1 ; i <= $n_mol ; i++))
do

	make_ndx_res($i ${atomes_names1} ${group_name1} ${md_file_name})
	make_ndx_res($i ${atomes_names2} ${group_name2} ${md_file_name})

	rm \#*


done
