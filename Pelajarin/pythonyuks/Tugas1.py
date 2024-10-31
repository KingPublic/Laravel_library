import random

# Membuat angka acak antara 1 dan 100
angka_acak = random.randint(1, 100)

# Inisialisasi tebakan awal
tebakan = 0

while True:
    tebakan = tebakan + 1
    tebakan_pengguna = int(input("Tebak angka antara 1 dan 100: "))

    if tebakan_pengguna < angka_acak:
        print("Terlalu kecil. Coba lagi.")
    elif tebakan_pengguna > angka_acak:
        print("Terlalu besar. Coba lagi.")
    else:
        print(f"Selamat! Anda menebak dengan benar setelah {tebakan} kali percobaan.")
        break
