# Source files in ~/.bash/

for file in ~/.bash/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

