from urllib.request import Request, urlopen

if __name__ == '__main__':
    headers_info = {
        "Agent":"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 SE 2.X MetaSr 1.0"
    }
    r1 = Request("http://www.httpbin.org/get?name=tom&age=27",headers=headers_info)
    response = urlopen(r1)
    print(response.read().decode())
    print("*" * 10)
    params = "color=yello&country=China"
    r2 = Request("http://www.httpbin.org/post?name=alice&sex=girl",data=params.encode())
    response2 = urlopen(r2)
    print(response2.read().decode())