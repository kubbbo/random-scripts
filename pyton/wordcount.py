import sys

def main():
    # if len(sys.argv) < 2:
    #     return
    # inp = str(sys.argv[1])
    inp = str(input("Enter text:"))
    word_count = 0
    total_chars = 0
    last_c = " "
    dots = 0
    for c in inp:
        if last_c == " " and c != " ":
            word_count += 1
        if c == ".":
            dots += 1
        total_chars += 1
        last_c = c
    print(f'Words: {word_count}\nTotal characters: {total_chars}')
    print(f"Dots: {dots}")

main()
