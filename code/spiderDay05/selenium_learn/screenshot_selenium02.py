import os
import time

from PIL import Image
from selenium.webdriver import Chrome

if __name__ == '__main__':
    browser = Chrome(r'C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe')  # 创建浏览器对象
    browser.get("https://account.guokr.com/sign_in/")   #  向“果壳网”登录页面发送请求
    time.sleep(3)
    login_screenshot = "./login.png"
    if os.path.exists(login_screenshot):   # 如果存在该截图，则先删除
        os.remove(login_screenshot)
    # browser.set_window_size(1000,600)  # 通过此方法可以设置窗口大小，从而确定截图的大小
    browser.execute_script("document.body.style.zoom='0.5'")
    browser.save_screenshot(login_screenshot)   #  保存截图到指定文件
    elements = browser.find_elements_by_xpath('//img[@id="captchaImage"]')
    top_x = elements[0].location['x']   # 验证码图片左上角的x轴坐标
    top_y = elements[0].location['y']  # 验证码图片左上角的y轴坐标
    bottom_x = elements[0].location['x'] + elements[0].size['width'] # 验证码图片右下角的x轴坐标
    bottom_y = elements[0].location['y'] + elements[0].size['height'] # 验证码图片右下角的y轴坐标

    captcha_screenshot = "./captcha.png"
    if os.path.exists(captcha_screenshot):  # 如果存在验证码截图，则先删除
        os.remove(captcha_screenshot)
    image = Image.open(login_screenshot)   # 打开截图
    image_crop =  image.crop((top_x*0.5,top_y*0.5,bottom_x*0.5,bottom_y*0.5))   # 裁剪图片（抠图）
    image_crop.save(captcha_screenshot)  #  保存验证码截图
