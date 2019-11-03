from urllib.request import urlopen


url = "http://sohu.com"
response = urlopen(url)
print("响应状态码是：",response.status)
print("响应内容是：",response.read().decode())


