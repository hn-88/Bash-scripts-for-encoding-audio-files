#! /bin/bash


# Scriptname: lamedir.sh
# Copied from lame_encoder2422.sh and modified, 25 March 2021 

# 1. Encodes  all the files listed in source.txt in current dir to encoded subdirectory of current dir preserving their paths
# 2. Files are encoded to 32kbps 22.05KHz 
# 3. source.txt can be created using something like find   -name "*.m4a" > source.txt
# 4. encoded subdirectory with internal paths must exist - to do that, one way is mkdir encoded; cp -R nameofsourcedir encoded/nameofsourcedir

# Encode the new files
terminal=`tty`
        # terminal : the filename of the terminal connected to standard input
        # tty - prints the file name of the terminal connected to standard input

exec < source.txt
        # The file passed as an argument becomes the standard input

i=0
while read line
do
        lame -a -h -b 32  --resample 22.05 --lowpass 9 "$line"  "encoded/$line"
        # unfortunately, lame can't read m4a
        
done

exec < $terminal
