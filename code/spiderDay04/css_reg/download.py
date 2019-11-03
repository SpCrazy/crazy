from urllib.request import urlopen

if __name__ == '__main__':
    url = "http://www.sohu.com/"
    response = urlopen(url)
    with open("sohu.html","wb") as f:
        f.write(response.read())
        print("搜狐信息保存成功")