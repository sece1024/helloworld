"""
1. 一个格子周围有3个格子为白，该格子为白
2. 一个格子周围2个格子为白，该格子颜色不变
3. 一个格子周围白格子少于2个，该格子为黑
4. 一个格子周围有超过3个白格子，该格子为黑
"""
import random

random.seed()


# 用数组表示网格，1表示白，0表示黑
class Board:
    SIZE = 26 + 2  # 网格大小, 为防止越界扩容2
    V = 0.2  # 初始时每个网格为白的概率

    def __init__(self):
        self.template = [[0 for i in range(self.SIZE)] for j in range(self.SIZE)]
        self.init()

    # 打印网格
    def show_board(self):
        for i in range(self.SIZE):
            for j in range(self.SIZE):
                print(self.template[i][j], end='\t')
            print()
        print('=\t' * self.SIZE)

    # 初始化
    def init(self):
        for i in range(1, self.SIZE-1):
            for j in range(1, self.SIZE-1):
                if random.random() < self.V:
                    self.template[i][j] = 1

    # 演化
    def life_or_die(self):
        for i in range(1, self.SIZE - 1):
            for j in range(1, self.SIZE - 1):
                num = 0
                for ii in range(i-1, i+2):
                    num += sum(self.template[ii][j-1:j+2])  # 计算周围一圈白色数目
                if self.template[i][j] == 1:                # 自己不算在网格内
                    num -= 1

                if num == 3:
                    self.template[i][j] = 1
                elif num < 2:
                    self.template[i][j] = 0
                elif num >3:
                    self.template[i][j] = 0

    # 按任意键继续
    def going(self):
        while input():
            self.life_or_die()
            self.show_board()


def main():
    # print('hello,world')
    b = Board()
    b.show_board()
    b.going()


if __name__ == '__main__':
    main()
