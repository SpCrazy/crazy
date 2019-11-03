import time
from multiprocessing import current_process, Process


def func(food,play):
    for i in range(5):
        print(current_process().name + "正在执行，i=", i, "food=", food, "play=", play)
        time.sleep(1)


if __name__ == '__main__':
    # t = Thread(target=func,args=("面条","足球"))
    p = Process(target=func, kwargs={"food": "米饭", "play": "篮球"})
    p.start()
    print(current_process().name+"正在运行~~~~~")
