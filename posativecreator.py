from PIL import Image, ImageFilter, ImageOps
import random
import os  



for filename in os.listdir("blahajpicturemaker/blahajpicturemaker/pictures/"): # parse through file list in the current directory  
    if filename[-3:] == "png":
        background = Image.open("n/n_"+str(random.randrange(0,3017)) + ".jpg")
        foreground = Image.open("blahajpicturemaker/blahajpicturemaker/pictures/" + filename)

        bg_width, bg_height = background.size
        s1 = (bg_width - 0) // 2
        s2 = (bg_height - 0) // 2
        f = (s1, s2)

        
        foreground = foreground.resize(f)
        
        fg_width, fg_height = foreground.size
        center_x = (bg_width - fg_width) // 2
        center_y = (bg_height - fg_height) // 2
        centered_position = (center_x, center_y)


        if foreground.mode == 'RGBA':
            mask = foreground.split()[3] # Get the alpha channel
        else:
            mask = None # No mask needed for opaque images


        
        background.paste(foreground, centered_position, mask)

        background.save("p/"+filename)
def massRename():
    n = 0
    for filename in os.listdir("n"): # parse through file list in the current directory  
      if filename[-3:] == "jpg":
         print(filename)
         os.rename("n/"+filename, "n/n_"+str(n)+".jpg")
         n+=1

