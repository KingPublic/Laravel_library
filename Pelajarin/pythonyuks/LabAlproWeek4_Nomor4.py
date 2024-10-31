#Total belanja dengan diskon
total_harga = float (input('total belanja'))
diskon = float (input('Diskon belanja'))
total_diskon = diskon/100
hasil = total_harga*total_diskon
total = total_harga-hasil
print ("Total harga belanja setelah diskon",total)