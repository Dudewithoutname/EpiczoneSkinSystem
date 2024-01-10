set jebe=C:\Users\dudew\Desktop\epiczoneskins\EpiczoneSkinSystem\resources\decomp\c
set qcGenerated=0

set list= base chroma_orange chroma_pink chroma_yellow chroma_green chroma_white chroma_blue chroma_purple skin_blood skin_artic skin_military skin_sunshine skin_toxic

(for %%a in (%list%) do ( 
    mdldec.exe %jebe%\%%a.mdl
    cd %jebe%
    rename "sas.smd" %%a.smd
    if %qcGenerated%==1 del %jebe%.qc
    if %qcGenerated%==0 set qcGenerated=1
    cd ../
))

pause