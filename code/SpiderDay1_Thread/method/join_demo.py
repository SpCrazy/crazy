import time
from threading import currentThread, Thread


def func():
    for i in range(5):
        print(currentThread().name+"正在执行，i=",i+1)
        time.sleep(2)


if __name__ == '__main__':
    t = Thread(target=func,name="快冲线程")
    t.start()
    t.join()

    for i in range(5):
        print(currentThread().name+"正在执行，i=",i+1)
        time.sleep(2)