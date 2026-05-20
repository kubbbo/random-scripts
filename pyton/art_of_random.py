import random as r

Track = str
Weather = str
Car = str

class Location:
	def __init__(self, name: str, tracks: list[Track]):
		self.name = name
		self.tracks = tracks
	
	def random_track(self):
		return self.tracks[r.randrange(0, len(self.tracks))]

class CarClass:
	def __init__(self, name: str, cars: list[Car]):
		self.name = name
		self.cars = cars
		
	def random_car(self):
		return self.cars[r.randrange(0, len(self.cars))]


FIN = Location("finland", ["noormakku",
						   "lamppi",
						   "palus",
						   "lasilla",
						   "kairila",
						   "haapajärvi"])

SAR = Location("sardinia", ["villacidro",
							"san gavino monreale",
							"san benedetto",
							"gennamari",
							"portu maga",
							"montevecchio"])

JPN = Location("japan", ["nasu highland",
						 "mount asama",
						 "mount akagi",
						 "nikko",
						 "tsumagoi",
						 "mount haruna"])

NOR = Location("norway", ["laupstad",
						 "vestpollen",
						 "stronstad",
						 "kvannkjosen",
						 "grunnfor",
						 "lake rostavatn"])

GER = Location("germany", ["hockweiler",
						   "franzenheim",
						   "holzerath",
						   "farschweiler",
						   "mertesdorf",
						   "gonnesweiler"])

KEN = Location("kenya", ["mount kenya",
						 "karura",
						 "homa bay",
						 "ndere island",
						 "lake baringo",
						 "lake nakuru"])

IND = Location("indonesia", ["mount kawi",
							 "semangka bay",
							 "satonda island",
							 "oreng valley",
							 "sangeang island",
							 "kalabakan valley"])

AUS = Location("australia", ["gum scrub",
							 "toorooka",
							 "nulla nulla",
							 "comara canyon",
							 "lake lucernia",
							 "wombamurra"])
	

G2 = CarClass("group 2", ["the esky v1",
						  "the meanie",
						  "la montaine",
						  "das 220",
						  "119i",
						  "le gorde",
						  "la regina",
						  "the rotary kei"])

G3 = CarClass("group 3", ["the esky v2",
						  "il nonno 313",
							  "the rotary 3",
							  "la wedge",
							  "il cavallo 803",
							  "das 119e",
							  "la hepta",
							  "the pebble v1",
							  "the pebble v2",
							  "the zetto"])

G4 = CarClass("group 4", ["le cinq",
						  "das whip",
						  "turbo brick",
						  "das uberwhip",
						  "the cozzie sr5",
						  "the original",
						  "la super montaine",
						  "la longana",
						  "das scholar"])

GB = CarClass("group b", ["the 4r6",
						  "le 502",
						  "das hammer v1",
						  "das hammer v2",
						  "il gorilla 4s",
						  "the cozzie sr2",
						  "the cozzie sr71",
						  "the rotary b7",
						  "das hammer v3",
						  "il monster",
						  "il cavallo 803",
						  "le cinq b",
						  "das uberspeedvan",
						  "the king of africa",
						  "das 559",
						  "the hyena",
						  "das maestro"])

GS = CarClass("group s", ["das eibenhammer",
						  "the rotary s7",
						  "the umibozu",
						  "il gorilla e1",
						  "le 504",
						  "il gorilla e2",
						  "das superbaus",
						  "the t22"])

GA = CarClass("group a", ["il gorillona",
						  "the fujin",
						  "the liftback",
						  "the max attack",
						  "the cozzie 90",
						  "the kingpin"])

MISC = CarClass("miscellanious", ["das speedvan",
								  "das hi-speedvan",
								  "das cube van",
					   		   "funselektor's van",
					   		   "little monkey",
								  "dakar truck",
								  "log transporter"])

LOCATIONS = [FIN, SAR, JPN, NOR, GER, KEN, IND]
CLASSES = [G2, G3, G4, GB, GS, GA, MISC]
WEATHERS = ["morning", "afternoon", "sunset",
			"rain", "night", "fog"]


def generate_setup() -> None:
	r_loc = r.randrange(0, len(LOCATIONS))
	r_cls = r.randrange(0, len(CLASSES))
	r_wtr = r.randrange(0, len(WEATHERS))
	r_rev = r.randint(0, 1)
	
	loc = LOCATIONS[r_loc]
	cls = CLASSES[r_cls]
	
	location = loc.name
	track = loc.random_track()
	carclass = cls.name
	car = cls.random_car()
	weather = WEATHERS[r_wtr]
	reverse = ' - r' if r_rev == 1 else '' 
	
	print("#####################################")
	print(f"location:  {location}")
	print(f"stage:     {track}{reverse}")
	print(f"weather:   {weather}")
	print(f"car class: {carclass}")
	print(f"car:       {car}")
	print("#####################################")

inp = ""
while inp != "q":
	generate_setup()
	inp = str(input("\n"))
