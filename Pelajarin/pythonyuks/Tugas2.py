#Fungsi untuk menghitung faktorial yang di input user
def hitung_faktorial(n):
    if n == 0:
        return 1
    else:
        return n * hitung_faktorial(n - 1)
#Untuk mengecek dan memberikan output-an
try:
    n = int(input("Masukkan bilangan bulat positif: "))
    if n < 0:
        print("Masukkan bilangan bulat positif.")
    else:
        hasil_faktorial = hitung_faktorial(n)
        print(f"{n}! = {hasil_faktorial}")
except ValueError:
    print("Masukkan harus berupa bilangan bulat.")
