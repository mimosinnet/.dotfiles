#!/bin/zsh
share="mimory"
folder="/home/mimosinnet/Dades/Documents/GoogleDrive"
file="$folder/0LLEGEIX.me"
formats="ods,odt,odp"

# is_phenom: si el servidor phenom està muntat {{{
is_phenom() {
  # exit code 0 = success
  if ( mount | grep -q $share )
  then
    return 0
  else
    echo "S'ha de muntar $share"
    return 1
  fi 
}
# }}}

# is_file: comprovar que hi ha l'arxiu de control {{{
is_file() {
  if [[ -f $file ]]
  then
    return 0
  else
    echo "No existeix l'arxiu $file. Hi ha un problema"
    return 1
  fi
}
# }}}

# que_vols: escollir opció {{{
que_vols() {
  quevols="9"
  while [[ $quevols > 4 ]]
  do
    echo "----------------------------------------------"
    echo "Selecciona una de les opcions"
    echo "----------------------------------------------"
    echo "            DE Google Drive A Ordinador"
    echo "----------------------------------------------"
    echo "1      Test DE Google Drive A Ordinador"
    echo "2 Hard Test DE Google Drive A Ordinador"
    echo "3 Sincronit DE Google Drive A Ordinador"
    echo "----------------------------------------------"
    echo "            DE Ordinador    A Google Drive"
    echo "----------------------------------------------"
    echo "4      Test DE Ordinador    A Google Drive"
    echo "5 Hard Test DE Ordinador    A Google Drive"
    echo "6 Sincronit DE Ordinador    A Google Drive"
    echo "----------------------------------------------"
    echo "            ENTRE Google Drive i Ordinador"
    echo "----------------------------------------------"
    echo "7 Sincronit ENTRE Google Drive i Ordinador"
    echo "----------------------------------------------"
    echo "0 Sortir"
    echo "----------------------------------------------"
    echo "Què vols fer?"
    read -k quevols
    echo "\n----------------------------------------------"
    echo "Has seleccionat l'opció $quevols"

    return $quevols
  done
}
# }}}

# seguim: continuar amb el procediment {{{
seguim() {
  seguim='z'
  while [[ $seguim != 's' && $seguim != 'n' ]]
  do
    echo "Seguim? (s/n) "
    read -k seguim
    echo "\n"
    if [[ $seguim == "s" ]]
    then
      return 0
    elif [[ $seguim == "n" ]]
    then
      echo "Sembla que no vols continuar"
      return 1
    fi
  done
}
# }}}

# 1 TestGoogleToDrive: Test Copiar de Google a l'Ordinador {{{ 
TestGoogleToDrive() {
  echo "Has escollit sincronitzar DE Google Drive A Ordinador"
  seguim || return 1
  echo "Provem la sincronització amb --dry-run"
  seguim || return 1
  rclone sync --progress --log-level ERROR --dry-run GD: $folder
  seguim || return 1
}
# }}}

# 2 HardTestGoogleToDrive: Hard Test Copiar de Google a l'Ordinador {{{ 
HardTestGoogleToDrive() {
  echo "Has escollit sincronitzar DE Google Drive A Ordinador"
  seguim || return 1
  echo "Provem la sincronització amb --dry-run NOTICE"
  seguim || return 1
  rclone sync --progress --log-level NOTICE --dry-run GD: $folder
  seguim || return 1
}
# }}}

# 3 RunGoogleToDrive: Copiar de Google a l'Ordinador {{{ 
RunGoogleToDrive() {
  echo "Has escollit sincronitzar DE Google Drive A Ordinador"
  seguim || return 1
  echo "Fem la sincronització i s'esborraran els arxius a l'ordinador"
  seguim || return 1
  rclone sync --progress --log-level ERROR GD: $folder
}
# }}}

# 4 TestDriveToGoogle: test copiar de l'ordinador a Google {{{
TestDriveToGoogle() {
  echo "Has escollit sincronitzar DE Ordinador A Google Drive"
  seguim || return 1
  echo "Provem la sincronització amb --dry-run"
  seguim || return 1
  rclone sync --progress --log-level ERROR --dry-run $folder GD:
  seguim || return 1
}
# }}}

# 5 HardTestDriveToGoogle: test detallat copiar de l'ordinador a Google {{{
HardTestDriveToGoogle() {
  echo "Has escollit sincronitzar DE Ordinador A Google Drive"
  seguim || return 1
  echo "Provem la sincronització amb --dry-run NOTICE"
  seguim || return 1
  rclone sync --progress --log-level NOTICE --dry-run $folder GD:
  seguim || return 1
}
# }}}

# 6 RunDriveToGoogle: copiar de l'ordinador a Google {{{
RunDriveToGoogle() {
  echo "Has escollit sincronitzar DE Ordinador A Google Drive"
  seguim || return 1
  echo "Fem la sincronització. Atenció: es borren els arxius a GoogleDrive"
  seguim || return 1
  rclone sync --progress --log-level ERROR $folder GD:
}
# }}}

# 7 bisync: sincronització bidireccional. Veuri si funciona {{{
bisync() {
  echo "Has escollit sincronitzar bidireccionalment"
  echo "Revisem els resultats, doncs no està molt clar que funcioni"
  seguim || return 1
  echo "Provem la sincronització amb --dry-run"
  seguim || return 1
  rclone bisync --progress --log-level NOTICE --dry-run GD: $folder
  seguim || return 1
  echo "Fem la sincronització. Atenció: es borren els arxius a GoogleDrive"
  seguim || return 1
  rclone bisync --progress --log-level NOTICE GD: $folder
}
# }}}

gdrive() {
  is_phenom || return 1
  echo "Phenom està engeat i muntat"
  is_file || return 1
  echo "Existeix 0LLEGEIX.me"
  opcio=9
  while [[ $opcio -ne 0 ]]
  do
    que_vols
    opcio=$?

    case $opcio in
      0) 
        echo 'Has escollit sortir. Que tinguis un boni dia!'
        return 1
        ;;
      1) TestGoogleToDrive;;
      2) HardTestGoogleToDrive;;
      3) RunGoogleToDrive;;
      4) TestDriveToGoogle;;
      5) HardTestDriveToGoogle;;
      6) RunDriveToGoogle;;
      7) bisync;;
    esac 

  done
}

gdrive
