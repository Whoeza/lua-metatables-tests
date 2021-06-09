-- # testing variable holding functions
myVar = {
    b = 1,
    c = 52,
}
myVar.sum = (function() return myVar.b+myVar.c end)()

print(myVar.sum)
myVar.b = -20
print(myVar.sum)
print(myVar.b+myVar.c)