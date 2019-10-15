# Source files in ~/.bash/

for file in ~/.bash/*; do
  echo "Sourcing $file"
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

