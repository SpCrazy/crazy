from multiprocessing import Pipe, current_process, Process

conn1,conn2 = Pipe()

def send_messages(conn,data):
    print("send_messages()中的conn=",conn)
    print(current_process().name+"准备发送数据")
    conn.send(data)
    print(current_process().name + "数据已经发送完毕!")

def receive_message(conn):
    print("receive_messages()中的conn=", conn)
    print(current_process().name + "准备接收数据")
    data = conn.recv()
    print(current_process().name + "接收到的数据为：",data)

if __name__ == '__main__':
    print("外部的conn1=",conn1,"外部的conn2=",conn2)
    p1 = Process(target=send_messages,args=(conn1,"孙子兵法"))
    p1.start()
    p2 = Process(target=receive_message, args=(conn2,))
    p2.start()