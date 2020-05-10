command0 = ['docker', 'apple','orange','amma', "--volume=1"]
command1 = ['docker', 'amma', 'appa', 'puppy', "--volume=1"]
command2 = ['docker', 'amma', 'appa', 'puppy', "--volume=2"]
command3 = ['docker', 'amma', 'appa', 'puppy', "--volume=3"]
command4 = ['docker', 'amma', 'appa', 'puppy', "--volume=3"]

print command1

print "List 2\n"
print command2

no_commands = 0
command_list = {}
command_list[0] = command0
no_commands += 1
command_list[1] = command1
no_commands += 1
command_list[2] = command2
no_commands += 1
command_list[3] = command3
no_commands += 1
command_list[4] = command4
no_commands += 1

#initialize dictionary with lists
dependency_child = {i: [] for i in range(no_commands)}

print "---------"
print command_list
for i in range(0, no_commands):
    print i

print command_list[0][1]
for i in range(no_commands-1, -1, -1):
        for j in range(no_commands):
			if j < i:
            if "docker" in command_list[i] and "docker" in command_list[j]:
                for p in command_list[i]:
                    for q in command_list[j]:		            
                        if (p == q) and ("--volume" in q) and ("--volume" in p):
                            dependency_child[i].append(j)
                            command_list[j][command_list[j].index(q)] = "V"

for i in dependency_child:
    print("Dependency Child of (%d) = "%(i)),
    print dependency_child[i]


print command_list
