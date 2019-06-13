#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun 13 08:19:23 2019

@author: manpreetsaluja
"""

#PRnciple Component annalysis

#Steps
#1.Standardize
#2.Covariance matrix
#3.eigen values,vector,
#PCA matrix
#done

import pandas as pd
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
dataset=pd.read_csv(url,names=['speal length','sepal width','petal length','petal width','target'])

dataset.describe
dataset.shape

#Standarizing the dataset as PCA is highly affected by standardising te value 
from sklearn.preprocessing import StandardScaler

features=['speal length','sepal width','petal length','petal width']
target=['target']

x=dataset.loc[:,features].values
y=dataset.loc[:,target].values

x = StandardScaler().fit_transform(x)
x

#apply PCA

from sklearn.decomposition import PCA

pca=PCA(n_components=2)
pca
pc=pca.fit_transform(x)
pc


import pandas as pd
principledf=pd.DataFrame(data=pc,columns=['PrincipleComponent1','PrinicpleComponent2'])

finalDf = pd.concat([principledf, dataset[['target']]], axis = 1)


