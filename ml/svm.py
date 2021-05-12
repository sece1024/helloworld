# SMO
import numpy as np
import random

class SVM:
    def __init__(self, C, tolerance, epsilon, max_step, kernel, sigma = 0.5):
        self.C = C  # 参数 C
        self.tolerance =  tolerance  # 容错率
        self.epsilon = epsilon # 拉格朗日乘数更新的最小比率
        self.max_step = max_step  # 训练次数
        self.kernel = kernel  # 和函数类型：'linear'、'rbf'
        self.sigma = sigma
    # 定义核函数
    # sample: 单样本，行向量
    def Kernel(self, X, sample):
        if self.kernel == 'linear':
            result = np.dot(X, sample.T).reshape(-1, 1)
        elif self.kernel == 'rbf':
            result = np.exp(-np.linalg.norm(X - sample, ord=2, axis=1, keepdims=True) ** 2) / (2*self.sigma**2)
        return result
    # 计算Gram矩阵
    def Gram(self,X):
        self.K = np.zeros((self.N, self.N))

