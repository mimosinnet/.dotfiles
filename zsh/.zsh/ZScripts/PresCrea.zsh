#!/usr/bin/env zsh

readonly pres=${1:?'Please, indicate the presentation number you want to create'}

pres_array=${(s//)pres}
[[ $pres_array =~ '[0-9]{3,3}' &&  ${#pres_array[@]} -eq 3 ]] \
    || { print 'Presentation number has to have three digits'; exit }

dir="/home/mimosinnet/Dades/IntercanviWin/Presentacions/$pres"

[[ -e $dir ]] \
    && { print "Presentation number $pres already exists" ; exit }

mkdir $dir
cp /home/mimosinnet/Dades/IntercanviWin/Presentacions/000/Test_different_features_of_presentations.md $dir
mkdir -p $dir/media/{P,V,S}
