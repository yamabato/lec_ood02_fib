import sys
import csv
import subprocess
from collections import defaultdict

COUNT = 5
perf = defaultdict(list)

if len(sys.argv) == 1:
    print("usage: python3 perf.py [file name]")
    sys.exit(0)

file_name = sys.argv[1]
subprocess.run(["gcc", "-O0", file_name])

for _ in range(COUNT):
    output = subprocess.run(f"./a.out", shell=True, capture_output=True, text=True).stdout
    raw_perf = output.replace(":", "").split()
    raw_perf = list(map(int, raw_perf))
    perf = {raw_perf[i*2]: perf[raw_perf[i*2]]+[raw_perf[i*2+1]] for i in range(len(raw_perf)//2)}

perf = {k: sorted(v)[1:-1] for k, v in perf.items()}
perf_ave = [sum(v)/(COUNT-2) for k, v in sorted(perf.items(), key=lambda x: x[0])]
with open("perf.csv", "a") as f:
    writer = csv.writer(f, lineterminator="\n")
    writer.writerow([sys.argv[1]] + [f"{t:.1f}" for t in perf_ave])
