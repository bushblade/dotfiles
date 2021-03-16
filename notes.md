# Fish script to convert all jpg images in dir to webp

Needs cwebp to be installed


```fish
 for file in *.jpg
      cwebp -q 80 $file -o (basename $file .jpg).webp
  end
 ```
