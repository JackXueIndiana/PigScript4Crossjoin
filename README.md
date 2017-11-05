3.	Create internal ORC table

cat crossjointable.hql# PigScript4Crossjoin
This script shows how to use Pig script to make a cross join on Hive table hivesampletable. Though the cross join is not used that often, but due to the resulted table’s size, it becomes a road block from time to time. After trying a few tools, I feel this Pig script is the simplest and most transformable.

Steps:
1.	Run your Pig script with command
>pig -f my.pig >my.pig.log 2>&1

2.	Create an external table to point to cross join result
>hive -f crossjointable_ext.hql >crossjointable_ext.log 2>&1

3. Create an managed ORC table for further usage
>hive -f crossjointable.hql  >crossjointable.log 2>&1
