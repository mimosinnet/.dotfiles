function _ask() {
  local command=$1
  print "Vols executar:\n $command \n"
  read -k 1 "answer? (y/n/e) "
  print "\n"
  case $answer in 
    [yY])
      return 0
      ;;
    [nN])
      return 1
      ;;
    [eE])
      exit
      ;;
    *)
      print "\nHas seleccionat $answer"
      exit
      ;;
  esac
 }
