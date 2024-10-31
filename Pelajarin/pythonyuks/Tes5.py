waktu =int(input ("Berapa lama waktu delay(menit):"))
pelayanan = input ("Apakah pelayanan memuaskan? baik/buruk:")
kebersihan = input ("Apakah kebersihan pesawat memuaskan? baik/buruk:")

if waktu < 30 and pelayanan == "baik " and kebersihan == "baik" :
    p_baik = 35
    p_buruk = 15  
    k_baik = 35
    k_buruk = 15
    w_baik = 30
    w_buruk = 5
    total = p_baik + k_baik + w_baik
    print ("nilai penerbangan:",total,"Penerbangan unggulan")
elif waktu < 30 and pelayanan == "buruk" and kebersihan == "buruk" :
    total = 30 + 15 + 15
    print ("nilai penerbangan:",total,"penerbangan standar")
elif waktu < 30 and pelayanan == "buruk " or kebersihan == "baik"  :
    total = 30 + 15 + 35
    print ("nilai penerbangan:",total,"Penerbangan standar")
elif waktu < 30 and pelayanan == "baik " or kebersihan == "buruk"  :
    total = 30 + 15 + 35
    print ("nilai penerbangan:",total,"Penerbangan standar")
elif  waktu >= 30 and pelayanan == "buruk " or kebersihan == "baik" :
    total = 5 + 35 + 15
    print ("nilai penerbangan:",total,"Penerbangan standar")
elif  waktu >= 30 and pelayanan == "baik" or kebersihan == "buruk" :
    total = 5 + 35 + 15
    print ("nilai penerbangan:",total,"Penerbangan standar")
elif waktu >= 30 and pelayanan == "baik" and kebersihan == "baik" :
    total = 5 + 35 + 35 
    print ("nilai penerbangan:",total,"Penerbangan standar")
elif waktu >= 30 and pelayanan == "buruk" and kebersihan == "buruk" :
    total = 5 + 15 + 15
    print ("nilai penerbangan:",total,"Penerbangan buruk")
elif waktu < 0 :
    print ("invalid")
