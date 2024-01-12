:: Coreyho uzasny model merger v6.9 dartom-malware super edition
:: hlavny model sa vzdy musi menovat base lebo treba aj nejake standardy a ne furt premenne
:: vytvor 2 zlozky v subore ktory je v premennej type a to output a models 
:: nezabudni si v .qc subore cd na lokaciu output zlozky
@echo off

:: ak mas predgenerovanu uz .qc file tak nastav na 2 ak nemas tak na vo vysledku aj tak budes muset vytvorit subor .qc manualne s bodygroup partmy
set /a qcGenerated=2
:: nazov suboru
set type=player
:: cesta 
:: ntb set jebe=C:\Users\dudew\Desktop\epiczoneskins\EpiczonSkinSystem\modelmerger\%type%
set path=C:\Users\Správca\Desktop\ctx\ActiveProjects\EpiczonSkinSystem\modelmerger\%type%
:: cast modelu na (.smd) mergnutie moj napad bol mergnut rovnaky model (rovnake .smd) s inymi textures, ak chces mergnut modely s inak pomenovanymi .smd subormi
:: tak toto je jedno jak nastavis iba v list permennej nastavis mena .smd suborov na mergnutie kedze toto sluzi skor na premenovanie toho isteho .smd 
set smd=sas
:: nazvy modelov (.smd) ktore chces mergnut (treba zmenene textures premenovat ak je to rovnaky model cez Half Life Asset Manager alebo Milkshape)
set list=base chroma_orange chroma_pink chroma_yellow chroma_green chroma_white chroma_blue chroma_purple skin_blood skin_artic skin_military skin_sunshine skin_toxic

echo decompiling...
del /f /q "%path%\output\*.*"
xcopy /f /s /i "%path%\models" "%path%\output"
(for %%a in (%list%) do ( 
    mdldec.exe %path%\output\%%a.mdl
    cd %path%\output
    rename "%smd%.smd" "%%a.smd"

    if not %qcGenerated%==2 (
        if %qcGenerated%==1 del %path%\output\%%a.qc
        if %qcGenerated%==0 set /a qcGenerated=1
    ) else ( 
        del %path%\output\base.qc
        copy %path%\models\base.qc %path%\output
        set /a qcGenerated=1
    )

    :continue
    cd ../
    cd ../
))

echo compiling...
studiomdl.exe %path%\output\base.qc

echo finished
pause