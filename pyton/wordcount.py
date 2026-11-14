import sys


def parse(contents: str):
    word_count = 0
    total_chars = 0
    dots = 0
    s_lens_c = []
    s_lens_w = []

    curr_s_c = 0
    curr_s_w = 0
    last_c = " "
    for c in contents:
        curr_s_c += 1
        if last_c == " " and c != " ":
            word_count += 1
            curr_s_w += 1
        if c == ".":
            dots += 1
            s_lens_c.append(curr_s_c)
            s_lens_w.append(curr_s_w)
            curr_s_c = 0
            curr_s_w = 0
        total_chars += 1
        last_c = c
    if last_c != ".":
        s_lens_c.append(curr_s_c)
        s_lens_w.append(curr_s_w)

    return word_count, total_chars, dots, s_lens_c, s_lens_w


def read_file(filepath: str):
    contents = ""
    with open(filepath,"r") as f:
        contents = f.read()
    return contents


def main():
    filepath = ""
    contents = ""
    if len(sys.argv) < 2:
        contents = str(input("Enter text:"))
    else:
        contents = read_file(sys.argv[1])

    word_count, total_chars, dots, s_lens_c, s_lens_w = parse(contents)

    print(f'Words: {word_count}\nTotal characters: {total_chars}')
    print(f'Dots: {dots}')
    print(f'Sentence lengths (characters): {s_lens_c}')
    print(f'Sentence lengths (words): {s_lens_w}')

main()
