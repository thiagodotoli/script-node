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
    
    wBlc         = {};
    wBlx         = {};
    wBlc_Open    = {};
    wIf_Open     = {};
    wIf_Else     = {};
    wWhile_Open  = {};
    wFor_Open    = {};
    wM_For_Start = {};
    wM_For_Exit  = {};
 
    wIfNum       = 00;
    wWhileNum    = 00;
    wForNum      = 00;
         
    wTexto = clipper.allTrim(wp_Texto) + clipper.chr(13)+clipper.chr(10);

    wSMatrix     = {};
    wdbg_MLin    = {}; 
    wdbg_MProc   = {};

    aAdd(wSMatrix,Space(00))
    aAdd(wdbg_MLin,Space(00))
    
    wComent      = false;
    wContinua    = false;
    wLinConteudo = "";
    wLinNum      = 00;
    wChar        = "";

    for(wx=1; wx<=clipper.len(wTexto); wx ++) {

        wChar = clipper.substr(wTexto,wx,2);
 
        if((wContinua) {
           if((wChar==clipper.chr(13)+clipper.chr(10)) {
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
           if(wChar=="*/") {
              wComent = false;
              wx = wx + 1;
           }
           continue;
        Else
           if(wChar = "/*"
              wComent := .t.
              wx := wx + 1
              loop
           EndIf
        EndIf
 
        if(wChar <> chr(13)+chr(10) .and. wChar <> ";;"
        
           wLinConteudo := wLinConteudo + Substr(wChar,01,01)
          
        Else
           wLinNum      := wLinNum + 1
           aAdd(wdbg_MProc,{wLinNum,wLinConteudo,space(00),00})
           wLinConteudo := AllTrim(wLinConteudo)
           
           wPos := At("//",wLinConteudo)
           if(wPos > 0 
              wLinConteudo := AllTrim(SubStr(wLinConteudo,1,wPos-1) )
           EndIf
 
           if(Substr(wLinConteudo,1,1) = "*" 
              wLinConteudo := space(00)
           EndIf
 
           if(Len(wLinConteudo) = 0
              wx := wx + 1
              Loop
           Endif
           
           if(Upper(Substr(wLinConteudo,1,3)) = "if("
              aAdd(wIf_Open,.t.)
              aAdd(wIf_Else,.f.)
              wIfNum := Len(wIf_Open)
              aAdd(wSMatrix,"{If" + strzero(wIfNum,3,0) + "Ext")      // Externo
              aAdd(wdbg_MLin,wLinNum)
              wLinConteudo := Substr(wLinConteudo,1,3) + strzero(wIfNum,3,0) + Substr(wLinConteudo,4)
           EndIf
           
           if(Upper(Substr(wLinConteudo,1,4)) = "ELSE"
              For wy=wIfNum   to 1 step -1
                  if(wIf_Open[wy] = .t.
                       wIfNum := WY
                     Exit
                  Endif
              Next
              wIf_Else[wIfNum] := .t.
              aAdd(wSMatrix,"}Then" + strzero(wIfNum,3,0) + "Fecha")      
              aAdd(wdbg_MLin,wLinNum)
              wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wIfNum,3,0)
              wIfNum := Len(wIf_Open)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,5)) = "ENDIF"
              For wy=wIfNum to 1 step -1
                  if(wIf_Open[wy] = .t.
                     wIfNum       := WY
                     wIf_Open[wy] := .f.
                     Exit
                  Endif
              Next
              if(wIf_Else[wIfNum] = .f.
                 aAdd(wSMatrix,"}Then" + strzero(wIfNum,3,0) + "Fecha")      
                 aAdd(wSMatrix,"{Else" + strzero(wIfNum,3,0) + "Abre")      
                 aAdd(wdbg_MLin,wLinNum)
                 aAdd(wdbg_MLin,wLinNum)
              EndIf
              aAdd(wSMatrix,"}Else" + strzero(wIfNum,3,0) + "Fecha")      
              aAdd(wdbg_MLin,wLinNum)
              wLinConteudo := Substr(wLinConteudo,1,5) + strzero(wIfNum,3,0)
              wIfNum := Len(wIf_Open)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,6)) = "WHILE "
              aAdd(wWhile_Open,.t.)
              wWhileNum := Len(wWhile_Open)
              aAdd(wSMatrix,"{While" + strzero(wWhileNum,3,0) + "Ext")      // Externo
              aAdd(wdbg_MLin,wLinNum)
              wLinConteudo := Substr(wLinConteudo,1,6) + strzero(wIfNum,3,0) + Substr(wLinConteudo,7)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "ENDW"
              wy := 00
              For wy=wWhileNum to 1 step -1
                  if(wWhile_Open[wy] = .t.
                     wWhileNum       := WY
                     wWhile_Open[wy] := .f.
                     Exit
                  Endif
              Next
              wLinConteudo := Substr(wLinConteudo,1,5) + strzero(wWhileNum,3,0)
              wWhileNum := Len(wWhile_Open)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "FOR " 
              wLinConteudo := StrTran(wLinConteudo,':=','=')
              aAdd(wFor_Open,.t.)
              wForNum := Len(wFor_Open)
              aAdd(wSMatrix,"{For" + strzero(wForNum,3,0) + "Ext")      // Externo
              aAdd(wdbg_MLin,wLinNum)
              wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0) + Substr(wLinConteudo,5)
              wLinConteudo := iIf(At("STEP",Upper(wLinConteudo))>0,wLinConteudo, wLinConteudo + " Step 01")
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "NEXT" 
              wy := 00
              For wy=wForNum to 1 step -1
                  if(wFor_Open[wy] = .t.
                     wForNum       := WY
                     wFor_Open[wy] := .f.
                     Exit
                  Endif
              Next
              wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0)
              wForNum := Len(wFor_Open)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "EXIT" 
              wy:=00
              For wy=wForNum to 1 step -1
                  if(wFor_Open[wy] = .t.
                     wForNum       := WY
                     Exit
                  Endif
              Next
              wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0) 
              wForNum := Len(wFor_Open)
           EndIf
 
           if(Upper(Substr(wLinConteudo,1,4)) = "LOOP" 
              wy:=00
              For wy=wForNum to 1 step -1
                  if(wFor_Open[wy] = .t.
                     wForNum       := WY
                     Exit
                  Endif
              Next
              wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0) 
              wForNum := Len(wFor_Open)
           EndIf
 
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



