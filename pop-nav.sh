
# populate nav.adoc

cp  modules/ROOT/pages/_partials/mindmap.uml nav.tmp

sed -i 's/.*mindmap.*//g'  nav.tmp
sed -i 's/.*skinparam.*//g'  nav.tmp
sed -i 's/left side//g'  nav.tmp


perl -i -p0e "s/(.*)\n\'(.*)/\1,\2/g" nav.tmp

IFS=','
shopt -s extglob

declare -i a_count num

echo '// Autogenterated by pop-nav.sh using nav.uml file, do not edit' >modules/ROOT/nav.adoc


cat nav.tmp | while read line 
do

read -r text link strarr <<< "$line"


if [ "$link" != "" ]
then
 
 a_count=`echo $text| grep -o '\*' | wc -l`
 a_count=$(($a_count+1))
 label=`echo $text| cut -c $a_count-`
 prefix=`echo $text| cut -c 1-$a_count`
 
 
 echo "$prefix xref:${link##*( )}[$label]" >> modules/ROOT/nav.adoc
else

  if [ "$text" != "" ]; then 
    echo $text >> modules/ROOT/nav.adoc
  fi

fi 


done

rm nav.tmp
