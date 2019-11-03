import re

from bs4 import BeautifulSoup

if __name__ == '__main__':
    with open("./sohu.html",encoding="utf-8") as f:
        html = f.read()
        bs = BeautifulSoup(html,"lxml")
        m_list = bs.findAll(re.compile("^m"))
        for m in m_list:
            print(m)