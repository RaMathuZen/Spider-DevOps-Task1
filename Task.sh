#!/bin/bash

# Creating Directories&Files
cd /home/spider/Documents
mkdir Principal Class[1] Class[2] Class[3] Class[4] Class[5]
for ((i=1;i<6;i++)) 
do
	cd /home/spider/Documents/Class[$i]
	touch Attendance
        cat /home/spider/Downloads/Attendance[$i] >> Attendance
	touch Marksheet[1] Marksheet[2] Marksheet[3] Marksheet[4] Marksheet[5]
        for ((z=1;z<6;z++))
        do
        	cat /home/spider/Downloads/Mark[$z] >>  Marksheet[$z]
        done 
	touch Notice1
        cat /home/spider/Downloads/Not[1] >>  Notice1
	touch Notice2
        cat /home/spider/Downloads/Not[2] >>  Notice2
	cd /home/spider/Documents/
done	
#Creating Users and Forming Groups
sudo groupadd groupa[1]
sudo groupadd groupa[2]
sudo groupadd groupa[3]
sudo groupadd groupa[4]
sudo groupadd groupa[5]
for ((j=1;j<6;j++))
do
	for ((i=1;i<6;i++))
	do
		sudo useradd -G groupa[$j] Stud[$j][$i]
	done
	i=1
	sudo useradd teacher[$j]
done
#Giving Permissions,Ownership
for ((j=1;j<6;j++))
do
	sudo chown teacher[$j]:groupa[$j] -R  /home/spider/Documents/Class[$j]
        sudo chmod 777 -R /home/spider/Documents/Class[$j]
done	
#Mark sheet Privacy!
cd /home/spider/Documents/ 
for ((j=1;j<6;j++))
do
	for ((i=1;i<6;i++))
	do
		sudo chown Stud[$j][$i]:teacher[$j] /home/spider/Documents/Class[$j]/Marksheet[$i]
		sudo chmod u=r,g=rwx,o-rwx /home/spider/Documents/Class[$j]/Marksheet[$i] 
        done
	i=1
        sudo chown spider /home/spider/Documents/Class[$j]/Notice2
        sudo chmod u=rwx,g=r-x,o=r /home/spider/Documents/Class[$j]/Notice2

done       
cd /home/spider/Documents/
for ((i=1;i<6;i++))
do
	sudo chmod u+rwx,g=r-x,o-rwx -R /home/spider/Documents/Class[$i]
done
#Principals Directory
cd /home/spider/Documents/Principal/
touch Notice
chmod u=rwx,g=r-x,o=r /home/spider/Documents/Principal
cd

#NOTE
# Principal can access the folder by running sudo's shell. sudo -s [command]. for example sudo -s cd Class[1].
# In Attendance 1 == Present , 0 == Absent.


