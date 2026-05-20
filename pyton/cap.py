HAVE = {
	"a": 4,
	"b": 3,
	"c": 1,
	"d": 2,
	"e": 7,
	"f": 2,
	"g": 3,
	"h": 1,
	"i": 3,
	"j": 3,
	"k": 3,
	"l": 6,
	"m": 2,
	"n": 4,
	"o": 4,
	"p": 3,
	"q": 2,
	"r": 2,
	"s": 2,
	"t": 2,
	"u": 2,
	"v": 2,
	"w": 2,
	"x": 2,
	"y": 2,
	"z": 2,
	"4": 1,
	"?": 1,
	"!": 1,
	"#": 2
}


def check():
	have_chars = set(HAVE.keys())
	need = {}
	inp = str(input("Input string (<q> to end): "))
	if inp == "q":
		return
	inp = inp.lower()

	for ch in inp:
		if ch == " ":
			continue
		need[ch] = need.get(ch, 0) + 1

	have_all = True 
	for chr in need:
		owned = HAVE.get(chr, 0)
		if need[chr] > owned:
			have_all = False
			print(f"Need {need[chr] - owned} of <{chr}>")

	if have_all:
		print("Possible to put on cap :)")

	print("")
	check()

	# nxt = input("Another? (q to end) ")
	# if nxt != "q":
	# 	print("")
	# 	check()
		

check()
