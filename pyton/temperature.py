ALLOWED_MODES = {'h', 'f', 'c', 'q'}

def main(): 
	mode = input("Input mode (h for help): ")
	if mode not in ALLOWED_MODES:
		print("Unknown mode.\n")
	elif mode == "q":
		return
	
	if mode == "h":
		print("f: fahrenheit -> celsius")
		print("c: celsius -> fahrenheit")
		print("q: quit program")
		print("")
	elif mode in {'c', 'f'}:
		in_mark = "°C" if mode == "c" else "°F"
		val = int(input(f"Enter temperature in {in_mark}: "))
		conv = round((val * 5/9) - 32) if mode == "f"\
			   else round((val + 32) * 9/5)
		out_mark = "°C" if mode == "f" else "°F"
		print(f"Converted temperature: {conv}{out_mark}\n")
	
	main()

main()