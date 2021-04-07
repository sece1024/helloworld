import numpy as np
import matplotlib.pyplot as plt

# x = range(10)
# plt.plot(x, x)
# plt.show()

# plt.gcf().set_facecolor(np.ones(3)* 240 / 255)   # 生成画布的大小
# plt.grid()  # 生成网格
# plt.show()


# ax = plt.gca()
# ax.set_xlim(0, 10)
# ax.set_ylim(0, 10)
# miloc = plt.MultipleLocator(1)
# ax.xaxis.set_minor_locator(miloc)
# ax.yaxis.set_minor_locator(miloc)
# plt.grid(color='red')
# plt.show()

x = np.arange(0, 10, 0.1)
y = x

fig = plt.figure()
ax = fig.gca()
ax.set_xticks(np.arange(0, 10, .1))
ax.set_yticks(np.arange(0, 10, .1))
# plt.scatter(x,y)
plt.grid()
plt.show()