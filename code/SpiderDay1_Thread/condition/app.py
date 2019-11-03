from threading import Condition

from condition.concumer import ConsumerThread
from condition.goods import Bread
from condition.producer import ProducerThread

bread = Bread()
con = Condition()



if __name__ == '__main__':
    for i in range(1,4):
        t = ProducerThread("生产者"+ str(i) + "号",bread,con)
        t.start()

    for i in range(1,6):
        t = ConsumerThread("消费者"+ str(i) + "号",bread,con)
        t.start()
