#!/bin/sh
awk  -f filtro.awk prova.csv | awk -v prec_r=0 -v prec_s=0 -v prec_w=0 -v prec_p="" -v prec_w1=0 -f final.awk | awk -v prec_r=0 -f combine.awk > output.csv

