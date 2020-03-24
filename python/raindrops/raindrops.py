SOUNDS = {
    3: "Pling",
    5: "Plang",
    7: "Plong",
}

def convert(number):
    sound = "".join([find_sound(number, factor) for factor in SOUNDS.keys()])
    if sound == "":
        return str(number)

    return sound

def find_sound(number, factor):
    if ((number % factor) == 0):
        return SOUNDS.get(factor)

    return ""
