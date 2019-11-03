

def func():
    print("11111111111")
    x = yield "hello"
    print(x)
    yield "world"


if __name__ == '__main__':
    g = func()
    data1 = next(g)
    print(data1)
    data2 = g.send("苹果")
    print(data2)
