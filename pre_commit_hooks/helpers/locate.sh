################################################################################
#
# Locate the command from a list of options
#
################################################################################

# Final location of the executable that we found by searching
exec_command=""


for cmd in ${commands[@]}; do
  if [ -f "$cmd" ]; then
    exec_command="$cmd"
    break 
  fi
  test_command=$(which $cmd)
  if [ -f "$test_command" ]; then
    exec_command="$test_command"
    break 
  fi
done
  # A phar file will need to be called by php
prefixed_local_command="php $local_command"

if [ -z "$exec_command" ]; then
    echo -e "${bldred}No valid ${title} found!${txtrst}"
    echo "Please have one available as one of the following: ${commands[@]}"
    exit 1
fi
