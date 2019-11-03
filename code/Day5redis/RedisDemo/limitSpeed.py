import redis

if __name__ == '__main__':
    r = redis.Redis(host="localhost",port=6379)

    key = "limit:ip"
    #将key对应的value设置为访问次数，第一次访问次数为1
    is_ok = r.set(key,1,ex=60,nx=True)
    print(is_ok)
    if is_ok or r.incr(key) <= 5:
        print("恭喜，可以访问，这是第" + r.get(key).decode() + "次访问")
    else:
        print("您的访问过于频繁，请稍后再试！！！")



