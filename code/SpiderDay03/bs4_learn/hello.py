from urllib.request import urlopen
from bs4 import BeautifulSoup



response = urlopen("http://www.pythonscraping.com/pages/page1.html")
bs = BeautifulSoup(response.read(),"html.parser")
print(bs.h1)
print(bs.h1.get_text())
print(bs.h1.text)
print(bs.html.body.h1)
print(bs.body.h1)
