import json
from urllib.request import urlretrieve


def download_img(url):
    image_name = url.split("/")[-1]
    urlretrieve(url,filename="./images/"+image_name)
    print(image_name+"下载完成")

if __name__ == '__main__':
    with open("./json/data.json",encoding="utf-8") as f:
        result_list = json.load(f)
        for movie_dict in result_list:
            img_path = movie_dict["cover_url"]
            download_img(img_path)