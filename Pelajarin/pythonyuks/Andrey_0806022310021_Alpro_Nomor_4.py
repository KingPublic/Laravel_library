jam = float(input("Berapa jam kalian bekerja"))

if jam <= 40 and jam > 0:
    kotor = jam * 6
    pajak = kotor * 0.1
    bersih = kotor - pajak
elif jam <= 0:
    print("Jam Kerja Invalid")
else:
    ekstra = jam - 40
    kotor = 40 * 6 + ekstra * (6 * 1.5)
    pajak = kotor * (12 / 100)
    bersih = kotor - pajak

if jam > 0:
    print("Gaji kotor :",kotor)
    print("Pajak :",pajak)
    print("Gaji bersih :",bersih)