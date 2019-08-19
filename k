#!/bin/bash

unset origin
origin=$(dirname ${BASH_SOURCE[0]})

usage() {
  echo "Usage: $origin [OPTIONS] "
  echo "Options: "
  echo ""
  echo "     init|I:   to bootstrap repository"
  echo "     run|R:    to run the analysis"
  echo ""
  echo ""
}

init() {

  fn="analysis.Rmd"
  template="${origin}/${fn}"

  if [[ -f ${fn} ]]
  then
    echo "MSG: ${fn} already exists, no action taken"
  else
    cp ${template} .
  fi

}

run() {
  make_file="${origin}/Makefile"
  cp ${make_file} .
  make all
}

case "$1" in
  help|-h|--help)
    usage
    exit
    ;;
  R|run)
	run
	exit
	;;
  I|init)
	init
	exit
	;;
  *)
    usage
    exit
esac
