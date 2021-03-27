#find Dashboard -name "*.ogg" > source.txt
#find Dashboard -name "*.mpeg" > source.txt
#find Dashboard -name "*.aac" > source.txt
find Dashboard -type f ! '(' -name '*.*' ')' > source.txt
