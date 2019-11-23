# Source files in ~/.bash/

for file in ~/.config/bash/*; do
  #echo "Sourcing $file"
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

. .ssh/ssh-agent-env > /dev/null
