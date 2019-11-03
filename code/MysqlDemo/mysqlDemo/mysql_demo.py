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
    sql1 = "update pay set salary=salary-200 where name='tom'"
    sql2 = "update pay set salary=salary+200 where name='jerry'"
    try:
        cursor.execute(sql1)
        cursor.execute(sql2)
        conn.commit()
        print("转账成功")
    except Exception as e:
        print("系统异常，转账失败")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()