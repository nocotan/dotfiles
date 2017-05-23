#!/bin/sh
# written by Shotaro Fujimoto (https://github.com/ssh0)
# first edited: 2015-06-26

# If there is a file named below in the same directory,
# this script automatically detect that the file is root tex file,
# and compile this file even if you choose different one.
rootfile='main.tex'

# If the choosed file is in $sourcedir, default outputdir is setted to one
# level upper directory.
sourcedir='source'

message() {
  echo "There is$1 '$rootfile' in the directory '$2',"
  echo "so this script compiles this file."
  echo ""
}

search_rootfile() {
if [ -f "$1"/"$rootfile" ]; then
  texfile="$1"/"$rootfile"
  message "" "$1"
  return 0
else
  texfile="$1"/"$name"
  return 1
fi
}

dir="$(cd "$(dirname $1)"; pwd)"
name="$(basename $1)"

if [ ! -f "$dir/$name" ]; then
  echo "$dir/$name doesn't exist."
  exit 1
fi

currentdir="$(basename $dir)"
dir_up="$(dirname $dir)"

if [ ${currentdir} = $sourcedir ]; then
  echo "This file is in '$sourcedir', so search '$rootfile' recursively."
  outdir="${dir_up}"
  search_rootfile ${dir_up} || search_rootfile $dir || message " not" "$dir"
else
  outdir="$dir"
  search_rootfile $dir || message " not" "$dir"
fi

echo "Run latexmk..."
echo "============"
echo ""
shift 1
latexmk -pdfdvi -output-directory=$outdir "$@" $texfile
