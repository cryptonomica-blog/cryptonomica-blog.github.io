#!/usr/bin/env bash

pandoc -N --template=mytemplate.tex --variable version=1.1 -s ./_posts/2019-02-09-cryptonomica-kyc-offer.md  -o ./PDFs/2019-02-09-cryptonomica-kyc-offer.md.pdf
