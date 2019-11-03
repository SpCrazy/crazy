import time
from threading import Thread, currentThread, Lock


#买票问题
class TicketThread(Thread):
    ticket = 5 #所有窗口共享5张票(类属性)
    lock = Lock()
    def __init__(self,thread_name):
        super().__init__(name=thread_name)

    def run(self):

        for i in range(100):
            TicketThread.lock.acquire()
            if TicketThread.ticket > 0:
                time.sleep(2)
                TicketThread.ticket -= 1
                print(currentThread().name+"卖了一张票，剩余票数为：", TicketThread.ticket)
            TicketThread.lock.release()




if __name__ == '__main__':
    for i in range(1,10):
        t = TicketThread("窗口"+str(i))
        t.start()