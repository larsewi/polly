import os
import random
import string

directory = "/tmp/source"
if not os.path.isdir(directory):
    os.mkdir(directory)

while True:
    for filename in ("foo", "bar", "baz"):
        with open(os.path.join(directory, filename), "r+") as f:
            f.seek(0, os.SEEK_END)
            offset = f.tell()

            if offset > 10:
                f.seek(offset - 1, os.SEEK_SET)
                f.truncate()
                continue

            for _ in range(0, 20000000):
                f.write(random.choice(string.ascii_letters))
