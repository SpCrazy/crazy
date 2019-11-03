import redis
r = redis.Redis(host="localhost",port=6379)
if __name__ == '__main__':
    r.set("fruit","苹果") #设置字符串
    data = r.get("fruit")
    print(data.decode())  #从Redis中获取的数据，要进行解码
    r.hmset("student:101",{"name":"马云","age":29,"score":93.5})
    data1 = r.hgetall("student:101")
    resultData = {}
    for k,v in data1.items():
        resultData[k.decode()] = v.decode()
    print(resultData)