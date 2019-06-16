#prec_r=0 #keep track of how record changes
#prec_s=0 #keep track of sentence number
#prec_w=0 #keep track of word number
#prec_w1=0
#prec_p=""
#awk -v prec_r=0 -v prec_s=0 -v prec_w=0 -v prec_p="" -v prec_w1=0 -f final.awk  lol.csv  
BEGIN { FS="[[:space:]]*"; OFS=","}{
if( !($1-prec_r) && !($2-prec_s) && !($3-prec_w1) && prec_r){#the previous word is to be merged with the current one

    # do not print yet, maybe the next record contains the 3d(x-th) word that should be attached to the previous 2(x-1)

    prec_r=$1
    prec_s=$2
    prec_w=$3
    prec_w1=$3+1
    prec_p=prec_p" "$4
}
else{
    
    if(prec_r){
        print prec_r, prec_s, prec_w, prec_p
    }
    prec_r=$1
    prec_s=$2
    prec_w=$3
    prec_w1=$3+1
    prec_p=$4
    
    # do not print yet, maybe the next record should be merged with the current one
}
}
END{
    print prec_r, prec_s, prec_w, prec_p
    print FILENAME" "NR
}
