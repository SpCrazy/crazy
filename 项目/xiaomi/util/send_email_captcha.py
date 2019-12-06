import random
import uuid

from django.core.mail import send_mail

from xiaomi.settings import EMAIL_HOST_USER


def get_captcha():
    """
    生成随机字符串
    :return: 4位数验证码
    """
    captcha_str = ''
    chars = '0123456789'
    chars_list = list(chars)
    #随机生成4位数验证码
    for i in range(6):
        s = random.choice(chars_list)
        captcha_str += s
    return captcha_str


def send_captcha_email(email):
    email_name = email.split("@")[0]
    sender = EMAIL_HOST_USER  # 发送邮箱，已经在settings.py设置，直接导入
    receiver = [email, ]  # 目标邮箱

    subject = '找回密码'  # 主题
    code = uuid.uuid4().hex
    message = email_name + "您好，您正在小米商城进行找回密码，请点击此链接进行重置密码: http://39.100.70.175:8000/api/user/auth/resetpassword/?token=" + code + "\n（请在24小时内完成验证。该链接24小时以内有效）"

    print("邮件开始发送")
    send_mail(subject=subject, message=message,
              from_email=sender, recipient_list=receiver)
    return code

