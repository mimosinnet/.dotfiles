#!/bin/zsh

# printline $lines {{{
function printline() {
  for (( i = 1; i < $1; i++ ))
  do
    printf '-'
  done
  print "\n"
}
# }}}

# listfiles {{{
function listfiles() {
  if [[ $pattern == 'all' ]]
  then
    # f: Split the result of the expansion at newlines
    files=("${(f)$(ls *.$extension)}")
  else
    files=("${(f)$(ls *$pattern*.$extension)}")
  fi
  printline 60
  print 'Arxius: '
  printline 60
  print -c $files
  printline 60
}
# }}}

printline 60
print 'Usage: Files.zsh extension   pattern         delete'
print 'Usage: Files.zsh extension ( pattern | all ) (del | nodel)'
printline 60

readonly extension=${1:?'Extension must be declared'}
readonly pattern=${2:='all'}
readonly delete=${3:='nodel'}

print "Command: $delete $pattern extension $extension"

deleted='/tmp/Files_Deleted'

[[ $delete == 'del' ]] && mkdir -p $deleted

listfiles

# Check varialble
# for file in $files; do; print $file; done ; exit

for file in $files
do
  print "\n\nArxiu: $file"
  xdg-open $file &
  if [[ $delete == 'del' ]] && read -q "?Vols esborrar l'arxiu $file (y/n) "
  then
    print "\nMove $file to $deleted"
    mv $file $deleted    
  fi
  print "\n"
  if ! read -q "?Continuar (y/n) "
  then
    print "\n"
    listfiles
    exit
  fi
done

print "\n"
listfiles

