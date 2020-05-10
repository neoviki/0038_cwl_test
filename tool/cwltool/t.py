from inspect import currentframe, getframeinfo
 
print("viki [ %s : %d ]")%(getframeinfo(currentframe()).filename, getframeinfo(currentframe()).lineno)

