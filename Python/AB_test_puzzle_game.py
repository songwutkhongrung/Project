import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

path = 'E:\python\AB test mobile puzzle game\cookie_cats.csv'
df = pd.read_csv(path)
df.head()

#check type of data 
df.info()

#check null value in data set
df.isna().sum()

#Export data 
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

reten_df = pd.DataFrame(np.zeros(4).reshape(2,2),index=["retention_1","retention_7"],columns=['True','False'])
reten_df['True'] = [df['retention_1'].sum(), df['retention_7'].sum()]
reten_df['False'] = [len(df) - df['retention_1'].sum(), len(df) - df['retention_7'].sum()]
plot1 = reten_df.plot(kind='bar',title='Come back to game in 1 days and 7 days',color=['#E19898','#4D3C77'],ax=ax1)
plot1.set_xlabel('Retenion')
plot1.set_ylabel('count')


df['version'].value_counts().plot(kind='pie',ax=ax2,autopct='%1.1f%%',colors=['#E19898','#4D3C77'])
ax2.set_title('Version Distribution')



#We know each version total play
df.groupby('version')['sum_gamerounds'].sum()

#replace value from gate_30 and gate_40 to A and B 
df['version'] = df['version'].replace({'gate_30':'A','gate_40':'B'})

#create function to calculate AB test
def A_B_function(dataframe, group, target):
    import scipy.stats as stats
    
    # Split data by group
    groupA = dataframe[dataframe[group]=='A'][target]
    groupB = dataframe[dataframe[group]=='B'][target]
    
    n = len(groupB)-(len(groupB)-len(groupA))

    groupA = groupA.sample(n=n,random_state=42)
    groupB = groupB.sample(n=n,random_state=42)
    print("""hypothesis test
    HO: Variances is equal
    H1:Variances is not equal""")
    statistic_Ftest, p_value_Ftest = stats.levene(groupA,groupB)

    alpha = 0.05

    if p_value_Ftest < alpha:
        print("----------------------------------------------------")
        print("Reject H0 hypothesis:Variances is not equal")
        print("----------------------------------------------------")
    else:
        print("----------------------------------------------------")
        print("Fail to reject HO: Variances is equal")
        print("----------------------------------------------------")
    
    print("""hypothesis test
    HO: mean is not different
    H1:mean is  different""")

    statistic_ttest, p_value_ttest = stats.ttest_rel(groupA,groupB)
    if p_value_ttest < alpha:
        print("----------------------------------------------------")
        print("Reject H0 hypothesis:Variances is not equal")
        print("----------------------------------------------------")
    else:
        print("----------------------------------------------------")
        print("Fail to reject HO: Variances is equal")
        print("----------------------------------------------------")

    meanA = np.mean(groupA)
    meanB = np.mean(groupB)

    print("meandiff:",meanA-meanB)

#put data in function 
A_B_function(dataframe=df, group='version', target='sum_gamerounds')

#Create plot to know different between retention 1 day and retention 7 day
fig, (ax3, ax4) = plt.subplots(1, 2, figsize=(12, 5))
mean_retention_1 = []
for i in range(100):
    bootstrap_sample = df.sample(frac = 1,replace=True)
    mean_1 = bootstrap_sample[bootstrap_sample['retention_1'] == True].groupby('version')['sum_gamerounds'].mean()
    mean_retention_1.append(mean_1)
mean_retention_1 = pd.DataFrame(mean_retention_1)

mean_retention_7 = []
for i in range(100):
    bootstrap_sample = df.sample(frac = 1,replace=True)
    mean_7 = bootstrap_sample[bootstrap_sample['retention_7'] == True].groupby('version')['sum_gamerounds'].mean()
    mean_retention_7.append(mean_7)
mean_retention_7 = pd.DataFrame(mean_retention_7)

mean_retention_1.plot(kind='density',ax=ax3)
ax3.set_title('Retention 1 Day')
ax3.set_xlabel('Mean Value')

mean_retention_7.plot(kind='density',ax=ax4)
plt.title('Retention 7 Day')
plt.xlabel('Mean Value')


