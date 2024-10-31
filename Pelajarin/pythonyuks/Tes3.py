jam = int (input ("berapa jam:"))
gaji = int (input ("gaji/jam:"))

if jam <= 40 and jam > 0 :
    total = jam*gaji 
    print ("total gaji: ", total)
elif jam < 0 :
    print ("Tidak valid")
else :
    ekstra = jam - 40
    jam1 = 40
    total = jam1*gaji + ekstra *(gaji*2)
    print ("total gaji: ", total)
