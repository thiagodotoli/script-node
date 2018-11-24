#include "FiveWin.ch"
#include "Constant.ch"
#include "Set.ch"

MEMVAR wBlc , wBlx, wBlc_Open , wPosObj , wSMatrix , wScriptReturn , wIf_Open, wIf_Else, wIfNum, wWhile_Open , wWhileNum , wFor_Open , wForNum , wM_Objeto , wc_User , wcDebug, wObj_Nome
MEMVAR wdbg_MProc, wdbg_MLin , wdbg_MVar, wdbg_LinhaGoto, wdbg_LinhaAtual, wM_For_Start, wM_For_Exit, wM_For_Loop
MEMVAR wm_grid , wm_brwlin, wM_Case, oM_Fld, om_brw, wCS_Coluna, wTimeTotalGeral, _wM_Private   , wQGFolder, wQGGRid
MemVar wPosTrace,wdbg_Trace,wc_Prc_Trace

function fPRC_Execute(wObjeto,wMParm,wDebug,wDebugQG)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wPos, wx, wMCursor , wTp_Obj, wReturn, wqtdPesq         
Private wcDebug,wPosTrace
Private wQGFolder, wQGGRid
wQGFolder := Len(oM_Fld)
wQGGRid   := Len(wM_Grid)

wObjeto   := AllTrim(wObjeto)
//wObj_Nome := wObjeto
wMParm    := iif(ValType(wMParm)="C",{wMParm},wMParm)
wMParm    := iif(ValType(wMParm)="A",wMParm,{})
wcDebug   := iif(ValType(wDebug)="L",wDebug,.f.)
wTp_Obj   := space(00)
wPos      := cScan(wM_Objeto,wObjeto,01)             // Verifica na Matriz de Objetos se este já está atribuido

aAdd(wdbg_Trace,{wObjeto,0,Space(00),Space(00),000})
wPosTrace := Len(wdbg_Trace)

**If wPos = 0 
**   wMCursor  := fConsulta( "cCase_Obj_Prp" ,, "Obj_Nome = " + Campo(wObjeto) ,,, {"Obj_Nome","Prp_Nome","Obj_Prp_Vlr"} )  
**   
**   For wx:=1 to len(wMCursor)
**       If Lower(wMCursor[wx,02]) = "debug"
**          wcDebug := wMCursor[wx,03]
**          wcDebug := iif(wcDebug="S",.t.,.f.)
**       ElseIf Lower(wMCursor[wx,02]) = "procedure"
**          wTp_Obj := "PRC"
**       EndIf
**   Next
**
**   If Len(wMCursor) = 0 
**      cCancel("Objeto " + wObjeto + " não cadastrado")
**   EndIf
**   If wTp_Obj <> "PRC"
**      cCancel("Objeto " + wObjeto + " não é uma Procedure")
**   EndIf
**
**EndIf

wqtdPesq := 0
do while wPos = 0 
   wMCursor  := fConsulta( "cCase_Obj_Prp" ,, "Obj_Nome = " + Campo(wObjeto) ,,, {"Obj_Nome","Prp_Nome","Obj_Prp_Vlr"} )  
   
   For wx:=1 to len(wMCursor)
       If Lower(wMCursor[wx,02]) = "debug"
          wcDebug := wMCursor[wx,03]
          wcDebug := iif(wcDebug="S",.t.,.f.)
       ElseIf Lower(wMCursor[wx,02]) = "procedure"
          wTp_Obj := "PRC"
       EndIf
   Next

   If Len(wMCursor) = 0 
      If wqtdPesq < 100 // 2      //  tenta por 100 vezes
         wqtdPesq := wqtdPesq + 1
         wPos     := cScan( wM_Objeto , wObjeto ,01 )             // Verifica na Matriz de Objetos se este já está atribuido
         Loop
      Else 
         cCancel("Procedure " + wObjeto + " não cadastrada")
      EndIf
   EndIf
   If wTp_Obj <> "PRC"
      cCancel("Objeto " + wObjeto + " não é uma Procedure")
   EndIf
   Exit
EndDo

aAdd(wM_Objeto,{wObjeto,wTp_Obj,Space(00),Space(00),0    })
wPos := Len(wM_Objeto)

wM_Objeto[wPos,3] := Dtoc(Date()) + " " +Time()   // Data e Hora da ultima utilizacao                    cCase_Obj.Obj_Util_Dt
wM_Objeto[wPos,4] := wc_User                      // Usuario da ultima utilizacao                        cCase_Obj.Obj_Util_Usr
wM_Objeto[wPos,5] := wM_Objeto[wPos,5] + 1        // Quantidade de vezes que o objeto foi utilizado      cCase_Obj.Obj_Util_Qtd

wc_Prc_Trace :=  wc_Prc_Trace + wObjeto  // cicerosql

wReturn := cCaseScript(wObjeto,wMParm)

wc_Prc_Trace :=  wc_Prc_Trace +"    " + wObjeto + chr(13)+chr(10) // cicerosql

wdbg_Trace[wPosTrace,01] := space(00)
wdbg_Trace[wPosTrace,02] := 0

wcDebug := .f.  //??
Return wReturn
*fim da function fPRC_Execute(wObjeto,wMParm,wDebug)


function cVar_Atrib(_wVar_Nome,_wConteudo)
*******************************************************************************
*                                                                             *
*******************************************************************************

 &_wVar_Nome := _wConteudo
 
return .t.
*fim da function cVar_Atrib(_wVar_Nome,_wConteudo)

function cIf(_wCondicao,_wThen,_wElse)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local _wcBlock
   If wcDebug
      If ValType(_wCondicao) = "U"
         msgInfo("Condição invalida para o IF")
      EndIf
      If ValType(_wThen)<> "C"
         msgInfo("If inválido")
      EndIf
      If ValType(_wElse)<> "C"
         msgInfo("IF sem encerramento ou invalido  (ENDIF/ELSE)")
      EndIf
   EndIf
   If _wCondicao
      If .not. cEmpty(_wThen)
         _wcBlock := fcBlock(_wThen)
         eVal(_wcBlock)
      EndIf
   Else
      If .not. cEmpty(_wElse)
         _wcBlock := fcBlock(_wElse)
         eVal(_wcBlock)
      EndIf
   EndIf    

return nil
*fim da function cIf(_wCondicao,_wThen,_wElse)

function cWhile(_wCondicao,_wThen,_wElse)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local _wcBlock

   If _wCondicao
      If .not. cEmpty(_wThen)
         _wcBlock := fcBlock(_wThen)
         eVal(_wcBlock)
      EndIf
   Else
      If .not. cEmpty(_wElse)
         _wcBlock := fcBlock(_wElse)
         eVal(_wcBlock)
      EndIf
   EndIf    

return nil
*fim da function cWhile(_wCondicao,_wThen,_wElse)


function cFor(_wVarNome,_wDe,_wAte,_wStep,_wXForNum,_wcBlock,_wcBlockFim)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local _wWork01
             
   _wStep      := iIf(Valtype(_wStep)="N",_wStep,01)
   _wXForNum   := iIf(Valtype(_wXForNum)="C",_wXForNum,"999")
   _wcBlockFim := iIf(Valtype(_wcBlockFim)="C",_wcBlockFim,"")

   For _wWork01:=len(wM_For_Exit) to Val(_wXForNum)
       aadd(wM_For_Exit,.f.)
   Next

   if wcdebug         
      For _wWork01:=len(wM_For_Start) to Val(_wXForNum)
          aadd(wM_For_Start,.f.)
      Next
      
      If wM_For_Start[val(_wXForNum)] = .f.
          &_wVarNome := _wDe
          wM_For_Start[val(_wXForNum)] = .t.
          wM_For_Exit[Val(_wXForNum)] := .f.
      Else
         If wM_For_Exit[Val(_wXForNum)] = .f.
             &_wVarNome := &_wVarNome + _wStep
          EndIf   
      EndIf

      If _wStep > 0
         If &_wVarNome <= _wAte .and. wM_For_Exit[Val(_wXForNum)] = .f.
            If .not. cEmpty(_wcBlock)
               _wWork01 := fcBlock(_wcBlock)
               eVal(_wWork01)
            EndIf
         Else
            wM_For_Start[val(_wXForNum)] = .f.
            If .not. cEmpty(_wcBlock)
               _wWork01 := fcBlock(_wcBlockFim)
               eVal(_wWork01)
            EndIf
         EndIf    
      Else
         If &_wVarNome >= _wAte .and. wM_For_Exit[Val(_wXForNum)] = .f.
            If .not. cEmpty(_wcBlock)
               _wWork01 := fcBlock(_wcBlock)
               eVal(_wWork01)
            EndIf
         Else
            wM_For_Start[val(_wXForNum)] = .f.
            If .not. cEmpty(_wcBlock)
               _wWork01 := fcBlock(_wcBlockFim)
               eVal(_wWork01)
            EndIf
         EndIf    
      EndIf
   Else
      wM_For_Exit[Val(_wXForNum)] := .f.
      &_wVarNome := _wDe
      *--------------------------------
      If _wStep > 0
         Do While &_wVarNome <= _wAte
            If .not. cEmpty(_wcBlock)
               _wcBlock := fcBlock(_wcBlock)    
               eVal(_wcBlock)     
            Endif
            If wM_For_Exit[val(_wXForNum)]
               Exit
            Endif
            &_wVarNome := &_wVarNome  + _wStep
         EndDo
         If .not. cEmpty(_wcBlockFim)
            _wcBlockFim := fcBlock(_wcBlockFim)    
            eVal(_wcBlockFim)     
         EndIf   
      *--------------------------------
      Else
         Do While &_wVarNome >= _wAte
            If .not. cEmpty(_wcBlock)
               _wcBlock := fcBlock(_wcBlock)    
               eVal(_wcBlock)     
            Endif
            If wM_For_Exit[val(_wXForNum)]
               Exit
            Endif
            &_wVarNome := &_wVarNome  + _wStep
         EndDo
         _wcBlockFim := fcBlock(_wcBlockFim)    
         eVal(_wcBlockFim)     
      EndIf
   EndIf
   
return nil
*fim da function cFor(_wVarNome,_wDe,_wAte,_wStep,_wcBlock)

function fcBlock(_wFcBlock)
*******************************************************************************
* Cria uma variavel tipo "Code Block"                                         *
*******************************************************************************
   If ValType(_wFcBlock) = "B"
      // none //
   ElseIf ValType(_wFcBlock) = "C"
      If Len(Trim(_wFcBlock)) = 0
         _wFcBlock := " nil "
      EndIf
      _wFcBlock := "{|| " +  _wFcBlock + "}"
      _wFcBlock := &(_wFcBlock)
   Else               
   
   
      cCancel("Parâmetros inválidos. Função fcBlock")
   EndIf
Return _wFcBlock
*fim da function fcBlock(_wFcBlock)

function cCaseScript(wObjeto,wMParm,wp_Texto)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wChar,wWhere,wMCursor,wTexto,wLinConteudo,wLinNum,wx,wPos,wy, wComent, wContinua
__MVPRIVATE("wBlc")
__MVPRIVATE("wBlx")
__MVPRIVATE("wBlc_Open")
__MVPRIVATE("wPosObj")
__MVPRIVATE("wSMatrix")
__MVPRIVATE("wScriptReturn")
__MVPRIVATE("wIf_Open")
__MVPRIVATE("wIf_Else")
__MVPRIVATE("wIfNum")
__MVPRIVATE("wWhile_Open")
__MVPRIVATE("wWhuleNum")
__MVPRIVATE("wFor_Open")
__MVPRIVATE("wForNum")
__MVPRIVATE("wdbg_MProc")
__MVPRIVATE("wdbg_MVar")
__MVPRIVATE("wdbg_MLin")
__MVPRIVATE("wdbg_LinhaGoto")
__MVPRIVATE("wdbg_LinhaAtual")
__MVPRIVATE("wM_For_Start")
__MVPRIVATE("wM_For_Exit")
__MVPRIVATE("wTimeTotalGeral")
__MVPRIVATE("_wM_Private")

    
   wdbg_LinhaAtual := 01
   wdbg_LinhaGoto  := 03
   wTimeTotalGeral := 00
   
   wBlc         := {}
   wBlx         := {}
   wBlc_Open    := {}
   wIf_Open     := {}
   wIf_Else     := {}
   wWhile_Open  := {}
   wFor_Open    := {}
   wM_For_Start := {}
   wM_For_Exit  := {}

   wIfNum       := 00
   wWhileNum    := 00
   wForNum      := 00
        
   If .not. wcdebug
      wPosObj := cScan(wM_Objeto , wObjeto , 01)           // Verifica na Matriz de Objetos se este já está atribuido
      If wPosObj > 0 
         If len(wM_Objeto[wPosObj]) >=6     // se o Code Bloco ja esta montado
            wBlc := wM_Objeto[wPosObj,6]
            cScriptAux(wBlc[03],wMParm,wObjeto)
            Return wScriptReturn
         EndIf
      EndIf
   EndIf

   If cEmpty(wp_Texto)
   	wWhere   := "Obj_Nome = " + Campo(wObjeto,"C") + " And Prp_Nome = " + campo("Procedure") 
   	wMCursor := fConsulta( "cCase_Obj_Prp" ,, wWhere ,,, {"Obj_Nome","Prp_Nome","Obj_Prp_Vlr","Obj_Prp_Memo"} )  
   	
   	If Len(wMCursor)=0
   	   cCancel("Procedure " + wObjeto + " não encontrada")
   	EndIf

	   wTexto := allTrim(wMCursor[01,04]) + chr(13)+chr(10)
   Else
	   wTexto := allTrim(wp_Texto) + chr(13)+chr(10)

		aAdd(wM_Objeto,{wObjeto,"",Space(00),Space(00),0})
		wPosObj := Len(wM_Objeto)
	EndIf

   wSMatrix      :={}
   wdbg_MLin     :={}  
   wdbg_MProc    := {}
   aAdd(wSMatrix,Space(00))
   aAdd(wdbg_MLin,Space(00))
   
   wComent      := .f.
   wContinua    := .f.
   wLinConteudo := Space(00)
   wLinNum      := 00
   wChar        := space(00)
   For wx=1 to len(wTexto)
       wChar := Substr(wTexto,wx,2)

       If wContinua
          If wChar = chr(13)+chr(10)
             wContinua := .f.
             wx := wx + 1
          EndIf
          Loop
       Else
          If wChar = "/;"
             wContinua := .t.
             wx := wx + 1
             Loop
          EndIf
       EndIf

       If wComent
          If wChar = "*/"
             wComent := .f.
             wx := wx + 1
          EndIf
          loop
       Else
          If wChar = "/*"
             wComent := .t.
             wx := wx + 1
             loop
          EndIf
       EndIf

       If wChar <> chr(13)+chr(10) .and. wChar <> ";;"
       
          wLinConteudo := wLinConteudo + Substr(wChar,01,01)
         
       Else
          wLinNum      := wLinNum + 1
          aAdd(wdbg_MProc,{wLinNum,wLinConteudo,space(00),00})
          wLinConteudo := AllTrim(wLinConteudo)
          
          wPos := At("//",wLinConteudo)
          If wPos > 0 
             wLinConteudo := AllTrim(SubStr(wLinConteudo,1,wPos-1) )
          EndIf

          If Substr(wLinConteudo,1,1) = "*" 
             wLinConteudo := space(00)
          EndIf

          If Len(wLinConteudo) = 0
             wx := wx + 1
             Loop
          Endif
          
          If Upper(Substr(wLinConteudo,1,3)) = "IF "
             aAdd(wIf_Open,.t.)
             aAdd(wIf_Else,.f.)
             wIfNum := Len(wIf_Open)
             aAdd(wSMatrix,"{If" + strzero(wIfNum,3,0) + "Ext")      // Externo
             aAdd(wdbg_MLin,wLinNum)
             wLinConteudo := Substr(wLinConteudo,1,3) + strzero(wIfNum,3,0) + Substr(wLinConteudo,4)
          EndIf
          
          If Upper(Substr(wLinConteudo,1,4)) = "ELSE"
             For wy=wIfNum   to 1 step -1
                 If wIf_Open[wy] = .t.
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

          If Upper(Substr(wLinConteudo,1,5)) = "ENDIF"
             For wy=wIfNum to 1 step -1
                 If wIf_Open[wy] = .t.
                    wIfNum       := WY
                    wIf_Open[wy] := .f.
                    Exit
                 Endif
             Next
             If wIf_Else[wIfNum] = .f.
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

          If Upper(Substr(wLinConteudo,1,6)) = "WHILE "
             aAdd(wWhile_Open,.t.)
             wWhileNum := Len(wWhile_Open)
             aAdd(wSMatrix,"{While" + strzero(wWhileNum,3,0) + "Ext")      // Externo
             aAdd(wdbg_MLin,wLinNum)
             wLinConteudo := Substr(wLinConteudo,1,6) + strzero(wIfNum,3,0) + Substr(wLinConteudo,7)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "ENDW"
             wy := 00
             For wy=wWhileNum to 1 step -1
                 If wWhile_Open[wy] = .t.
                    wWhileNum       := WY
                    wWhile_Open[wy] := .f.
                    Exit
                 Endif
             Next
             wLinConteudo := Substr(wLinConteudo,1,5) + strzero(wWhileNum,3,0)
             wWhileNum := Len(wWhile_Open)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "FOR " 
             wLinConteudo := StrTran(wLinConteudo,':=','=')
             aAdd(wFor_Open,.t.)
             wForNum := Len(wFor_Open)
             aAdd(wSMatrix,"{For" + strzero(wForNum,3,0) + "Ext")      // Externo
             aAdd(wdbg_MLin,wLinNum)
             wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0) + Substr(wLinConteudo,5)
             wLinConteudo := iIf(At("STEP",Upper(wLinConteudo))>0,wLinConteudo, wLinConteudo + " Step 01")
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "NEXT" 
             wy := 00
             For wy=wForNum to 1 step -1
                 If wFor_Open[wy] = .t.
                    wForNum       := WY
                    wFor_Open[wy] := .f.
                    Exit
                 Endif
             Next
             wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0)
             wForNum := Len(wFor_Open)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "EXIT" 
             wy:=00
             For wy=wForNum to 1 step -1
                 If wFor_Open[wy] = .t.
                    wForNum       := WY
                    Exit
                 Endif
             Next
             wLinConteudo := Substr(wLinConteudo,1,4) + strzero(wForNum,3,0) 
             wForNum := Len(wFor_Open)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "LOOP" 
             wy:=00
             For wy=wForNum to 1 step -1
                 If wFor_Open[wy] = .t.
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

          If  Upper(Substr(wLinConteudo,1,3)) = "IF " 
             wIfNum := Val(Substr(wLinConteudo,4,3))
             aAdd(wSMatrix,"{Then" + strzero(wIfNum,3,0) + "Abre")      
             aAdd(wdbg_MLin,wLinNum)
          EndIf
          If Upper(Substr(wLinConteudo,1,4)) = "ELSE"
             wIfNum := Val(Substr(wLinConteudo,5,3))
             aAdd(wSMatrix,"{Else" + strzero(wIfNum,3,0) + "Abre")      
             aAdd(wdbg_MLin,wLinNum)
          EndIf
          If Upper(Substr(wLinConteudo,1,5)) = "ENDIF"  
             wIfNum := Val(Substr(wLinConteudo,6,3))
             aAdd(wSMatrix,"}EndIf" + strzero(wIfNum,3,0) + "Ext")      // Externo
             aAdd(wdbg_MLin,wLinNum)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "ENDW" 
             wWhileNum := Val(Substr(wLinConteudo,5,3))
             aAdd(wSMatrix,"}EndW" + strzero(wWhileNum,3,0) + "Ext")       // externo
             aAdd(wdbg_MLin,wLinNum)
          EndIf

          If Upper(Substr(wLinConteudo,1,4)) = "NEXT" 
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

   If upper(wObjeto) = "PRC_CICERO"
      *cFor("wx",1,len(wSMatrix),1,"cLog_sql(wSMatrix[wx])" )  // CICERO NAO EXCLUIR
      cScript(wSMatrix,wMParm,wObjeto)
   else
      cScript(wSMatrix,wMParm,wObjeto)
   EndIf 
   
   
Return wScriptReturn
*Fim da function cCaseScript(wObjeto,wMParm)

function cScript(wMMatrix,wMParm,wSObjeto)
****************************************************************************
*                                                                          *
****************************************************************************
Local wx,wy,wPos , wFor:=.f. , wBlcNum:=00 , wMatrixResult, wMatrixLinha, wWork
            
   aAdd(wBlc,Space(00))     // Bloco 01 reservado para o PARAMETERS
   aAdd(wBlx,00       )     // Bloco 01 reservado para o PARAMETERS
   aAdd(wBlc_Open,.f.)      // Bloco 01 reservado para o PARAMETERS

   aAdd(wBlc,Space(00))     // Bloco 02 reservado para o PRIVATE
   aAdd(wBlx,00       )     // Bloco 02 reservado para o PRIVATE
   aAdd(wBlc_Open,.f.)      // Bloco 02 reservado para o PRIVATE

   aAdd(wBlc,Space(00))
   aAdd(wBlx,0)
   aAdd(wBlc_Open,.t.)
   wBlcNum := Len(wBlc)
   
   For wx=1 to len(wMMatrix)
       wMatrixResult := wMMatrix[wx]
       wMatrixLinha  := wx
       If Upper(Substr(wMMatrix[wx],1,11)) = "PARAMETERS "
          wBlc[01]   := wBlc[01] + iif(cEmpty(wBlc[01]),Space(00),",") + AllTrim(Substr(wMMatrix[wx],11))     // Bloco 01 é fixo para o PARAMETERS
          wMatrixResult := Space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,8)) = "PRIVATE "
          wBlc[02]   := wBlc[02] + iif(cEmpty(wBlc[02]),Space(00),",") + AllTrim(Substr(wMMatrix[wx],8))      // Bloco 02 é fixo para o PRIVATE
          wMatrixResult := Space(00)
       ElseIf At(":=",wMMatrix[wx]) > 0 
          wPos          := At(":=",wMMatrix[wx])
          wMatrixResult := "cVar_Atrib('" + AllTrim(SubStr(wMMatrix[wx],1,wPos-1)) + "'," + SubStr(wMMatrix[wx],wPos+2)+" )"
       ElseIf Upper(Substr(wMMatrix[wx],1,1)) == "?"
          wMMatrix[wx]   := "WQout({" + Alltrim(Substr(wMMatrix[wx],2)) + "})"
          wMatrixResult := wMMatrix[wx]
       ElseIf Upper(Substr(wMMatrix[wx],1,3)) = "IF "
          If .not. cEmpty(wBlc[wBlcNum])
             wBlc[wBlcNum] := wBlc[wBlcNum] + ","
          EndIf
          If wcDebug
             wBlc[wBlcNum] := wBlc[wBlcNum] + "fdbg_Goto(022," + strzero(wBlcNum+1,3) + ")"
          Else
             wBlc[wBlcNum] := wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + strzero(wBlcNum+1,3) + "]))"
          EndIf
          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)

          wMMatrix[wx]   := "cIf(" + Substr(wMMatrix[wx],4) + ","
          If wcDebug
             wMatrixResult   :=  wMMatrix[wx] + "'fdbg_Goto(04," + strzero( wBlcNum+1 ,3) + ")')"
          Else
             wMatrixResult    := wMMatrix[wx] + "(wBlc[" + strzero( wBlcNum+1 ,3) + "]))"   
          EndIf

          wBlc[wBlcNum] := wMatrixResult
          wBlx[wBlcNum] := wx
          wMatrixResult := Space(00)

          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)

       ElseIf Upper(Substr(wMMatrix[wx],1,4)) = "FOR "
          If .not. cEmpty(wBlc[wBlcNum])
             wBlc[wBlcNum] := wBlc[wBlcNum] + ","
          EndIf
          If wcDebug
             wBlc[wBlcNum] := wBlc[wBlcNum] + "fdbg_Goto(023," + strzero(wBlcNum+1,3) + ")"
          Else
             wBlc[wBlcNum] := wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + strzero(wBlcNum+1,3) + "]))"
          EndIf
          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)
       
          wMMatrix[wx] := 'cFor("' + Substr(wMMatrix[wx],5) + ","
          wMMatrix[wx] := StrTran(wMMatrix[wx],'=','",')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'to',',')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'To',',')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'TO',',')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'step',',')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'Step',',')
          wMMatrix[wx] := StrTran(wMMatrix[wx],'STEP',',')
          wMMatrix[wx] := wMMatrix[wx] +  "'" + Substr(wMMatrix[wx],7,3) + "'," 
                                                                                                                                       
          If wcDebug 
             wMatrixResult := wMMatrix[wx] + "'fdbg_Goto(03," + strzero( Len(wBlc)+1,3) + ")'" 
          Else
             wMatrixResult := wMMatrix[wx] + "(wBlc[" + strzero( Len(wBlc)+1  ,3) + '])' 
          EndIf 
                                                                                                                                    
          wBlc[wBlcNum] := wMatrixResult                                                                         
          wBlx[wBlcNum] := wx 
          If wcDebug
             //wBlc[wBlcNum] := wBlc[wBlcNum] + ",fdbg_Goto(019," + strzero(wBlcNum+1 ,3) + ") "
          Else
             //wBlc[wBlcNum] := wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + strzero(wBlcNum+1 ,3) + "]))"
          EndIf

          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)

          wMatrixResult := Space(00)

       ElseIf Upper(Substr(wMMatrix[wx],1,4)) == "ELSE"
          wMatrixResult := space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,5)) == "ENDIF"
          wMatrixResult := space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,4)) == "NEXT"
          wMatrixResult := space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,4)) == "ENDW"
          wMatrixResult := space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,6)) = "WHILE "
          wMMatrix[wx]   := "cWhile(" + Substr(wMMatrix[wx],7) + ","
          wMatrixResult := wMMatrix[wx]
       ElseIf Upper(Substr(wMMatrix[wx],1,4)) == "ENDW"
          wMatrixResult := space(00)
       ElseIf Upper(Substr(wMMatrix[wx],1,6)) == "RETURN"
          wMMatrix[wx]   := "cScriptReturn(" + Alltrim(Substr(wMMatrix[wx],7)) + ")#RETURN#"
          wMatrixResult := wMMatrix[wx]
       ElseIf Upper(Substr(wMMatrix[wx],1,4)) = "EXIT"
          If .not. cEmpty(wBlc[wBlcNum])
             If wcDebug
                wBlc[wBlcNum] := wBlc[wBlcNum] + ",fdbg_Goto(01," + strzero(wBlcNum+1 ,3) + ") "
             Else
                wBlc[wBlcNum] := wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + strzero(wBlcNum+1 ,3) + "]))"
             EndIf
             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)
          EndIf

          wMatrixResult := 'cScriptForExit("' + Substr(wMMatrix[wx],5,3) + '")'
          wBlc[wBlcNum] := wMatrixResult
          wBlx[wBlcNum] := wx
          wMatrixResult := Space(00)

          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)

       ElseIf Upper(Substr(wMMatrix[wx],1,4)) = "LOOP"
          If .not. cEmpty(wBlc[wBlcNum])
             If wcDebug
                wBlc[wBlcNum] := wBlc[wBlcNum] + ",fdbg_Goto(02," + strzero(wBlcNum+1 ,3) + ") "
             Else
                wBlc[wBlcNum] := wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + strzero(wBlcNum+1 ,3) + "]))"
             EndIf

             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)
          EndIf

          wMatrixResult := 'cScriptForLoop("' + Substr(wMMatrix[wx],5,3) + '")'
          wBlc[wBlcNum] := wMatrixResult
          wBlx[wBlcNum] := wx
          wMatrixResult := Space(00)

          aAdd(wBlc,Space(00))
          aAdd(wBlx,00       )
          aAdd(wBlc_Open,.t.)
          wBlcNum := Len(wBlc)

       ElseIf wMMatrix[wx] = "{"

          wMatrixResult   := Space(00)

       ElseIf wMMatrix[wx] = "}"
          wMatrixResult   := Space(00)
          
          For wy= wBlcNum-1 to 1 step -1
              If wBlc_Open[wy] = .t.
                 wBlcNum          := WY
                 wBlc_Open[wy] := .f.
                 Exit
              Endif
          Next
          
          If Substr(wMMatrix[wx],1,5) == "}Then"  //.and. Substr(wMMatrix[wx],9,3) == "Fec" // }Then001Fecha

             wIfNum := Substr(wMMatrix[wx],6,3)
             wBlcNum := 0
             For wy=1 to len(wBlc)
                 If wBlc[wy] = "cIf("+ wIfNum 
                    wBlcNum := WY
                    Exit
                 Endif
             Next

             If Substr(wMMatrix[wx-1],1,8) == "{Then" + wIfNum // {Then001Abre
                *Se nao tem THEN redireciona para o EndIf
                *wMMatrix[wx]   := "cIf(" + Substr(wMMatrix[wx],4) + ","
                If wcDebug
                   wBlc[wBlcNum] :=  wMMatrix[wBlx[wBlcNum]] + "'fdbg_Goto(044,GotoEndIf)')"
                Else
                   wBlc[wBlcNum] := wMMatrix[wBlx[wBlcNum]] + "(wBlc[GotoEndIf]))"   
                EndIf
             EndIf
             
             If wcDebug
                wWork  :=  "ELSE"+wIfNum + ",'fdbg_Goto(07," + strzero( Len(wBlc)+1  ,3) + ")') " 
             Else
               wWork   :=  "ELSE"+wIfNum + ",(wBlc[" + strzero( Len(wBlc)+1  ,3) + "])) " 
             EndIf
             
             wBlc[wBlcNum]      := SubStr(wBlc[wBlcNum],1,Len(Trim(wBlc[wBlcNum]))-1) + wWork

             wBlc[len(wBlc)] := "BTHEN"+wIfNum + wBlc[len(wBlc)]
             
             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)

             wBlx[Len(wBlc)] := wx+1
   
             wMatrixResult := Space(00)
          
          ElseIf Substr(wMMatrix[wx],1,6) == "}EndIf"  //.and. Substr(wMMatrix[wx],10,3) == "Ext" // }EndIf001Ext

             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)

             wBlx[wBlcNum] := wx-1
             
                                                                                                   
             wIfNum := Substr(wMMatrix[wx],7,3)
             *-----direciona o bloco cIf------------*
             wBlcNum := 0
             wy := 00
             For wy=1 to len(wBlc)
                 If wBlc[wy] = "cIf("+ wIfNum 
                    wBlcNum := WY
                    Exit
                 Endif
             Next
             If wBlcNum > 0
                If At("GotoEndIf",wBlc[wBlcNum]) > 0
                   wBlc[wBlcNum] := StrTran(wBlc[wBlcNum],"GotoEndIf",StrZero(Len(wBlc),3,0))
                EndIf
             EndIf
             *--------------------------------------*

             *-----direciona o bloco THEN-----------*
             wBlcNum := 0
             wy := 00
             For wy=1 to Len(wBlc)
                 If wBlc[wy] = "BTHEN"+wIfNum 
                    wBlcNum := WY
                    Exit
                 Endif
             Next   

             If wBlcNum > 0
                If wcDebug
                   wWork := "fdbg_Goto(09," + strzero( Len(wBlc)    ,3) + ")"
                Else
                   wWork := "eVal(fcBlock(wBlc[" + strzero( Len(wBlc)    ,3) + "]))"
                EndIf
                If Len(Trim(wBlc[wBlcNum])) <> Len(Trim("BTHEN"+wIfNum))
                   wBlc[wBlcNum] := wBlc[wBlcNum] + ","
                EndIf
                wBlc[wBlcNum] := wBlc[wBlcNum] + wWork
             EndIf
             *--------------------------------------*
             *-----direciona o bloco ELSE------------*
             wBlcNum       := Len(wBlc) -1  // O bloco anterior e´o ELSE
             If wcDebug
                wWork := "fdbg_Goto(010," + strzero(  Len(wBlc)  ,3) + ")"
             Else
                wWork := "eVal(fcBlock(wBlc[" + strzero(  Len(wBlc)  ,3) + "]))"
             EndIf
             
             If .not. cEmpty(wBlc[wBlcNum])
                wBlc[wBlcNum] := wBlc[wBlcNum] + ","
             EndIf
             wBlc[wBlcNum] := wBlc[wBlcNum] + wWork  
             *--------------------------------------*

          ElseIf Upper(Substr(wMMatrix[wx],1,5)) == "}EndW"  //.and. Substr(wMMatrix[wx],9,3) == "Ext" // }EndW001Ext

          ElseIf Substr(wMMatrix[wx],1,5) == "}Next"  //.and. Substr(wMMatrix[wx],9,3) == "Ext" // }Next001Ext

             wBlcNum := Len(wBlc) 
             If wcDebug
                wWork := "fdbg_Goto(026," + strzero( wBlcNum +1,3) + ")"

                If .not. cEmpty(wBlc[wBlcNum])
                   wBlc[wBlcNum] := wBlc[wBlcNum] + ","
                EndIf
                wBlc[wBlcNum] := wBlc[wBlcNum] + wWork  

             Else
                *wWork := "eVal(fcBlock(wBlc[" + strzero(wBlcNum +1,3) + "]))"
                *If .not. cEmpty(wBlc[wBlcNum])
                *   wBlc[wBlcNum] := wBlc[wBlcNum] + ","
                *EndIf
                *wBlc[wBlcNum] := wBlc[wBlcNum] + wWork  



             EndIf
             *If .not. cEmpty(wBlc[wBlcNum])
             *   wBlc[wBlcNum] := wBlc[wBlcNum] + ","
             *EndIf
             *wBlc[wBlcNum] := wBlc[wBlcNum] + wWork  
             
             

             *-----direciona o bloco cFor-----------*                                               
             wForNum := Substr(wMMatrix[wx],6,3)
             wBlcNum := 0
             wy      := 00
             For wy=1 to len(wBlc)
                 If wBlc[wy] = 'cFor("' + wForNum 
                    wBlcNum := WY
                    Exit
                 Endif
             Next
             If wBlcNum > 0
             
                *--------------------------------------*
                aAdd(wBlc,Space(00))
                aAdd(wBlx,00       )
                aAdd(wBlc_Open,.t.)

                *wBlx[wBlcNum] := wx-1
                *wBlx[Len(wBlc) - 1] := wx
                *wBlx[wBlcNum] := wx-1

                wBlx[Len(wBlc) ] := wx -1

                If wcDebug
                   wBlc[Len(wBlc)] := "fdbg_Goto(014," + strzero( wBlcNum ,3) + ")"
                Else
                   wBlc[Len(wBlc)] := "eVal(fcBlock(wBlc[" + strzero( wBlcNum ,3) + "]))"
                EndIf

                *If .not. cEmpty(wBlc[wBlcNum])
                *   wBlc[wBlcNum] := wBlc[wBlcNum] + ","
                *EndIf
                *wBlc[wBlcNum] := wBlc[wBlcNum] + wMatrixResult  
                *--------------------------------------*
             
                //If Substr(wMMatrix[wx-2],1,7) == "{For" + wForNum // {For001Ext
                //   If wcDebug
                //      wBlc[wBlcNum] := wMMatrix[wBlx[wBlcNum]] + "'fdbg_Goto(024," + strzero(Len(wBlc)+0,3) + ")'"
                //   Else
                //      wBlc[wBlcNum] := wMMatrix[wBlx[wBlcNum]] + "wBlc["           + strzero(Len(wBlc)-1,3) + "]"
                //   EndIf
                //EndIf

                If wcDebug
                   wBlc[wBlcNum] := wBlc[wBlcNum] + ",'fdbg_Goto(025," + strzero( Len(wBlc)+1 ,3) + ")')"
                Else
                   wBlc[wBlcNum] := wBlc[wBlcNum] + ",(wBlc[" + strzero( Len(wBlc)+1,3) + "]))"
                EndIf

             EndIf
             *--------------------------------------*
             *-----------------------------------------*

             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)
             
             wMatrixResult := space(00)

             *-----direciona o bloco ForExit-----------*
             **wForNum := Substr(wMMatrix[wx],6,3)
             wy      := 00
             For wy=1 to len(wBlc)
                 If wBlc[wy] = 'cScriptForExit("' + wForNum 
                    If wcDebug
                       wBlc[wy] := wBlc[wy] + ",fdbg_Goto(015," + strzero( Len(wBlc)-1 ,3) + ")"
                    Else
                       **wBlc[wy] := wBlc[wy] + ", eVal(fcBlock(wBlc[" + strzero( Len(wBlc) ,3) + "]))"
                    EndIf
                 
                 EndIf
             Next
             *-----------------------------------------*
             *-----direciona o bloco ForLoop-----------*
            **wForNum := Substr(wMMatrix[wx-3],5,3)
            ** wForNum := Substr(wMMatrix[wx],6,3)
             wy      := 00
             For wy=1 to len(wBlc)
                 If wBlc[wy] = 'cScriptForLoop("' + wForNum 
                    If wcDebug
                       wBlc[wy] := wBlc[wy] + ",fdbg_Goto(016," + strzero( Len(wBlc)-1 ,3) + ")"
                    Else
                       **wBlc[wy] := wBlc[wy] + ", eVal(fcBlock(wBlc[" + strzero( Len(wBlc) ,3) + "]))"
                    EndIf
                 
                 EndIf
             Next
             *--------------------------------------*

          EndIf
       
          wBlcNum       := Len(wBlc)
          wMatrixResult := Space(00)
       
       Else
       *****
       EndIf       

       If wBlcNum>2 .and. len(trim(wBlc[wBlcNum])) > 0
         wBlc[wBlcNum] := wBlc[wBlcNum] + ",fdbg_Lin("+alltrim(str(wx-1)) + ")"
         //wdbg_Trace[wPosTrace,05] := wLinNum
       EndIf

       If wcdebug
          If .not. cEmpty(wMatrixResult)  //.and. ( (Len(wMatrixResult) + Len(wBlc[wBlcNum]) > 512 .or. wcDebug ))  // o Limite de expanção é de 704 bytes por bloco
             If .not. cEmpty(wBlc[wBlcNum])
                wBlc[wBlcNum] := wBlc[wBlcNum] + ","
             EndIf
             If wcDebug
                wBlc[wBlcNum] := wBlc[wBlcNum] + "fdbg_Goto(017," + strzero(wBlcNum+1,3) + ")"
             Else
                wBlc[wBlcNum] := wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + strzero(wBlcNum+1,3) + "]))"
             EndIf
          
             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)
          EndIf
       Else
          **If .not. cEmpty(wMatrixResult)  //.and. ( (Len(wMatrixResult) + Len(wBlc[wBlcNum]) > 512 .or. wcDebug ))  // o Limite de expanção é de 704 bytes por bloco
          If .not. cEmpty(wMatrixResult)  .and. (Len(wMatrixResult) + Len(wBlc[wBlcNum]) > 512 )  // o Limite de expanção é de 704 bytes por bloco
             If .not. cEmpty(wBlc[wBlcNum])
                wBlc[wBlcNum] := wBlc[wBlcNum] + ","
             EndIf
             If wcDebug
                wBlc[wBlcNum] := wBlc[wBlcNum] + "fdbg_Goto(017," + strzero(wBlcNum+1,3) + ")"
             Else
                wBlc[wBlcNum] := wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + strzero(wBlcNum+1,3) + "]))"
             EndIf
          
             aAdd(wBlc,Space(00))
             aAdd(wBlx,00       )
             aAdd(wBlc_Open,.t.)
             wBlcNum := Len(wBlc)
          EndIf
       Endif

       If .not. cEmpty(wMatrixResult)
          If .not. cEmpty(wBlc[wBlcNum])
             wBlc[wBlcNum] := wBlc[wBlcNum] + ","
          EndIf
          wBlc[wBlcNum] := wBlc[wBlcNum] + wMatrixResult
          wBlx[wBlcNum] := wMatrixLinha
       EndIf
   Next
       
   aAdd(wBlc,Space(00))     // #RETURN# 
   aAdd(wBlx,00       )     // #RETURN# 
          
          
   wy := 00
   For wy=1 to Len(wBlc)
      
       If wBlc[wy] = "cIf("
          wBlc[wy] = "cIf(" + Substr(wBlc[wy],8)

          wPos := At("ELSE",wBlc[wy])
          If wPos > 0
             wBlc[wy] = Substr(wBlc[wy],1,wPos-1) + Substr(wBlc[wy],wPos+07)
          EndIf

          wPos := At("ELSE",wBlc[wy])
          If wPos > 0
             wBlc[wy] = Substr(wBlc[wy],1,wPos-1) + Substr(wBlc[wy],wPos+07)
          EndIf

       Endif
       If wBlc[wy] = "BTHEN"
          wBlc[wy] = Substr(wBlc[wy],09)
       EndIf
       If wBlc[wy] = "cFor("
          wBlc[wy] = 'cFor("' + Substr(wBlc[wy],10)
       Endif

       If wBlc[wy] = "cWhile("
          wBlc[wy] = "cWhile(" + Substr(wBlc[wy],11)
       Endif

       wPos := At("#RETURN#",wBlc[wy])
       If wPos > 0 
          If wcDebug
             wBlc[wy] := Substr(wBlc[wy],1,wPos-1) + ",fdbg_Goto(018," + strzero( Len(wBlc),3) + ")"
          Else
             wBlc[wy] := Substr(wBlc[wy],1,wPos-1) + ",eVal(fcBlock(wBlc[" + strzero( Len(wBlc),3) + "]))"
          EndIf
       EndIf
   Next

   If wcDebug

      for wx=1 to len(wBlx) 
          if wblx[wx] > 0 

             wdbg_MProc[ wdbg_MLin[wblx[wx]] ,3] := wblc[wx]
             wdbg_MProc[ wdbg_MLin[wblx[wx]] ,4] := wx 
          EndIf
      Next    
   
   EndIf

//  If upper(wObj_Nome) = "PRC_CICERO2"
////      cFor("wx" , 1 , len(wblc)     ,1,"clog_sql(strzero(wx,2)+wBlc[wx])" )   // CICERO NAO EXCLUIR
//      for wx=1 to len(wblc) 
//          clog_sql(strzero(wx,2)+wBlc[wx])
//      next
//  ENDIF
   
   If .not. wcdebug
      aAdd( wM_Objeto[wPosObj], wBlc )     // Armazena o script já compilado no 6 item da matrix wM_Objeto
   EndIf

   wdbg_Trace[wPosTrace,03] := wBlc[01]   // Paramameters
   wdbg_Trace[wPosTrace,04] := wBlc[02]   // Privates

	cScriptAux(wBlc[03],wMParm,wSObjeto)

return nil
*Fim da function cScript(wMMatrix,wMParm,wSObjeto)

function cScriptAux(_wcBlock,_wM_Parm,_wPrcNome)
****************************************************************************
*                                                                          *
****************************************************************************
Local _wx , _wWork01 //, _wM_Private 

                                                
   If .Not.cEmpty(wBlc[01])     // Bloco exclusivo para o PARAMETERS
      _wM_Private :=  cStrToMatriz(wBlc[01],",","C")      
      If len(_wM_Private) <> len(_wM_Parm)
         cCancel("Quantidade de parametros inválidos na procedure (" + _wPrcNome + ")" )
      Endif   
      For _wx:=1 to len(_wM_Private)
          _wWork01          := AllTrim(_wM_Private[_wx])
          private &_wWork01 := _wM_Parm[_wx]
      Next
   EndIf

   If .Not.cEmpty(wBlc[02])     // Bloco exclusivo para o PRIVATE
      _wM_Private:= cStrToMatriz(wBlc[02],",","C")   
      For _wx:=1 to len(_wM_Private)
          _wWork01 := AllTrim(_wM_Private[_wx])
          Private &_wWork01
      Next
   EndIf

   if wcDebug
      wdbg_MVar  := {}
      If .Not.cEmpty(wBlc[02])     
         _wM_Private:= cStrToMatriz(wBlc[02],",","C")   
         For _wx:=1 to len(_wM_Private)
             _wWork01 := AllTrim(_wM_Private[_wx])
             Private &_wWork01
             aAdd( wdbg_MVar , {_wWork01,"U",""})
         Next
      EndIf
   
      fobj_LoadAll("frm_prc_Debug") 
      Return nil
   Endif
                           
   _wcBlock := fcBlock(_wcBlock)
   eVal(_wcBlock)

   __MVRELEASE()

Return nil
*Fim da function cScriptAux()

function cScriptReturn(_wReturn)
****************************************************************************
*                                                                          *
****************************************************************************
Local _wWork01,_wx,_wxx
   wScriptReturn  := _wReturn
   
   For _wx=1 to 999
       _wxx := strzero(_wx,3,0)
       _wWork01  := "wExit" +  _wxx
       If Type(_wWork01) = "U"
          Exit
       Else
          &_wWork01 := .t.
       EndIf
   Next

   For _wWork01:=01 to len(wM_For_Exit)
       wM_For_Exit[_wWork01] := .t.
   Next

Return nil
*Fim da function cScriptReturn()

function cScriptForExit(_wForNum)
****************************************************************************
*                                                                          *
****************************************************************************
Local _wWork01
_wWork01  := "wExit" + _wForNum
&_wWork01 := .t.  

wM_For_Exit[Val(_wForNum)] := .t.
Return nil
*Fim da function cScriptForExit(_wForNum)

function cScriptForLoop(_wForNum)
****************************************************************************
*                                                                          *
****************************************************************************
Return nil
*Fim da function cScriptForLoop(_wForNum)






function fdbg_Btn_Execute(wOpcao) 
*******************************************************************************
*                                                                             *
*******************************************************************************
local wreturn,wLinhaAtual, wx, wGrid, _wWork01, _wWork02
local www_cBlock,WTime1,WTime2,wTimeTotal  
Local wLinha,wXLinha,wYLinha

   wGrid := wQGGRid + 1
   wLinhaAtual := 0 
   wLinha      := Val(wM_Grid[wQGGRid+1,wM_BrwLin[wQGGRid+1],cNC("Seq",wQGGRid+1)])
   wTimeTotal  := 0

   If wOpcao = 1

   ElseIf wOpcao = 2
      If wLinha > 0 
         If  wLinha = wdbg_LinhaAtual
            If wdbg_MProc[wLinha,4] > 0
               wLinhaAtual := wdbg_MProc[wLinha,4]
               www_cBlock := wblc[ wdbg_MProc[wLinha,4]  ]
               www_cBlock := fcBlock(www_cBlock)    
               WTime1 := time()
               eVal(www_cBlock)
               WTime2 := time()
               wTimeTotal := ( (Val(substr(WTime2,1,2)) * 3600) + (Val(substr(WTime2,4,2)) * 60) + (Val(substr(WTime2,7,2)))   )  -  ( (Val(substr(WTime1,1,2)) * 3600) + (Val(substr(WTime1,4,2)) * 60) + (Val(substr(WTime1,7,2)))   )
               wTimeTotalGeral := wTimeTotalGeral + wTimeTotal
            EndIf
         ElseIf  wLinha < wdbg_LinhaAtual
            wLinhaAtual := 0
         ElseIf  wLinha > wdbg_LinhaAtual
            wLinhaAtual := 99999
         EndIf
      EndIf

      If wdbg_LinhaGoto < wLinhaAtual 
         For wx:=wLinha-1 to 01 step -1
             oM_brw[wGrid]:GoUp()
             If  wdbg_MProc[wx,4] = wdbg_LinhaGoto .or. wdbg_LinhaGoto = 0
               exit
             EndIf
         Next
      ElseIf wdbg_LinhaGoto > wLinhaAtual 
      *ElseIf wdbg_LinhaGoto > wLinha
         For wx:=wLinha+1 to Len(wdbg_MProc)
             oM_brw[wGrid]:GoDown()
             If wdbg_MProc[wx,4] >= wdbg_LinhaGoto .or. wdbg_LinhaGoto = 0 
                exit
             EndIf
         Next
      Else
         oM_brw[wGrid]:GoDown()
      EndIf
      wdbg_LinhaAtual := Val(wM_Grid[wQGGRid+1,wM_BrwLin[wQGGRid+1],cNC("Seq",wQGGRid+1)])

      cvf("dbg_Tempo",,wTimeTotal) 
   ElseIf wOpcao = 3
      wTimeTotalGeral := 0
      wXLinha := Val(wM_Grid[wQGGRid+1,wM_BrwLin[wQGGRid+1],cNC("Seq",wQGGRid+1)])
      wYLinha := 0
      Do while wXLinha > wYLinha
         fdbg_Btn_Execute(2) 
         wYLinha := Val(wM_Grid[wQGGRid+1,wM_BrwLin[wQGGRid+1],cNC("Seq",wQGGRid+1)])
      EndDo 
      cvf("dbg_Tempo",,wTimeTotalGeral) 
   ElseIf wOpcao = 4
      wLinha  := Val(wM_Grid[wQGGRid+1,wM_BrwLin[wQGGRid+1],cNC("Seq",wQGGRid+1)])
      For wx:=wLinha to Len(wdbg_MProc)
          If wdbg_MProc[wx,4] > 0
             wdbg_LinhaAtual := wx
             wdbg_LinhaGoto  := wdbg_MProc[wx,4]
             exit
          EndIf
      Next
   ElseIf wOpcao = 5
      _wWork01 :=  Alltrim(cv("Comando",wQGGRid+1))
      _wWork02 :=  Space(00)
      If At(chr(13)+chr(10),_wWork01) > 0
         _wWork01 := Trim(Substr(_wWork01,01,At(chr(13)+chr(10),_wWork01)-1))
      EndIf
      If At(":=",_wWork01) > 0 
         _wWork02 := At(":=",_wWork01)
         _wWork01 := "cVar_Atrib('" + AllTrim(SubStr(_wWork01,1,_wWork02-1)) + "'," + SubStr(_wWork01,_wWork02+2)+" )"
         &_wWork01 
      ElseIf Upper(Substr(_wWork01,1,2)) == "??"
         _wWork01   := "WQout({" + Alltrim(Substr(_wWork01,3)) + "})"
         &_wWork01 
      ElseIf Upper(Substr(_wWork01,1,1)) == "?"
         _wWork01   :=  Alltrim(Substr(_wWork01,2)) 
         If _wWork01 = "'" .or. _wWork01 = '"'
            _wWork02 := _wWork01
         Else   
        
            If Type(_wWork01) = "U"
               _wWork02 := "variavel não definida...."
            ElseIf Type(_wWork01) = "C"
               _wWork02 := &_wWork01
            ElseIf Type(_wWork01) = "N"
               _wWork02 := str(&_wWork01)
            ElseIf Type(_wWork01) = "D"
               _wWork02 := dtoc(&_wWork01)
            ElseIf Type(_wWork01) = "A"
               _wWork02 := "{ ... }       (" + alltrim(str(Len(&_wWork01))) + ")"
            ElseIf Type(_wWork01) = "L"
               _wWork02 := iif(&_wWork01 , ".T.",".F.")
            ElseIf Type(_wWork01) = "O"
               _wWork02 := "Objects.."
            Else   
               _wWork02 := "..."
            EndIf   
         EndIf   

         cvf("Comando",wQGGRid+1, "? " + _wWork01 +chr(13)+chr(10)+ _wWork02) 

      Else
         &_wWork01 
      EndIf
      
   ElseIf wOpcao = 6
        _wWork01 :=  cv("variavel",wQGGRid+2)
        _wWork02 :=  cv("Valor",wQGGRid+2) 
        &_wWork01 :=  _wWork02
//      fdbg_Var_Matriz_Atrib()   
   *********
   EndIf

   If wOpcao = 2 .or. wOpcao = 5
      _wWork01 := Space(00)
      _wWork02 := Space(00)
      For wx:=1 to Len(_wM_Private)
          _wWork02 := _wM_Private[wx]
          _wWork02 := &_wWork02
          
          If ValType(_wWork02) = "U"
             _wWork02 := "nil"
          ElseIf ValType(_wWork02) = "C"
          ElseIf ValType(_wWork02) = "N"
             _wWork02 := str(_wWork02)
          ElseIf ValType(_wWork02) = "D"
             _wWork02 := dtoc(_wWork02)
          ElseIf ValType(_wWork02) = "A"
             _wWork02 := "{ ... }       (" + alltrim(str(Len(_wWork02))) + ")"
          ElseIf ValType(_wWork02) = "L"
             _wWork02 := iif(_wWork02 , ".T.",".F.")
          ElseIf ValType(_wWork02) = "O"
             _wWork02 := "Objects.."
          Else   
             _wWork02 := "..."
          EndIf   
          _wWork02 := _wM_Private[wx] + " = " + _wWork02

          _wWork01 := _wWork01 + _wWork02 +chr(13)+chr(10)
          if wx = 3
          *   exit
          endif
       Next
       
      cvf("dbg_VarLst",,_wWork01) 

   EndIf
   
return .t.
*fim da function fdbg_Btn_Execute(wOpcao) 

function fdbg_Goto(_wRef,_wLinha)
****************************************************************************
*                                                                          *
****************************************************************************
   wdbg_LinhaGoto := _wLinha
return .t.
*fim da function fdbg_Goto(_wRef,_wLinha)

function fdbg_Atrib(wOpcao)
****************************************************************************
*                                                                          *
****************************************************************************
Local wWork
Local wGrid,wx,wLen,wMDados

   wMDados := {}   

   If wOpcao = 1
      wLen  := Len(wdbg_MProc)

      wGrid := wQGGRid + 1
      For wx = 01 to wLen
         aAdd(wMDados, {strzero(wdbg_MProc[wx,1],4,0),wdbg_MProc[wx,2]} )
      Next
   EndIf

   If wOpcao = 2
      For wx=1 to len(wdbg_MVar)
          wWork := wdbg_MVar[wx,1]
          wdbg_MVar[wx,3] := &wWork
          wdbg_MVar[wx,2] := valType(wdbg_MVar[wx,3])
          If ValType(wdbg_MVar[wx,3]) = "A"
             wdbg_MVar[wx,3] := "{ ... }       (" + alltrim(str(Len(wdbg_MVar[wx,3]))) + ")"
          EndIf
      Next

      wLen  := Len(wdbg_MVar)
      wGrid := wQGGRid + 2
      
      For wx = 01 to wLen
         aAdd(wMDados, {wdbg_MVar[wx,1],wdbg_MVar[wx,2],wdbg_MVar[wx,3]} )
      Next
   EndIf
             
   If Len(wMDados)>0
       wM_Grid[wGrid] := wMDados 
   Else
      aSize( wM_Grid[wGrid], 0 )
      wM_Grid[wGrid] := {}
      If wOpcao = 1
         aAdd( wM_Grid[wGrid] , {0,Space(0)})
      EndIf
      If wOpcao = 2
         aAdd( wM_Grid[wGrid] , {Space(0),Space(0),Space(0)})
      EndIf
   EndIf

   oM_Brw[wGrid]:GoTop()
   fCaseAtrib(wGrid)
   fCaseRefresh(wGrid)

   oM_Brw[wGrid]:Click()
   oM_Brw[wGrid]:Refresh()
   oM_Brw[wGrid]:SetFocus()

Return .T.
*fim da function fdbg_Atrib(wOpcao)

function fdbg_Var_Matriz(wOpcao)
****************************************************************************
*                                                                          *
****************************************************************************
Local _wVarNome

   _wVarNome :=  cv("variavel",wQGGRid+2)
   
   _wVarNome := &_wVarNome
   If ValType(_wVarNome) <> "A"
      Return .f.
   EndIf

   fobj_LoadAll("frm_prc_Debug_Variavel")

return .t.
* fim da function fdbg_Var_Matriz()


function fdbg_Var_Matriz_Atrib()
****************************************************************************
*                                                                          *
****************************************************************************
Local wWork
Local wGrid,wx,wy,wMDados, _wVarNome
Local wLen,wLenLin,wLenCol,wLenGrid

   wGrid := wQGGRid + 4

   _wVarNome := cv("variavel",wQGGRid+2)
   _wVarNome := &_wVarNome

   wMDados := {}   

   wLenLin := len(_wVarNome)
   If wLenLin = 0
      Return .f.
   EndIf

   wLenGrid := Len(wM_Case[wGrid,wCS_Coluna]) 
   wLenCol  := len(_wVarNome[01])
*  wLenCol  := iif(wLenCol>wLenGrid,wLenGrid,wLenCol)
   wLenCol  := iif(wLenCol>16,16,wLenCol)

   If ValType(_wVarNome[01]) = "A"
      For wx = 01 to wLenLin

          aAdd(wMDados,{})
          For wy = 01 to  wLenGrid+1
              aAdd(wMDados[wx], "") 
          Next

          wMDados[wx,01] := strzero(wx,4,0)                       
          For wy = 01 to wLenCol
              wMDados[wx,wy+1] := _wVarNome[wx,wy]
          Next
      Next
   Else                     
   
      For wx = 01 to wLenLin
          aAdd(wMDados, {"","","","","","","","","","",""      ,""}) 
          wMDados[wx,01] := strzero(wx,4,0)                       
          wMDados[wx,02] := _wVarNome[wx]
      Next
   EndIf          
   If Len(wMDados)>0
       wM_Grid[wGrid] := wMDados 
   Else
      aSize( wM_Grid[wGrid], 0 )
      wM_Grid[wGrid] := {}
      aAdd( wM_Grid[wGrid] , {"",Space(0)})
   EndIf

   oM_Brw[wGrid]:GoTop()
   fCaseAtrib(wGrid)
   fCaseRefresh(wGrid)

   oM_Brw[wGrid]:Click()
   oM_Brw[wGrid]:Refresh()
   oM_Brw[wGrid]:SetFocus()

Return .T.
*fim da function fdbg_Var_Matriz_Atrib(wOpcao)

Function fdbg_Lin(wLin)
   wdbg_Trace[wPosTrace,02] := wLin
Return nil



function fcBlockExec(wBEcBlock)
*******************************************************************************
* Expande uma variavel tipo "Code Block"  (macro &)                           *
*******************************************************************************
   wBEcBlock := fcBlock(wBEcBlock)
   wBEcBlock := eVal(wBEcBlock)
Return wBEcBlock
*fim da function fcBlockExec(wBEcBlock)

