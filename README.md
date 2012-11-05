shell-scripts
=============

# some cool shell scripts

# This script will enhance the operation of standard UNIX commands by doing some simple checking of the command 
# line parameters and asking for user confirmation. 

# Copy a file

if [ "$#" != 2 ]

then

     print " Usage: copy from to"

     exit 1

fi



from="$1"

to="$2"



# See if the destination file already exists



if [ -f "$to" ]

then

     print "$to already exists; overwrite (y/n)?\c" 

     read answer



     if [ "$answer" != y ]

     then

          print " $from not copied "

          exit 0

     fi

fi



# If the destination doesn't exist to "y" was typed



cp $from $to

