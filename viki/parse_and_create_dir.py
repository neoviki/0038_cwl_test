import os
command = ['docker run test', '--volume=./local_dir1/test/tst/file.txt:mount1','orange','amma', "--volume=./local_dir1/1/2/3:mount1", "--volume=./local_dir2/1/3/4:mount2:rw"]

def parse_command(command):
    for i in command:
        if "--volume" in i:
            #print i
            first_token = i.split(":")
            volume = first_token[0].split("=")[1]
            #print "volume = ", volume
            head, tail = os.path.split(volume)
            if '.' in tail:
                f = head+"/"+tail
                d = head
                print "File = ", f
                print "Directory = ", d
                try:
                    os.makedirs(d)
                    open(f, 'a').close()
                except:
                    pass
            else:
                d = head+"/"+tail
                print "Directory = ", d
                try:
                    os.makedirs(d)
                except:
                    pass
 
for item in command:
    if 'docker' in item:
	    print "YES"
parse_command(command)
