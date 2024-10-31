celcius = float (input("Berapa suhu celcius:"))
pilihan = input("pilih konversinya(K/R/F):")
kelvin = float(celcius) + 273.15
reamur = float(celcius)*0.8
fahrenheit = float(celcius)*1.8+32

if pilihan == "K" :
    print ("suhu kamu =", kelvin)
elif pilihan  == "R" :
    print ("suhu kamu =" , reamur)
elif pilihan == "F" :
    print ("suhu kamu =" , fahrenheit)
else :
    print ("suhu kamu tidak diketahui")


