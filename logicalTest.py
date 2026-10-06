#Logical Test
#1.Hidden Pattern -Duplicate & position Logic

data=[12,7,12,5,7,9,5,12,7,15]
duplicates=[]
count={}
for item in data:
    if item in count:
        count[item]+=1
    else:
        count[item]=1
for item in data:
    if count[item]>1 and item not in duplicates:
        duplicates.append(item)
print("Duplicate Values:")

for item in duplicates:
    print(item,"->",count[item],"times")



#2.Missing Number Logic
ids=[1,2,3,4,5,7,8,9,10]
for i in range(1,11):
    if i not in ids:
        print("Missing Number:",i)