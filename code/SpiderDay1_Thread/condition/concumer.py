import time
from threading import Thread, currentThread


class ConsumerThread(Thread):
    def __init__(self, thread_name, bread, condition):
        super().__init__(name=thread_name)
        self.bread = bread
        self.condition = condition


    def run(self):
        while True:
            self.condition.acquire()
            if self.bread.count > 0:
                time.sleep(2)
                self.bread.consume_bread()
                print(currentThread().name + "消费了面包，当前面包数量为：", self.bread.count)
                self.condition.release()
            else:
                print("面包已消费完，" + currentThread().name + ",请等待生产，当前面包数量为：", self.bread.count)
                self.condition.notifyAll()
                self.condition.wait()
