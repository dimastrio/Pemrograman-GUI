# Menggunakan Variabel
angka = 10

# Param ke 1 : Max
for i in range(angka) :
  print("Angka ke : ")
  print(i)

# Param ke 2 : Min, Max (sifat increment)
for i in range(angka, 20) :
  print("Angka ke : ")
  print(i)

# Param ke 3 : Min, Max, Lompatan + (sifat incre)
# Param ke 3 : Min, Max, Lompatan - (sifat decre)
for i in range(angka, 1, -1) :
  print("Angka ke : ")
  print(i)

# Array 
array = [1,2,3,4]

for i in array :
  print(i , end = '')