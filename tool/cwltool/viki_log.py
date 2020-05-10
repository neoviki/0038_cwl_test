from .utils import json_dumps, onWindows, subprocess
import os

def init_viki_logger():
    f1 = open('/tmp/script.log', "w")
    f1.write(unicode("\n################# COMMANDS #############\n"))
    f1.close()

def viki_logger(filename, lineno, commands):
    f1 = open('/tmp/script.log', "a")
    file_info = "[ " + str(filename) + ":" + str(lineno) + " ]\n"
    #f1.write(unicode(file_info))
    cmd_str = ""
    for s in commands:
        cmd_str += str(s)
        #cmd_str += ' # '
        cmd_str += ' '
		
    f1.write(unicode("CMD : {}\n".format(cmd_str)))
    f1.close()
def viki_job_executer(commands, shell, close_fds, stdin, stdout, stderr, env, cwd):
	#ssh and execute
	#get the result and send it to the system
    #parse_command(commands)

    docker_command = False
    for item in commands:
        if 'docker' in item:
            docker_command = True
	
    docker_command = False
    if not docker_command:
        print "Not a docker command"
        sproc = subprocess.Popen(commands,
                                 shell=shell,
                                 close_fds=close_fds,
                                 stdin=stdin,
                                 stdout=stdout,
                                 stderr=stderr,
                                 env=env,
                                 cwd=cwd)
    else:
        sproc = subprocess.Popen(['ls'],
                                 shell=shell,
                                 close_fds=close_fds,
                                 stdin=stdin,
                                 stdout=stdout,
                                 stderr=stderr,
                                 env=env,
                                 cwd=cwd)
    return sproc

def parse_command(command):
    for i in command:
        print "viki_command = ", i
        if "--volume" in i:
            #print i
            first_token = i.split(":")
            volume = first_token[0].split("=")[1]
            #print "volume = ", volume
            head, tail = os.path.split(volume)
            if '.' in tail:
                f = head+"/"+tail
                d = head
                try:
                    print "Creating Directory = ", d
                    os.makedirs(d)
                    print "Creating File = ", f
                    open(f, 'a').close()
                except:
                    None
            else:
                d = head+"/"+tail
                try:
                    print "Creating Directory = ", d
                    os.makedirs(d)
                except:
                    None
 
 	
#viki_logger([123,'2','3'])
