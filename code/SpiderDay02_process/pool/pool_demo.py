import os
import time
from multiprocessing import current_process
from multiprocessing import Pool


def func(food):
    for i in  range(50):
        print(current_process().name+"是后台进程吗？",current_process().daemon,
              "进程ID是：",os.getpid(),"父进程ID是：",os.getppid(),"food=",food)
        time.sleep(2)

if __name__ == '__main__':
    pool = Pool(processes=5)
    for i in range(10):
        pool.apply_async(func,args=("面条",))
    pool.close()
    pool.join()
    print(current_process().name+"正在运行")