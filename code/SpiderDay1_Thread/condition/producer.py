import time
from threading import Thread, currentThread

MAX_COUNT = 5  #生产面包的最大数量

class ProducerThread(Thread):  #生产者进程类
    def __init__(self,thread_name, bread,  condition):
        super().__init__(name=thread_name)
        self.bread = bread
        self.condition = condition


    def run(self):
        while True:
            self.condition.acquire()
            if self.bread.count < MAX_COUNT:
                time.sleep(2)
                self.bread.produce_bread()
                self.condition.notifyAll()
                print(currentThread().name+"生产了面包，当前面包数量为：",self.bread.count)
                self.condition.release()
            else:
                print("面包达到上限，"+currentThread().name+",停止生产，当前面包数量为：",self.bread.count)

                self.condition.wait()



