from urllib.request import urlopen
from bs4 import BeautifulSoup


response = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
bsObj = BeautifulSoup(response,"lxml")

span = bsObj.find("span", attrs={"class": ["green"]})
print("一共找到符合条件的标签个数为：",len(span))
print(span.get_text())