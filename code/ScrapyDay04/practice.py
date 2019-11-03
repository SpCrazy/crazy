

def extendList(val,list=[]):
    list.append(val)
    return list


l1 = extendList(10)
print("l1 = %s" % l1)

l2 = extendList(123,[])
l3 = extendList('a')
l4 = extendList([])


print("l1 = %s" % l1)
print("l2 = %s" % l2)
print("l3 = %s" % l3)
print("l4 = %s" % l4)


