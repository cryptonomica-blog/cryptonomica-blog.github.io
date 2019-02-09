#!/usr/bin/env bash

# see:
# https://jekyllrb.com/docs/themes/ 
 
bundle show minima

cp -a $(bundle show minima)/_includes .
cp -a $(bundle show minima)/_layouts .
