import os
import time

from PIL import Image
from selenium.webdriver import Chrome

if __name__ == '__main__':
    browser = Chrome(r'C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe')
    browser.get("https://account.guokr.com/sign_in/")
    time.sleep(3)
    login_screenshot = "./login.png"
    if os.path.exists(login_screenshot):
        os.remove(login_screenshot)
    # browser.set_window_size(1000,600)
    browser.save_screenshot(login_screenshot)
    elements = browser.find_elements_by_xpath('//img[@id="captchaImage"]')
    top_x = elements[0].location['x']
    top_y = elements[0].location['y']
    bottom_x = elements[0].location['x'] + elements[0].size["width"]
    bottom_y = elements[0].location['y'] + elements[0].size["height"]

    captcha_screenshot = "./captcha.png"
    if os.path.exists(captcha_screenshot):
        os.remove(captcha_screenshot)

    img = Image.open(login_screenshot)
    img_crop = img.crop((top_x,top_y,bottom_x,bottom_y))
    img_crop.save(captcha_screenshot)



