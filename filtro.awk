#FS is Field Separator: everything that is not a sequence
#of alphanumeric characters or ',.,!,?, should be
# considered as a field separator; OFS is Output Field Separator
BEGIN { FS="[[:space:]]*[.!?\"']+[[:space:]]*"}{
#the check for the single quote is better to postpone
#prec=""
for (sentenceNr=1; sentenceNr<=NF; sentenceNr++) {
        sentence = $sentenceNr
        numWords = split(sentence,words,/[^[:alpha:]\047]+/)
        for (wordNr=2; wordNr<=numWords; wordNr++) {
            #take not the first word of the sentence
            word = words[wordNr]
            if ( word ~ /^[[:upper:]][[:alpha:]]+/ ) {
                print NR, sentenceNr, wordNr, word 
            }
        }
}
}
END{
    print FILENAME" "FNR
}


