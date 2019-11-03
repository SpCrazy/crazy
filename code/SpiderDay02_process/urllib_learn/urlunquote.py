from urllib.request import unquote


if __name__ == '__main__':
    s = unquote("id=101&name=%E5%BF%AB%E5%86%B2&age=27&score=70")
    print(s)