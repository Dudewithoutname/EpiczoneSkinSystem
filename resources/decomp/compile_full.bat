:: Coreyho uzasny model merger v6.9 dartom-malware super edition
:: hlavny model sa vzdy musi menovat base lebo treba aj nejake standardy
:: vytvor 2 zlozky v subore ktory je v premennej type a to output a models 
:: nezabudni si v .qc subore cd na lokaciu output zlozky
@echo off

:: ak mas predgenerovanu uz .qc file tak nastava na 2
set /a qcGenerated=2
:: nazov suboru
set type=player
:: cast modelu na mergnutie
set smd="sas.smd"
:: cesta, nepytaj sa preco taky nazov
set jebe=C:\Users\dudew\Desktop\epiczoneskins\EpiczoneSkinSystem\resources\decomp\%type%
:: nazvy modelov ktore chces mergnut (treba zmenene textures premenovat ak je to rovnaky model cez Half Life Asset Manager alebo Milkshape)
set list=base chroma_orange chroma_pink chroma_yellow chroma_green chroma_white chroma_blue chroma_purple skin_blood skin_artic skin_military skin_sunshine skin_toxic

echo decompiling...

del /f /q "%jebe%\output\*.*"
xcopy /f /s /i "%jebe%\models" "%jebe%\output"
(for %%a in (%list%) do ( 
    mdldec.exe %jebe%\output\%%a.mdl
    cd %jebe%\output
    rename %smd% "%%a.smd"

    if not %qcGenerated%==2 (
        if %qcGenerated%==1 del %jebe%\output\%%a.qc
        if %qcGenerated%==0 set /a qcGenerated=1
    ) else ( 
        del %jebe%\output\base.qc
        copy %jebe%\models\base.qc %jebe%\output
        set /a qcGenerated=1
     )

    :continue
    cd ../
    cd ../
))
echo compiling...
studiomdl.exe %jebe%\output\base.qc

echo finished
pause