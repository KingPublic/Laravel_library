item = float(input("Berapa item"))
harga = float(input("Berapa harga item"))
total = float( item*harga)
diskon = 0.1
if item < 10 and item > 0 :
    print ("Kamu tidak mendapat diskon",total)
elif item < 0 :
    print("Invalid")
else :
    total1 = item*harga
    total=total1*diskon
    total_bayar = total1-total
    print ("Kamu mendapat diskon",total_bayar)
