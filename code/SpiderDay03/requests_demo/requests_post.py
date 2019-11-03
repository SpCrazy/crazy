import requests


if __name__ == '__main__':
    url = "http://www.httpbin.org/post"
    params_dict = {
        "name":"alice",
        "age":25
    }
    headers_dict = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36"
    }
    response = requests.post(url,data=params_dict,headers=headers_dict)
    print("响应状态码：",response.status_code)
    print("最终URL是：",response.url)
    print("响应内容",response.text)