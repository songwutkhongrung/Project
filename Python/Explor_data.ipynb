# import data
import pandas as pd
import numpy as np
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe
df['Order Date'] = pd.to_datetime(df['Order Date'],format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'],format='%m/%d/%Y')
df.info()

# TODO - count nan in postal code column
df['Postal Code'].isna().sum()

# TODO - filter rows with missing values
df[df.isnull().any(axis=1)]

# TODO - Explore this dataset on your owns, ask your own questions
#I want to know what is segment hight impact to business and what segment 1st Profit
S = df.groupby('Segment')['Profit'].agg(['count','sum']).round(2).reset_index()
S['per_1'] = round(S['sum']/S['count'],2)
S

# TODO 01 - how many columns, rows in this dataset
print("Row is ",df.shape[0],"Columns is" , df.shape[1])

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
df.isna().sum().sort_values(ascending=False)

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
data_California = df[df['State']=="California"]
data_California.to_csv('Data_California.csv',index = False)

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file
data_C_and_T_2017 = df[(df['State'].isin(["California","Texas"])) & (df['Order Date'].dt.year == 2017)]
data_C_and_T_2017.to_csv('data_C_and_T_2017.csv',index=False)

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
df[df['Order Date'].dt.year == 2017]['Sales'].agg(['sum','mean','std'])

# TODO 06 - which Segment has the highest profit in 2018
df[df['Order Date'].dt.year == 2018].groupby('Segment')['Profit'].sum().sort_values(ascending=False).head(1)

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019
df[(df['Order Date']>= '2019-4-15') & (df['Order Date']<= '2019-12-31')].groupby('State')['Sales'].sum().sort_values(ascending=True).head(5)

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 
fil_col = df[df['Order Date'].dt.year == 2019 ]
total = pd.DataFrame(fil_col[['Region','Sales']].groupby('Region')['Sales'].sum().sort_values(ascending=False)).round(2).reset_index()
sumtotal = total['Sales'].sum()
total['Percentage'] = round((total['Sales']/sumtotal)*100,2)
print("West + Central in 2019 equal",total[(total['Region']=='West')|(total['Region']=='Central')]['Percentage'].sum())

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
fil_year = df[(df['Order Date'].dt.year == 2019)|(df['Order Date'].dt.year == 2020)]
fil_year['Order Date'] = fil_year['Order Date'].dt.year
re_col = fil_year[['Product Name','Order Date','Quantity','Sales']]
full_2019 = re_col[re_col['Order Date']==2019].groupby('Product Name')[['Quantity','Sales']].sum().round(2).reset_index()
full_2020 = re_col[re_col['Order Date']==2020].groupby('Product Name')[['Quantity','Sales']].sum().round(2).reset_index()
Full_df =  pd.merge(full_2019,full_2020,how='outer',on='Product Name')
Full_df['Dif_Quantity'] = Full_df['Quantity_x'] - Full_df['Quantity_y']
Full_df['Dif_Sales'] = round(Full_df['Sales_x'] - Full_df['Sales_y'],2)
Full_df.rename(columns={'Quantity_x':'2019_Quantity','Sales_x':'2019_Sales','Quantity_y':'2020_Quantity','Sales_y':'2020_Sales'})
Full_df.sort_values(by='Quantity_x',ascending=False)

import matplotlib.pyplot as plt
# TODO 10 - plot at least 2 plots, any plot you think interesting :)
for_bar = df[['Region', 'Profit']].groupby('Region')['Profit'].sum().round(2).reset_index()
plt.figure(figsize=(8, 5))
plt.bar(for_bar['Region'], for_bar['Profit'], color='skyblue')
plt.title('Total Profit by Region')
plt.xlabel('Region')
plt.ylabel('Total Profit')
plt.grid(axis='y', linestyle='--', alpha=1)
# Pie chart (Distribution of Profit by Region)
plt.figure(figsize=(6, 6))
plt.pie(for_bar['Profit'], labels=for_bar['Region'], autopct='%1.1f%%', colors=['lightcoral', 'lightskyblue', 'lightgreen', 'lightpink'])
plt.title('Distribution of Profit by Region')

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
#I want to know Which state purchases more than 20 piece ?
group_state = df[['State','Quantity']].groupby('State').agg('count').reset_index()
group_state['Check'] = np.where(group_state['Quantity']>= 20 , 1,0)
group_state



    
