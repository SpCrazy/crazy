import time

import pymysql

from urllib.request import urlopen,Request

from bs4 import BeautifulSoup


def get_conn():
    conn = pymysql.Connect(
        host="localhost",
        port=3306,
        database="mydb",
        user="root",
        password="930214",
        charset="utf8"
    )
    return conn

def spider_movie(page_number):
    movies = []
    #爬取某一页电影名称，page_number为要爬取的页码
    start_index = (page_number - 1) * 25
    response = urlopen("https://movie.douban.com/top250?start="+str(start_index)+"&filter=")
    bs = BeautifulSoup(response,"lxml")
    #提取所有class属性值为hd的div
    divs = bs.findAll("div",attrs={"class":"hd"})
    for div in divs:
        #提取电影名称
        movie_name = div.a.find("span").text
        movies.append(movie_name)
    return movies


def save_database():
    conn = get_conn()
    cursor = conn.cursor()
    sql = "insert into movies(name)values(%s)"
    try:
        for i in range(1,11):
            movies = spider_movie(i)
            time.sleep(2)
            for moviename in movies:
                cursor.execute(sql,(moviename,))
            conn.commit()
            print("第%d页电影插入完成"% i)
    except Exception as e:
        print("数据处理过程失败，失败原因：",e)
        conn.rollback()
    finally:
        cursor.close()
        conn.close()


if __name__ == '__main__':
    save_database()