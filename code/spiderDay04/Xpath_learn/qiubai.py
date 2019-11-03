import time
from urllib.request import urlopen, urlretrieve, Request
from lxml import etree

#下载“糗事百科”图片
if __name__ == '__main__':
    url = "https://www.qiushibaike.com/"
    headers_dict = {
        "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36"
    }
    r = Request(url,headers=headers_dict)
    # 发送请求
    response = urlopen(r)
    # 获取网页代码
    html = response.read().decode()
    #获取跟节点
    root_node = etree.HTML(html)
    #调用xpath选择器，选取结果
    pic_path_list = root_node.xpath('//div[@class="recommend-article"]/ul/li/a/img/@src')
    for pic_path in pic_path_list:
        dest_path = str(int(time.time() * 1000)) + ".jpg"
        urlretrieve("https:"+pic_path,filename="./images/"+dest_path)
        print(dest_path+"下载完毕")



