sisi1 = input ('sisi1:')
sisi2 = input ("sisi2:")
sisi3 = input ("sisi3:")

if sisi1 == sisi2 == sisi3 :
    print ("segitiga sama sisi")
elif sisi1 == sisi2 and sisi2 != sisi3 or sisi1 != sisi2  == sisi3 and sisi2 == sisi3 :
    print ("segitiga sama kaki")
elif sisi1 != sisi2 != sisi3 :
    print ("segitiga sembarang")
else :
    print ("Invalid")
