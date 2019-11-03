import time
from threading import currentThread, Thread


def func():
    while True:
        print(currentThread().name+"正在执行~~~")
        time.sleep(2)

if __name__ == '__main__':
    t = Thread(target=func)
    t.setDaemon(True)
    t.start()
    print(currentThread().name + "正在运行~~~~~")