import time
from threading import Thread, currentThread

def func(food,play):
    for i in range(5):
        print(currentThread().name + "正在执行，i=", i, "food=", food, "play=", play)
        time.sleep(1)


if __name__ == '__main__':
    # t = Thread(target=func,args=("面条","足球"))
    t = Thread(target=func, kwargs={"food": "米饭", "play": "篮球"})
    t.start()
    print(currentThread().name+"正在运行~~~~~")
