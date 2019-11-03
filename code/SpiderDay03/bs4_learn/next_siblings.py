from urllib.request import urlopen
from bs4 import BeautifulSoup

response = urlopen('http://www.pythonscraping.com/pages/page3.html')
bsObj = BeautifulSoup(response,'html.parser')


for tr in bsObj.find("table",attrs={"id":"giftList"}).tr.next_siblings:
    print(tr)