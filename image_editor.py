from PIL import Image, ImageFilter, ImageOps

img = Image.open("0.png")



img0 = img.convert("RGBA")  
img = ImageOps.grayscale(img0)
pixdata = img.load()  


for y in range(img.size[1]):  
     for x in range(img.size[0]):  
          r, g, b, a = img.getpixel((x, y))  
          if g == 255:  
               pixdata[x, y] = (255, 255, 255, 0)  
          ##Remove anti-aliasing outline of body.  
          #if r == 0 and g == 0 and b == 0:  
          #     pixdata[x, y] = (255, 255, 255, 0)  
#img2 = img.filter(ImageFilter.GaussianBlur(radius=1))  

img2.save("new.png", "PNG")  