from multiprocessing import Queue, current_process, Process

q = Queue()

def sent_messages(q1):
    print(current_process().name + "数据准备入队")
    q1.put("香蕉")
    q1.put("橘子")
    q1.put("菠萝")
    print(current_process().name + "入队完毕")


def save_messages(q2):
    while True:
        if not q2.empty():
            with open("data.txt", "a", encoding="utf-8") as f:
                f.write(q2.get())
        else:
            print(current_process().name+"保存成功")
            break

if __name__ == '__main__':
    p1 = Process(target=sent_messages, args=(q,),name="入队进程")
    p1.start()
    p2 = Process(target=save_messages, args=(q,), name="保存进程")
    p2.start()