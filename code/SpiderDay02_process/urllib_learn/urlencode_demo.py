from urllib.parse import urlencode

if __name__ == '__main__':
    student_dict = {
        "id": 101,
        "name": "快冲",
        "age": 27,
        "score": 70
    }
    worker_tuple = (("empno",10086),("empnname","Jondan"))
    student_params = urlencode(student_dict)
    print(student_params)
    worker_params = urlencode(worker_tuple)
    print(worker_params)
