# Shell Scripting.
# This script will read a CSV filr that contains 20 new Linux user.
# This script will create easch user on the  server and add a na existing group called  'Developers'.
# This script will first check for the existence of a the user on the system, before it will attempt to creat that it.
# The user that is being created also must have a deafault home folder.
# Each user should have a .ssh folder within its home directory. If it does not exist, then it would be created.
# For each users SSH configuration, we will create an authorized_keys file and add the below public key.

#!/bin/bash
userfile=$(cat names.csv)
PASSWORD=braiding

# To ensure the user running this script has sudo priviledge
if [ $(id -u) -eq 0 ]; then

#Reading the CSV file

     for user in $userfile;
     do 
        echo $user
     if id "$user" &>/dev/null
     then 
        echo "USer Exist"
     else

# This will create a new user 
    useradd -m -d /home/$user -s /bin/bash -g developers $user
    echo "New USer Created"
    echo

# This will create a ssh folder in the user home folder
    su - -c "mkdir ~/.ssh" $user
    echo ".ssh directory created for new user"
    echo

# We need to set the user permission for the ssh dir
    su - -c "mkdir ~/.ssh" $user
    echo "user permission for .ssh directory set"
    echo

# This will create an authorized key file
    su - -c "touch~/.ssh/authorized_keys" $user
    echo "Authorized Key File Created"
    echo

# We need to create and set public key for users in the server
    cp _R "/root/onboard/id_rsa" "/home/$user/.ssh/authorized_keys"
    echo "Copyied the Public Key to New User Account on the server"
    echo
    echo

    echo "USER CREATED"

# Generate a password.
sudo echo -e "$PASSWORD\N$password" | sudo passwd "$user"
sudo passwd -x 5 $user
            fi
          done
        else
        echo "Only Admin Can Onboard A User"
        fi        

# we need to create and set public key for users in the server
         







