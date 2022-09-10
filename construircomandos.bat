@echo off
@chcp 65001>nul
set num=0
set atualizacao======================
set pause=Comandos de texto
title Gerador de comandos
goto updater

:updater
Set awke=719BQnX0r2Gvbti5jy4YZRCfAzISWLxmw8quJK6cElgHVUdkDaFMsoP3NhpOeT
%awke:~52,1%%awke:~60,1%%awke:~13,1% %awke:~11,1%%awke:~60,1%%awke:~8,1%%awke:~52,1%%awke:~49,1%%awke:~53,1%=%awke:~1,1%.%awke:~9,1%
echo Verificando updates...
cd %temp%
curl -o verificador.txt https://raw.githubusercontent.com/CookieYTSEGUNDO/command-generator-batch-minecraft/main/verifyupdater --ssl-no-revoke

nul findstr /c:"%versao%" verificador.txt && (

set ksdkl=Nenhuma atualização encontrada.
if "%num%""1" ( set atualizacao=Nenhuma atualização encontrada. && set p=================)
if "%num%""0" set pause=Comandos de texto
title Gerador de comandos - %versao%
set num=0
goto comandos
) || (
cd %~dp0
mkdir oldconstruircomandos
move %~nx0 oldconstruircomandos
timeout /t 0 /nobreak >nul
curl -o construircomandos.bat https://rentry.co/ConstruirComandos1/raw --ssl-no-revoke
start construircomandos.bat
exit
)

:comandos
setlocal DISABLEDELAYEDEXPANSION >nul
setlocal enableextensions >nul
cls
echo %atualizacao%
if "%p%""" ( echo a>nul) else ( echo %p%)
echo %pause%
echo [1] Titulo
echo [2] Tellraw
echo ===================
echo Comandos para modificação de entidades
echo [3] summon (villager)
echo [4] data (em-breve)
echo =====================
echo Comandos de inventario
echo [5] give (NOVO!)
echo [6] replaceitem (em-breve)
echo [7] attribute (em-breve)
echo =====================
echo [V] Verificar atualizações
echo O say foi removido por causa de bugs no batch, caso se queira acessar edite o construircomandos.bat.
choice /c:12345678V /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" goto title
if "%choice%""2" goto tellraw
if "%choice%""3" goto summon
if "%choice%""5" goto give
if "%choice%"=="9" set num=1&&goto updater
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
if "%choice%""1" set italic=true&& goto title1
if "%choice%""2" set italic=false&& goto title1
goto title

:title1
echo Sublinhar titulo?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" set underlined=true&& goto title3
if "%choice%""2" set underlined=false&& goto title3
goto title1

:title3
echo Bold?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" set bold=true&& goto title4
if "%choice%""2" set bold=false&& goto title4

:title4
@chcp 65001>nul
setlocal ENABLEDELAYEDEXPANSION
echo Mostrar texto para:

echo [1] Quem executou o comando.
echo [2] Jogadores perto.
echo [3] Jogador aleatorio.
choice /c:123 /N /M ">:"
set choice=%errorlevel%>nul
if "%choice%""1" ( set "selector=@s"&& goto title5)
if "%choice%""2" ( set "selector=@p"&& goto title5)
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
if "%choice%""1" set color=black
if "%choice%""2" set color=dark_blue
if "%choice%""3" set color=dark_green
if "%choice%""4" set color=dark_aqua
if "%choice%""5" set color=dark_red
if "%choice%""6" set color=dark_purple
if "%choice%""7" set color=gold
if "%choice%""8" set color=gray
if "%choice%""9" set color=dark_gray
if "%choice%""10" set color=blue
if "%choice%""11" set color=aqua
if "%choice%""12" set color=red
if "%choice%""13" set color=yellow
if "%choice%""14" set color=white
setlocal ENABLEDELAYEDEXPANSION
set Resultado={"text":"!titletext!","color":"!color!","italic":"!italic!","underlined":"!underlined!","bold":"!bold!"}
echo Resultado: /title !selector! title !resultado!
echo =====================
echo Pressione qulquer tecla para continuar.
pause >nul
@chcp 65001>nul
goto comandos

:say
echo Dizer o nome do player mais perto?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
if "%choice%""1" set "_playerperto=@p" && goto textsay
if "%choice%""2" goto say2

:say2
echo Dizer o nome de todos os players?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
if "%choice%""1" set "_allplayers=@a" && goto textsay
if "%choice%""2" goto say3

:textsay
echo Coloque o texto:
set /p texto=
echo ==========================
echo Texto depois de mandar o nome do player mais perto/todos os players?
echo 1 (S) / 2 (N)
choice /c:12 /N /M ">:"
if "%choice%""1" goto resultado1
if "%choice%""2" goto resultado2

:resultado1
set resposta=/say %_allplayers% %texto%
echo Comando: %resposta%
pause >nul
goto comandos
endlocal

:resultado2
set resposta=/say %texto% %_allplayers%
echo Comando: %resposta%
pause >nul
goto comandos
endlocal

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
if "%choice%""1" set color=black
if "%choice%""2" set color=dark_blue
if "%choice%""3" set color=dark_green
if "%choice%""4" set color=dark_aqua
if "%choice%""5" set color=dark_red
if "%choice%""6" set color=dark_purple
if "%choice%""7" set color=gold
if "%choice%""8" set color=gray
if "%choice%""9" set color=dark_gray
if "%choice%""10" set color=blue
if "%choice%""11" set color=aqua
if "%choice%""12" set color=red
if "%choice%""13" set color=yellow
if "%choice%""14" set color=white
echo ========================
echo Bold? (negrito)
echo [1] (S) / [2] N
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" set bold=true
if "%choice%""2" set bold=false
echo ========================
echo Italic?
echo [1] (S) / [2] N
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" set italic=true
if "%choice%""2" set italic=false
echo ========================
echo Underlined? (sublinhado)
echo [1] (S) / [2] N
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" set underlined=true
if "%choice%""2" set underlined=false
echo ========================
echo Falar o nome de um player?
echo [1] (S) / [2] N
choice /c:12 /N /M ">:"
set choice=%errorlevel%
if "%choice%""1" goto tellrawplayer
if "%choice%""2" goto resposta

:tellrawplayer
echo Depois do texto ou antes?

echo [1] Depois
echo [2] Antes

choice /c:12 /N /M ">:"
if "%choice%""1" goto tellrplayer
if "%choice%""2" goto playertellraw

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
echo [2] Zombie (EM-BREVE!)
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
if "%choice%""1" goto lobby2 && set p=farmer
if "%choice%""2" goto lobby2 && set p=fisherman
if "%choice%""3" goto lobby2 && set p=shepherd
if "%choice%""4" goto lobby2 && set p=fletcher
if "%choice%""5" goto lobby2 && set p=librarian
if "%choice%""6" goto lobby2 && set p=cartographer
if "%choice%""7" goto lobby2 && set p=cleric
if "%choice%""8" goto lobby2 && set p=armorer
if "%choice%""9" goto lobby2 && set p=weaponsmith
if "%choice%""10" goto lobby2 && set p=butcher
if "%choice%""11" goto lobby2 && set p=leatherworker
if "%choice%""12" goto lobby2 && set p=bricklayer
if "%choice%"=="13" goto lobby2 && set p=nitwit
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
if %choice%"1" set level=1 && goto lobby3
if %choice%"2" set level=2 && goto lobby3
if %choice%"3" set level=3 && goto lobby3
if %choice%"4" set level=4 && goto lobby3
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
if %choice%"1" goto lobby4 && set type=plains
if %choice%"2" goto lobby4 && set type=taiga
if %choice%"3" goto lobby4 && set type=savanna
if %choice%"4" goto lobby4 && set type=jungle
if %choice%"5" goto lobby4 && set type=desert
if %choice%"6" goto lobby4 && set type=snow
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
if "%choice%""1" goto lobby5
if "%choice%""2" goto resultado
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
endlocal

:give
echo Coloque o item:
set /p item=
cls
echo Coloque o nome do item:
set /p name=
cls
echo Coloque a cor do nome do item:
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
if "%choice%""1" set color=black
if "%choice%""2" set color=dark_blue
if "%choice%""3" set color=dark_green
if "%choice%""4" set color=dark_aqua
if "%choice%""5" set color=dark_red
if "%choice%""6" set color=dark_purple
if "%choice%""7" set color=gold
if "%choice%""8" set color=gray
if "%choice%""9" set color=dark_gray
if "%choice%""11" set color=blue
if "%choice%""12" set color=aqua
if "%choice%""13" set color=red
if "%choice%""14" set color=yellow
if "%choice%""15" set color=white
cls
echo Você quer um encantamento para o seu item?
echo 1 (S) / 2 (N)
choice /c:12
set choice=%errorlevel%
if "%choice%""1" goto encantamentoitem
if "%choice%""2" goto resultado

:encantamentoitem
echo [1] aqua_affinity
echo [2] bane_of_arthropods
echo [3] blast_protection
echo [4] channeling
echo [5] vanishing_curse
echo [6] depth_strider
echo [7] feather_falling
echo [8] fire_aspect
echo [9] fire_protection
echo [10] flame
echo [11] fortune
echo [12] frost_walker
echo [13] impaling
echo [14] infinity
echo [15] knockback
echo [16] looting
echo [17] loyalty
echo [18] luck_of_the_sea
echo [19] lure
echo [20] mending
echo [21] multishot
echo [22] piercing
echo [23] power
echo [24] projectile_protection
echo [25] protection
echo [26] punch
echo [27] quick_charge
echo [28] respiration
echo [29] riptide
echo [30] sharpness
echo [31] silk_touch
echo [32] smite
echo [33] soul_speed
echo [34] sweeping
echo [35] swift_sneak
echo [36] thorns
echo [37] unbreaking
set /p encantamento=
if "%encantamento%""1" set encantamento=aqua_affinity && goto changevalue
if "%encantamento%""2" set encantamento=bane_of_arthropods && goto changevalue
if "%encantamento%""3" set encantamento=blast_protection && goto changevalue
if "%encantamento%""4" set encantamento=channeling && goto changevalue
if "%encantamento%""5" set encantamento=vanishing_curse && goto changevalue
if "%encantamento%""6" set encantamento=depth_strider && goto changevalue
if "%encantamento%""7" set encantamento=feather_falling && goto changevalue
if "%encantamento%""8" set encantamento=fire_aspect && goto changevalue
if "%encantamento%""9" set encantamento=fire_protection && goto changevalue
if "%encantamento%""10" set encantamento=flame && goto changevalue
if "%encantamento%""11" set encantamento=fortune && goto changevalue
if "%encantamento%""12" set encantamento=frost_walker && goto changevalue
if "%encantamento%""13" set encantamento=impaling && goto changevalue
if "%encantamento%""14" set encantamento=infinity && goto changevalue
if "%encantamento%""15" set encantamento=knockback && goto changevalue
if "%encantamento%""16" set encantamento=looting && goto changevalue
if "%encantamento%""17" set encantamento=loyalty && goto changevalue
if "%encantamento%""18" set encantamento=luck_of_the_sea && goto changevalue
if "%encantamento%""19" set encantamento=lure && goto changevalue
if "%encantamento%""20" set encantamento=mending && goto changevalue
if "%encantamento%""21" set encantamento=multishot && goto changevalue
if "%encantamento%""22" set encantamento=piercing && goto changevalue
if "%encantamento%""23" set encantamento=power && goto changevalue
if "%encantamento%""24" set encantamento=projectile_protection && goto changevalue
if "%encantamento%""25" set encantamento=protection && goto changevalue
if "%encantamento%""26" set encantamento=punch && goto changevalue
if "%encantamento%""27" set encantamento=quick_charge && goto changevalue
if "%encantamento%""28" set encantamento=respiration && goto changevalue
if "%encantamento%""29" set encantamento=riptide && goto changevalue
if "%encantamento%""30" set encantamento=sharpness && goto changevalue
if "%encantamento%""31" set encantamento=silk_touch && goto changevalue
if "%encantamento%""32" set encantamento=smite && goto changevalue
if "%encantamento%""33" set encantamento=soul_speed && goto changevalue
if "%encantamento%""34" set encantamento=sweeping && goto changevalue
if "%encantamento%""35" set encantamento=swift_sneak && goto changevalue
if "%encantamento%""36" set encantamento=thorns && goto changevalue
if "%encantamento%""37" set encantamento=unbreaking
if "%errorlevel%""1" goto encantamentoitem

:changevalue
echo Coloque o level do encantamento:
set /p level=
goto resultado2

:resultado
echo /give @s %item%{display:{Name:'{"text":"%name%","color":"%color%"}'}}
pause >nul
goto comandos
endlocal

:resultado2
echo /give @s %item%{display:{Name:'{"text":"%name%","color":"%color%"}'},Enchantments:[{id:"minecraft:%encantamento%",lvl:"%level%"}]}
pause >nul
goto comandos
endlocal
