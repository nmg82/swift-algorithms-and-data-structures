var numberList = [8, 2, 10, 7, 5]

//foward stride enumeration
for index in stride(from: 0, through: numberList.endIndex - 1, by: 1) {
  print(numberList[index])
}

print("\n--------------------------------------------\n")

//foward stride enumeration - every two
for index in stride(from: 0, through: numberList.endIndex - 1, by: 2) {
  print(numberList[index])
}

print("\n--------------------------------------------\n")

//reverse stride enumeration
for index in stride(from: numberList.endIndex - 1, through: 0, by: -1) {
  print(numberList[index])
}
