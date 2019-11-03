from urllib.request import urlretrieve

if __name__ == '__main__':
    url = "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2719855372,991083710&fm=26&gp=0.jpg"
    urlretrieve(url,filename="./download/星空.jpg")
    print("下载成功")