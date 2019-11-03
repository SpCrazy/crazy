import time
from threading import Thread, currentThread


class MyThread(Thread):

    def __init__(self,thread_name):
        super().__init__(name=thread_name)

    def run(self):
        for i in range(5):
            print(currentThread().name+"正在执行，i=",i)
            time.sleep(1)


if __name__ == '__main__':
    mt = MyThread("快冲线程")
    mt.start()
    print(currentThread().name+"正在运行~~~~~")
