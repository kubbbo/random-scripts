import random as r
import sys
from pathlib import Path


def set_repeats() -> bool:
	yn = str(input("Repeats? (y/n,	default n)"))
	if (len(yn) <= 0 or yn == "n"):
		return False
	elif (yn == "y"):
		return True
	print("Wrong option, try again.")
	return set_repeats()


def main():
	if len(sys.argv) < 2:
		print("Error: no file path entered.")
		return
	if len(sys.argv) > 2:
		print("Error: multiple files not currently supported.")
		return
	filepath = sys.argv[1]
	if not Path(filepath).exists():
		print("Error: file does not exist.")
		return
	repeats = set_repeats()
	used_idxs = set()
	options = []

	with open(filepath,"r") as f:
		options = f.readlines()
	inp=" "
	counter=1
	print("#####################################\n")
	while inp != "q":
		if not repeats and counter >= len (options):

			break
		r_idx = r.randrange(0, len(options))
		if r_idx in used_idxs:
			continue

		# print("#####################################\n")
		print(f'{counter} | {options[r_idx]}')
		print("#####################################")

		if not repeats:
			used_idxs.add(r_idx)
		counter += 1
		inp = str(input(""))
		while inp != "" and inp != "q":
			inp = str(input(""))

	# print(options)


# def generate_setup() -> None:
#         r_loc = r.randrange(0, len(LOCATIONS))
#         r_cls = r.randrange(0, len(CLASSES))
#         r_wtr = r.randrange(0, len(WEATHERS))
#         r_rev = r.randint(0, 1)
#
#         loc = LOCATIONS[r_loc]
#         cls = CLASSES[r_cls]
#
#         location = loc.name
#         track = loc.random_track()
#         carclass = cls.name
#         car = cls.random_car()
#         weather = WEATHERS[r_wtr]
#         reverse = ' - r' if r_rev == 1 else ''
#
#         print("#####################################")
#         print(f"location:  {location}")
#         print(f"stage:     {track}{reverse}")
#         print(f"weather:   {weather}")
#         print(f"car class: {carclass}")
#         print(f"car:       {car}")
#         print("#####################################")

main()
