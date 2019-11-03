from urllib.request import urlopen
from bs4 import BeautifulSoup


response = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
bsObj = BeautifulSoup(response,"lxml")

span_list = bsObj.findAll("span", attrs={"class": ["green"]})
print("一共找到符合条件的标签个数为：",len(span_list))
for span in span_list:
    print(span.get_text())