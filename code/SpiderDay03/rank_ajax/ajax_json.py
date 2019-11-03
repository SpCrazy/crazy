from urllib.request import urlopen


def get_json(ajax_url):
    response = urlopen(ajax_url)
    with open("./json/data.json","wb") as f:
        f.write(response.read())


if __name__ == '__main__':
    ajax_url = "https://movie.douban.com/j/chart/top_list?type=5&interval_id=100%3A90&action=&start=20&limit=20"
    get_json(ajax_url)