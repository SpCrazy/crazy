



class Bread():  #面包实体类
    def __init__(self):
        self.count = 0  #面包数量


    def produce_bread(self):  #生产面包
        self.count += 1

    def consume_bread(self):  #消费面包
        self.count -= 1
