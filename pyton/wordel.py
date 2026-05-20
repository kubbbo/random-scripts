def get_missing(template:str):
	missing_idxs = []
	for i in range(len(template)):
		if template[i] == "X":
			missing_idxs.append(i)
	return missing_idxs

def wordel(available:str, template:str):
	missing_idxs = get_missing(template)
	if not missing_idxs:
		print(template)
	for letter in available:
		for m in (missing_idxs):
			wordel(available, template[:m] + letter + template[m+1:])
def main():
	first_available = input("Input available letters: ")
	first_template = input("Input template: ")
	wordel(first_available, first_template)

main()

