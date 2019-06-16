#awk -v prec_r=0 -f combine.awk  lol2.csv  
BEGIN { FS=","}{
if(!($1-prec_r)){#the current word belongs 
#to the same records as the previous one
 
   words[$4]#add it to the "bag" of names 

# belonging to the same article and continue
# with the next record
}else{
    #print $0
    if(!prec_r){
        prec_r=$1
        words[$4]
    }
    else{
        for (word1 in words) {
            for (word2 in words) {
                if (word1 != word2) {
                    print ""word1", "word2
                }
            }

            delete words[word1]
        }
        prec_r=$1
        words[$4]                
    }  
}}
END{#flush the words from the last lines
    for (word1 in words) {
            for (word2 in words) {
                if (word1 != word2) {
                    print ""word1", "word2
                }
            }

            delete words[word1]
    }    
}
