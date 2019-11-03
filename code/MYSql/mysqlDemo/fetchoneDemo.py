import pymysql
if __name__ == '__main__':
    conn = pymysql.Connect(
        host="localhost",
        port=3306,
        user="root",
        password="930214",
        database="mydb",
        charset="utf8"
    )
    cursor = conn.cursor()
    # sql = "select name,score from student where id=%s"
    sql = "select name,score from student"
    try:
        # cursor.execute(sql,(1,))
        # item = cursor.fetchone()
        # print("查询的数据为：",item)
        cursor.execute(sql)
        item = cursor.fetchone()
        while item:
            print("查询的数据为：", item)
            item = cursor.fetchone()
        conn.commit()
    except Exception as e:
        print("查询的数据失败，原因为：",e)
        conn.rollback()
    finally:
        cursor.close()
        conn.close()