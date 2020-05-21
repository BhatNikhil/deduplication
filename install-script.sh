while IFS="" read -r p || [ -n "$p" ] 
do
  printf '%s\n' "$p"
  npm i --save "$p"

  SIZE=`(du -cs .| sed -n 1p | awk '{print $1;}' )`
  echo $SIZE
  if [[ SIZE -ge 1024*1024*100 ]]
    then
      echo "You hit maximum limit"
      exit 1
  fi
  
done < npm-rank.txt