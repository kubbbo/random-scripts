a=[]
m=int(input("input modulo "))
base=int(input("input base "))
mode=str(input("input mode (h for help) "))
while mode == "h":
	print("p for prim root")
	print("o for rem=1")
	mode=str(input("input flag (h for help) "))

for i in range(1,m):
	rem =(base**i) % m
	print(f"exp: {i} | rem: {rem}")
	if mode == 'p':
		if rem not in a:
			a.append(rem)
		else:
			print(f"fuck. exp: {i}")
			break
	elif mode == "o" and (rem == 1 or rem == m-1):
		break

print(a)
