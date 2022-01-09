import time
import  sys
r = '\033[1;31m'
g= '\033[1;32m'


def write(in_text):
 for char in in_text:
  time.sleep(0.1)
  sys.stdout.write(char)
  sys.stdout.flush()
write(f"{g}[+]{r} Starting Termux.....")
print("\t")
