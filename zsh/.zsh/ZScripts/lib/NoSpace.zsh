#!/bin/zsh

# Aquesta funció elimina els caràcters especials utilitzant detox

function _no_space() {
  local file=$1
  # Mira si l'arxiu existeix
  [[ -e "$file" ]] || { print -u2 "Error: L'arxiu '$file' no existeix." ; return 1; }

  # Mira si la comanda detox està disponible
  command -v detox &> /dev/null || { print -u2 "Error: Manca la dependència 'detox'. Instal·la-la per continuar." ; exit 1; }

  local name=$(detox -n "$file")

  if [[ $name == '' ]]
  then
    print "✗ L'arxiu '$file' no té caràcters especials."
  else
    print "✓ $name"
    detox "$file"
    [[ -e $name[-1] ]] || { print -u2 "Error: No s'ha pogut renombrar l'arxiu a '$name'." ; return 1; }
    print $(readlink -f $name[-1])
  fi
}
