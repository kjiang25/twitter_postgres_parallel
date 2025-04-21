#!/bin/sh

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
# FIXME: implement this with GNU parallel
time parallel ./load_denormalized.sh ::: data/*


echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
# FIXME: implement this with GNU parallel
time parallel 'python3 load_tweets.py --db postgresql://postgres:pass@localhost:10652/postgres --inputs {} --print_every 10000' ::: data/*

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
# FIXME: implement this with GNU parallel
