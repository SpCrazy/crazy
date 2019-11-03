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
    sql = "select name,score from student"
    try:
        cursor.execute(sql)
        items = cursor.fetchall()
        print("查询的数据为：", items)
        conn.commit()
    except Exception as e:
        print("查询的数据失败，原因为：",e)
        conn.rollback()
    finally:
        cursor.close()
        conn.close()