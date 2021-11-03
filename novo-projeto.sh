#!/usr/bin/bash
##Script para automação de versionamento de projetos###

echo "Digite o id do projeto para puxar"
read projeto
echo " "
#Lê o ID do projeto com o read


#####Puxa o projeto#####

echo "Puxando o projeto $projeto"
echo " "
sleep 4
#mkdir -p $projeto/app
svn co http://svn.atualinterativa.com/$projeto

echo "Pasta $projeto criada"
echo " "
sleep 4

##########################################################


#Puxa os  arquivos da versão necessária para o projeto
echo "Qual versão necessária para o projeto?"

read django
sleep 2
echo "Movendo arquivos da versão do Django para o projeto destino"
echo " "
sleep 1

#cp -r djangoapps/$django/* $projeto/app/
svn export http://svn.atualinterativa.com/djangoapps/$django $projeto/app/ --force

echo " "
echo "Arquivos movidos!"
sleep 1

#echo " "
echo "Copiando local_settings.py para o projeto $projeto..."
cp minhasconfig/local_settings.py $projeto/app/core

#############################################################
###Cria o Virtualenv#######
#echo " "
#echo "Criando o Virtualenv"

#Checa se o django é 2.2 ou 1.11
#if [ "$django" == '2.2' ]
#then
	echo " "
	echo "A versão do django é 2.2"
	mkvirtualenv $projeto

#elif [ "$django" == '1.11' ]
#then
#	echo " "
#	echo "A versão do django é 1.11"
#	mkvirtualenv --python python2 $projeto
#fi

#echo " "
#echo "Virtualenv criado como $projeto"
############################################
#sleep 2
#cd $projeto/app
#echo "Entrando na pasta"

#code ..










