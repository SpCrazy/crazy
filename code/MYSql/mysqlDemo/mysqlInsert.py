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
    sql = "insert into student(name,age,sex,score) value(%s,%s,%s,%s)"
    try:
        cursor.execute(sql,("令狐冲",26,"男",90.5))
        conn.commit()
        print("数据插入成功~~~")
    except Exception as e:
        print("数据插入失败，失败原因：",e)
        conn.rollback()
    finally:
        cursor.close()
        conn.close()