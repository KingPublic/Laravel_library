

nama = input ("Nama anda:")
gender = input ("Jenis kelamin (L/P):")
status = input ("Menikah(Y/T):")


if gender == "L" and status == "Y" :
    print ("Hello,mr,",nama)
elif gender == "L" and status == "T" :
    print ("Hello,mr,",nama)
elif gender == "P" and status == "Y" :
    print ("Hello,mrs,",nama)
else :
    print ("Hello,ms,",nama)