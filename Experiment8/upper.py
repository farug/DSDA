fo = open("output.txt","r")
for x in fo.read():
    y = x.lower()
    fo1 = open("output2.txt","w")
    fo1.write(y)