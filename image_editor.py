from PIL import Image, ImageFilter, ImageOps

import os  


for filename in os.listdir("blahajpicturemaker/blahajpicturemaker/pictures"): # parse through file list in the current directory  
      if filename[-3:] == "png":  
        img = Image.open("blahajpicturemaker/blahajpicturemaker/pictures/"+filename)




        img = ImageOps.grayscale(img)

        img = img.convert("RGBA")  
        pixdata = img.load()  


        for y in range(img.size[1]):  
             for x in range(img.size[0]):  
                  r, g, b, a = img.getpixel((x, y))  
                  if g == 150:  
                       pixdata[x, y] = (255, 255, 255, 0)  
                  ##Remove anti-aliasing outline of body.  
                  #if r == 0 and g == 0 and b == 0:  
                  #     pixdata[x, y] = (255, 255, 255, 0)  
        #img2 = img.filter(ImageFilter.GaussianBlur(radius=1))  

        img.save("blahajpicturemaker/blahajpicturemaker/pictures/" + filename, "PNG")  