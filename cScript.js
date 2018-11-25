clipper = require('./clipper');

const wBlc
,wBlx
,wBlc_Open
,wPosObj
,wSMatrix
,wScriptReturn
,wIf_Open
,wIf_Else
,wIfNum
,wWhile_Open
,wWhuleNum
,wFor_Open
,wForNum
,wdbg_MProc
,wdbg_MVar
,wdbg_MLin
,wdbg_LinhaGoto
,wdbg_LinhaAtual
,wM_For_Start
,wM_For_Exit
,wTimeTotalGeral
,_wM_Private;

//console.log("TESTE");
const cCaseScript = (wObjeto,wMParm,wp_Texto) => {

    wdbg_LinhaAtual = 01;
    wdbg_LinhaGoto  = 03;
    wTimeTotalGeral = 00;
    
    wBlc         = [];
    wBlx         = [];
    wBlc_Open    = [];
    wIf_Open     = [];
    wIf_Else     = [];
    wWhile_Open  = [];
    wFor_Open    = [];
    wM_For_Start = [];
    wM_For_Exit  = [];
 
    wIfNum       = 00;
    wWhileNum    = 00;
    wForNum      = 00;
         
    wTexto = clipper.allTrim(wp_Texto) + clipper.chr(13)+clipper.chr(10);

    wSMatrix     = [];
    wdbg_MLin    = []; 
    wdbg_MProc   = [];

    clipper.aAdd(wSMatrix,Space(00))
    clipper.aAdd(wdbg_MLin,Space(00))
    
    wComent      = false;
    wContinua    = false;
    wLinConteudo = "";
    wLinNum      = 00;
    wChar        = "";

    for(wx=1; wx<=clipper.len(wTexto); wx ++) {

        wChar = clipper.substr(wTexto,wx,2);
 
        if(wContinua) {
           if(wChar==(clipper.chr(13)+clipper.chr(10))) {
              wContinua = false;
              wx = wx + 1;
           }
           continue;
        } else {
            if(wChar=="/;") {
              wContinua = true;
              wx = wx + 1;
              continue;
            }
        }
 
        if(wComent) {
           if(wChar=="*/") {      // If wChar = "*/"
              wComent = false;
              wx = wx + 1;
           }
           continue;
        } else {
           if(clipper.substr(wChar,1,1)=="/" && clipper.substr(wChar,2,1)=="*") {    //If wChar = "/*"
              wComent = true;
              wx = wx + 1;
              continue;
           EndIf
        EndIf
 
        if(wChar!=clipper.chr(13)+clipper.chr(10) && wChar!=";;") {
            wLinConteudo = wLinConteudo + clipper.substr(wChar,01,01);
        } else {
            wLinNum      = wLinNum + 1;
            clipper.aAdd(wdbg_MProc,[wLinNum,wLinConteudo,"" , 0 ]);
            wLinConteudo = clipper.allTrim(wLinConteudo);

            wPos = clipper.at("//",wLinConteudo);
            if(wPos > 0) { 
                wLinConteudo = clipper.allTrim(clipper.substr(wLinConteudo,1,wPos-1) );
            }
 
            if(clipper.substr(wLinConteudo,1,1) == "*" ) {
                wLinConteudo = "";
            }
 
            if(clipper.len(wLinConteudo)==0) {
                wx = wx + 1;
                continue;
            }
           
            if(clipper.upper(clipper.substr(wLinConteudo,1,3)) == "IF(") {
                clipper.aAdd(wIf_Open,true);
                clipper.aAdd(wIf_Else,true);
                wIfNum = clipper.len(wIf_Open);
                clipper.aAdd(wSMatrix,"{If" + clipper.strzero(wIfNum,3,0) + "Ext");      // Externo
                clipper.aAdd(wdbg_MLin,wLinNum);
                wLinConteudo = clipper.substr(wLinConteudo,1,3) + clipper.strzero(wIfNum,3,0) + clipper.substr(wLinConteudo,4);
            }
           
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "ELSE") {
                for(var wy = wIfNum; wy<=1; wy--) {    // For wy=wIfNum   to 1 step -1
                    if(wIf_Open[wy]) {                //    If wIf_Open[wy] = .t.
                        wIfNum = wy;
                        break;                        //        Exit
                    }
                }
              wIf_Else[wIfNum] = true;
              clipper.aAdd(wSMatrix,"}Then" + clipper.strzero(wIfNum,3,0) + "Fecha");      
              clipper.aAdd(wdbg_MLin,wLinNum);
              wLinConteudo = clipper.substr(wLinConteudo,1,4) + clipper.strzero(wIfNum,3,0);
              wIfNum = clipper.len(wIf_Open);
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,5)) == "ENDIF") {
                for(var wy = wIfNum; wy<=1; wy--) {    // For wy=wIfNum to 1 step -1
                    if(wIf_Open[wy]) {
                        wIfNum       = wy;
                        wIf_Open[wy] = false;
                        break;
                    }
                }
                if(!wIf_Else[wIfNum])     // If wIf_Else[wIfNum] = .f.
                    clipper.aAdd(wSMatrix,"}Then" + clipper.strzero(wIfNum,3,0) + "Fecha");      
                    clipper.aAdd(wSMatrix,"{Else" + clipper.strzero(wIfNum,3,0) + "Abre");      
                    clipper.aAdd(wdbg_MLin,wLinNum);
                    clipper.aAdd(wdbg_MLin,wLinNum);
                }      
                clipper.aAdd(wSMatrix,"}Else" + clipper.strzero(wIfNum,3,0) + "Fecha"); 
                clipper.aAdd(wdbg_MLin,wLinNum);
                wLinConteudo = clipper.substr(wLinConteudo,1,5) + strzero(wIfNum,3,0);
                wIfNum = clipper.len(wIf_Open);
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,6)) == "WHILE ") {
                clipper.aAdd(wWhile_Open,true);
                wWhileNum = clipper.len(wWhile_Open);
                clipper.aAdd(wSMatrix,"{While" + clipper.strzero(wWhileNum,3,0) + "Ext");      // Externo
                clipper.aAdd(wdbg_MLin,wLinNum);
                wLinConteudo = clipper.substr(wLinConteudo,1,6) + clipper.strzero(wIfNum,3,0) + clipper.substr(wLinConteudo,7;)
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "ENDW") {
                wy = 0;
                for(var wy = wWhileNum; wy<=1; wy--) { //For wy=wWhileNum to 1 step -1
                    if(wWhile_Open[wy]) {
                        wWhileNum       = wy;
                        wWhile_Open[wy] = false;
                        break;
                    }
                }
                wLinConteudo = clipper.substr(wLinConteudo,1,5) + clipper.strzero(wWhileNum,3,0);
                wWhileNum = clipper.len(wWhile_Open);
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "FOR ") {
              wLinConteudo = clipper.strTran(wLinConteudo,':=','=');
              clipper.aAdd(wFor_Open,true);
              wForNum = clipper.len(wFor_Open);
              clipper.aAdd(wSMatrix,"{For" + clipper.strzero(wForNum,3,0) + "Ext");      // Externo
              clipper.aAdd(wdbg_MLin,wLinNum);
              wLinConteudo = clipper.substr(wLinConteudo,1,4) + clipper.strzero(wForNum,3,0) + clipper.substr(wLinConteudo,5);
              wLinConteudo = (clipper.at("STEP",clipper.upper(wLinConteudo))>0) ? wLinConteudo : wLinConteudo + " Step 01";     //iIf(At("STEP",Upper(wLinConteudo))>0,wLinConteudo, wLinConteudo + " Step 01")
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "NEXT") { 
                wy = 0;
                for(var wy=wForNum; wy<=1; wy--) { //For wy=wForNum to 1 step -1
                    if(wFor_Open[wy]) {
                        wForNum       = wy;
                        wFor_Open[wy] = false;
                        break;
                    }
                }
                wLinConteudo = clipper.substr(wLinConteudo,1,4) + clipper.strzero(wForNum,3,0);
                wForNum = clipper.len(wFor_Open);
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "EXIT") { 
                wy = 0;
                for(var wy=wForNum; wy<=1; wy--) { //For wy=wForNum to 1 step -1
                    if(wFor_Open[wy]) {
                        wForNum = wy;
                        break;     //Exit
                    }
                }
                wLinConteudo = clipper.substr(wLinConteudo,1,4) + clipper.strzero(wForNum,3,0); 
                wForNum = clipper.len(wFor_Open);
            }
 
            if(clipper.upper(clipper.substr(wLinConteudo,1,4)) == "LOOP") { 
                wy = 0;
                for(var wy=wForNum; wy<=1; wy--) { //For wy=wForNum to 1 step -1
                    if(wFor_Open[wy]) {
                        wForNum = wy;
                        break;
                    }
                }
                wLinConteudo = clipper.substr(wLinConteudo,1,4) + clipper.strzero(wForNum,3,0); 
                wForNum = clipper.len(wFor_Open);
            }
 
           *---------------------------------inclui a linha de comando----------------------------------------------*
           aAdd(wSMatrix,AllTrim(wLinConteudo))
           aAdd(wdbg_MLin,wLinNum)
           *--------------------------------------------------------------------------------------------------------*
 
           if( Upper(Substr(wLinConteudo,1,3)) = "if(" 
              wIfNum := Val(Substr(wLinConteudo,4,3))
              aAdd(wSMatrix,"{Then" + strzero(wIfNum,3,0) + "Abre")      
              aAdd(wdbg_MLin,wLinNum)
           EndIf
           if(Upper(Substr(wLinConteudo,1,4)) = "ELSE"
              wIfNum := Val(Substr(wLinConteudo,5,3))
              aAdd(wSMatrix,"{Else" + strzero(wIfNum,3,0) + "Abre")      
              aAdd(wdbg_MLin,wLinNum)
           EndIf
           if(Upper(Substr(wLinConteudo,1,5)) = "ENDIF"  
              wIfNum := Val(Substr(wLinConteudo,6,3))
              aAdd(wSMatrix,"}EndIf" + strzero(wIfNum,3,0) + "Ext")      // Externo
              aAdd(wdbg_MLin,wLinNum)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "ENDW" 
              wWhileNum := Val(Substr(wLinConteudo,5,3))
              aAdd(wSMatrix,"}EndW" + strzero(wWhileNum,3,0) + "Ext")       // externo
              aAdd(wdbg_MLin,wLinNum)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "NEXT" 
              wForNum := Val(Substr(wLinConteudo,5,3))
              aAdd(wSMatrix,"}Next" + strzero(wForNum,3,0) + "Ext")       // externo
              aAdd(wdbg_MLin,wLinNum)
           EndIf
 
           wLinConteudo  := Space(00)
           wx := wx + 1
        EndIf
 
    Next
    aAdd(wSMatrix,AllTrim(wLinConteudo))
    aAdd(wdbg_MLin,wLinNum)
 
    if(upper(wObjeto) = "PRC_CICERO"
       *cFor("wx",1,len(wSMatrix),1,"cLog_sql(wSMatrix[wx])" )  // CICERO NAO EXCLUIR
       cScript(wSMatrix,wMParm,wObjeto)
    else
       cScript(wSMatrix,wMParm,wObjeto)
    Endif(

}



