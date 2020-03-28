i=1
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

while [ "$i" -ne 0 ]
do
   clear;
    echo -e "\n\n"
   VBoxManage list runningvms | grep vagrant 
  
   
  sleep 2;
done