import time
from multiprocessing import Process, current_process


class MyProcess(Process):
    def __init__(self,process_name):
        Process.__init__(self,name=process_name)


    def run(self):
        for i in range(5):
            print(current_process().name+"正在运行~~~~~~~~")
            time.sleep(2)


if __name__ == '__main__':
    p = MyProcess("我的进程")
    p.start()
    print(current_process().name + "正在运行~~~~~~~~")
