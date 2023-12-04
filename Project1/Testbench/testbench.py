import random

def rand_key(p):
    key1=""
    for i in range(p):
        temp=str(random.randint(0,1))
        key1 += temp
    return(key1)

f= open("testbenchvector.mem","w")


key=''
for i in range(200):
    key=rand_key(16)
    f.write(key+"\n")

f.close()