import time

from selenium.webdriver import Chrome


if __name__ == '__main__':
    #创建浏览器对象
    browser = Chrome(r'C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe')
    browser.get("https://www.baidu.com")
    time.sleep(2)
    browser.find_element_by_id("kw").send_keys("php")
    browser.find_element_by_id("su").click()
    time.sleep(10)
    js = "document.documentElement.scrollTop=10000"
    browser.execute_script(js)
    print("执行完毕")
    time.sleep(5)
    divs = browser.find_elements_by_xpath('//div[@class="op_exactqa_detail_s_answer_scroll"]/div[1]/div')
    print("divs==", divs)
    for d in divs:
        print(d.text)