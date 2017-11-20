#!/bin/bash
DB_HOST='ap2v.cbsiuvculycr.ap-south-1.rds.amazonaws.com';
DB_USER='pkthakur';
DB_PASSWD='redhat123';

DB_NAME='testing';
TABLE='quotes';

echo  "********** DROPPING TABLE IF EXISTS *************" && sleep 2
mysql -u $DB_USER -p$DB_PASSWD -h $DB_HOST -e 'use testing; drop table '$TABLE';';

echo "********** CREATING TABLE AGAIN   *************** " && sleep 2

mysql -u $DB_USER -p$DB_PASSWD -h $DB_HOST -e 'use testing; create table '$TABLE' ( Id int, quote varchar(255));';

echo  "************** LISTING  TABLES  *****************" && sleep 2
mysql -u $DB_USER -p$DB_PASSWD -h $DB_HOST -e 'use testing; show tables;';

echo  "***************** FEEDING DATA ******************" && sleep 2

for i in {1..30}
do
mysql -u $DB_USER -p$DB_PASSWD -h $DB_HOST -e 'use testing; insert into '$TABLE' values ("'$i'","Quote No.'$i'")';
done
echo  "***************** DONE !!!!   *******************" && sleep 2


