#! /bin/bash
cat <<EOF > file
007-Tiani Choudja Oneonta New York
008-Kengne Valdes Houston Texas
009-Messa Josqui Houston Texas
010-Aliyou Hamdja Cincinnati Ohio
011-Salvador Washington DC Washington DC
012-Christelle France France
013-Martial silver Spring Maryland
014-Gilbert Irving Texas
015-Yann Cincinnati Ohio
016-Brice Baltimore Maryland
017-Caroline Raleigh North Carolina
018-Linda High Point North Carolina
019-Steve Atlanta Georgia
EOF
while IFS=' ' read -r line
do
echo $line
sleep 2
done < file
