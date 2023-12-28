#Building a docker image

#!/bin/bash

#Description: Building a docker image

#Author:

#Date: 01/15/2021

echo "checking the OS system"

OS=$(cat /etc/os-release  |grep PRETTY_NAME |awk -F= '{print $2}'|awk -F '"' '{print$2}'|awk '{print $1}')

echo Your sever is running $OS

echo 'what is your name?'

read NAME

echo 'what is your email and/or phone number?'

read CONT

echo 'now let us get some input to build your docker image'

                                                                      

echo 'what is the base image (FROM input in the Dockerfile) you would

like to use in your Dockerfile example

ubuntu,centos,debian,httpd,nginx,tomcat,mysql etc..'

echo ' please visit 

  for more explaination'

read -p 'Enter your selection here: ' TYPE

 

 

                                 case  $TYPE in

      

 

 

                                    ubuntu)              

 

 

echo 'what is the tag you would like to use, enter latest to use the most current tag'

read TAG

echo

echo " FROM ${TYPE}:${TAG} " > Dockerfile

 

 

echo " MAINTAINER $CONT " >> Dockerfile

echo 'validating contains of your Dockerfile so far'

PWD=$(pwd)

if [[ -f ${PWD}/Dockerfile ]]

then

echo ' great your Dockerfile is in progress and here is the containt so far'

cat ${PWD}/Dockerfile

echo

else

echo 'ERROR no such file in the directory'

exit 1

fi

echo

echo ' let us keep adding more stuff on your Dockerfile'

sleep 2

echo 'list all the packages you would like to install using the RUN module example:

vim , curl , finger, net-tools etc.. '

sleep 2

echo 'PS: enter everything in a single line with space ,example: vim curl finger

etc ....'

read ENTRY

sleep 1

echo 'adding your input to the dockerfile hang tight.....'

echo

echo " RUN apt update -y " >> Dockerfile

#ARG DEBIAN_FRONTEND=noninteractive

for i in $ENTRY

do

echo " RUN apt install -y $i " >> Dockerfile

done

# validating the content

if [ $? -ne 0 ]

then

echo 'ERROR we were not able to add your content to Dockerfile'

exit 1

fi

echo ' Good news, everything went well , here is the containt of your docker file

so far '

cat ${PWD}/Dockerfile

 

                                     ;;

 

                                   debian)    

 

    echo 'what is the tag you would like to use, enter latest to use the most current tag'

read TAG

echo

echo " FROM ${TYPE}:${TAG} " > Dockerfile

                                        

 

echo " MAINTAINER $CONT " >> Dockerfile

echo 'validating contains of your Dockerfile so far'

PWD=$(pwd)

if [[ -f ${PWD}/Dockerfile ]]

then

echo ' great your Dockerfile is in progress and here is the containt so far'

cat ${PWD}/Dockerfile

echo

else

echo 'ERROR no such file in the directory'

exit 1

fi

echo

echo ' let us keep adding more stuff on your Dockerfile'

sleep 2

echo 'list all the packages you would like to install using the RUN module example:

vim , curl , finger, net-tools etc.. '

sleep 2

echo 'PS: enter everything in a single line with space ,example: vim curl finger

etc ....'

read ENTRY

sleep 1

echo 'adding your input to the dockerfile hang tight.....'

echo

echo " RUN apt update -y " >> Dockerfile

#ARG DEBIAN_FRONTEND=noninteractive

for i in $ENTRY

do

echo " RUN apt install -y $i " >> Dockerfile

done

# validating the content

if [ $? -ne 0 ]

then

echo 'ERROR we were not able to add your content to Dockerfile'

exit 1

fi

echo ' Good news, everything went well , here is the containt of your docker file

so far '

cat ${PWD}/Dockerfile

 

                                      ;;

 

 

 

 

                                           kalilinux)              

echo 'what is the tag you would like to use, enter latest to use the most current tag'

read TAG

echo

echo " FROM ${TYPE}:${TAG} " > Dockerfile

 

echo " MAINTAINER $CONT " >> Dockerfile

echo 'validating contains of your Dockerfile so far'

PWD=$(pwd)

if [[ -f ${PWD}/Dockerfile ]]

then

echo ' great your Dockerfile is in progress and here is the containt so far'

cat ${PWD}/Dockerfile

echo

else

echo 'ERROR no such file in the directory'

exit 1

fi

echo

echo ' let us keep adding more stuff on your Dockerfile'

sleep 2

echo 'list all the packages you would like to install using the RUN module example:

vim , curl , finger, net-tools etc.. '

sleep 2

echo 'PS: enter everything in a single line with space ,example: vim curl finger

etc ....'

read ENTRY

sleep 1

echo 'adding your input to the dockerfile hang tight.....'

echo

echo " RUN apt update -y " >> Dockerfile

#ARG DEBIAN_FRONTEND=noninteractive

for i in $ENTRY

do

echo " RUN apt install -y $i " >> Dockerfile

done

# validating the content

if [ $? -ne 0 ]

then

echo 'ERROR we were not able to add your content to Dockerfile'

exit 1

fi

echo ' Good news, everything went well , here is the containt of your docker file

so far '

cat ${PWD}/Dockerfile

 

                                        ;;

 

 

 

 

 

                                 centos)   

      echo 'what is the tag you would like to use, enter latest to use the most current tag'

read TAG

echo

echo " FROM ${TYPE}:${TAG} " > Dockerfile

                               

 

echo " MAINTAINER $CONT " >> Dockerfile

echo 'validating contains of your Dockerfile so far'

PWD=$(pwd)

if [[ -f ${PWD}/Dockerfile ]]

then

echo ' great your Dockerfile is in progress and here is the containt so far'

cat ${PWD}/Dockerfile

echo

else

echo 'ERROR no such file in the directory'

exit 1

fi

echo

echo ' let us keep adding more stuff on your Dockerfile'

sleep 2

echo 'list all the packages you would like to install using the RUN module example:

vim , curl , finger, net-tools etc.. '

sleep 2

echo 'PS: enter everything in a single line with space ,example: vim curl finger

etc ....'

read ENTRY

sleep 1

echo 'adding your input to the dockerfile hang tight.....'

echo

echo " RUN yum  update -y " >> Dockerfile

#ARG DEBIAN_FRONTEND=noninteractive

for i in $ENTRY

do

echo " RUN yum  install -y $i " >> Dockerfile

done

# validating the content

if [ $? -ne 0 ]

then

echo 'ERROR we were not able to add your content to Dockerfile'

exit 1

fi

echo ' Good news, everything went well , here is the containt of your docker file

so far '

cat ${PWD}/Dockerfile

 

                                              ;;

 

 

                                             rhel)  

echo 'what is the tag you would like to use, enter latest to use the most current tag'

read TAG

echo

echo " FROM ${TYPE}:${TAG} " > Dockerfile

                                     

 

echo " MAINTAINER $CONT " >> Dockerfile

echo 'validating contains of your Dockerfile so far'

PWD=$(pwd)

if [[ -f ${PWD}/Dockerfile ]]

then

echo ' great your Dockerfile is in progress and here is the containt so far'

cat ${PWD}/Dockerfile

echo

else

echo 'ERROR no such file in the directory'

exit 1

fi

echo

echo ' let us keep adding more stuff on your Dockerfile'

sleep 2

echo 'list all the packages you would like to install using the RUN module example:

vim , curl , finger, net-tools etc.. '

sleep 2

echo 'PS: enter everything in a single line with space ,example: vim curl finger

etc ....'

read ENTRY

sleep 1

echo 'adding your input to the dockerfile hang tight.....'

echo

echo " RUN yum  update -y " >> Dockerfile

#ARG DEBIAN_FRONTEND=noninteractive

for i in $ENTRY

do

echo " RUN yum  install -y $i " >> Dockerfile

done

# validating the content

if [ $? -ne 0 ]

then

echo 'ERROR we were not able to add your content to Dockerfile'

exit 1

fi

echo ' Good news, everything went well , here is the containt of your docker file

so far '

cat ${PWD}/Dockerfile

                                                    ;; 

 

 

 

                                    *)

        echo ' Error selection not supported'

        exit 1

                                                    ;;

 

esac

 

 

echo 'are you going to use the COPY module yes/no?'

read FILE

if [[ ${FILE} == yes ]]

then

echo 'enter the complete path of your file '

read PATH

echo 'enter the destination path into your file '

read DESTINATION

if

[[ -f $PATH ]]

then

echo 'the file exist'

echo " COPY $PATH $DESTINATION " >> Dockerfile

else

echo ' the file $PATH does not exist'

exit 1

fi

#validating the content

if [ $? -ne 0 ]

then

echo 'ERROR sorry we were not able to add your content to Dockerfile'

exit 1

fi

echo ' good everything went well '

elif [[ ${FILE} == no ]]

then

echo ' No worry you can keep moving'

elif

[[ ${FILE} != yes || no ]]

then

echo ' ERROR: sorry you enter a wrong selection'

exit 1

fi

echo

echo ' are you going to use the EXPOSE module yes/no ? '

read EXPOSE

if [[ ${EXPOSE} == yes ]]

then

echo 'enter the port you would like to expose your container into '

read PORT

sleep 2

 

echo 'making sure your input is an integer/number'

 

if  [ $PORT -ne  $PORT   ]

  then

    

     echo "sorry $PORT  is not a number "

     exit 1

  fi

 

 

 

 

 

echo " EXPOSE $PORT " >> Dockerfile

#validating the content

if [ $? -ne 0 ]

then

echo 'ERROR sorry we were not able to add your content to Dockerfile'

exit 1

fi

echo ' good everything went well '

elif [[ ${EXPOSE} == no ]]

then

echo 'No worry, you we can keep moving'

elif

[[ ${EXPOSE} != yes || no ]]

then

echo ' ERROR: sorry you enter a wrong selection'

exit 1

fi

echo ' are you going to use the CMD module yes/no ? '

read CMD

if [[ ${CMD} == yes ]]

then

echo 'enter the content of your CMD module '

read CMD_CONTENT

echo " CMD [ $CMD_CONTENT ] " >> Dockerfile

#validating the content

if [ $? -ne 0 ]

then

echo 'ERROR sorry we were not able to add your content to Dockerfile'

exit 1

fi

echo ' good everything went well '

elif [[ ${CMD} == no ]]

then

echo 'No worry, you we can keep moving'

elif

[[ ${CMD} != yes || no ]]

then

echo ' ERROR: sorry you enter a wrong selection'

exit 1

fi

echo ' are you going to use the ENV module yes/no ? '

read ENV

if [[ ${ENV} == yes ]]

then

echo 'enter the key Varialbe '

read KEY

echo 'enter the value Varialbe '

read VALUE

echo " ENV ${KEY}=${VALUE} " >> Dockerfile

#validating the content

if [ $? -ne 0 ]

then

echo 'ERROR sorry we were not able to add your content to Dockerfile'

exit 1

fi

echo ' good everything went well '

elif [[ ${ENV} == no ]]

then

echo 'No worry, you we can keep moving'

elif

[[ ${ENV} != yes || no ]]

then

echo ' ERROR: sorry you enter a wrong selection'

exit 1

fi

echo ' are you going to use the VOLUME module yes/no ? '

read VOLUME

if [[ ${VOLUME} == yes ]]

then

echo 'enter the key Varialbe '

echo 'enter the path to your volume should be a directory'

read PATH_VOLUME

if

[[ -d $PATH_VOLUME ]]

then

echo 'the directory exist'

else

echo ' sorry the directory does not exist, but no worry we will create it for you '

mkdir -p $PATH_VOLUME

echo 'done'

fi

echo 'adding the volume to the dockerfile hang tight'

echo " VOLUME $PATH_VOLUME " >> Dockerfile

#validating the content

if [ $? -ne 0 ]

then

echo 'ERROR sorry we were not able to add your content to Dockerfile'

exit 1

fi

echo ' good everything went well '

elif [[ ${VOLUME} == no ]]

then

echo 'No worry, you we can keep moving'

elif

[[ ${VOLUME} != yes || no ]]

then

echo ' ERROR: sorry you enter a wrong selection'

exit 1

fi

echo ' wrapping up all data collected so far...... '

sleep 2

echo ' done '

echo

echo

echo 'working on your image'

echo 'verifying if docker is install'

docker -v &> /dev/null

if

[[ $? -eq 0 ]]

then

echo 'bingo docker is installed'

systemctl start docker

else

echo 'docker is not installed'

echo 'installing docker'

apt install -y 

  &> /dev/null

systemctl start docker

fi

echo 'now that docker is up and running let us keep digging through your image'

echo 'enter your image name '

read IMAGE_NAME

sleep 3

echo 'By the way here is your Dockerfile containt so far hopefully this meet your

expectations if not terminate this script and re-run it and make sure you enter all

you need for your image'

echo 'Here we go'

cat Dockerfile

sleep 5

echo 'building your image hold it tight it might take coupe of minutes this script

will keep running when it is through'

echo 'but before that let us clean your docker space'

docker rm -f $(docker ps -aq) &> /dev/null

docker rmi $(docker images -aq) &> /dev/null

echo 'the house is cleaned'

sleep 2

docker build -t $IMAGE_NAME .

if

[[ $? -eq 0 ]]

then

echo 'bingo the image is ready'

else

echo 'ERROR: sorry something when wrong'

exit 1

fi

echo 'here is your image'

docker images

echo 'validating the existance of your image '

docker images | grep -i $IMAGE_NAME &> /dev/null

if

[[ $? -eq 0 ]]

then

echo 'bingo docker image is ready'

else

echo 'ERROR: sorry something went wrong'

exit 1

fi

echo 'Now let us spin us some containers, but before that we need to collect

some inputs first '

echo 'are you ready for the show?'

echo 'Definitely yes, since that is the case enter all your containers name using the

space to sepearate them example: eric valette yollande etc....'

read CONTAINER_NAME

for A in $CONTAINER_NAME

do

docker run -itd --name $A $IMAGE_NAME bash

done

 

echo 'Here is the list of all your container '

docker ps | awk '{print $1 "                     " $NF}'

sleep 3

echo 'tagging your image'

echo 'what is your dockerhub username '

read USERNAME

docker tag $IMAGE_NAME ${USERNAME}/$IMAGE_NAME

if

[[ $? -ne 0 ]]

then

echo 'sorry somehting when wrong the image was not tagged'

exit 1

fi

echo 'pushing to your dockerhub'

docker push ${USERNAME}/$IMAGE_NAME

if

[[ $? -ne 0 ]]

then

echo 'sorry somehting when wrong the image was not pushed'

exit 1

fi

echo ' if your can read this BINGO your image is now available on dockerhub'

echo ' good job and bye '

 

echo 'now let us remove your image '

docker rmi ${USERNAME}/$IMAGE_NAME  &> /dev/null

if

 [[ $? -eq 0 ]]

then

echo 'bingo the image has been removed '

echo 'thank you for running this small script '

else

echo 'ERROR: sorry something when wrong'

exit 1

 fi