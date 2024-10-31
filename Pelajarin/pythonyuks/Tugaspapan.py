A = input ("nilai a")
B = input ("nilai b")
C = input ("nilai c")

if A > B and A > C :
    if B > C :
        print ("a tertua,b kedua tertua,c termuda")

    else : 
        print ("a tertua,c kedua tertua,b termuda")

elif B > A and B > C :
    if A > C :
        print ("b tertua,a kedua tertua,c termuda")
        
    else :
        print ("b tertua,c kedua tertua,a termuda")

else :
    if A > B : 
        print ("c tertua,a kedua tertua,b termuda")

    else :
        print ("c tertua,b kedua tertua,a termuda")