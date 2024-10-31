jam = int (input ("berapa jam:"))
gaji = int (input ("gaji/jam:"))
pengalaman = int (input ("pengalaman(Tahun):"))

if jam <= 40 and jam > 0 :
    total = jam*gaji 
    print ("total gaji tanpa pengalaman: ", total)
    'break'
    if pengalaman > 5 :
        total = jam*gaji 
        totals = total*0.05
        total_semua = total+totals
        print ("total gaji dengan pengalaman: ", total_semua)

elif jam < 0 :
    print ("Tidak valid")
    
elif jam > 40 and jam <= 60:
    ekstra = jam - 40
    jam1 = 40
    total = jam1*gaji + ekstra *(gaji*1.5)
    print ("total gaji tanpa pengalaman: ", total)
    'break'
    if pengalaman > 5 :
        ekstra = jam - 40
        jam1 = 40
        total = jam1*gaji + ekstra *(gaji*1.5)
        totals = total*0.05
        total_semua = total+totals
        print ("total gaji dengan pengalaman:",total_semua)

else :
    jam1 = 40
    ekstra_lembur = 20
    ekstra = jam - 60
    total = jam1*gaji + ekstra_lembur *(gaji*1.5)
    total2 = total + ekstra * (gaji*2)
    print ("total gaji tanpa pengalaman: ", total2)
    'break'
    if pengalaman > 5 :
        jam1 = 40
        ekstra_lembur = 20
        ekstra = jam - 60
        total = jam1*gaji + ekstra_lembur *(gaji*1.5)
        total2 = total + ekstra * (gaji*2)
        totals = total2*0.05
        total_semua = total2+totals
        print ("total gaji dengan pengalaman:", total_semua)
    
