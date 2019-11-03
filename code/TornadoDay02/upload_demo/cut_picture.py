from PIL import Image

if __name__ == '__main__':
    image = Image.open('upload_dir/27.jpg')
    new_image = image.crop((150,200,300,200))
    new_image.save('upload_dir/new_image.jpg')
    image.remove()
    print("操作完毕")
