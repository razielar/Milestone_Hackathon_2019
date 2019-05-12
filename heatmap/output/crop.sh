for i in *.jpg; do
    convert $i -gravity West -chop 35x0 cropped/$i
done
