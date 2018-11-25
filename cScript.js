clipper = require('./clipper');

const cScript = (wMMatrix,wMParm,wSObjeto) => {

    let wx,wy,wPos,wMatrixResult,wMatrixLinha,wWork;
    let wFor = false;
    let wBlcNum = 0;

    clipper.aAdd(wBlc,"");              // Bloco 01 reservado para o PARAMETERS
    clipper.aAdd(wBlx,0);               // Bloco 01 reservado para o PARAMETERS
    clipper.aAdd(wBlc_Open,false);      // Bloco 01 reservado para o PARAMETERS

    clipper.aAdd(wBlc,"");              // Bloco 02 reservado para o PRIVATE
    clipper.aAdd(wBlx,0);               // Bloco 02 reservado para o PRIVATE
    clipper.aAdd(wBlc_Open,false);      // Bloco 02 reservado para o PRIVATE

    clipper.aAdd(wBlc,"");
    clipper.aAdd(wBlx,0);
    clipper.aAdd(wBlc_Open,true);
    wBlcNum = clipper.len(wBlc);
   
    for(var wx=1; wx<=clipper.len(wMMatrix); wx++) {
       wMatrixResult = wMMatrix[wx];
       wMatrixLinha  = wx;
       if(clipper.upper(clipper.substr(wMMatrix[wx],1,11)) == "PARAMETERS ") {
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

return null;