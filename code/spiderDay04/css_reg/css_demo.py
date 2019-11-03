import re
from urllib import parse

from bs4 import BeautifulSoup

if __name__ == '__main__':
    with open("./sohu.html",encoding="utf-8") as f:
        html = f.read()
        bs = BeautifulSoup(html,"lxml")
        div = bs.select("div.pic")
        print(div)
