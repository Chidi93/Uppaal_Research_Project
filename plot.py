import matplotlib.pyplot as plt


lines = []
with open("outputFile.txt", "r") as f:
    lines = f.readlines()

x_arr = []
y_arr = []
for line in lines:
    l1 = line.split(",")
    x = int(l1[0])
    x_arr.append(x)
    y = float(l1[2].strip("\n").strip("]"))
    y_arr.append(y)

print(x_arr, y_arr)
plt.plot(x_arr, y_arr, linestyle='--', marker='o', color='r')
plt.xlabel("Attack Time")
plt.ylabel("Probability")
plt.show()