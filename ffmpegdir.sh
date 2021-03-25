#! /bin/bash


# Scriptname: ffpmegdir.sh
# Copied from lame_encoder2422.sh and modified, 25 March 2021 

# 1. Encodes  all the files listed in source.txt in current dir to encoded subdirectory of current dir preserving their paths
# 2. Files are encoded to 32kbps 22.05KHz 
# 3. source.txt can be created using something like find   -name "*.m4a" > source.txt
# 4. encoded subdirectory with internal paths must exist - to do that, one way is mkdir encoded; cp -R nameofsourcedir encoded/nameofsourcedir

# Encode the new files

i=0
cat source.txt | while read line
do
       # lame -a -h -b 32  --resample 22.05 --lowpass 9 "$line"  "encoded/$line"
        # unfortunately, lame can't read m4a
        outline=${line/aac/mp3}
        #echo "Now about to encode $line"
        #echo "to encoded/$outline"
        ((i=i+1))
        echo Processing files... number $i
         
        #sleep 5
        ffmpeg -hide_banner -loglevel error -nostdin -y -i "$line" -ac 1 -ab 32000 -ar 22050  "encoded/$outline" 
        # need the nostdin, otherwise ffmpeg swallows some characters from stdin
        # https://superuser.com/questions/1492507/why-does-ffmpeg-require-nostdin-in-while-loop
        FILESIZE=$(stat -c%s "encoded/$outline")
        echo "Done, Size of $outline = $FILESIZE bytes."
        #https://unix.stackexchange.com/questions/16640/how-can-i-get-the-size-of-a-file-in-a-bash-script
        
      
done


