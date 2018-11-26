clipper = require('./clipper');
c_infow = require('./c_infow');

function cScript(wMMatrix,wMParm,wSObjeto) {

    let wx,wy,wPos,wMatrixResult,wMatrixLinha,wWork;
    let wFor = false;
    let wBlcNum = 0;

    clipper.clipper.aAdd(wBlc,"");              // Bloco 01 reservado para o PARAMETERS
    clipper.clipper.aAdd(wBlx,0);               // Bloco 01 reservado para o PARAMETERS
    clipper.clipper.aAdd(wBlc_Open,false);      // Bloco 01 reservado para o PARAMETERS

    clipper.clipper.aAdd(wBlc,"");              // Bloco 02 reservado para o PRIVATE
    clipper.clipper.aAdd(wBlx,0);               // Bloco 02 reservado para o PRIVATE
    clipper.clipper.aAdd(wBlc_Open,false);      // Bloco 02 reservado para o PRIVATE

    clipper.clipper.aAdd(wBlc,"");
    clipper.clipper.aAdd(wBlx,0);
    clipper.clipper.aAdd(wBlc_Open,true);
    wBlcNum = clipper.clipper.len(wBlc);
   
    for(var wx=1; wx<=clipper.clipper.len(wMMatrix); wx++) {
        wMatrixResult = wMMatrix[wx];
        wMatrixLinha  = wx;
        if(clipper.clipper.upper(clipper.substr(wMMatrix[wx],1,11)) == "PARAMETERS ") {
            wBlc[01]      = wBlc[01] + (c_infow.cEmpty(wBlc[01]) ? "" : ",") + clipper.allTrim(clipper.substr(wMMatrix[wx],11));     // Bloco 01 é fixo para o PARAMETERS
            wMatrixResult = "";
        } else if(clipper.clipper.upper(clipper.substr(wMMatrix[wx],1,8)) = "PRIVATE ") {
            wBlc[02]      = wBlc[02] + (c_infow.cEmpty(wBlc[02]),"",",") + clipper.allTrim(clipper.substr(wMMatrix[wx],8));      // Bloco 02 é fixo para o PRIVATE
            wMatrixResult = "";
        } else if(clipper.at("=",wMMatrix[wx]) > 0) { 
            wPos          = clipper.at("=",wMMatrix[wx]);
            wMatrixResult = "cVar_Atrib('" + clipper.allTrim(clipper.substr(wMMatrix[wx],1,wPos-1)) + "'," + clipper.substr(wMMatrix[wx],wPos+2)+" )";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,1)) == "?") {
            wMMatrix[wx]  = "WQout({" + clipper.allTrim(clipper.substr(wMMatrix[wx],2)) + "})";
            wMatrixResult = wMMatrix[wx];
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,3)) == "IF ") {
            if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
            }
            if(wcDebug) {
                wBlc[wBlcNum] = wBlc[wBlcNum] + "fdbg_Goto(022," + clipper.strzero(wBlcNum+1,3) + ")";
            } else {
                wBlc[wBlcNum] = wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1,3) + "]))";
            }
            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);

            wMMatrix[wx] = "cIf(" + clipper.substr(wMMatrix[wx],4) + ",";
            if(wcDebug) {
                wMatrixResult = wMMatrix[wx] + "'fdbg_Goto(04," + clipper.strzero( wBlcNum+1 ,3) + ")')";
            } else {
                wMatrixResult = wMMatrix[wx] + "(wBlc[" + clipper.strzero( wBlcNum+1 ,3) + "]))";
            }

            wBlc[wBlcNum] = wMatrixResult;
            wBlx[wBlcNum] = wx;
            wMatrixResult = "";

            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);

        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "FOR ") {
            if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
            }
            if(wcDebug) {
                wBlc[wBlcNum] = wBlc[wBlcNum] + "fdbg_Goto(023," + clipper.strzero(wBlcNum+1,3) + ")";
            } else {
                wBlc[wBlcNum] = wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1,3) + "]))";
            }
            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);
       
            wMMatrix[wx] = 'cFor("' + clipper.substr(wMMatrix[wx],5) + ",";
            wMMatrix[wx] = StrTran(wMMatrix[wx],'=','",');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'to',',');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'To',',');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'TO',',');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'step',',');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'Step',',');
            wMMatrix[wx] = StrTran(wMMatrix[wx],'STEP',',');
            wMMatrix[wx] = wMMatrix[wx] +  "'" + clipper.substr(wMMatrix[wx],7,3) + "',";
                                                                                                                                       
            if(wcDebug) {
                wMatrixResult = wMMatrix[wx] + "'fdbg_Goto(03," + clipper.strzero( clipper.len(wBlc)+1,3) + ")'";
            } else {
                wMatrixResult = wMMatrix[wx] + "(wBlc[" + clipper.strzero( clipper.len(wBlc)+1  ,3) + '])';
            }
                                                                                                                                    
            wBlc[wBlcNum] = wMatrixResult                                                                         
            wBlx[wBlcNum] = wx 
            if(wcDebug) {
                //wBlc[wBlcNum] = wBlc[wBlcNum] + ",fdbg_Goto(019," + clipper.strzero(wBlcNum+1 ,3) + ") "
            Else
                //wBlc[wBlcNum] = wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1 ,3) + "]))"
            EndIf

            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);

            wMatrixResult = "";

        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "ELSE") {
          wMatrixResult = "";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,5)) == "ENDIF") {
          wMatrixResult = "";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "NEXT") {
          wMatrixResult = "";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "ENDW") {
          wMatrixResult = "";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,6)) = "WHILE ") {
          wMMatrix[wx]   = "cWhile(" + clipper.substr(wMMatrix[wx],7) + ","
          wMatrixResult = wMMatrix[wx];
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "ENDW") {
          wMatrixResult = "";
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,6)) == "RETURN") {
          wMMatrix[wx]  = "cScriptReturn(" + clipper.allTrim(clipper.substr(wMMatrix[wx],7)) + ")#RETURN#";
          wMatrixResult = wMMatrix[wx];
        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "EXIT") {
            if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                if(wcDebug) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",fdbg_Goto(01," + clipper.strzero(wBlcNum+1 ,3) + ") ";
                } else {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1 ,3) + "]))";
                }
                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);
            }

            wMatrixResult = 'cScriptForExit("' + clipper.substr(wMMatrix[wx],5,3) + '")';
            wBlc[wBlcNum] = wMatrixResult;
            wBlx[wBlcNum] = wx;
            wMatrixResult = "";

            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);

        } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,4)) == "LOOP") {
            if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                if(wcDebug) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",fdbg_Goto(02," + clipper.strzero(wBlcNum+1 ,3) + ") ";
                } else {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1 ,3) + "]))";
                }

                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);
            }

            wMatrixResult = 'cScriptForLoop("' + clipper.substr(wMMatrix[wx],5,3) + '")';
            wBlc[wBlcNum] = wMatrixResult;
            wBlx[wBlcNum] = wx;
            wMatrixResult = "";

            clipper.aAdd(wBlc,"");
            clipper.aAdd(wBlx,0);
            clipper.aAdd(wBlc_Open,true);
            wBlcNum = clipper.len(wBlc);

        } else if(wMMatrix[wx] == "{") {
            wMatrixResult = "";
        } else if(wMMatrix[wx] == "}") {
            wMatrixResult = "";
          
            for(var wy=wBlcNum-1; wy >= 1; wy--) {
                if(wBlc_Open[wy]) {
                 wBlcNum       = wy
                 wBlc_Open[wy] = false;
                 break;
                }
            }
          
            if(clipper.substr(wMMatrix[wx],1,5) == "}Then") { //.and. clipper.substr(wMMatrix[wx],9,3) == "Fec" // }Then001Fecha

                wIfNum = clipper.substr(wMMatrix[wx],6,3);
                wBlcNum = 0;
                for(var wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == ("cIf(" + wIfNum)) { 
                        wBlcNum = wy;
                        break;
                    }
                }
             
                if(clipper.substr(wMMatrix[wx-1],1,8) == ("{Then"+wIfNum)) { // {Then001Abre
                    // *Se nao tem THEN redireciona para o EndIf
                    // *wMMatrix[wx]   = "cIf(" + clipper.substr(wMMatrix[wx],4) + ","
                    if(wcDebug) {
                        wBlc[wBlcNum] =  wMMatrix[wBlx[wBlcNum]] + "'fdbg_Goto(044,GotoEndIf)')";
                    } else {
                        wBlc[wBlcNum] = wMMatrix[wBlx[wBlcNum]] + "(wBlc[GotoEndIf]))";
                    }
                }
             
                if(wcDebug) {
                    wWork = "ELSE" + wIfNum + ",'fdbg_Goto(07," + clipper.strzero(clipper.len(wBlc)+1,3) + ")') ";
                } else {
                    wWork = "ELSE" + wIfNum + ",(wBlc[" + clipper.strzero(clipper.len(wBlc)+1,3) + "])) ";
                }

                wBlc[wBlcNum] = clipper.substr(wBlc[wBlcNum],1,clipper.len(Trim(wBlc[wBlcNum]))-1) + wWork;

                wBlc[clipper.len(wBlc)] = "BTHEN" + wIfNum + wBlc[clipper.len(wBlc)];

                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);

                wBlx[clipper.len(wBlc)] = wx+1;

                wMatrixResult = "";
          
            } else if(clipper.substr(wMMatrix[wx],1,6) == "}EndIf") {  //.and. clipper.substr(wMMatrix[wx],10,3) == "Ext" // }EndIf001Ext

                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);

                wBlx[wBlcNum] = wx-1;

                wIfNum = clipper.substr(wMMatrix[wx],7,3);
                //*-----direciona o bloco cIf------------*
                wBlcNum = 0;
                wy = 0;
                for(var wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == ("cIf("+wIfNum)) { 
                        wBlcNum = wy;
                        break;
                    }
                }
                if(wBlcNum > 0) {
                    if(clipper.at("GotoEndIf",wBlc[wBlcNum]) > 0) {
                        wBlc[wBlcNum] = StrTran(wBlc[wBlcNum],"GotoEndIf",clipper.strzero(clipper.len(wBlc),3,0));
                    }
                }
                //*--------------------------------------*

                //*-----direciona o bloco THEN-----------*
                wBlcNum = 0;
                wy = 0;
                for(var wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == ("BTHEN"+wIfNum)) {
                        wBlcNum = wy;
                        break;
                    }
                }  

                if(wBlcNum > 0) {
                    if(wcDebug) {
                        wWork = "fdbg_Goto(09," + clipper.strzero( clipper.len(wBlc),3) + ")";
                    } else {
                        wWork = "eVal(fcBlock(wBlc[" + clipper.strzero( clipper.len(wBlc),3) + "]))";
                    }

                    if(clipper.len(clipper.trim(wBlc[wBlcNum])) != clipper.len(clipper.trim("BTHEN"+wIfNum))) {
                        wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
                    }
                    wBlc[wBlcNum] = wBlc[wBlcNum] + wWork;
                }
                //*--------------------------------------*
                //*-----direciona o bloco ELSE------------*
                wBlcNum = clipper.len(wBlc)-1;  // O bloco anterior e´o ELSE
                if(wcDebug) {
                    wWork = "fdbg_Goto(010," + clipper.strzero(clipper.len(wBlc),3) + ")";
                } else {
                    wWork = "eVal(fcBlock(wBlc[" + clipper.strzero(clipper.len(wBlc),3) + "]))";
                }
                
                if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
                }
                wBlc[wBlcNum] = wBlc[wBlcNum] + wWork;
                //*--------------------------------------*

            } else if(clipper.upper(clipper.substr(wMMatrix[wx],1,5)) == "}EndW") { //.and. clipper.substr(wMMatrix[wx],9,3) == "Ext" // }EndW001Ext

            } else if(clipper.substr(wMMatrix[wx],1,5) == "}Next") {  //.and. clipper.substr(wMMatrix[wx],9,3) == "Ext" // }Next001Ext

                wBlcNum = clipper.len(wBlc); 
                if(wcDebug) {
                    wWork = "fdbg_Goto(026," + clipper.strzero( wBlcNum +1,3) + ")";

                    if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                        wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
                    }
                    wBlc[wBlcNum] = wBlc[wBlcNum] + wWork;
                }
                //*-----direciona o bloco cFor-----------*                                               
                wForNum = clipper.substr(wMMatrix[wx],6,3);
                wBlcNum = 0;
                wy      = 0;
                for(var wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == ('cFor("' + wForNum)) { 
                        wBlcNum = wy;
                        break;
                    }
                }
             
                if(wBlcNum > 0) {
                    //*--------------------------------------*
                    clipper.aAdd(wBlc,"");
                    clipper.aAdd(wBlx,0);
                    clipper.aAdd(wBlc_Open,true);

                    wBlx[clipper.len(wBlc) ] = wx-1;

                    if(wcDebug) {
                        wBlc[clipper.len(wBlc)] = "fdbg_Goto(014," + clipper.strzero( wBlcNum ,3) + ")";
                    } else {
                        wBlc[clipper.len(wBlc)] = "eVal(fcBlock(wBlc[" + clipper.strzero( wBlcNum ,3) + "]))";
                    }

                    if(wcDebug) {
                        wBlc[wBlcNum] = wBlc[wBlcNum] + ",'fdbg_Goto(025," + clipper.strzero( clipper.len(wBlc)+1 ,3) + ")')";
                    } else {
                        wBlc[wBlcNum] = wBlc[wBlcNum] + ",(wBlc[" + clipper.strzero( clipper.len(wBlc)+1,3) + "]))";
                    }

                }
                // *--------------------------------------*
                // *-----------------------------------------*

                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);

                wMatrixResult = "";

                //*-----direciona o bloco ForExit-----------*
                //**wForNum = clipper.substr(wMMatrix[wx],6,3)
                wy = 0;
                for(wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == 'cScriptForExit("' + wForNum) { 
                        if(wcDebug) {
                            wBlc[wy] = wBlc[wy] + ",fdbg_Goto(015," + clipper.strzero( clipper.len(wBlc)-1 ,3) + ")";
                        }
                    
                    EndIf
                Next

                wy = 0;
                for(var wy=1; wy<=clipper.len(wBlc); wy++) {
                    if(wBlc[wy] == 'cScriptForLoop("' + wForNum) { 
                        if(wcDebug) {
                            wBlc[wy] = wBlc[wy] + ",fdbg_Goto(016," + clipper.strzero( clipper.len(wBlc)-1 ,3) + ")";
                        }
                    }
                }
                //*--------------------------------------*
            }
       
            wBlcNum       = clipper.len(wBlc);
            wMatrixResult = "";
        }       

        if(wBlcNum>2 && clipper.len(trim(wBlc[wBlcNum])) > 0) {
            wBlc[wBlcNum] = wBlc[wBlcNum] + ",fdbg_Lin("+clipper.allTrim(str(wx-1)) + ")";
            //wdbg_Trace[wPosTrace,05] = wLinNum
        }

        if(wcDebug) {
            if(!c_infow.cEmpty(wMatrixResult)) {  //.and. ( (clipper.len(wMatrixResult) + clipper.len(wBlc[wBlcNum]) > 512 .or. wcDebug ))  // o Limite de expanção é de 704 bytes por bloco
                if(!c_infow.cEmpty(wBlc[wBlcNum])) {  
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
                }
                if(wcDebug) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + "fdbg_Goto(017," + clipper.strzero(wBlcNum+1,3) + ")";
                } else {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1,3) + "]))";
                }
            
                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);
            }
        } else {
            //**If .not. c_infow.cEmpty(wMatrixResult)  //.and. ( (clipper.len(wMatrixResult) + clipper.len(wBlc[wBlcNum]) > 512 .or. wcDebug ))  // o Limite de expanção é de 704 bytes por bloco
            if(!c_infow.cEmpty(wMatrixResult)  && (clipper.len(wMatrixResult) + clipper.len(wBlc[wBlcNum]) > 512 )) { // o Limite de expanção é de 704 bytes por bloco
                if(!c_infow.cEmpty(wBlc[wBlcNum])) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
                }
                if(wcDebug) {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + "fdbg_Goto(017," + clipper.strzero(wBlcNum+1,3) + ")";
                } else {
                    wBlc[wBlcNum] = wBlc[wBlcNum] + "eVal(fcBlock(wBlc[" + clipper.strzero(wBlcNum+1,3) + "]))";
                }
            
                clipper.aAdd(wBlc,"");
                clipper.aAdd(wBlx,0);
                clipper.aAdd(wBlc_Open,true);
                wBlcNum = clipper.len(wBlc);
            }
        }

        if(!c_infow.cEmpty(wMatrixResult)) {
            if(!c_infow.cEmpty(wBlc[wBlcNum])) {
              wBlc[wBlcNum] = wBlc[wBlcNum] + ",";
            }
            wBlc[wBlcNum] = wBlc[wBlcNum] + wMatrixResult;
            wBlx[wBlcNum] = wMatrixLinha;
        }
    }
       
    clipper.aAdd(wBlc,"");     // #RETURN# 
    clipper.aAdd(wBlx,0);     // #RETURN# 

    wy = 0;
    for(wy=1; wy<=clipper.len(wBlc); wy++) {
      
        if(wBlc[wy] == "cIf(") {
            wBlc[wy] = "cIf(" + clipper.substr(wBlc[wy],8);

            wPos = clipper.at("ELSE",wBlc[wy]);
            if(wPos > 0) {
                wBlc[wy] = clipper.substr(wBlc[wy],1,wPos-1) + clipper.substr(wBlc[wy],wPos+07);
            }

            wPos = clipper.at("ELSE",wBlc[wy]);
            if (wPos > 0) {
                wBlc[wy] = clipper.substr(wBlc[wy],1,wPos-1) + clipper.substr(wBlc[wy],wPos+07);
            }
        }
        if(wBlc[wy] == "BTHEN") {
            wBlc[wy] = clipper.substr(wBlc[wy],09);
        }
        if(wBlc[wy] == "cFor(") {
            wBlc[wy] = 'cFor("' + clipper.substr(wBlc[wy],10);
        }
        if(wBlc[wy] == "cWhile(") {
            wBlc[wy] = "cWhile(" + clipper.substr(wBlc[wy],11);
        }

        wPos = clipper.at("#RETURN#",wBlc[wy]);
        if(wPos > 0) { 
            if(wcDebug) {
                wBlc[wy] = clipper.substr(wBlc[wy],1,wPos-1) + ",fdbg_Goto(018," + clipper.strzero( clipper.len(wBlc),3) + ")";
            } else {
                wBlc[wy] = clipper.substr(wBlc[wy],1,wPos-1) + ",eVal(fcBlock(wBlc[" + clipper.strzero( clipper.len(wBlc),3) + "]))";
            }
        }
    }

    if(wcDebug) {
        for(var wx=1; wx <= clipper.len(wBlx); wx++) { 
            if(wblx[wx] > 0) { 
                wdbg_MProc[ wdbg_MLin[wblx[wx]] ,3] = wblc[wx]
                wdbg_MProc[ wdbg_MLin[wblx[wx]] ,4] = wx 
            }
        } 
    }

    if(!wcdebug) {
        clipper.aAdd( wM_Objeto[wPosObj], wBlc )     // Armazena o script já compilado no 6 item da matrix wM_Objeto
    }

    wdbg_Trace[wPosTrace,03] = wBlc[01]   // Paramameters
    wdbg_Trace[wPosTrace,04] = wBlc[02]   // Privates

	cScriptAux(wBlc[03],wMParm,wSObjeto);

    return null;
}

function cScriptAux(_wcBlock,_wM_Parm,_wPrcNome) {
    var _wx , _wWork01 //, _wM_Private 
                                                
    if(!c_infow.cEmpty(wBlc[01])) {     // Bloco exclusivo para o PARAMETERS
        _wM_Private = cStrToMatriz(wBlc[1],",","C");      
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

    return null;
}