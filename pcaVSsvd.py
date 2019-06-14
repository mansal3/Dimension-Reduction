#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 14 07:24:47 2019

@author: manpreetsaluja
"""

#PCA WITH EXAMPLE
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.decomposition import PCA,TruncatedSVD
from sklearn import linear_model
from sklearn.ensemble import RandomForestClassifier

from sklearn.datasets import load_boston
boston=load_boston()
df_x=pd.DataFrame(boston.data,columns=boston.feature_names)
df_y=pd.DataFrame(boston.target)

reg=linear_model.LinearRegression()
x_train,x_test,y_train,y_test=train_test_split(df_x,df_y,test_size=0.2)
reg.fit(x_train,y_train)

reg.score(x_test,y_test)

#----apply pca---#
pca=PCA(n_components=8)
x=pca.fit(df_x).transform(df_x)

pca.explained_variance_ratio_

reg=linear_model.LinearRegression()
x_train,x_test,y_train,y_test=train_test_split(x,df_y,test_size=0.2)
reg.fit(x_train,y_train)

reg.score(x_test,y_test)


#-------svd======#####3

svd=TruncatedSVD(n_components=10)
x=svd.fit(df_x).transform(df_x)
reg=linear_model.LinearRegression()
x_train,x_test,y_train,y_test=train_test_split(x,df_y,test_size=0.2)
reg.fit(x_train,y_train)

reg.score(x_test,y_test)