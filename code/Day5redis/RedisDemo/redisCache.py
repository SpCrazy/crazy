import pymysql,redis,time

r = redis.Redis(host="localhost", port=6379)

def get_conn():
    conn = pymysql.Connect(
        host = "localhost",
        port = 3306,
        user = "root",
        password = "930214",
        database = "myku",
        charset = "utf8"
    )
    return conn

def getProduct(product_id):
    key = "product:" + str(product_id) #redis的key
    product_dict = r.hgetall(key)
    if product_dict:
        print("缓存命中啦~~~")
        data = {}
        for k,v in product_dict.items():
            data[k.decode()] = v.decode()
        return  data
    else:  #如果redis中没有，则查询mysql
        print("缓存中没有该数据，继续查询mysql....")
        time.sleep(3)
        conn = get_conn()
        cursor = conn.cursor()
        sql = "select id,name,price from product where id=%s"
        try:
            cursor.execute(sql,(product_id,))
            item = cursor.fetchone()
            conn.commit()
            if item:
                data = {"product_id": item[0], "product_name": item[1], "product_price": item[2]}
                r.hmset(key, data)
                r.expire(key,60)
                return data
            else:
                print("sorry,系统无此数据!")
        except Exception as e:
            print("查询失败，失败原因：",e)
            conn.rollback()
        finally:
            cursor.close()
            conn.close()

if __name__ == '__main__':
    data = getProduct(2)
    print("获取到的产品数据为:",data)

