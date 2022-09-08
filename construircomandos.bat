@echo off
@chcp 1252>nul
set p=
set versao=1.0
title Gerador de comandos
goto updater

:updater
echo Verificando updates...
cd %temp%
curl https://raw.githubusercontent.com/CookieYTSEGUNDO/command-generator-batch-minecraft/main/verifyupdater > verificador.txt

>nul findstr /c:"%versao%" verificador.txt && (
  goto comandos
) || (
  curl -o 
)


:comandos
cls
setlocal DISABLEDELAYEDEXPANSION
setlocal enableextensions
echo =====================
echo Comandos de texto
echo [1] Titulo
echo [2] Tellraw
echo [3] Say
echo =====================
echo Comandos para modificação de entidades
echo [4] summon (villager)
echo [5] data (em-breve)
echo =====================
echo Comandos de inventario
echo [6] give
echo [7] replaceitem
echo [8] attribute (em-breve)
choice /c:12345678 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" goto title
if "%choice%"=="2" goto tellraw
if "%choice%"=="3" goto say
if "%choice%"=="4" goto summon
goto comandos

:title
echo =====================
echo Coloque o texto do titulo:
set /p titletext=
echo =====================
echo Italic?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set italic=true&& goto title1
if "%choice%"=="2" set italic=false&& goto title1
goto title

:title1
echo Sublinhar titulo?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set underlined=true&& goto title3
if "%choice%"=="2" set underlined=false&& goto title3
goto title1

:title3
echo Bold?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set bold=true&& goto title4
if "%choice%"=="2" set bold=false&& goto title4

:title4
@chcp 1252>nul
setlocal ENABLEDELAYEDEXPANSION
echo Mostrar texto para:

echo [1] Quem executou o comando.
echo [2] Jogadores perto.
echo [3] Jogador aleatorio.
choice /c:123 /N /M ">:"
set choice=%errorlevel%>nul
if "%choice%"=="1" ( set "selector=@s"&& goto title5)
if "%choice%"=="2" ( set "selector=@p"&& goto title5)
if "%choice%"=="3" ( set "selector=@r"&& goto title5)

:title5
echo =================
echo Coloque a cor do titulo:
echo [1] Preto
echo [2] Azul escuro
echo [3] Verde escuro
echo [4] Água escura (dark_aqua)
echo [5] Vermelho escuro
echo [6] Roxo escuro
echo [7] Ouro
echo [8] Cinza
echo [9] Cinza escuro
echo [A] Azul
echo [B] Água (Aqua)
echo [C] Vermelho
echo [D] Amarelo
echo [E] Branco
choice /c:123456789ABCDE /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set color=black
if "%choice%"=="2" set color=dark_blue
if "%choice%"=="3" set color=dark_green
if "%choice%"=="4" set color=dark_aqua
if "%choice%"=="5" set color=dark_red
if "%choice%"=="6" set color=dark_purple
if "%choice%"=="7" set color=gold
if "%choice%"=="8" set color=gray
if "%choice%"=="9" set color=dark_gray
if "%choice%"=="A" set color=blue
if "%choice%"=="B" set color=aqua
if "%choice%"=="C" set color=red
if "%choice%"=="D" set color=yellow
if "%choice%"=="E" set color=white
setlocal ENABLEDELAYEDEXPANSION
set Resultado={"text":"!titletext!","color":"!color!","italic":"!italic!","underlined":"!underlined!","bold":"!bold!"}
echo Resultado: /title !selector! title !resultado!
echo =====================
echo Pressione qulquer tecla para continuar.
pause >nul
@chcp 1252>nul
goto comandos

:tellraw
echo Coloque o texto do tellraw:
set /p tellraw=
echo ========================
echo Coloque a cor do texto do tellraw:
echo [1] Preto
echo [2] Azul escuro
echo [3] Verde escuro
echo [4] Água escura (dark_aqua)
echo [5] Vermelho escuro
echo [6] Roxo escuro
echo [7] Ouro
echo [8] Cinza
echo [9] Cinza escuro
echo [A] Azul
echo [B] Água (Aqua)
echo [C] Vermelho
echo [D] Amarelo
echo [E] Branco
choice /c:123456789ABCDE /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set color=black
if "%choice%"=="2" set color=dark_blue
if "%choice%"=="3" set color=dark_green
if "%choice%"=="4" set color=dark_aqua
if "%choice%"=="5" set color=dark_red
if "%choice%"=="6" set color=dark_purple
if "%choice%"=="7" set color=gold
if "%choice%"=="8" set color=gray
if "%choice%"=="9" set color=dark_gray
if "%choice%"=="A" set color=blue
if "%choice%"=="B" set color=aqua
if "%choice%"=="C" set color=red
if "%choice%"=="D" set color=yellow
if "%choice%"=="E" set color=white
echo ========================
echo Bold? (negrito)
echo [1] (S) / [2] N 
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set bold=true
if "%choice%"=="2" set bold=false
echo ========================
echo Italic?
echo [1] (S) / [2] N 
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set italic=true
if "%choice%"=="2" set italic=false
echo ========================
echo Underlined? (sublinhado)
echo [1] (S) / [2] N 
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" set underlined=true
if "%choice%"=="2" set underlined=false
echo ========================
echo Falar o nome de um player?
echo [1] (S) / [2] N 
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" goto tellrawplayer
if "%choice%"=="2" goto resposta

:tellrawplayer
echo Depois do texto ou antes?

echo [1] Depois
echo [2] Antes

choice /c:12 /N /M ">:"
if "%choice%"=="1" goto tellrplayer
if "%choice%"=="2" goto playertellraw

:playertellraw
echo Qual o nome do player?
set /p plr=
goto respostaplayer

:tellrplayer
echo Qual o nome do player?
set /p plr=
goto respostaplr

:respostaplayer
set resposta=[{"text":"%tellraw%","color":"%color%","italic":"%italic%","bold":"%bold%","underlined":"%underlined%"},{"selector":"plr"}]
echo Comando: %resposta%
pause >nul
goto comandos

:respostaplr
set resposta=[{"selector":"%plr%"},{"text":"%tellraw%","color":"%color%","italic":"%italic%","bold":"%bold%","underlined":"%underlined%"}]
echo Comando: %resposta%
pause >nul
goto comandos

:resposta
set resposta=[{"text":"%tellraw%","color":"%color%","italic":"%italic%","bold":"%bold%","underlined":"%underlined%"}]
echo Comando: %resposta%
pause >nul
goto comandos

:summon

echo =====================
echo [1] Villager
echo =====================
choice /c:1 /N /M ">:"
set choice=%errorlevel%
if %choice%=="1" goto profissao
goto summon

:profissao
setlocal enableextensions
echo Selecione a profissao.

echo [1] agricultor
echo [2] pescador
echo [3] pastor
echo [4] flecheiro
echo [5] bibliotecário
echo [6] cartógrafo
echo [7] clérigo
echo [8] armeiro
echo [9] ferreiro
echo [A] açougueiro
echo [B] coureiro
echo [C] pedreiro
echo [D] desempregado
choice /c:123456789ABCD /N /M ">:"
set choice=%errorlevel%
if %choice%=="1" goto lobby2 && set p=farmer
if %choice%=="2" goto lobby2 && set p=fisherman
if %choice%=="3" goto lobby2 && set p=shepherd
if %choice%=="4" goto lobby2 && set p=fletcher 
if %choice%=="5" goto lobby2 && set p=librarian
if %choice%=="6" goto lobby2 && set p=cartographer
if %choice%=="7" goto lobby2 && set p=cleric
if %choice%=="8" goto lobby2 && set p=armorer
if %choice%=="9" goto lobby2 && set p=weaponsmith
if %choice%=="A" goto lobby2 && set p=butcher
if %choice%=="B" goto lobby2 && set p=leatherworker
if %choice%=="C" goto lobby2 && set p=bricklayer
if %choice%=="D" goto lobby2 && set p=nitwit
goto lobby2

:lobby2
echo ==================================
echo ==================================
echo Coloque o level do villager

echo [1] Novato
echo [2] Aprendiz
echo [3] viajante
echo [4] Especialista
echo [5] Mestre
choice /c:12345 /N /M ">:"
set choice=%errorlevel%
if %choice%=="1" set level=1 && goto lobby3
if %choice%=="2" set level=2 && goto lobby3
if %choice%=="3" set level=3 && goto lobby3
if %choice%=="4" set level=4 && goto lobby3
if %choice%=="5" set level=5 && goto lobby3

:lobby3
set resultado={VillagerData:{profession:%p%,level:%level%}}
echo ==================================
echo ==================================
echo Escolha o bioma do villager.

echo [1] planícies
echo [2] taiga
echo [3] savana
echo [4] selva
echo [5] deserto
echo [6] neve
echo [7] pântano
choice /c:1234567 /N /M ">:"
set choice=%errorlevel%
if %choice%=="1" goto lobby4 && set type=plains
if %choice%=="2" goto lobby4 && set type=taiga
if %choice%=="3" goto lobby4 && set type=savanna
if %choice%=="4" goto lobby4 && set type=jungle
if %choice%=="5" goto lobby4 && set type=desert
if %choice%=="6" goto lobby4 && set type=snow
if %choice%=="7" goto lobby4 && set type=swamp

:lobby4
set resultado={VillagerData:{profession:%p%,level:%level%,type:%type%}}
echo ==================================
echo ==================================
echo Como está na versão alpha.
echo O limite vai ser de duas trocas.
echo ==================================
echo Coloque o nome do primeiro item da troca em inglês:
set /p troco=
echo Coloque quantos items para trocar:
set /p troconumero=

echo Coloque o item a ser vendido em inglês:
set /p por=
echo Coloque quantos items para dar:
set /p pornumero=

set resultado={Offers:{Recipes:[{buy:{id:%troco%,Count:%troconumero%}, sell:{id:%por%,Count:%pornumero%}, maxUses:9999999}]}}

echo ==================================
echo ==================================
echo Deseja colocar mais uma troca?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%"=="1" goto lobby5
if "%choice%"=="2" goto resultado
endlocal

:lobby5
echo Coloque o nome do primeiro item da troca em inglês:
set /p troco2=
echo Coloque quantos items para trocar:
set /p troconumero2=
echo Coloque o item a ser vendido em inglês:
set /p por2=
echo Coloque quantos items para dar:
set /p pornumero2=
set resultado={VillagerData:{profession:%p%,level:%level%,type:%type%},Offers:{Recipes:[{buy:{id:%troco%,Count:%troconumero%}, sell:{id:%por%,Count:%pornumero%}, maxUses:9999999},
{buy:{id:%troco2%,Count:%troconumero2%}, buyB:{id:%%,Count:3}, sell:{id:%por2%,Count:%pornumero2%},maxUses:9999999}]}}
goto resultado

:resultado
cls
echo /summon villager ~ ~ ~ %resultado%
echo ==
echo Aperte uma tecla para voltar.
pause >nul
goto comandos
