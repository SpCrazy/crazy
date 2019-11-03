#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @File  : copy_file.py
# @Author: Feng
# @Date  : 2019-11-03
# @Desc  :查找文件并复制
import os

import fire


def get_file(path, file_path_list):
    if not os.path.exists(path):
        print("路径不存在")
        return

    if os.path.isfile(path):
        if path.endswith(".xmind"):
            print("文件：", path)
            file_path_list.append(path)

    file_list = os.listdir(path)
    for file_name in file_list:
        file_path = os.path.join(path, file_name)
        # print(file_path)
        if os.path.isdir(file_path):
            get_file(file_path, file_path_list)

        else:
            if os.path.splitext(file_path)[1].lower() == ".xmind":
                # print(file_path)

                file_path_list.append(file_path)
                # print(file_path_list)

    return file_path_list


def file_copy(file_path, save_path):
    file_name = os.path.basename(file_path)
    file_save_path = os.path.join(save_path, file_name)

    with open(file_path, "rb") as f1:
        with open(file_save_path, "wb") as f2:
            content = f1.read()
            f2.write(content)
            f2.flush()


def run(path, file_path_list, save_path):
    path_list = get_file(path, file_path_list)
    print(path_list)
    for file_path in path_list:
        file_copy(file_path, save_path)


if __name__ == '__main__':
    path = r"F:\资料\StuPython\第二阶段"
    file_path_list = []
    save_path = r"F:\gitcode\xmind"
    run(path, file_path_list, save_path)

