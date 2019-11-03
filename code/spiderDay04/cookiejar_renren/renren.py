import json
from http import cookiejar
from urllib.parse import urlencode
from urllib.request import Request, HTTPCookieProcessor, build_opener

if __name__ == '__main__':
    login_url = "http://www.renren.com/ajaxLogin/login?1=1&uniqueTimestamp=2019641139565"
    #创建Cookiejar对象
    cj = cookiejar.CookieJar()
    #创建可以处理cookiejar的Handler
    handler = HTTPCookieProcessor(cj)
    #创建打开器
    opener = build_opener(handler)
    form_dict = {
        "email": "15291960323",
        "icode": "",
        "origURL":"http://www.renren.com/home",
        "domain":"renren.com",
        "key_id": "1",
        "captcha_type": "web_login",
        "password": "7d61bcd68537951ebda36e411521c48d9adeca12725d947868fd98453a02292f",
        "rkey": "36a9ad71468e2e60c092fb4bfe24dd7f",
        "f": "http%3A%2F%2Fwww.renren.com%2F480312482"
    }
    headers_dict = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
        "X-Requested-With": "XMLHttpRequest"
    }
    params = urlencode(form_dict)
    r = Request(login_url,data=params.encode(),headers=headers_dict)
    response = opener.open(r)
    success_dict = json.loads(response.read().decode())
    homeUrl = success_dict["homeUrl"]
    home_response = opener.open(homeUrl)
    with open("renren.html","wb") as f:
        f.write(home_response.read())
    print("人人网信息保存成功")
    # print("二次请求之后的内容：")
    # print(home_response.read().decode())

