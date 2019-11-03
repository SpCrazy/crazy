import time

import gevent
from gevent import monkey

monkey.patch_all(thread=False)

def sing():
    while True:
        print("sing.........")
        time.sleep(2)

def dance():
    while True:
        print("dance.........")
        time.sleep(2)

if __name__ == '__main__':
    task1 = gevent.spawn(sing)
    task2 = gevent.spawn(dance)
    gevent.joinall([task1,task2])