from flask import Blueprint

#创建蓝图对象
music_blue = Blueprint('musicblue',__name__)

@music_blue.route('/listen/')
def listen_music_view():
    return "<h3 style='color:pink'>听音乐，用酷我，酷我音乐</h3>"

@music_blue.route('/sing/')
def sing_view():
    return "<h3 style='color:cyan'>唱歌~~</h3>"
