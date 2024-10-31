password = "rahasia"

input_password= input("Masukkan kata sandi: ")

while input_password != password:
    print("Kata sandi salah. Coba lagi.") 
    input_password= input("Masukkan kata sandi: ") 
print("Selamat! Kata sandi benar.")