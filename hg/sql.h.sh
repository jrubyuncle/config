#!/bin/bash

cat << EEE


% /usr/bin/sqlite3 <name.db>'

Enter SQL statements terminated with a ";"
sqlite> create table posts(
   ...> id integer primary key,
   ...> title text,
   ...> content text
   ...> );
sqlite>


drop table posts;


.help
.table         // show all tables
.schema users  // show table schema
.exit          // exit command shell

// ----------------------------------------------
// table: userdevice
update userdevice set devstate=11 where DevID like '% test_ver2 %'

UPDATE userdevice SET ServiceIp = "ability-relay,ability_p2p" WHERE DevName LIKE "TESTtest_ver2_%";

SELECT * FROM myabcam.userdevice;
SELECT * FROM myabcam.userdevice where devid ='VS50031H_6CADF8F0CC4D';

// table: user
SELECT * FROM myabcam.user where userid='1412739537854';

// table: devservers
SELECT * FROM myabcam.devservers;


EEE


echo
echo [$0]
