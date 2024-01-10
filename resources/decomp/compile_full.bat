
set type=player
set jebe=C:\Users\dudew\Desktop\epiczoneskins\EpiczoneSkinSystem\resources\decomp\%type%
set qcGenerated=1

xcopy /s /i "%jebe%\models" "%jebe%\output"

set list= base chroma_orange chroma_pink chroma_yellow chroma_green chroma_white chroma_blue chroma_purple skin_blood skin_artic skin_military skin_sunshine skin_toxic

(for %%a in (%list%) do ( 
    mdldec.exe %jebe%\output\%%a.mdl
    cd %jebe%\output
    rename "sas.smd" %%a.smd
    
    if %qcGenerated%==1 del %jebe%\output\%%a.qc
    if %qcGenerated%==0 set qcGenerated=1
    cd ../
    cd ../
))

echo "[decompile finished]"
studiomdl.exe %jebe%\output\base.qc

echo "[compile finished]"
pause