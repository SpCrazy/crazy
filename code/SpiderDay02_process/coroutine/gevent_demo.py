from threading import currentThread

import gevent


def learn(subject):
    while True:
        print(currentThread().name+"正在学习："+subject)
        gevent.sleep(10)
        print(currentThread().name+"本次学习结束~~~")

def sing(song):
    while True:
        print(currentThread().name+"正在唱歌，歌名为："+song)
        gevent.sleep(15)
        print(currentThread().name+"本首歌唱完~~~")

def eat(food):
    while True:
        print(currentThread().name+"正在吃："+food)
        gevent.sleep(20)
        print(currentThread().name+"吃完了~~~")

if __name__ == '__main__':
    #创建任务
    task1 = gevent.spawn(learn,"python")
    task2 = gevent.spawn(sing,song="《小苹果》")
    task3 = gevent.spawn(eat,food="米饭")
    #执行任务
    gevent.joinall([task1,task2,task3])