#include "FiveWin.ch"
#include "Directry.ch"

MEMVAR wdbase , wc_Prog , wc_DB , wc_Path , oM_Dlg,wc_stru_pc,wctNivel,wc_SQL_tp,nDllWeb,hRichDLL
MEMVAR _wMrc_CAnt,oxCbx,wBuffer,wLenBuffer,__wKeySeek,_wAbre_Pesquisa,_wMM_Grid,_wMrc_Lst_Cnv
MEMVAR __wScanMatriz,__wScanConteudo,__wScanNum_Col,__wScan_wx,__oClpMaster

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Para arquivo DBF´s                                             **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

function cwTabDB(wArq,wMatrixNTX)
*******************************************************************************
* cria a tabela (matrix) de arquivos e indices wc_db                          *
* warq    = > nome do arquivo dbf                                             *
* wntxnn  = > nome do arquivo de indice (ate 15)                              *
* ex.:  cwtabdb("dbc01,ibc01a")                                               *
*       cwtabdb("d"+wdbase+"cc01","a","b","c")                                *
*******************************************************************************
Local wx,wScan,wDBF,wwNtx

   wArq := AllTrim(Lower(wArq))
   wDBF := wArq
   
   for wx := 01 To Len(wMatrixNTX)
       If cEmpty(wMatrixNTX[wx])
          Exit
       EndIf
       If Len(wMatrixNTX[wx]) = 01     // se foi passado somente a sequencia do indice entao cria o nome completo
          wwNtx := "i"+SubStr(wArq,2) + AllTrim(wMatrixNTX[wx]) + ".ntx"
       else
          wwNtx := AllTrim(wMatrixNTX[wx]) + ".ntx"
       EndIf
       wDBF := wDBF + "," + wwNtx
   next

   wScan := aScan(wc_DB,wArq)
   If wScan > 0              // se ja existe na tabela; entao redefine, senao adiciona
      wc_db[wScan] := wDBF
   Else
      aAdd(wc_DB,wDBF)
   EndIf

return .t.
*fim da function cwtabdb()

function cwAbreDB(wDBF,wOrder,wModo)
****************************************************************************
* funcao para abertura de arquivos (db)                                    *
* wDBF   => (cha) nome do arquivo a ser aberto                                *
* worder => numero da sequencia do arquivo de indice (set order to worder) *
* worder => ou nome dos arquivos de indice                                 *
* wmodo  => modo (0-normal/default) (1-exclusive)                          *
*           se worder = ""  (nao informado) assume 1                       *
*           se worder = "0"  nao abre nenhum arquivo de indice             *
*           se worder = "1" abre todos os indices com order "1"            *
*           se worder = "ifr01x" abre o arquivo de indice informado        *
* ex:                                                                      *
*    cwAbreDB("dfr01",1)                                                    *
****************************************************************************
Local wArq,wDBNum,wPath,wIndex,wx
Local windex01, windex02, windex03, windex04, windex05, windex06, windex07, windex08
Local windex09, windex10, windex11, windex12, windex13, windex14, windex15

   if ValType(wDBase) <> "C"
      return .f.
   EndIf

   wDBF  := Lower(AllTrim(wDBF))
   wModo := iif(ValType(wModo)<>"N",0,wModo)

   *------------------ verifica a existencia de redireciomento de PATH -------*
   wPath := cwPath(wDBF)
   wArq  := wPath + wDBF
   *--------------------------------------------------------------------------*

   if select(warq) > 0   // se ja estiver aberto entao seleciona
      select &wArq
   else
      cwSelect()         // funcao para localizar a 1º area de trabalho livre
      wx:=0
      Do While .t.
         wx ++
         if wModo = 0    // se for compartilhado
            USE &wArq
         else            // se for exclusivo
            USE &wArq Exclusive
         EndIf

         if NetErr()
            MsgWait("Arquivo "+Trim(warq)+" em uso (Exclusivo) por outro terminal. Alocando arquivos ... " + Str(wx,3) , "Aguarde...",.1)
            if INKEY() = 27
               cCancel("O(s) Arquivo(s) necessário(s) para ","a execução da transação está(ão) em uso por outro terminal.")
            EndIf
            Loop
         EndIf
         Exit
      EndDo
   EndIf

   Close Index

   if ValType(worder)="U"       // se nao foi passado o "worder"  assume "1"
      wOrder := 1
   elseif ValType(wOrder)="C"   // se foi passado o nome do arquivo de indice abre ele mesmo
      Set Index To (wOrder)
      DbGoTop()
      Return .t.
   elseif wOrder = 0            // se for "0" nao abre nenhum arquivo de indice
      return .t.
   EndIf

   wDbNum := aScan(wc_DB,wDBF)
   if wDbNum = 0
      windex01 := wpath + "i" + substr(wDBF,2) + "a"
      Set Index To &windex01
   else
      windex   := wc_db[wdbnum] + ","
      windex01 := substr(windex,at(",",windex)+1)
      windex02 := substr(windex01,at(",",windex01)+1)
      windex03 := substr(windex02,at(",",windex02)+1)
      windex04 := substr(windex03,at(",",windex03)+1)
      windex05 := substr(windex04,at(",",windex04)+1)
      windex06 := substr(windex05,at(",",windex05)+1)
      windex07 := substr(windex06,at(",",windex06)+1)
      windex08 := substr(windex07,at(",",windex07)+1)
      windex09 := substr(windex08,at(",",windex08)+1)
      windex10 := substr(windex09,at(",",windex09)+1)
      windex11 := substr(windex10,at(",",windex10)+1)
      windex12 := substr(windex11,at(",",windex11)+1)
      windex13 := substr(windex12,at(",",windex12)+1)
      windex14 := substr(windex13,at(",",windex13)+1)
      windex15 := substr(windex14,at(",",windex14)+1)

      *-----------cicero/ailton 08/11/99 warmam----------------------------*
      windex01 := substr(windex01,1,at(",",windex01)-1)   + " "
      windex02 := substr(windex02,1,at(",",windex02)-1)   + " "
      windex03 := substr(windex03,1,at(",",windex03)-1)   + " "
      windex04 := substr(windex04,1,at(",",windex04)-1)   + " "
      windex05 := substr(windex05,1,at(",",windex05)-1)   + " "
      windex06 := substr(windex06,1,at(",",windex06)-1)   + " "
      windex07 := substr(windex07,1,at(",",windex07)-1)   + " "
      windex08 := substr(windex08,1,at(",",windex08)-1)   + " "
      windex09 := substr(windex09,1,at(",",windex09)-1)   + " "
      windex10 := substr(windex10,1,at(",",windex10)-1)   + " "
      windex11 := substr(windex11,1,at(",",windex11)-1)   + " "
      windex12 := substr(windex12,1,at(",",windex12)-1)   + " "
      windex13 := substr(windex13,1,at(",",windex13)-1)   + " "
      windex14 := substr(windex14,1,at(",",windex14)-1)   + " "
      windex15 := substr(windex15,1,at(",",windex15)-1)   + " "
      *--------------------------------------------------------------------*

      if windex01 <> " "
         windex01 := wpath + windex01
         if windex02 <> " "
            windex02 := wpath + windex02
            if windex03 <> " "
               windex03 := wpath + windex03
               if windex04 <> " "
                  windex04 := wpath + windex04
                  if windex05 <> " "
                     windex05 := wpath + windex05
                     if windex06 <> " "
                        windex06 := wpath + windex06
                        if windex07 <> " "
                           windex07 := wpath + windex07
                           if windex08 <> " "
                              windex08 := wpath + windex08
                              if windex09 <> " "
                                 windex09 := wpath + windex09
                                 if windex10 <> " "
                                    windex10 := wpath + windex10
                                    if windex11 <> " "
                                       windex11 := wpath + windex11
                                       if windex12 <> " "
                                          windex12 := wpath + windex12
                                          if windex13 <> " "
                                             windex13 := wpath + windex13
                                             if windex14 <> " "
                                                windex14 := wpath + windex14
                                                if windex15 <> " "
                                                   windex15 := wpath + windex15
                                                EndIf
                                             EndIf
                                          EndIf
                                       EndIf
                                    EndIf
                                 EndIf
                              EndIf
                           EndIf
                        EndIf
                     EndIf
                  EndIf
               EndIf
            EndIf
         EndIf
      EndIf

//      Set Index to (windex01), (windex02),  (windex03),  (windex04), (windex05), (windex06),  (windex07),  (windex08), (windex09), (windex10), (windex11), (windex12),  (windex13),  (windex14), (windex15) ,"" ,"",""

      if !.F. ; ordListClear() ; end
      if !cEmpty(windex01); ordListAdd((windex01)) ; End
      if !cEmpty(windex02); ordListAdd((windex02)) ; End
      if !cEmpty(windex03); ordListAdd((windex03)) ; End
      if !cEmpty(windex04); ordListAdd((windex04)) ; End
      if !cEmpty(windex05); ordListAdd((windex05)) ; End
      if !cEmpty(windex06); ordListAdd((windex06)) ; End
      if !cEmpty(windex07); ordListAdd((windex07)) ; End
      if !cEmpty(windex08); ordListAdd((windex08)) ; End
      if !cEmpty(windex09); ordListAdd((windex09)) ; End
      if !cEmpty(windex10); ordListAdd((windex10)) ; End
      if !cEmpty(windex11); ordListAdd((windex11)) ; End
      if !cEmpty(windex12); ordListAdd((windex12)) ; End
      if !cEmpty(windex13); ordListAdd((windex13)) ; End
      if !cEmpty(windex14); ordListAdd((windex14)) ; End
      if !cEmpty(windex15); ordListAdd((windex15)) ; End

      If IndexOrd() > 0   // se tiver algum indice
         Set Order To wOrder
      EndIf
   EndIf
   DbGoTop()

return .t.
*fim da function cwAbreDB

function cwFechaDB(wDataBase)
****************************************************************************
* funcao para fechamento de arquivos (db)                                  *
* se for passado o nome do arquivo so' fechara' o proprio                  *
* wDBase => (cha) nome do arquivo a ser fechado                               *
* ex:                                                                      *
*    cwFechaDB("dfr01")     // fecha o arquivo informado                    *
*    cwFechaDB()            // fecha todos os arquivos                      *
****************************************************************************

   if ValType(wDataBase) = "C"  // fecha somente o arquivo informado
      if Select(wDataBase) > 0  // se estiver aberto entao fecha
         Select &wDataBase
         USE
      EndIf
   else                         // fecha todos os arquivos
      Close DataBase
      Close All
   EndIf
   Commit

return .t.
*fim da function cwFechaDB()

function cwSelect(wDBF,wOrder)
****************************************************************************
* Funcao para localizar um arquivo de dados e indices                      *
* wDBF   => nome do aruivo de dados                                         *
* worder=> numero do arquivo de indice                                     *
* obs: se o arquivo nao estiver aberto sera acionado automaticamente a     *
*      funcao cwAbreDB(wDBF,worder)                                          *
* ex:                                                                      *
*    cwSelect("dct01)     // seleceiona o arquivo sem alterar o indice      *
*    cwSelect("dct01,2)   // seleceiona o arquivo alterando o indice p/ o 2 * *
****************************************************************************

   if pCount() = 0                             // se nao tem parametro localiza a 1¦ area livre
      select 0
      return .t.
   EndIf

   if ValType(wDBF) = "C"                      // se foi passado o nome de um arquivo
      if .Not.cEmpty(wDBF)                     // se foi passado uma variavel com dados
         if Select(wDBF) > 0                   // se ja estiver aberto entao so' seleciona
            Select &wDBF                       
            if pCount() = 2                    // se foi passado o worder
               if wOrder <> INDEXORD()         // se o indice nao for o mesmo entao set o solicitado
                  if INDEXORD() > 0            // se tiver algum indice
                     Set Order To wOrder
                  EndIf
               EndIf
            EndIf
         Else
            wOrder := iif(ValType(wOrder)<>"N",1,wOrder)   // se nao foi passado o worder entao sera 1
            cwAbreDB(wDBF,worder)
         EndIf
      EndIf
   ElseIf Valtype(wDBF) = "N"                   // se foi passado o numero da area
      select wDBF
   EndIf

return .t.
*fim da function cwSelect

function cwBeginLock(wTipo,wMatrixArq)
*******************************************************************************
* funcao para dar o lock de registro (rlock) no(s) arquivo(s) informado(s)    *
* ex: cwbeginlock("dct01","dct02")                                            *
* para "rlock" nao e' necessario indicar o tipo (e' o default)                *
* para "flock"     1ä parametro (wArq01) deve ser = 1 (num)                   *
* para "exclusive" 1ä parametro (wArq01) deve ser = 2 (num)                   *
*******************************************************************************
Local wArea,wLock,wx,wy

   wArea    := ALIAS()
   wTipo    := iif(Valtype(wTipo)<>"N",0,wTipo)

   Do While .T.
      For wx := 01 To Len(wMatrixArq)          // do 1º ao ultimo arquivo
         cwSelect(wMatrixArq[wx])              
         wLock := .f.                          
         For wy:= 01 To 03                      // tenta 03 vezes para cada arquivo
             if wTipo=0                        // travamento por registro (rlock)
                if rLock()                     
                   wLock := .t.                
                   Exit                        
                EndIf                          
             elseif wtipo=1 .Or. wtipo=3       // travamento por arquivo (flock)
                if flock()
                   wLock := .t.
                   Exit
                EndIf
             elseif wtipo=2                    // travamento por arquivo (use exclusive)
                cwFechaDB(wMatrixArq[wx])
                cwAbreDB(wMatrixArq[wx],1,1)   // Abre o arquivo com a opcao "exclusive"
                if .Not. neterr()
                   wLock := .t.
                   Exit
                EndIf
             EndIf
         Next

         if .Not. wLock                        // se ficou algum de for entao libera todos e reinicia
            MsgWait("Arquivo "+Trim(wMatrixArq[wx])+" em uso (Exclusivo) por outro terminal. Alocando arquivos ... " + Str(wx,3) , "Aguarde...",.1)
            cwEndLock(wMatrixArq)
            wLock := .f.
            Exit
         EndIf
      Next

      if wLock   // se Travou todos entao sai do loop
         Exit
      EndIf
   EndDo
   cwSelect(wArea)

return .t.
*fim da function cwBeginLock()

function cwEndLock(wMatrixArq)
*******************************************************************************
* funcao para dar o unlock no(s) arquivo(s) informado(s) ou todos (unlockall) *
* ex: cbeginlock("dct01","dct02")                                             *
*******************************************************************************
Local wx

   Commit

   If .Not.cEmpty(wMatrixArq)
      For wx := 01 To Len(wMatrixArq)
         If cEmpty(wMatrixArq[wx])
            Exit
         EndIf
         cwSelect(wMatrixArq[wx])
         UnLock
      Next
   Else
      UnLock All
   EndIf

return .t.
*fim da function cwendlock

Function c_Melhor_Ntx(wTabela,wMX_Indice)
******************************************************************************
*            verIfica qual o indice mais apropriado                          *
******************************************************************************
Local wx , wy := 00 , wResposta[3] , wXF_Coluna := 1 , wXF_1Conteudo := 2 , wXF_2Conteudo := 3 , wwntx , wpos1 , wTem
Local wMelhor_NTX        := 00            // Índice Escolhido
Local wMelhor_Pontuacao  := 00            // Pontuacao do melhor indice (qtd campos)
Local wMelhor_Seek       := Space(00)     
Local wMelhor_Comparacao := Space(00)     
Local wstru_ntx , want , wChave_Seek , wchave_comparador ,windexstru , wpontuacao , wChave 
Local wwCampo , wFiltro_1 , wFiltro_2 , wxLen1 , wxLen2

   *---------------------cria matriz com estrutura dos indices----------------*
   wstru_ntx := {}
   want      := Space(00)
   wx        := 00
   For wx := 01 to 20
      cwselect(wTabela,wx)
      wwntx = indexkey()
      If want == wwntx
         Exit
      Else
         want := wwntx
      EndIf

      aAdd(wstru_ntx,wwntx)
   next
   *--------------------------------------------------------------------------*
   wx    := 00
   wxLen1:= Len(wstru_ntx)
   For wx:= 01 to wxLen1       // executa para todos os indices (.ntx) do arquivo (.dbf)
      wChave_Seek       := Space(00)
      wchave_comparador := " .not. Eof() "
      windexstru        := Upper(wstru_ntx[wx]) + "+"
      wpontuacao        := 0   // quantidade de campos encontrados para este indice

      do while at("+",windexstru) > 0
         wpos1      := at("+",windexstru)
         wwcampo    := SubStr(windexstru,1,wpos1-1)
         windexstru := SubStr(windexstru,wpos1+1)

         wtem  := .f.
         wxLen2:= Len(wMX_Indice)
         For wy:=1 To wxLen2                                    // verIfica se tem algum campo no indice que esta no filtro
             If cEmpty(wMX_Indice[wy,wXF_Coluna])                // ate o ultimo campo utilizado
                Loop
             EndIf
             If Trim(wMX_Indice[wy,wXF_Coluna])$wwcampo           // se o nome do campo estiver contido na estrutura parcial do indice
                If .not.cEmpty(wMX_Indice[wy,wXF_1Conteudo])       // se foi Informado pelo operador
                   wtem := .t.

                   wwCampo := Trim(wMX_Indice[wy,wXF_Coluna])
                   If     ValType(wMX_Indice[wy,wXF_1Conteudo]) = "C"                   // de campo CARACTER
                      wFiltro_1         := '"'+ SubStr(wMX_Indice[wy,wXF_1Conteudo],1,len(&wwCampo)) +'"'
                      wChave_Seek       := wChave_Seek + iIf(cEmpty(wChave_Seek),"","+") + strtran(wwcampo,wwCampo,wFiltro_1)
                      wChave_comparador := wChave_Comparador + " .And. &wwCampo = Trim(&wFiltro_1)"
                   ElseIf ValType(wMX_Indice[wy,wXF_1Conteudo]) = "N"                   // de campo NUMERICO
                      wFiltro_1         := AllTrim(Str(wMX_Indice[wy,wXF_1Conteudo]))
                      wFiltro_2         := AllTrim(Str(wMX_Indice[wy,wXF_2Conteudo]))
                      wChave_Seek       := wChave_Seek + iIf(cEmpty(wChave_Seek),"","+") + strtran(wwcampo,wwCampo,wFiltro_1)
                      wChave_Comparador := wchave_comparador + " .And. " + wwCampo + " >= " + wFiltro_1 + " .And. " + wwCampo + " <= " + wFiltro_2
                   ElseIf ValType(wMX_Indice[wy,wXF_1Conteudo]) = "D"                  // de campo DATA

                      If wPontuacao = 0                                    // campo DATA so' serve se For o 1ä campo da chave
                         wChave            := 'DtoS(ctod("' + DtoC(wMX_Indice[wy,wXF_1Conteudo])+ '"))'
                         wFiltro_1         := 'CtoD("' + DtoC(wMX_Indice[wy,wXF_1Conteudo])+ '")'
                         wFiltro_2         := 'CtoD("' + DtoC(wMX_Indice[wy,wXF_2Conteudo])+ '")'
                         wChave_Seek       := wChave_Seek + iIf(cEmpty(wChave_Seek),"","+") + StrTran(wwcampo,wwCampo,wchave)
                         wChave_comparador := wChave_Comparador + " .And. " + wwCampo + " >= " + wFiltro_1 + " .And. " + wwCampo + " <= " + wFiltro_2
                         wPontuacao        := 99                           // campo DATA tem peso maior (se tem 2 indices com a mesma pontuacao o campo data tem preferencia)
                      Else
                         wtem := .f.
                      EndIf
                   EndIf
                EndIf
             EndIf
        next

        If wTem = .f.   // se nao tem este campo entao encerra
           Exit
        EndIf

        wPontuacao ++   // quantidade de campos encontrados para este indice
      enddo

      If wMelhor_Pontuacao < wPontuacao  // verIfica se a pontuacao deste e melhor que os anteriores
         wMelhor_Ntx        := wx         // numero do melhor indice
         wMelhor_Seek       := wChave_Seek
         wMelhor_Comparacao := wChave_Comparador
         wMelhor_Pontuacao  := wPontuacao // pontuacao do melhor indice (qtd campos)
      EndIf
   Next        // executa para todos os indices (.ntx) do arquivo (.dbf)

   wResposta[1] := wMelhor_Ntx         
   wResposta[2] := wMelhor_Seek      
   wResposta[3] := wMelhor_Comparacao

Return wResposta
*fim da Function c_Melhor_Ntx()

Function fCria_Melhor_Comparacao( wKeyDbf , wKeySql )
************************************************************************************************
*                                 Função para gerar Menu POPUP                                 *
************************************************************************************************
Local wRetorno , wAux_Dbf , wAux_Sql , wIndexKey , wPos , wPos1 , wPos2 , wFinal , wwxx := 00 , wxLen

wRetorno  := wAux_Dbf := wAux_Sql := wIndexKey := Space(00)
wPos      := wPos1    := wPos2    := wFinal    := 00

   If SubStr(wKeySql,1,1) = '"' .or. SubStr(wKeySql,1,1) = "'"   // CICERO 10/09/2003 se For para expandir
     wAux_Sql := &wKeySql
   Else
     wAux_Sql := wKeySql
   EndIf
   wAux_Sql := iIf(ValType(wAux_Sql)="L", iIf(wAux_Sql=.T.,'.T.','.F.'),Upper(wAux_Sql))
   
   wIndexKey := IndexKey() + "+"
   wxLen     := Len(wIndexKey)
   For wwxx  := 01 To wxLen
      wFinal   := At( "+" , SubStr(wIndexKey,wwxx,wxLen) )
      If SubStr(wIndexKey,wFinal-1,1) = ")"  // Se tiver Parentêses por œltimo ' que esse campo não ' caracter
         wPos1 := At( "(" , SubStr(wIndexKey,wwxx,wFinal-2) ) + 1
         wPos2 := At( "," , SubStr(wIndexKey,wPos1+1,wFinal-2) )
         wPos2 := iIf(wPos2<>0,wPos2,wFinal-2)
         wPos2 := (wPos2 - wPos1) + 1
         wPos  := At( Upper(SubStr(wIndexKey,wPos1,wPos2)) , wAux_Sql )
      Else 
         wPos  := At( Upper(SubStr(wIndexKey,wwxx,wFinal-1)) , wAux_Sql )
      EndIf
      If wPos <> 0
         wAux_Dbf := wAux_Dbf + iIf(cEmpty(wAux_Dbf),"","+") + SubStr(wIndexKey,wwxx,wFinal-1)
      EndIf   
      wwxx := wwxx + Len(SubStr(wIndexKey,wwxx,wFinal-1))
   Next
   
   If .Not.cEmpty(wAux_Dbf)
      wAux_Dbf := wAux_Dbf + " = " + wKeyDbf
   EndIf
   wRetorno := " .Not. Eof() " + iIf(cEmpty(wAux_Dbf),""," .And. ") + wAux_Dbf

Return wRetorno
* fim da Function fCria_Melhor_Comparacao()

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Para Empresa                                                   **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

function cwdbTiraEmpresa(wArquivo)
*******************************************************************************
*     RETIRA o codigo da empresa no nome do arquivo   (dpr01 -> d01pr01)      *
*******************************************************************************
   if .Not.cEmpty(wDbase)                                  // RETIRA o codigo da empresa no nome do arquivo   (dpr01 -> d01pr01)
      wArquivo := Trim("@"+lower(wArquivo))                // acrescenta "@" somente para facilitar a comparacao
      wArquivo := StrTran(wArquivo,"@d"+Trim(wdbase),"@d")
      wArquivo := SubStr(wArquivo,2)                       // retira o "@"
   EndIf

return Upper(wArquivo)
*fim da function cwdbTiraEmpresa()

function cwdbPoeEmpresa(wArquivo)
*******************************************************************************
*       POE o codigo da empresa no nome do arquivo   (dpr01 -> d01pr01)       *
*******************************************************************************
Local wAuxArq

   If .Not.cEmpty(wdbase)                  // Põe o codigo da empresa no nome do arquivo   (dpr01 -> d01pr01)
      wAuxArq := AllTrim(StrTran("@"+Lower(wArquivo), "@d" ,"d"+Trim(wDBase) ))

      If aScan(wc_DB,Lower(wAuxArq)) <> 0  // se EXISTIR na cTab entao e' COM empresa
         wArquivo := wAuxArq
      EndIf
   EndIf

return Upper(wArquivo)
*fim da function cwdbPoeEmpresa()


*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções de Arquivos (dos)                                              **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*
function cwDelete(wDelArq)
*******************************************************************************
* deleta arquivos do diretorio  (idem ao del ou erase do DOS)                 *
* warq    = > nome do arquivo a ser deletado                                  *
* ex.:  cwdelete("dct01.dbf")                                                  *
*       cwdelete("dct*.*")                                                     *
*       cwdelete("ict01*.ntx")                                                 *
*******************************************************************************
Local wxArq,wx

   If ValType(wDelArq) <> "C"
      cCancel(" cwDelete() - 1 - Parâmetro inválido ou não informado")
   EndIf

   wxArq := LFNDIRECTORY(wDelArq)
   For wx := 01 To Len(wxArq)
      fErase(wxArq[wx,F_NAME])
   Next

return .t.
*fim da function cwDelete()

function cwPath(wDBF)
*******************************************************************************
* funcao para montar o path (caminho) atraves do arquivo dpath.dbf            *
* wdb     => variavel que contem o nome do arquivo                            *
*            ex: wpath = cwPath("dca01")        ==> "\c\sct\"                 *
*******************************************************************************
Local wScan,wPath

   *------------------ verifica a existencia de redireciomento de PATH -------*
   wDBF  := Lower(AllTrim(wDBF))
   wScan := aScan(wc_path,wDBF)      // localiza o DB na tabela
   if wScan = 0                      // se NAO achou o DB na tabela procura o path generico "*"
      wScan := aScan(wc_Path,"*")    // localiza o path generico "*"
   EndIf
   wPath := AllTrim(iif(wScan=0,Space(00),SubStr(wc_path[wScan],9)))
   *--------------------------------------------------------------------------*

return wPath
* fim da function cwPath

Function cBuscaDir(wArquivo,wCaminho,wVar)
*******************************************************************************
*                             Pasta de arquivos                               *
*******************************************************************************
Local wRetorno

   wArquivo := AllTrim(wArquivo)
   wCaminho := iif(cEmpty(wCaminho),nil,AllTrim(StrTran(wCaminho,"/","\")))
   wRetorno := cGetFile32( wArquivo, "Pesquisa de arquivos..." ,,wCaminho) //cGetFile32( <cFileMask>, <cTitle>, [<nDefaultMask>], [<cInitialDirectory>], [lSave], [nFlags], [cInitialFile] )  \\ <cFileName>

   If cNvl(wVar,.F.)
	   wCaminho := Campo(wRetorno)
	   wCaminho := StrTran(wCaminho,"'",'"')
	   wRetorno := wCaminho
   EndIf

Return wRetorno
* fim da Function cBuscaDir()


*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções de Data e Hora                                                 **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*
function cwSomaMes(wwparm1,wwparm2)
********************************************************
* funcao somar n meses em uma data                     *
* wwparm1 => (date) data original a ser incrementada   *
* wwparm2 => (num) quantidade de meses a incrementar   *
* ex:                                                  *
*    wwdatax = cwsomames(wdata,5)                       *
*    a resposta sera a data original + 5 (meses)       *
********************************************************
Local wwdia,wwmes,wwano,wwsomaano,wwsomames,wwresp

   wwSomaAno := int(wwparm2/12)
   wwSomaMes := wwparm2 - (wwsomaano*12)
   wwDia     := day(wwparm1)
   wwMes     := month(wwparm1) + wwsomames
   wwAno     := year(wwparm1) + wwsomaano
   if wwMes < 1
      wwMes  := wwmes + 12
      wwAno  := wwano - 01
   elseif wwmes > 12
      wwmes  := wwmes - 12
      wwano  := wwano + 01
   EndIf

   if StrZero(wwMes,2,0) $ "04.06.09.11" .and. wwDia > 30
      wwdia := 30
   elseif wwMes = 02
      if wwano/4 = int(wwano/4) .and. wwdia > 29
         wwdia := 29
      elseif wwdia > 28
         wwdia := 28
      EndIf
   EndIf

   wwresp := ctod(str(wwdia,2,0)+"/"+str(wwmes,2,0)+"/"+str(wwano,4,0) )

return wwresp
*fim da function cwSomaMes()

function cwIniMes(wData)
********************************************************
* funcao determinar o primeiro dia do mes              *
* wparm1 => (date) data qualquer                       *
* ex:                                                  *
*    wdata  = ctod("12/05/90")                         *
*    wdatax = cwinimes(wdata)   =>  01/05/90            *
********************************************************
Local wMes,wAno,wResp

   wMes  := Str(month(wData),2,0)
   wAno  := Str(year(wData),4,0)
   wResp := CtoD("01/" + wMes + "/" +wAno)   //  1º Dia do mes seguinte

return wResp
*fim da function cwIniMes(wData)

function cwFimMes(wData)
********************************************************
* funcao determinar o ultimo dia do mes                *
* wparm1 => (date) data qualquer                       *
* ex:                                                  *
*    wdata  = ctod("12/05/90")                         *
*    wdatax = cwfimmes(wdata)   =>  31/05/90            *
********************************************************
Local wresp

   wData := cwSomaMes(wData,1)  // Acrescenta  1 (hum) mes na data
   wResp := cwIniMes(wData)     // Inicio do mes
   wResp := wResp - 1            // 1º Dia do mes seguinte - 1 (hum)

return wresp
*fim da function cwFimMes(wData)

function cMes(wMes,widioma)
****************************************************************************
* retorna o nome do mes                                                    *
* wwmes => numero do mes (1..12)                                           *
* widioma => idioma em que sera respondido (0-portugues) (1-ingles)        *
****************************************************************************
Local wMesExt[12]

   if ValType(wMes)="D"
      wMes := Month(wMes)
   elseif ValType(wMes) = "C"
      wMes := Val(wMes)
   elseif ValType(wMes) = "N"
      wMes := wMes
   else
      wMes := 0
   endif

   if wMes<1 .Or. wMes>12
      return "*********"
   endif

   if ValType(wIdioma)="U"
      wIdioma := 0
   endif

   if widioma <> 1    && portugues
      wMesExt[01] := "Janeiro"
      wMesExt[02] := "Fevereiro"
      wMesExt[03] := "Março"
      wMesExt[04] := "Abril"
      wMesExt[05] := "Maio"
      wMesExt[06] := "Junho"
      wMesExt[07] := "Julho"
      wMesExt[08] := "Agosto"
      wMesExt[09] := "Setembro"
      wMesExt[10] := "Outubro"
      wMesExt[11] := "Novembro"
      wMesExt[12] := "Dezembro"
   else                         // Ingles
      wmesext[01] = "January"
      wmesext[02] = "February"
      wmesext[03] = "March"
      wmesext[04] = "April"
      wmesext[05] = "May"
      wmesext[06] = "June"
      wmesext[07] = "July"
      wmesext[08] = "August"
      wmesext[09] = "September"
      wmesext[10] = "October"
      wmesext[11] = "November"
      wmesext[12] = "December"
   endif

return wMesExt[wMes]
*fim da function cMes()

function cdsemana(wData)
************************************************************************
* determina qua o dia da semana por extenso com o FEIRA (SEGUNDA FEIRA)*
* wwfdata    => (DATA) data a ser extraida                             *
************************************************************************
Local wdia,wsem[7]

   wDia := Dow(wData)
   wDia := iif(ValType(wDia)<>"N",1,wDia)

   wSem[1] := "Domingo"
   wSem[2] := "Segunda-Feira"
   wSem[3] := "Terça-Feira"
   wSem[4] := "Quarta-Feira"
   wSem[5] := "Quinta-Feira"
   wSem[6] := "Sexta-Feira"
   wSem[7] := "Sábado"

   If wdia<1 .or. wdia>7
      wdia := 1
   EndIf

return wSem[wdia]
*fim da function cdsemana()

function cIniMes(wparm1)
********************************************************
* funcao determinar o primeiro dia do mes              *
* wparm1 => (date) data qualquer                       *
* ex:                                                  *
*    wdata  = ctod("12/05/90")                         *
*    wdatax = cIniMes(wdata)   =>  01/05/90            *
********************************************************
Local wmes,wano,wresp

   wmes  := str(month(wparm1),2,0)
   wano  := str(year(wparm1),4,0)
   wresp := ctod("01/" + wmes + "/" +wano)   &&  1§ dia do mes seguinte

return wresp
*fim da function cIniMes()

function cFimMes(wparm1)
********************************************************
* funcao determinar o ultimo dia do mes                *
* wparm1 => (date) data qualquer                       *
* ex:                                                  *
*    wdata  = ctod("12/05/90")                         *
*    wdatax = cFimMes(wdata)   =>  31/05/90            *
********************************************************
Local wmes,wano,wresp

   wparm1 := cSomaMes(wparm1,1)  && acrescenta  1 (hum) mes na data
   wresp  := cIniMes(wparm1)     && inicio do mes
   wresp  := wresp - 1            &&  1§ dia do mes seguinte - 1 (hum)

return wresp
*fim da function cFimMes

function cSomaMes(wwparm1,wwparm2)
********************************************************
* funcao somar n meses em uma data                     *
* wwparm1 => (date) data original a ser incrementada   *
* wwparm2 => (num) quantidade de meses a incrementar   *
* ex:                                                  *
*    wwdatax = cSomaMes(wdata,5)                       *
*    a resposta sera a data original + 5 (meses)       *
********************************************************
Local wwdia,wwmes,wwano,wwsomaano,wwsomames,wwresp

   wwSomaAno := int(wwparm2/12)
   wwSomaMes := wwparm2 - (wwsomaano*12)
   wwDia     :=   day(wwparm1)
   wwMes     := month(wwparm1) + wwsomames
   wwAno     :=  year(wwparm1) + wwsomaano
   if     wwMes < 1
      wwMes := wwMes + 12
      wwAno := wwAno - 1
   elseif wwMes > 12
      wwMes := wwMes - 12
      wwAno := wwAno + 1
   endif

   if strzero(wwmes,2,0) $ "04.06.09.11" .and. wwdia > 30
      wwdia := 30
   elseif wwmes = 02
      if wwano/4 = int(wwano/4) .and. wwdia > 29
         wwdia := 29
      elseif wwdia > 28
         wwdia := 28
      endif
   endif

   wwresp := cTod(str(wwdia,2,0)+"/"+str(wwmes,2,0)+"/"+str(wwano,4,0) )

return wwresp
*fim da function cSomaMes()

Function  cSomaHora(wHora1,wSinal,wHora2)
*******************************************************************************
*          funcao para fazer calculo (soma e subtracao) entre horas           *
*wHora1 =>  caracter"+000:00"  hora a ser somada                              *
*wHora2 =>  caracter"+000:00"  hora a ser somada                              *
*           ex:                                                               *
*               cSomaHora("+08:40","-09:10")     =>     -01:30                *
*******************************************************************************
Private wresp,wx1,wx2,wy1,wy2,wHora1H,wHora1M,wHora2H,wHora2M
//Private wHora1,wSinal,wHora2

//wHora1 := "9000000:10"
//wSinal := "+"
//wHora2 := "30000:00"

   wHora1  := strtran(wHora1,".","")
   wHora2  := strtran(wHora2,".","")

   wSinal  := val(wSinal + "01")
   wHora1  := strzero(       val(strtran(strtran(wHora1,":",".")," ","")),19,2)
   wHora2  := strzero(wSinal*val(strtran(strtran(wHora2,":",".")," ","")),19,2)   // coloca o Sinal na wHora2

   wHora1H := val(SubStr(wHora1,02,15))
   wHora2H := val(SubStr(wHora2,02,15))
   wHora1M := val(SubStr(wHora1,18,02))
   wHora2M := val(SubStr(wHora2,18,02))

   If SubStr(wHora1,1,1) = SubStr(wHora2,1,1)
      * soma
      wSinal := If(SubStr(wHora1,1,1)="0","+","-")
      wx1    := wHora1H + wHora2H
      wx2    := wHora1M + wHora2M
      wy2    := wx2 - int(wx2/60)*60
      wy1    := wx1 + int(wx2/60)
   Else
      * subtracao
      If (wHora1H+(wHora1M/100))  >  (wHora2H+(wHora2M/100))
         wSinal  := If(SubStr(wHora1,1,1)="0","+","-")
      Else
         wSinal  := If(SubStr(wHora2,1,1)="0","+","-")
         wHora2H := val(SubStr(wHora1,02,15))     // inverte ap posicao
         wHora1H := val(SubStr(wHora2,02,15))
         wHora2M := val(SubStr(wHora1,18,02))
         wHora1M := val(SubStr(wHora2,18,02))
      EndIf

      If wHora1M >= wHora2M
         wx1 := wHora1H - wHora2H
         wx2 := wHora1M - wHora2M
      Else
         wx1 := cwModulo(wHora2H - wHora1H) - 1
         wx2 := (wHora1M + 60) - wHora2M
      EndIf

      wy1 := cwModulo(wx1)
      wy2 := cwModulo(wx2)

   EndIf
   wSinal := iIf(wy1+wy2=0," ",wSinal)   // se For zero nao tem sinal

// wResp  := wSinal + StrZero(wy1,4,0)             + ":" + strzero(wy2,2,0)

If wy1 <10000
   wResp  := wSinal + StrZero(wy1,4,0)             + ":" + strzero(wy2,2,0)
Else
// wResp  := wSinal + AllTrim(cStrPonto(wy1,19,0)) + ":" + strzero(wy2,2,0)
   wResp  := wSinal + AllTrim(cStr     (wy1,19,0)) + ":" + strzero(wy2,2,0)
EndIf
Return wResp
*fim da Function cSomaHora()

Function cwSomaHora(whora1,wsinal,whora2)
*******************************************************************************
*          funcao para fazer calculo (soma e subtracao) entre horas           *
*whora1 =>  caracter"+000:00"  hora a ser somada                              *
*whora2 =>  caracter"+000:00"  hora a ser somada                              *
*           ex:                                                               *
*               csomahora("+08:40","-09:10")     =>     -01:30                *
*******************************************************************************
Return cSomaHora(whora1,wsinal,whora2)
*fim da Function cwSomaHora()

Function cSomaDataHora(wData1,wHora1,wsinal,wData2,wHora2)
*******************************************************************************
*          funcao para fazer calculo (soma e subtracao) entre datas e horas   *
*wData1 =>  Date 29/12/2005   Data inicial                                    *
*wHora1 =>  caracter"10:25"   Hora inicial                                    *
*wData2 =>  Date 31/12/2005   Data final                                      *
*wHora2 =>  caracter"15:00"   Hora final                                      *
* Retorna {wSinal,wHoras,wMinutos}                                            *
* ex: cSomaDataHora(ctod("31/12/2005"),"15:00","-",ctod("29/12/2005"),"10:25")   =>     {"+",52,35}
*******************************************************************************
Local wSomaHora,wRespSinal,wRespHora,wRespMin,wRespTotMin,wDifDias,wDifMin,wDifTotMin

wSomaHora   := cSomaHora(whora1,wsinal,whora2)  // "+0001:25"

//wRespSinal  :=     substr(wSomaHora,1,1)
//wRespHora   := Val(substr(wSomaHora,2,3)) 
//wRespMin    := Val(substr(wSomaHora,6,2)) 
//wRespTotMin := (wRespHora*60) + wRespMin

wRespSinal  :=     substr(wSomaHora,1,1)
wRespHora   := Val(substr(wSomaHora,2,4)) 
wRespMin    := Val(substr(wSomaHora,7,2)) 
wRespTotMin := (wRespHora*60) + wRespMin
                          
If .not. cEmpty(wData1)
   wDifDias := wData2 - wData1 
   wDifMin  := (wDifDias * 24) * 60
   
   If wRespSinal = "-"
      wDifTotMin := wDifMin + wRespTotMin 
   Else
      wDifTotMin := wDifMin - wRespTotMin 
   EndIf

   wRespHora   := Int(wDifTotMin / 60)
   wRespMin    := round( ( (wDifTotMin/60) - Int(wDifTotMin/60)) * 60 ,0)
   If wDifTotMin < 0
      wRespHora   := wRespHora *-1
      wRespMin    := wRespMin  *-1
   EndIf   

   If wData1 < wData2
      wRespSinal  := "-"
   Else
      wRespSinal  := "+"
   EndIf

EndIf
return {wRespSinal,wRespHora,wRespMin}
*Function cSomaDataHora(wData1,wHora1,wsinal,wData2,wHora2)

function cdiapmes
parameters wparm1,wparm2
private wdias,wmes,wano
   ****************************************************************************
   * retorna a quantidade de dias do mes inforamdo                            *
   * wparm1 =>  mes (01..12)  ou   uma data                                   *
   * wparm2 =>  ano (caso parm1 nao seja uma data)                            *
   ****************************************************************************
   if type('wparm1')='D'
      wmes = month(wparm1)
      wano = year(wparm1)
      if wmes = 0
         ccancel('funcao "Cdiapmes" data invalida: ' +ctod(wparm1))
      endif
   elseif type('wparm1') = "N"
      wmes = wparm1
      wano = if(type('wparm2')="U",1,wparm2)
   else
      return .f.
   endif

   declare wdias[12]
   wdias[01] = 31
   wdias[02] = 28
   wdias[03] = 31
   wdias[04] = 30
   wdias[05] = 31
   wdias[06] = 30
   wdias[07] = 31
   wdias[08] = 31
   wdias[09] = 30
   wdias[10] = 31
   wdias[11] = 30
   wdias[12] = 31

   if wmes = 2
      if wano/4 = int(wano/4)
         wdias[02] = 29
      else
         wdias[02] = 28
      endif
   endif
return wdias[wmes]
*fim da function cdiapmes

function cqtdmes
parameters wwparm1,wwparm2
private wqtdmes1,wqtdmes2,wtotmes
*************************************************************
* funcao para determinar quantos meses tem entre duas datas *
* wwparm1 => (date) data inicial                            *
* wwparm2 => (date) data final                              *
* ex:                                                       *
*       data1 = 22/03/89         data2 = 15/04/91           *
*                                                           *
* wwqtdmeses = cqtdmes(data1,data2)                         *
* a resposta sera a   25  (meses)                           *
*                                                           *
* wwqtdmeses = cqtdmes(data2 ,data1  )                      *
* a resposta sera a  -25  (meses)                           *
*************************************************************
   wqtdmes1 = (month(wwparm1) - 12) + 12
   wqtdmes2 = (month(wwparm2) - 12) + 12
   wtotmes  = (year(wwparm2)-year(wwparm1)) * 12
   wtotmes  = wtotmes + (wqtdmes2 - wqtdmes1)
return wtotmes
*fim da function cqtdmes

Function cCalc_Idade(wDataNasc,wDataAtual,wOpcao)
**************************************************************************************
*  Funcao para calcular a qtde de anos, meses e dias entre duas datas                *
* wDataNasc =>  Data inicial ctod("18/03/64")                                        *
* wDataAtual=>  Data Atual   ctod("15/08/05")                                        *
* wOpcao=> 0 // retorna matrix completa {wTxt_Dia,wTxt_Mes,wTxt_Ano,wTxt_Msg}        *
*          1 // retorna wTxt_Dia                                                     *
*          2 // retorna wTxt_Mes                                                     *
*          3 // retorna wTxt_Ano                                                     *
*          4 // retorna wTxt_Msg                                                     *
* Ex:           cCalc_Idade(ctod("18/03/64"),ctod("20/08/05"))                       *
*                          => {02,05,41,"41 Anos, 5 Meses e 2 Dias"}                 *
**************************************************************************************
Local wAno,wMes,wDia,wAno1,wMes1,wDia1,wAno2,wMes2,wDia2,wTxt_Dia,wTxt_Mes,wTxt_Ano,wTxt_Msg,wReturn

   wDataAtual := iIf(ValType(wDataAtual)="U",cDate(),wDataAtual)
   wOpcao     := iIf(ValType(wOpcao)="U",0,wOpcao)

   If cEmpty(wDataNasc)
      Return {00,00,00,"Data de Nascimento não informada"}
   Endif
   If cEmpty(wDataAtual)
      Return {00,00,00,"Data atual não informada"}
   Endif
   If wDataNasc > wDataAtual
      Return {00,00,00,"Data de Nascimento maior que data atual"}
   Endif


   wAno1 := year (wDataNasc)
   wMes1 := month(wDataNasc)
   wDia1 := day  (wDataNasc)

   wAno2 := year (wDataAtual)
   wMes2 := month(wDataAtual)
   wDia2 := day  (wDataAtual)
   
   wAno := wAno2 - wAno1
   wMes := wMes2 - wMes1
   wDia := wDia2 - wDia1

   If wMes < 0 
      wAno := (wAno2 - wAno1) -1
      wMes := 12 - (wMes1-wMes2)
   EndIf

   If wDia < 0 
      If wMes = 0 
         wAno := (wAno2 - wAno1) -1
         wMes := 11
       Else
         wMes  := wMes - 1
       EndIf
      wDia := iif(wMes2=1,cDiapMes(12,wAno2-1),cDiapMes(wMes2-1,wAno2)) - (wDia1-wDia2)
   EndIf

   wTxt_Dia := + iif(wDia=0,"",alltrim(Str(wDia))+" Dia"+iif(wDia>1,"s",""))
   wTxt_Mes := + iif(wMes=0,"",alltrim(Str(wMes))+" Mes"+iif(wMes>1,"es",""))
   wTxt_Ano := + iif(wAno=0,"",alltrim(Str(wAno))+" Ano"+iif(wAno>1,"s",""))
   if wDia=0 .and. wMes=0
      //wTxt_Msg := "Parabens!! Hoje você completa " + wTxt_Ano
      wTxt_Msg := wTxt_Ano
   Else
      wTxt_Msg := wTxt_Ano + iif(wMes=0,"",iif(wAno=0,"",iif(wDia=0," e ",", "))+wTxt_Mes) + iif(wDia=0,"",iif(wAno=0.and.wMes=0,""," e ")+wTxt_Dia)
   EndIf   

If     wOpcao = 0 // retorna matrix completa {wTxt_Dia,wTxt_Mes,wTxt_Ano,wTxt_Msg}
   wReturn := {wTxt_Dia,wTxt_Mes,wTxt_Ano,wTxt_Msg}
ElseIf wOpcao = 1 // retorna wTxt_Dia
   wReturn := wTxt_Dia
ElseIf wOpcao = 2 // retorna wTxt_Mes
   wReturn := wTxt_Mes
ElseIf wOpcao = 3 // retorna wTxt_Ano
   wReturn := wTxt_Ano
ElseIf wOpcao = 4 // retorna wTxt_Msg
   wReturn := wTxt_Msg
EndIf
Return wReturn
*Fim Function cCalc_Idade(wDataNasc,wDataAtual,wOpcao)

Function cDataExtenso(wDate)
*******************************************************************************
*                         Formata DATA para String                            *
*******************************************************************************
wDate := iIf(ValType(wDate)<>"D",DATE(),wDate)
Return cdsemana(wDate) + ", " + Str(Day(wDate),2) + " de " + cMes(wDate) + " de " + Str(Year(wDate),4)

Function cDate()
*******************************************************************************
*                            Pega data do Servidor                            *
*******************************************************************************
Local wData,wResp

	If wc_SQL_tp = "M"
   	wResp := fConnect_Tabela("ccase_prp","select curdate()")

	   If Len(wResp)>0
	      wData := wResp[1,1]
	      wData := SubStr(wData,9,2)+"/"+SubStr(wData,6,2)+"/"+SubStr(wData,1,4)
	      wData := cTod(wData)
	   Else
	      wData := DATE()
	   EndIf
   Else
	   wResp := fConnect_Tabela("ccase_prp","select getdate()")

	   If Len(wResp)>0
	      wData := wResp[1,1]
	      wData := SubStr(wData,9,2)+"/"+SubStr(wData,6,2)+"/"+SubStr(wData,1,4)
	      wData := cTod(wData)
	   Else
	      wData := DATE()
	   EndIf
   EndIf

Return wData
* fim da function cDate()

Function cTime()
*******************************************************************************
*                          Pega Hora do Servidor                              *
*******************************************************************************
Local wTime,wResp

   wResp := fConnect_Tabela("ccase_prp","select curtime()")
   If Len(wResp)>0
      wTime := wResp[1,1]
   Else
      wTime := TIME()
   EndIf
   wTime := Substr(AllTrim(wTime),1,5)
Return wTime
* fim da function cTime()

Function dDateToString(dDate)
*******************************************************************************
*                         Formata DATA para String                            *
*******************************************************************************
dDate := iIf(ValType(dDate)<>"D",cDate(),dDate)
Return cdsemana(dDate) + ", " + Str(Day(dDate),2) + " " + cMes(dDate) + " " + Str(Year(dDate),4)
* Fim da Function dDateToString(dDate)

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Montar Telas                                                   **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

function cbox(wwlinha,wwcoluna,wwtexto,wwsize1,wwsize2,wwoDlg,wwtipo)
*******************************************************************************
*                       funcao para montar box na tela                        *
*******************************************************************************
Local wpix , wx , wlinb , wcolb , wlint , wcolt , wsize1 , wsize2 , wvar

   wlinb  := (wwlinha - 0.75)    // define linha inicial do box                                
   wcolb  := (wwcoluna)          // define coluna inicial do box                               
   wlint  := ((wwlinha-1)*13)+2  // define linha inicial do texto                              
   wcolt  := (wwcoluna*8)+2      // define coluna inicial do texto                             
   wsize1 := wwsize1             // define o comprimento do box                             
   wsize2 := wwsize2             // define a altura do box                                  

   wpix   := 0                   // define o comprimento do pixel                               

   if     wwtipo = 1
      @wlinb,wcolb say ""  of wwoDlg size wsize1,wsize2  box
   elseif wwtipo = 2
      @wlinb,wcolb say ""  of wwoDlg size wsize1,wsize2  shadow
   elseif wwtipo = 3
      @wlinb,wcolb say ""  of wwoDlg size wsize1,wsize2  raised
   endif

   for wx := 01 To Len(wwtexto)                              // calcula o comprimento do pixel   
       wvar := substr(wwtexto,wx,1)                                                            

      if wvar $ "iIjl!.ºí"
         wpix := wpix + 1
      elseif wvar $ "trf "
         wpix := wpix + 2
      elseif wvar $ "yzxqaLbcdZenopFghsTuJkv0123456789çãê ˆ"+chr(63)
         wpix := wpix + 3
      elseif wvar $ "ODPYENCBAQGHRSUVKXÓÉ"
         wpix := wpix + 4
      elseif wvar $ "mwM"
         wpix := wpix + 5
      elseif wvar $ "W"
         wpix := wpix + 6
      endif
   next
   wpix := (wpix+(len(wwtexto)/2))                                                             

   @wlint,wcolt say wwtexto  size wpix,08 pixel of wwoDlg  //mostra o conteudo do texto na tela
   wwoDlg:refresh()

return .t.
*fim da function cbox()

Function cColorText(wTextoColor)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wNumColor

   wTextoColor := cUpper(AllTrim(cNvl(wTextoColor,"")))

   If cEmpty(wTextoColor)
     return nil
   EndIf

   If     wTextoColor = "AZUL"
      wNumColor := 8388608
   ElseIf wTextoColor = "AZUL2"
      wNumColor := 16711680
   ElseIf wTextoColor = "VERMELHO"
      wNumColor := 255
   ElseIf wTextoColor = "VERDE"
      wNumColor := 32768
   ElseIf wTextoColor = "AMARELO"
      wNumColor := 65535
   ElseIf wTextoColor = "BRANCO"
      wNumColor := 16777215
   ElseIf wTextoColor = "PRETO"
      wNumColor := 0
   ElseIf wTextoColor = "WINDOWS"
      wNumColor := GetSysColor(15)
   EndIf

Return wNumColor
*fim da Function cColorText(wTextoColor)

Function cColorRBG(wVermelho,wVerde,wAzul)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wNumColor

   If ValType(wVermelho)<>"N"
      wVermelho := 0
   EndIf
   If ValType(wVerde)<>"N"
      wVerde := 0
   EndIf
   If ValType(wAzul)<>"N"
      wAzul := 0
   EndIf

Return nRGB(wVermelho,wVerde,wAzul)
*fim da Function cColorRBG(wVermelho,wVerde,wAzul)

Function cBuscaCor()
*******************************************************************************
*                            Abre opção de cores                              *
*******************************************************************************
Return ChooseColor(0)  // Cor padrão preto
* fim da Function cBuscaCor()

Function cBuscaFont()
*******************************************************************************
*                    Abre opção para configuração da Font                     *
* Parâmetros: 01 - HEIGHT                                                     *
*             02 - WIDTH                                                      *
*             03 - ESCAPEMENT                                                 *
*             04 - ORIENTATION                                                *
*             05 - NEGRITO (WEIGHT)                                           *
*             06 - ITALIC                                                     *
*             07 - UNDERLINE                                                  *
*             08 - STRIKEOUT                                                  *
*             09 - CHARSET                                                    *
*             10 - OUTPRECISION                                               *
*             11 - CLIPPRECISION                                              *
*             12 - QUALITY                                                    *
*             13 - PITCHANDFAMILY                                             *
*             14 - FACENAME                                                   *
*             15 - COR                                                        *
*******************************************************************************
Local wColor,wMatriz,wx
   
   wMatriz := {10,0,0,0,.F.,.F.,.F.,.F.,0,0,0,0,0,"Arial"}
   wMatriz := ChooseFont(wMatriz,@wColor)

   If wColor = nil
   	Return {}
   EndIf

   aAdd(wMatriz,wColor)

   for wx := 01 to Len(wMatriz)
      If wx = 5
      	If wMatriz[wx] = 700
      		wMatriz[wx] := "S"
      	Else
      		wMatriz[wx] := "N"
      	EndIf
      ElseIf wx >= 06 .And. wx <= 08
      	wMatriz[wx] := iif(wMatriz[wx],"S","N")
   	EndIf
   next

Return wMatriz
* fim da Function cBuscaCor()


*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções para estruturas contabeis                                      **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*
function ffcpoezero(wconta,wstru)
***********************************************************************************
* poe os zeros (0) a direita da conta. ex: 12345 = 1234500000                     *
* wconta  => (cha) numero da conta (sem ponto) que sera tirado os zeros a direita *
* sera usado uma variavel publica ( wce1pcstru ) que contem a estrutura da conta  *
***********************************************************************************
Local wTemPonto,wLen

   If ValType(wstru)="U"
      wstru := wc_stru_pc //wce1pcstru
   EndIf
  
   if cEmpty(wstru)
      wstru  := Space(00)
   endif
  
   wtemponto := At(".",wconta)
   wconta    := ffctiraponto(trim(wconta),wstru)
   wlen      := Len(ffctiraponto(wstru,wstru))
   wconta    := wconta+"000000000000000000000000000000000000000"
   wconta    := SubStr(wConta,1,wlen)
   if wtemponto > 0                        // se nao tinha ponto entao tira (para devolver no mesmo formato)
      wconta := ffcpoeponto(wconta,wstru)
   endif

return Trim(wconta)
*fim da function ffcpoezero()

function ffcPoePonto(wConta,wStru)
***********************************************************************************
* Coloca pontos "." em uma conta contabil                                         *
* wconta  => (cha) numero da conta que sera colocado os pontos "."                *
* sera usado uma variavel publica ( wstru ) que contem a estrutura da conta *
***********************************************************************************
Local wpos,wwstru,wxlen

   If Valtype(wStru) = "U"
      wstru := wc_stru_pc //wce1pcstru
   EndIf

   If cEmpty(wStru)
      wStru := Space(00)
   EndIf

   wconta := trim(wconta)
   if at(".",wconta) > 0   //  se ja tiver ponto ele tira depois poe
      wconta := ffctiraponto(wConta,wStru)
   endif

   wwstru := AllTrim(wStru)
   wconta := wconta+"000000000000000000000000000000000000000"
   wxlen := Len(wwstru)
   Do While At(".",wwstru) > 0
      wPos   := At(".",wwstru)
      wwStru := SubStr(wwstru,1,wpos-1) +"-"+ substr(wwstru,wpos+1,wxlen)
      wConta := SubStr(wconta,1,wpos-1) +"."+ substr(wconta,wpos,wxlen)
   enddo

   wconta := substr(wconta,1,len(wwstru))
return Trim(wconta)
*fim da function ffcpoeponto()

function ffctirazero(wconta,wstru)
***********************************************************************
* tira os zeros (0) a direita da conta. ex: 1.2.3.45.00.000 = 1.2.3.45*
* wconta  => (cha) numero da conta que sera tirado os zeros a direita *
***********************************************************************
Local wPos1,wPos2,wNivelx,wTemPonto

   if ValType(wStru)="U"
      wstru := wc_stru_pc //wce1pcstru
   endif

   If cEmpty(wStru)
      wstru := Space(00)
   EndIf

   if val(wconta) = 0   && se for zero retorna
      return wconta
   endif

   wconta     := trim(wconta)
   wtemponto  := At(".",wconta)
   wconta     := ffcpoeponto(wconta,wstru) + "."
   do while .t.  //  a funcao rat() pesquisa da "direira" p/ "esquerda" (Right)
      wpos2   := rat(".",wconta)
      wconta  := substr(wconta,1,wpos2-1) +"-"+ substr(wconta,wpos2+1,32)   && troca o "." por "-"
      wpos1   := RAT(".",wconta)
      wnivelx := substr(wconta,wpos1+1,wpos2-wpos1-1)
      if val(wnivelx)=0
         wconta : substr(wconta,1,wpos1)
      else
         wconta := substr(wconta,1,wpos2-1) +"."+ substr(wconta,wpos2+1,32)   && troca o "-" por "."
         wconta := substr(wconta,1,len(wconta)-1)
         Exit
      endif
   enddo

   if wtemponto = 0    && se nao tinha ponto entao tira (para devolver no mesmo formato)
      wconta := ffctiraponto(wconta,wstru)
   endif

return Trim(wconta)
*fim da function ffctirazero

function ffctiraponto(wConta,wStru)
***********************************************************************
* elimina os pontos "." de uma conta contabil                         *
* wconta  => (cha) numero da conta que sera tirado os pontos "."      *
***********************************************************************
Local wpos

   if ValType(wStru)="U"
      wstru := wc_stru_pc //wce1pcstru
   endif

   if cEmpty(wStru)
      wStru := wc_stru_pc //wce1pcstru
   endif

   wconta := Trim(wconta)
   wpos   := At(".",wconta)

   Do While wpos > 0
      wPos   := At(".",wconta)
      wConta := SubStr(wconta,1,wpos-1) + substr(wconta,wpos+1,32)
   EndDo

return trim(wconta)
*fim da function ffctiraponto()

function ffcnivelconta(wconta,wstru)
***********************************************************************
* determina os niveis: anterior,atual e posterior de uma conta        *
* wconta   => (cha 10) valor a ser calculado                          *
***********************************************************************
private wwconta,wcontax,wwcontax,wnivelx,wx,wult,wpenult,wantpenult , wtemponto, wpos1, wpos2
private wprocresp1 ,wprocresp2 , wprocresp2 , wprocresp3 , wprocresp4 , wprocresp5

   if pcount() = 1
      wstru :=  wc_stru_pc //wce1pcstru
   endif
   wconta    := trim(wconta)
   wtemponto := at(".",wconta)
   declare wcontax[17]
   declare wnivelx[17]
   afill(wnivelx,"")
   afill(wcontax,"")
   wconta   := ffcpoeponto(wconta,wstru)
   wconta   := ffctirazero(wconta,wstru)
   wwconta  := "." + wconta + "."
   wconta   := ffctiraponto(wconta,wstru)
   wwcontax := space(00)
   wx := 0
   do while at(".",wwconta) > 0
      wx      := wx + 1
      wpos1   := at(".",wwconta)
      wwconta := substr(wwconta,1,wpos1-1) +"-"+ substr(wwconta,wpos1+1,32)   && troca o "." por "-"
      if at(".",wwconta) = 0
         wx := wx - 1
         exit
      endif
      wpos2       := at(".",wwconta)
      wnivelx[wx] := substr(wwconta,wpos1+1,wpos2-wpos1-1)
      wwcontax    := wwcontax + wnivelx[wx]
      wcontax[wx] := wwcontax
   enddo

   if wx > 1
      wult        := wx             // o ultimo       nivel da conta informada (despresando os zeros)
      wpenult     := wx-1           // o penultimo    nivel da conta informada (despresando os zeros)
      wantpenult  := wx-2           // o antpenultimo nivel da conta informada (despresando os zeros)
   else                             // quando so tiver um nivel
      wult        := wx             // o ultimo       nivel da conta informada (despresando os zeros)
      wpenult     := 17             // o penultimo    nivel da conta informada (despresando os zeros)
      wantpenult  := 17             // o antpenultimo nivel da conta informada (despresando os zeros)
      wnivelx[17] := wnivelx[1]
      wcontax[17] := wcontax[1]
   endif

   wprocresp1 := ffcpoezero( alltrim(str(val(wcontax[wpenult])-1,32,0)) ,wstru)                   && um nivel abaixo dele.             ex:1.2.3.03.00.000 =>1.2.2.00.00.000",wprocresp1
   wprocresp2 := ffcpoezero( wcontax[wpenult] ,wstru)                                             && o nivel dele ou o menor item dele ex:1.2.3.04.00.000 =>1.2.3.00.00.000",wp
   if wx > 1
      wprocresp3 := ffcpoezero( wcontax[wpenult] + substr("9999999999",1,len(wnivelx[wult])) ,wstru) && o maior nivel dele                ex:1.2.3.03.00.000 =>1.2.3.99.00.000",wprocresp3
   else
      wprocresp3 := ffcpoezero("9",wstru)
   endif
   wprocresp4 := ffcpoezero( alltrim(str(val(wcontax[wpenult])+1,32,0)) ,wstru)                   && um nivel acima dele.              ex:1.2.3.04.00.000 =>1.2.4.00.00.000",wprocresp4
   wprocresp5 := ffcpoezero( alltrim(str(val(wcontax[wult])+1,32,0)) ,wstru)                      && a proxima conta                   ex:1.2.3.04.00.000 =>1.2.3.05.00.000",wprocresp5

   if wtemponto > 0    // se nao tinha ponto entao tira (para devolver no mesmo formato)
      wprocresp1 := ffcpoeponto( wprocresp1 ,wstru)   && um nivel abaixo dele.             ex:1.2.3.03.00.000 =>1.2.2.00.00.000",wprocresp1
      wprocresp2 := ffcpoeponto( wprocresp2 ,wstru)   && o nivel dele ou o menor item dele ex:1.2.3.04.00.000 =>1.2.3.00.00.000",wprocresp2
      wprocresp3 := ffcpoeponto( wprocresp3 ,wstru)   && o maior nivel dele                ex:1.2.3.03.00.000 =>1.2.3.99.00.000",wprocresp3
      wprocresp4 := ffcpoeponto( wprocresp4 ,wstru)   && um nivel acima dele.              ex:1.2.3.04.00.000 =>1.2.4.00.00.000",wprocresp4
      wprocresp5 := ffcpoeponto( wprocresp5 ,wstru)   && a proxima conta                   ex:1.2.3.04.00.000 =>1.2.3.05.00.000",wprocresp5
   endif

return .t.
*fim da ffcnivelconta(wconta,wstru)

//function fctchkconta(wconta)
//*******************************************************************************
//*          verifica se a conta contem niveis intermediarios com zero          *
//* ex:   1.1.00.01.001                                                         *
//*******************************************************************************
//local wx,w1,w2
//
//   for wx=ct1nivel to 2 step -1
//      wconta := ffcpoeponto(wconta)
//      w1     := wctnivel[wx-1] + 1
//      w2     := wctnivel[wx] - wctnivel[wx-1] -1
//      if val(substr(wconta,w1,w2))=0
//         return .f.
//      endif
//   next
//
//return .t.
//*fim da function fctchkconta()

function fctnivelconta(wconta,wctnivel)
*******************************************************************************
*         funcao para determinar o numenro do nivel da conta contabil         *
* ex: wconta = 1.1.01.000  ->  fctnivelconta(wconta) -> 3                     *
*******************************************************************************
local wx,w1,w2,wctniveltot

   wconta := ffcpoeponto(wconta)
   for wx=wctniveltot to 2 step -1
      w1 := wctnivel[wx-1] + 1
      w2 := wctnivel[wx] - wctnivel[wx-1] -1
      if val(substr(wconta,w1,w2))<> 0
         exit
      endif
   next

return wx
*fim da function fctnivelconta()

function fctnivelant(wconta)
Local   wpos
*******************************************************************************
*              funcao para determinar a conta sistentica anterior             *
*******************************************************************************
   wconta = ffctirazero(ffcpoeponto(wconta))
   wpos   = rat(".",wconta)
   wconta = substr(wconta,1,wpos-1)
   wconta = ffctirazero(ffctiraponto(wconta))
return wconta
*fim da function fctnivelant

function fctchkplano
//private wtela,werro,wconta,wcontar,wrecno,wcontax1,wcontax2
//*******************************************************************************
//*verifica a integrdade do plano de contas"                                    *
//*           se a conta contem niveis intermediarios com zero ex: 1.1.00.128   *
//*           se a conta (classificacao) esta em duplidade                      *
//*           se a conta (reduzida) esta em duplidade                           *
//*           se a conta sintetica anterior existe                              *
//*******************************************************************************
//   save screen to wtela
//   cselect(wdct01,1)
//   goto top
//   store space(15) to wcontax1,wcontax2
//   store .f.       to werro
//   do while.not. eof()
//      wrecno  = recno()
//      wconta  = ct1conta
//      wcontar = ct1contar
//
//      if .not. fctchkconta(wconta) &&  verifica se a conta contem niveis intermediarios com zero
//         wmsg = "Conta Contabil "+ffcpoeponto(wconta)+ " invalida"
//         //csaymsg()
//         //crodape1("Pressione qualquer Tecla para Continuar")
//         wait ""
//         werro = .t.
//         restore screen from wtela
//      endif
//
//      ** verifica se a conta (classificacao) esta em duplidade
//      cselect(wdct01,1)
//      seek wconta
//      skip
//      if ct1conta = wconta
//         wmsg = "Conta Contabil "+ffcpoeponto(wconta)+ " em duplicidade"
//         //csaymsg()
//         //crodape1("Pressione qualquer Tecla para Continuar")
//         wait ""
//         werro = .t.
//         restore screen from wtela
//      endif
//
//      ** verifica se a conta (redzida) esta em duplidade
//      cselect(wdct01,2)
//      seek wcontar
//      skip
//      if ct1contar = wcontar
//         wmsg = "Conta Contabil Reduzida "+alltrim(str(wcontar))+ " em duplicidade"
//         //csaymsg()
//         //crodape1("Pressione qualquer Tecla para Continuar")
//         wait ""
//         werro = .t.
//         restore screen from wtela
//      endif
//
//      cselect(wdct01,1)
//      goto wrecno
//
//      **  verifica se a conta sintetica anterior existe
//      if ct1nivel > 1 && nivel 1 nao tem conta sintetica anterior
//         wcontax1    = ffcpoezero(fctnivelant(ct1conta))  && o nivel anterior com ponto
//         if wcontax1 <> wcontax2   && se nao foi verificado nenhuma vez
//         ***wrecno = recno()
//            seek wcontax1  && localiza a sintetica anterior
//            if eof()
//               wmsg = "Conta Sintetica " +ffcpoeponto(wcontax1)+ " nao cadastrada"
//               //csaymsg()
//               //crodape1("Pressione qualquer Tecla para Continuar")
//               wait ""
//               werro = .t.
//               restore screen from wtela
//            endif
//            wcontax2 = wcontax1
//         ***** goto wrecno
//         endif
//      endif
//
//      cselect(wdct01,1)
//      goto wrecno
//      skip
//
//   enddo
//
//   if werro
//      ccancel("Plano de Contas invalido")
//   endif
//
return .t.
*fim da function fctchkplano

function fctchkconta(wConta,wNivel)
*******************************************************************************
*          verifica se a conta contem niveis intermediarios com zero          *
* ex:   1.1.00.01.001                                                         *
*******************************************************************************
Local wx,w1,w2

// for wx=ct1nivel to 2 step -1
   
   for wx := wNivel to 2 step -1
      wconta := ffcpoeponto(wconta)
      w1     := wctnivel[wx-1] + 1
      w2     := wctnivel[wx] - wctnivel[wx-1] -1
      if val(substr(wconta,w1,w2))=0
         return .f.
      endif
   next

return .t.
*fim da function fctchkconta

function cstrcontabil(wvalor,wlen,wdec)
*******************************************************************************************
* funcao para converter par "string" e colocar ponto e vigula em valores numerico*
* wvalor => (num) valor a ser convertido                                         *
* wlen   => (num) quantidade total de caracteres                                 *
* wdec   => (num) quantidade de casas decimais                                   *
* ex:                                                                            *
*    wvalor = 12345678.901              //  123456789012345678                   *
*    wvalor = cstrcontabil(wvalor,10,0) // "12.345.678"                          *
*    wvalor = cstrcontabil(wvalor,15,1) // "   12.345.678,9"                     *
*    wvalor = cstrcontabil(wvalor,14,2) // " 12.345.678,90"                      *
**********************************************************************************
Local wwvalor,wsinal,wwlen,wcentavos,w1,w2,w3,w4,w5,w6,w7,w8

   wvalor    := val(str(wvalor))   // para resolver "bug" na funcao int(xxxx) em variaveis acumuladas
   wdec      := cNvl(wdec,0)
   wwlen     := wlen
   wcentavos := ""

   if wdec > 0
      wcentavos := "," + substr(str(wvalor,wlen,wdec),wlen-wdec+1,wdec)
      wwlen     := wlen - (wdec + 1)
   endif
   if wvalor < 0
      wsinal := "-"
      wvalor := wvalor *-1
   else
      wsinal := " "
   endif

   wvalor := space(30) + str(int(wvalor),wwlen,0)
   wvalor := right(wvalor,30)
   w1 := substr(wvalor,30-02,3)
   w2 := substr(wvalor,30-05,3)
   w3 := substr(wvalor,30-08,3)
   w4 := substr(wvalor,30-11,3)
   w5 := substr(wvalor,30-14,3)
   w6 := substr(wvalor,30-17,3)
   w7 := substr(wvalor,30-20,3)
   w8 := substr(wvalor,30-23,3)

   wwvalor := " " + w8 + "." + w7 + "." + w6 + "." + w5 + "." + w4 + "." + w3 + "." + w2 + "." + w1 + wcentavos
   wwvalor := wsinal+ alltrim(substr(wwvalor,rat(" .",wwvalor)+2))
   wwvalor := space(30) + wwvalor
   wvalor  := right(wwvalor,wlen)
   if .not. ( alltrim(wwvalor) $ wvalor )
      wvalor := replicate("*",wlen)
   endif

   if wsinal = "-"
      wvalor := "(" + substr(alltrim(wvalor),2)
      wvalor := space(wlen-len(wvalor))+wvalor + ")"
   else
      wvalor := wvalor + " "
   endif

return wvalor
*fim da function cstrcontabil()







*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções para Caracteres/Numeros                                        **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*
function cstrponto(wvalor,wlen,wdec,wbranco)
*******************************************************************************************
* funcao para converter par "string" e colocar ponto e vigula em valores numerico*
* wvalor => (num) valor a ser convertido                                         *
* wlen   => (num) quantidade total de caracteres                                 *
* wdec   => (num) quantidade de casas decimais                                   *
* wbranco =>(cha) " " (branco) se for passado este parm. e o result. for 0 (zero)*
*           entao retorna' espacos em branco                                     *
* ex:                                                                            *
*    wvalor = 12345678.901             &&  123456789012345678                    *
*    wvalor = cstrponto(wvalor,10,0)   && "12.345.678"                           *
*    wvalor = cstrponto(wvalor,15,1)   && "   12.345.678,9"                      *
*    wvalor = cstrponto(wvalor,14,2)   && " 12.345.678,90"                       *
**********************************************************************************
Local wwvalor,wcentena,wsinal,w1,w2,w3,w4,w5,w6,w7,w8,wcentavos,wwlen

   If ValType(wvalor) = "C"
      Return wvalor
   EndIf   

   wvalor := Val(Str(wvalor,wLen,wDec))      // para resolver "bug" na funcao int(xxxx) em variaveis acumuladas  // cicero 12/07/99

   if wvalor=0 .And. ValType(wbranco)="C"
      Return Space(wlen)
   endif

   if ValType(wDec) = "U"
      wDec := 0
   endif

   wwlen     := wLen
   wcentavos := ""

   if wdec > 0
      wcentavos := "," + substr(str(wvalor,wlen,wdec),wlen-wdec+1,wdec)
      wwlen     := wlen - (wdec + 1)
   endif
   if wvalor < 0
      wsinal := "-"
      wvalor := wvalor *-1
   else
      wsinal := " "
   endif

   wvalor  := Space(30) + str(int(wvalor),wwlen,0)
   wvalor  := right(wvalor,30)
   w1      := substr(wvalor,30-02,3)
   w2      := substr(wvalor,30-05,3)
   w3      := substr(wvalor,30-08,3)
   w4      := substr(wvalor,30-11,3)
   w5      := substr(wvalor,30-14,3)
   w6      := substr(wvalor,30-17,3)
   w7      := substr(wvalor,30-20,3)
   w8      := substr(wvalor,30-23,3)
   wwValor := " " + w8 + "." + w7 + "." + w6 + "." + w5 + "." + w4 + "." + w3 + "." + w2 + "." + w1 + wCentavos
   wwValor := wsinal + AllTrim(substr(wwvalor,Rat(" .",wwvalor)+2))
   wwValor := space(30) + wwvalor
   wValor  := right(wwvalor,wlen)

   if .Not.( AllTrim(wwValor) $ wvalor )
      wvalor := Replicate("*",wlen)
   endif

return wValor
*fim da function cstrponto()

Function cVal(wVar)
**********************************************************************************
* Converte uma variavel do tipo "caracter" para o tipo "numerico" e não da erro se já for "numérico"
**********************************************************************************
   If ValType(wVar) = "U"
      wVar := 0
   ElseIf ValType(wVar) = "C"
      wVar := Val(wvar)
   ElseIf ValType(wVar) = "N"
   ElseIf ValType(wVar) = "D"
      ccancel("cVa() - Parâmetros inválidos")
   ElseIf ValType(wVar) = "A"
      ccancel("cVa() - Parâmetros inválidos")
   EndIf

Return wVar
*Fim da Function cVal(wVar)

Function cStr(wVar,wTam,wDec)
**********************************************************************************
* Converte uma variavel do tipo  "numerico"  para o tipo "caracter" e não da erro se já for "caracter"
**********************************************************************************

   If ValType(wVar) = "U"
      wVar := 0
   ElseIf ValType(wVar) = "C"
      Return wVar 
      //wVar := Val(wvar)
   ElseIf ValType(wVar) = "N"
   ElseIf ValType(wVar) = "D"
      ccancel("cVa() - Parâmetros inválidos")
   ElseIf ValType(wVar) = "A"
      ccancel("cVa() - Parâmetros inválidos")
   EndIf      
   
   If ValType(wTam) = "U" .and. ValType(wDec) = "U"
      wVar := str(wVar)
   ElseIf ValType(wTam) <> "U" .and. ValType(wDec) = "U"
      wVar := str(wVar,wTam)
   ElseIf ValType(wTam) = "U" .and. ValType(wDec) <> "U"
      wVar := str(wVar,15,wDec)
   ElseIf ValType(wTam) <> "U" .and. ValType(wDec) <> "U"
      wVar := str(wVar,wTam,wDec)
   EndIf

Return wVar
*Fim da Function cStr(wVar,wTam,wDec)

function cStrQtd(wString,wChar)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wQtd,wx

   wString := AllTrim(cNvl(wString,""))
   wChar   := AllTrim(cNvl(wChar ,"."))
   wQtd    := 0
   
   For wx := 01 To Len(wString)
      If SubStr(wString,wx,1)=wChar
         wQtd := wQtd + 1
      EndIf
   Next

Return wQtd
* fim da Function cStrQtd(wString,wChar)

function cAtQtd(wString,wChar)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wQtd,wx

   wString := AllTrim(cNvl(wString,""))
   wChar   := AllTrim(cNvl(wChar ,"."))
   wQtd    := 0
   
   For wx := 01 To Len(wString)
      If SubStr(wString,wx,1)=wChar
         wQtd := wQtd + 1
      EndIf
   Next

Return wQtd
* fim da Function cAtQtd(wString,wChar)

Function cUpper(wTexto,wInicial)
**************************************************************************************************
*                         Converte os caracteres para maiúsculo                                  *
*wTexto  => CHAR  - Texto a ser convertido                                                       *
*wInicial=> LOGIC - Se .t. converte as iniciais para maiusculo e as demais minusculo             *
*                 (A..Z-065..090) (a..z-097..122) (À..Þ-192..222) (à..Þ-224..254)                * 
**************************************************************************************************
Local wTextoResp,wChar,wCharAnt,wAsc,wx,wLen

   wInicial := iif(ValType(wInicial)<>"L",.f.,wInicial)
   If .not. wInicial
      wTextoResp := space(00)
      wLen       := Len(wTexto)
      For wx:=1 to wLen
          wChar := Substr(wTexto,wx,1)
          wAsc  := Asc(wChar)
          If (wAsc>=097.and.wAsc<=122) .or. (wAsc>=224.and.wAsc<=254)
             wChar := chr(wAsc - 32)
          EndIf
          wTextoResp := wTextoResp + wChar
      Next
   Else
      wTexto     := cLower(wTexto)
      wTextoResp := space(00)
      wLen       := Len(wTexto)
      wCharAnt   := " "
      For wx:=1 to wLen
          wChar := Substr(wTexto,wx,1)
          If wCharAnt = " "
             wChar := cUpper(wChar)
          EndIf
          wCharAnt   := wChar
          wTextoResp := wTextoResp + wChar
      Next
   EndIf
return wTextoResp
*Fim da Function cUpper(wTexto,wInicial)

Function cLower(wTexto)
**************************************************************************************************
*                         Converte os caracteres para minúsculo                                  *
*wTexto  => CHAR - Texto a ser convertido                                                        *
*                 (A..Z-065..090) (a..z-097..122) (À..Þ-192..222) (à..Þ-224..254)                * 
**************************************************************************************************
Local wTextoResp,wChar,wAsc,wx,wLen

   wTextoResp := space(00)
   wLen       := Len(wTexto)
   For wx:=1 to wLen
       wChar := Substr(wTexto,wx,1)
       wAsc  := Asc(wChar)
       If (wAsc>=065.and.wAsc<=090) .or. (wAsc>=192.and.wAsc<=222)
          wChar := chr(wAsc + 32)
       EndIf
       wTextoResp := wTextoResp + wChar
   Next
return wTextoResp
*Fim da Function cLower(wTexto)

function XcCript(wTexto)
*******************************************************************************
*                  funcao para criptografar textos (asc + 1)                  *
* ex:      ccript("CICERO")    =>      "DJDFSP"                               *
*******************************************************************************
   return wTexto
*fim da function XcCript()

function cCript(wTexto)
*******************************************************************************
*                  funcao para criptografar textos (asc + 1)                  *
* ex:      ccript("CICERO")    =>      "DJDFSP"                               *
*******************************************************************************
local wlen,wTextoAux,wchar,wx
   wlen         := len(wtexto)
   wTextoAux    := space(00)

   For wx := 01 To wLen
      wChar     := substr(wtexto,wx,1)
      If wChar <> " "    && nao criptografa  " "
         wChar  := chr(If(ASC(wchar)=255,1,ASC(wchar)+1))
      // wChar  := chr(ASC(wchar)+1)
      EndIf
      wtexto    := substr(wtexto,1,wx-1) + wchar + substr(wtexto,wx+1)
      wTextoAux := wTextoAux + wChar
   Next

return wTextoAux
*fim da function cCript()

function cdecript(wTexto)
*******************************************************************************
*                  funcao para de-criptografar textos (asc - 1)               *
* ex:      ccript("DJDFSP")    =>      "CICERO"                               *
*******************************************************************************
Local wlen,wTextoAux,wchar,wx
   wlen      := len(wtexto)
   wTextoAux := space(00)
   for wx=1 to wlen
      wchar   := substr(wtexto,wx,1)
      If wchar <> " "    && nao criptografa  " "
         wchar := chr(If(Asc(wchar)=1,255,Asc(wchar)-1))
      // wchar := chr(asc(wchar)-1)
      EndIf
      wtexto    := substr(wtexto,1,wx-1) + wchar + substr(wtexto,wx+1)
      wTextoAux := wTextoAux + wChar
   next

return wTextoAux
*fim da function cdecript

function cQuebraTXT(wTexto,wMatrix,wAlinhamento)
*******************************************************************************
* quebra uma variavel tipo "texto" em varias outras (matrix) sem cortar a pa- *
* lavra na metade                                                             *
*******************************************************************************
Local wqtdtxt,wlen,wpos,wx

   wAlinhamento := If(pcount()=3,.t.,.f.)
   wTexto       := wTexto + space(01)
   wQtdtxt      := Len(wMatrix)                       && quantidade de itens da matrix

   For wx:=1 to wqtdtxt
       wLen        := len(wMatrix[wx])                    && tamanho do item
       wPos        := rat(" ",substr(wTexto,1,wlen+1))    && posicao do 1§ branco (" ") da dir. para a esq.
       wPos        := if(wpos=0,wlen,wpos)
       wMatrix[wx] := substr(substr(wTexto,1,wpos)+space(wlen),1,wlen)
       wTexto      := substr(wTexto,wpos+1)
       wMatrix[wx] := if(wAlinhamento,cAlinhaTXT(wMatrix[wx]),wMatrix[wx])  && se for com alinhamento executa funcao de alinhamento a direita
   next

return .t.
*fim da function cquebratxt()

function cAlinhaTXT(wTexto)
*******************************************************************************
*             alinha um texto a direita (padrao editor de textos)             *
*******************************************************************************
Local wqtdtxt,wlen,wpos,wx,wbrancos

   if Len(AllTrim(wTexto)) = 0       // se NAO tiver nada
      return wTexto
   endif

   if at(" ",AllTrim(wTexto)) = 0    // se SO' tiver UMA palavra
      return wTexto
   endif

   wbrancos := Len(wTexto) - Len(AllTrim(wTexto))
   do while wBrancos > 0
      wBrancos := Len(wTexto) - Len(AllTrim(wTexto))
      wTexto   := AllTrim(wTexto)
      wpos     := Len(wTexto)

      For wx:= 01 To wBrancos
          wpos   := rat(" ",trim(substr(wTexto,1,wpos)))
          wTexto := substr(wTexto,1,wpos) + " " + substr(wTexto,wpos+1)
      Next

      wBrancos := Len(wTexto) - Len(AllTrim(wTexto))
   enddo

return wTexto
*fim da function cAlinhaTXT()

function cQuebraTXT2(wTexto,wLinLen,wAlinhamento,wOpcao)
*********************************************************************************************
* quebra uma variavel tipo "texto" em varias outras (matrix) sem cortar a palavra na metade *
* wTexto       => Texto a ser manipulado
* wLinLen      => Quantidade de colunas para formatar o texto
* wAlinhamento => Se .T. alinha
* wOpcao       => "T" Texto (Default)  ou   "M" Matriz
*********************************************************************************************
Local wTxtLen,wlen,wpos,wx,wy,wLinLenWX,wResult,wResult_Matriz,wResult_TXT,wTextoWX,wTextoWXy

   wAlinhamento   := iIf(ValType(wAlinhamento)="L",wAlinhamento,.f.)
   wOpcao         := cNvl(wOpcao,"T")
   wTexto         := wTexto + chr(13)+chr(10)
   wTxtLen        := Len(wTexto)                       && quantidade de caracters do texto
   wLinLenWX      := 0    
   wTextoWX       := Space(0)
   wResult_Matriz := {}
   wResult_TXT    := Space(0)

   For wx:=1 to wTxtLen
       If wLinLenWX >= wLinLen .or. SubStr(wTexto,wx,2) = chr(13)+chr(10)

          If SubStr(wTexto,wx,2) = chr(13)+chr(10) 
             wx:=wx+2
          Else
             If SubStr(wTexto,wx-1,2) <> " " .and. SubStr(wTexto,wx,1) <> " "
                For wy:=wLinLenWX to 1 step -1
                    If SubStr(wTextoWX,wy,1) = " "  // volta até o último branco 
                       exit
                    EndIf
                Next
                If wy>0 
                   wx        := wx - (wLinLenWX - wy)
                   wLinLenWX := wy
                   wTextoWX  := Substr(wTextoWX,1,wLinLenWX)
                EndIf
             EndIf
          EndIf

          If wAlinhamento 
             wTextoWX := cAlinhaTXT2(wTextoWX,wLinLen)
          EndIf
          
          aAdd(wResult_Matriz,wTextoWX)
          wTextoWX  := space(00)
          wLinLenWX := 0
       EndIf
       wLinLenWX := wLinLenWX + 1
       wTextoWX  := wTextoWX  + SubStr(wTexto,wx,1)
   next

   If wOpcao="T"
      For wx:=1 to Len(wResult_Matriz)
          wResult_TXT := wResult_TXT + wResult_Matriz[wx] + chr(13)+chr(10)
      Next
      wResult := wResult_TXT
   Else
      wResult := wResult_Matriz
   EndIf

return wResult
*fim da function cQuebraTXT2()

function cAlinhaTXT2(wTexto,wLinLen)
*******************************************************************************
*             alinha um texto a direita (padrao editor de textos)             *
*******************************************************************************
Local wqtdtxt,wlen,wpos,wx,wbrancos

   If ValType(wLinLen) ="N"
      wTexto:= Substr(wTexto + space(wLinLen),1,wLinLen)
   EndIf

   if Len(AllTrim(wTexto)) = 0       // se NAO tiver nada
      return wTexto
   endif

   if at(" ",AllTrim(wTexto)) = 0    // se SO' tiver UMA palavra
      return wTexto
   endif

   wbrancos := Len(wTexto) - Len(AllTrim(wTexto))
   do while wBrancos > 0
      wBrancos := Len(wTexto) - Len(AllTrim(wTexto))
      wTexto   := AllTrim(wTexto)
      wpos     := Len(wTexto)

      For wx:= 01 To wBrancos
          wpos   := rat(" ",trim(substr(wTexto,1,wpos)))
          wTexto := substr(wTexto,1,wpos) + " " + substr(wTexto,wpos+1)
      Next

      wBrancos := Len(wTexto) - Len(AllTrim(wTexto))
   enddo

return wTexto
*fim da function cAlinhaTXT2()

Function cStrToMatriz(wString,wChar,wTpVar,wNull)
************************************************************************************************
*  Cria uma matrix atraves de um STRING com os itens separados por um Char (#)                 *
*  Ex.: cStrToMatriz("FRM#TAB#COL#GET","#")  => {"FRM","TAB","COL","GET"}                        *
*       A wTpVar transForma a resposta o tipo de variav'l passado.
*       O wNull cria um ítem na matrix com nulo - space(00)
************************************************************************************************
Local wMatrix := {} , wItem , wCharLen

// wTpVar := iIf(cEmpty(wTpVar),"C",wTpVar)
   wTpVar  := iIf(ValType(wTpVar)<>"C","C",wTpVar)
   wNull   := iIf(ValType(wNull) <>"L",.f.,wNull)


   wCharLen := len(wChar)
   wString  := wString + wChar
   Do While .not. cEmpty(wString) 
       wItem   := SubStr(wString,1,At(wChar,wString)-1)
       //wString := SubStr(wString,At(wChar,wString)+1)
       wString := SubStr(wString,At(wChar,wString)+wCharLen)
       If .not. wNull
          If cEmpty(wItem) 
               Loop
          EndIf 
       EndIf
       If wTpVar="C"
          aAdd(wMatrix , wItem )
       ElseIf wTpVar="N"
          aAdd(wMatrix , Val(wItem)  )
       ElseIf wTpVar="D"
          aAdd(wMatrix , cTod(wItem) )
       EndIf
   EndDo

Return wMatrix
* Fim da Function cStrToMatriz(wString,wChar,wTpVar,wNull)

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Para Tratamento de Matrix (arrow)                              **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

Function cScan(wMatriz,wConteudo,wNum_Col,wSinal,wInicio,wFinal)
*******************************************************************************
*                          Versão melhorada da aScan                          *
*******************************************************************************
Local wPos := 00 , wx := 00 , wCompara , wxLen
__MVPRIVATE("__wScanMatriz"  )
__MVPRIVATE("__wScanConteudo")
__MVPRIVATE("__wScanNum_Col" )
__MVPRIVATE("__wScan_wx"     )

   wxLen := Len(wMatriz)
   If wxLen=0
      Return 0
   EndIf

   If cEmpty(wSinal) .Or. ValType(wSinal)<>"C"
      wSinal := "=="
   EndIf

   If cEmpty(wInicio) .Or. ValType(wInicio)<>"N"
      wInicio := 01
   EndIf

   If cEmpty(wFinal) .Or. ValType(wFinal)<>"N"
      wFinal := wxLen
   EndIf

   If .Not.cEmpty(wNum_Col) .And. ValType(wNum_Col)="N"
      if valtype(wMatriz[wxLen])="U"
         return 0
      EndIf

      If wNum_Col > Len(wMatriz[wxLen])
         cCancel("cScan() - Coluna Informada é maior que a Quantidade de Colunas na Matriz")
      EndIf
   EndIf   

   __wScanMatriz   := wMatriz
   __wScanConteudo := wConteudo
   __wScanNum_Col  := wNum_Col
   
   If ValType(__wScanConteudo)="C"
      __wScanConteudo := Upper(AllTrim(__wScanConteudo))
   EndIf

   If .Not.cEmpty(wNum_Col) .And. ValType(wNum_Col) = "N"
      wCompara := "iIf(ValType(__wScanMatriz[__wScan_wx,__wScanNum_Col])='C',Upper(AllTrim(__wScanMatriz[__wScan_wx,__wScanNum_Col])),__wScanMatriz[__wScan_wx,__wScanNum_Col]) " + wSinal + " __wScanConteudo"
   Else
      wCompara := "iIf(ValType(__wScanMatriz[__wScan_wx])='C',Upper(AllTrim(__wScanMatriz[__wScan_wx])),__wScanMatriz[__wScan_wx]) " + wSinal + " __wScanConteudo"
   EndIf

   For wx := wInicio to wFinal
      __wScan_wx := wx
      If &wCompara
         wPos := wx
         Exit
      EndIf
   Next

Return wPos
*fim da Function cScan(wMatriz,wConteudo,wNum_Col,wSinal,wInicio,wFinal)

Function cScanBin(wMatriz,wTexto_Pesquisa,wPosCol,wdebug)
*********************************************************************************************************
*            Executa uma Pesquisa Binaria (arvore binaria) na matrix INDEXADA                           *
*********************************************************************************************************
Local wTexto_Compara,wRecTot,wPos,wPos1,wPos2,wx,wqtd,wMeio

wRecTot := Len(wMatriz)
wPos    := 0
wPos1   := 1
wPos2   := wRecTot
wMeio   := 0
wPosCol := cNvl(wPosCol,1)

For wx=1 to wRecTot
   wqtd  := (wPos2 - wPos1)  + 1 
   wMeio := (wQtd/2) 
   If wMeio <> int(wMeio)  // se for impar
      wMeio := Int(wMeio) + 1
   Endif

   wMeio := ( wMeio + wPos1 ) - 1
   if wmeio = 0
      exit
   EndIf

   wTexto_Compara := wMatriz[wMeio,wPosCol]

   If wTexto_Pesquisa == wTexto_Compara
      wPos := wMeio
      Exit 
   Else
      If wPos1 = wPos2  // nao encontrado
         Exit 
      EndIf
      If wTexto_Pesquisa < wTexto_Compara 
         wPos1 := wPos1
         wPos2 := wMeio -1
      Else
         wPos1 := wMeio +1
         wPos2 := wPos2
      EndIf
   EndIf
Next

Return wPos
*fim da Function cScanBin(wMatriz,wTexto_Pesquisa,wPosCol)

Function aTranspose(wTMatrix)
*****************************************************************************************************
* Inverte o conteudo das cordenadas (X,Y) de uma matrix Bi-Dimensional                              *
*****************************************************************************************************
Local wMatrixAux := {} , wX , wY , wLen1 , wLen2

   wLen1 := Len(wTMatrix[01])
   wLen2 := Len(wTMatrix)

   For wY := 01 To wLen1
      aAdd(wMatrixAux , Array(wLen2) )

      For wx := 01 To wLen2
         wMatrixAux[wy,wx] := wTMatrix[wx,wy]
      Next
   Next

// For wY := 01 To Len(wTMatrix[01])  
//     aAdd(wMatrixAux , {} )
//     For wx := 01 To Len(wTMatrix) 
//         aAdd(wMatrixAux[len(wMatrixAux)] , wTMatrix[wx,wy])
//     Next  
// Next

Return wMatrixAux
* Fim da Function aTranspose(wTMatrix)

//************************************//

function cDistinct(wmMatrix,wmParmCol)
***************************************************************************************************************
* Recria a matriz  com Unicidade (chave úncica) excluindo as linhas iguais através das colunas informadas     *
* wmMatrix -> matriz já classificada                                                                          *
* wmParmCol -> matriz com o número (sequencial) das colunas para comparação de chave única ex: {1,4,5}        *
***************************************************************************************************************
Local wmAnterior,wDel,wx,wy,wlen

wmAnterior:={}
aSize(wmAnterior,len(wmMatrix[01]))

for wy=1 to len(wmParmCol)
    If ValType(wmMatrix[01,wmParmCol[wy]]) = "C"
       wmAnterior[wmParmCol[wy]] := Space(00)
    EndIf
    If ValType(wmMatrix[01,wmParmCol[wy]]) = "N"
       wmAnterior[wmParmCol[wy]] := 0
    EndIf
    If ValType(wmMatrix[01,wmParmCol[wy]]) = "D"
       wmAnterior[wmParmCol[wy]] := dtoc("  /  /    ")
    EndIf
Next

wlen := len(wmMatrix)
for wx=1 to wlen 
    wDel := .t.
    for wy=1 to len(wmParmCol)
        If .not. (wmAnterior[wmParmCol[wy]] == wmMatrix[wx,wmParmCol[wy]])
           wDel := .f.
        EndIf
        wmAnterior[wmParmCol[wy]] := wmMatrix[wx,wmParmCol[wy]]   // já atribui o anterior
    Next

    If wDel 
       adel(wmMatrix,wx,.t.)   // delete com auto Resize
       wlen := len(wmMatrix)
       wx   := wx -1
    endif
next

return wmMatrix
* fim da function cDistinct(wmMatrix,wmParmCol)

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Para Banco de Dados SQL                                        **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

Function Campo(wConteudo,wTipo,wPicture)
*******************************************************************************
*                 Função para controle de aspas nas variaveis                 *
*******************************************************************************
Local wResp , wTam := 00 , wDec := 00

   If cEmpty(wTipo)
      wTipo := "C"
   EndIf

   If Upper(wTipo) = "C"
      If cEmpty(wConteudo)
         If ValType(wConteudo)="C"
            If Len(wConteudo) <> 0 
               wResp := "'" + rTrim(wConteudo) + "'"
            Else  
               wResp := "''" 
            EndIf
         Else  
            wResp := "''" 
         EndIf
      ElseIf wConteudo = "0000-00-00" .and. wc_SQL_tp  = "S"    //  ciceroSQL
            wResp := "''" 
      ElseIf wConteudo = "   0-00-00" .and. wc_SQL_tp  = "S"    //  ciceroSQL
            wResp := "''" 
      ElseIf wConteudo = "00000000"   .and. wc_SQL_tp  = "S"    //  ciceroSQL
            wResp := "''" 
      Else
         wResp := "'" + Func_Ver_Char(rTrim(wConteudo)) + "'"
      EndIf
   ElseIf Upper(wTipo) = "N"
      If cEmpty(wConteudo) .or. wConteudo = nil
         wResp := "0"
      Else
         If cEmpty(wPicture)
            wResp := Str(wConteudo)
         Else
            wTam  := Len(wPicture)
            wDec  := At( "." , wPicture )
            wDec  := wTam - wDec
            If wDec<>0
               wDec:= wTam - wDec
            EndIf   
            wResp := Str(wConteudo,wTam,wDec)
         EndIf   
      EndIf
   ElseIf Upper(wTipo) = "D" 
   // If cEmpty(wConteudo)
   //    If wc_DB = "O"      // Se o Banco For ORACLE
   //       wResp := "NULL"
   //    ElseIf wc_DB = "A"  // Se o Banco For Access
   //       wResp := "NULL"
   //    ElseIf wc_DB = "M"  // Se o Banco For My Sql
   //       wResp := "IS NULL"
   //    ElseIf wc_DB = "D"  // Se o Banco For DBF
   //       wResp := cTod("  /  /    ")
   //    EndIf
   // Else
      // If wc_DB = "O"       // Se o Banco For ORACLE
      //    wResp := "To_Date('" + DtoC(wConteudo) + "','DD/MM/YYYY')"
      // ElseIf wc_DB = "A"   // Se o Banco For Access
      //    wResp := "Format('" + wConteudo + "', 'DD/MM/YYYY')" 
      // ElseIf wc_DB = "M"   // Se o Banco For My Sql
      If wc_SQL_tp  = "M" //  ("D"-DBF) ("O"-ORACLE) ("S"-SQL SERVER) ("A"-ACCESS) ("M"-MySQL)  // cicerosql
         wResp := "Date_Format('" + DtoS(wConteudo) + "','%Y%m%d')"
      ElseIf wc_SQL_tp  = "S" //  ("D"-DBF) ("O"-ORACLE) ("S"-SQL SERVER) ("A"-ACCESS) ("M"-MySQL)
         wResp := "Date_Format('" + DtoS(wConteudo) + "','%Y%m%d')"   // ciceroSQL
         //wResp := "ccase"+wc_SQL_Sufixo+".dbo.XDate_Format('" + DtoS(wConteudo) + "','%Y%m%d')"
      EndIf

      // ElseIf wc_DB = "D"   // Se o Banco For DBF
      //    wResp := "DtoC('" + wConteudo + "')" 
      // EndIf
   // EndIf
   ElseIf Upper(wTipo) = "E"  // Tipo Expressao algebrica (nao tem aspas)
      If cEmpty(wConteudo)
         wResp := "" 
      Else
         wResp := Func_Ver_Char(rTrim(wConteudo))
      EndIf
   EndIf

Return wResp
*Fim da Function Campo(wConteudo,wTipo)

Function Func_Ver_Char (wConteudo)
   wConteudo := StrTran(wConteudo,"'","´")
   wConteudo := StrTran(wConteudo,"\","/")
Return wConteudo
*Fim da Function Func_Ver_Char(wConteudo,wTipo)

function cSqlExp(wConteudo)
*******************************************************************************
*                 Função para controle de aspas nas variaveis                 *
*******************************************************************************
Local wResp , wTam := 00 , wDec := 00

      *If cEmpty(wConteudo)
      *      wResp := "" 
      *   EndIf
      *Else
      *   wResp := "cSqlExp#" + AllTrim(wConteudo)
      *EndIf

      wResp := "cSqlExp#" + AllTrim(wConteudo)
      
Return wResp          
*Fim da Function Func_Ver_Char(wConteudo,wTipo)

Function c_Sql_TiraPonto(wChaveSQL)
************************************************************************************************
*                 Função para tirar os pontos do AND-OR-NOT para chave SQL                     *
************************************************************************************************

   wChaveSQL := StrTran(wChaveSQL,".and."," And ")
   wChaveSQL := StrTran(wChaveSQL,".AND."," And ")
   wChaveSQL := StrTran(wChaveSQL,".And."," And ")
   wChaveSQL := StrTran(wChaveSQL,".or." ," Or " )
   wChaveSQL := StrTran(wChaveSQL,".OR." ," Or " )
   wChaveSQL := StrTran(wChaveSQL,".Or." ," Or " )
   wChaveSQL := StrTran(wChaveSQL,".not."," Not ")
   wChaveSQL := StrTran(wChaveSQL,".NOT."," Not ")
   wChaveSQL := StrTran(wChaveSQL,".Not."," Not ")

Return wChaveSQL
*fim Function c_Sql_TiraPonto(wChaveSQL)

Function cLog_Sql(wxMsg,wTipo)
*****************************************************************************************************
*                     Funcao para Gravar a Chave SQL num arquivo LOG                                *
*****************************************************************************************************
Local wArq_Handle , wSql , wMsg , wx , wText

   wText := Space(00) 
   wTipo := iIf(ValType(wTipo)="U",1,wTipo)

   If ValType(wxMsg)="N"
      wxMsg := Str(wMsg)
   ElseIf ValType(wxMsg)="A"
      For wx := 1 To Len(wxMsg)
         wText := wText+" "+wxMsg[wx]
      Next
      wxMsg := wText
   ElseIf ValType(wxMsg)="U"
      wxMsg := ""
   EndIf

   wMsg  := wxMsg
   wMsg := StrTran(wMsg,"'",'"')

   If wTipo=1
      wArq_Handle := fOpen("c_info.err",1)   //  abre arquivo com os seguinte modos de abertura (0-leitura) (1-gravacao) (2-leitura e gravacao)
      If wArq_Handle = -1
         wArq_Handle := FCreate("c_info.err")
      EndIf
      fSeek(wArq_Handle,-1,2)
      fWrite(wArq_Handle,wMsg + chr(13)+chr(10))
      fClose(wArq_Handle)
   Else
   // wSql :=  " Insert Into cCase_Log (Log_Dt,Log_Hr,Log_dsc) Values ("
   // wSql := wSql + Campo(DATE(),"D")+","+Campo(Time())+","+wMsg + ")"
   // wSql := StrTran(wSql,"'",'"')
   // cSql_Execute("cCase_Log" , wSql , .F.)
   EndIf

Return nil
*fim da Function cLog_Sql(wMsg)


*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções do SysCare/Sam                                                 **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*

function fPesquisa_Paciente(wOpcao)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local oDlg,wx,wPaciente,wWhere,wResp,wXPaciente , wqg,wId
Private oBrwSay,wXoBrw,_wMM_Grid,_wBrwLin,wGrid_Order

If wOpcao=1
   If ValType(cO("mrc_pac_nom",1))="O"
      cO("mrc_pac_nom",1):bKeyDown := {|nKey| iIf(nKey=113,(msgwait("","",0.0001),fPesquisa_Paciente(2)),) }
   EndIf
ElseIf wOpcao=2
   If _wAbre_Pesquisa
      _wMM_Grid := {}

      wPaciente := cV("mrc_pac_nom",1)
      wPaciente := AllTrim(cNvl(wPaciente,""))
      If Len(wPaciente) >= 2
         wXPaciente := StrTran(wPaciente , "  " , " ")
         wXPaciente := StrTran(wXPaciente, "  " , " ")
         wXPaciente := StrTran(wXPaciente, " "  , "% ")
         cVF("mrc_pac_nom",6,wPaciente)
   
         wWhere := " pac_nom Like " + Campo(wXPaciente+"%")
         wResp  := fConsulta2("sam_pac_paciente",,wWhere,,"pac_nom",{"pac_nom"} )
         For wx := 01 To Len(wResp)
            aAdd( _wMM_Grid, {wResp[wx,1]})
         Next
      Else
         Return .T.
      EndIf
      _wAbre_Pesquisa := .F.
      
      If Len(_wMM_Grid)=0
         aAdd( _wMM_Grid, {Space(00)})
      EndIf
   
      oDlg := TDialog():New(14,52,14+18,52+25.75,"Pesquisa de Paciente",,,.F.,,,,,,.F.,,,,,)
         __wKeySeek  := wPaciente
         _wBrwLin    := 01
         wGrid_Order := .F.

         *-------------------------Cria o Objeto Browse-----------------------------*
         wXoBrw := TWBrowse():New( 1   ,    1,    100,     125, {||{_wMM_Grid[_wBrwLin,1]}} , {"Paciente"},{300}     ,oDlg ,       ,      ,      ,        ,          ,        ,     ,        ,         ,         ,     ,.F.     ,       ,.T.    ,      ,.F.    ,       ,        , )
               //      METHOD New( nRow, nCol, nWidth, nHeigth, bLine                       , aHeaders    , aColSizes, oWnd, cField, uVal1, uVal2, bChange,bLDblClick, bRClick,oFont, oCursor, nClrFore,nForeBack, cMsg, lUpdate, cAlias, lPixel, bWhen,lDesign, bValid, bLClick, aActions ) CONSTRUCTOR

         wXoBrw:aActions := {}
         aAdd( wXoBrw:aActions , { || fSort_Matrix() , __wKeySeek:=Space(00), oBrwSay:Refresh(),wXoBrw:GoTop() , wXoBrw:Refresh()})

         wXoBrw:cAlias        := "ARRAY"
         wXoBrw:bLogicLen     := { || Len(_wMM_Grid) }
         wXoBrw:bGoTop        := { || _wBrwLin  := 01 }
         wXoBrw:bGoBottom     := { || _wBrwLin  := Eval( wXoBrw:bLogicLen , wXoBrw ) }
         wXoBrw:bkeydown      := { | nKey, nFlags | fSeek_Matrix(nKey,nFlags),iIf(nKey=13,(cV("mrc_pac_nom",1,_wMM_Grid[_wBrwLin,1]+Space(252)),_wAbre_Pesquisa:=.T.,oDlg:End()),) }
         wXoBrw:bLDblClick    := { || cV("mrc_pac_nom",1,_wMM_Grid[_wBrwLin,1]+Space(252)),oDlg:End(),_wAbre_Pesquisa:=.T. } 
         wXoBrw:bSkip         := { | nwant , nOld | nOld := _wBrwLin , _wBrwLin += nwant , _wBrwLin  := Min( Max( _wBrwLin,1 ), Eval( wXoBrw:bLogicLen , wXoBrw) ) , _wBrwLin  - nOld }
         wXoBrw:nLineStyle    := 1
         wXoBrw:aJustIfy      := {.f.}

         oBrwSay := TSay():New( wXoBrw:nTop+wXoBrw:nHeight+1 , wXoBrw:nLeft , {|| __wKeySeek },oDlg, "" ,, .F., .F., .T., .T., "R+/W" ,, wXoBrw:nWidth ,09, .F., .F., .F., .F., .F. )
         *--------------------------------------------------------------------------*
      oDlg:Activate(oDlg:bLClicked,oDlg:bMoved,oDlg:bPainted,.F.,oDlg:bValid := {||fSaida_F2()},,,oDlg:bRClicked,,)

      oDlg:aControls:={}

      oDlg   :End() 
      oBrwSay:End() 
      wXoBrw :End() 
      __MXRelease( "oDlg",  "oBrwSay" ,  "wXoBrw" )
   EndIf
EndIf

Return .T.
* fim da function fPesquisa_Paciente(wOpcao)

function fBusca_Convenio()
***************************************************************************************************
*          
***************************************************************************************************
Local wx,wAnt,wxLen,wxx,wMatriz

   If wLenBuffer=1
      If Len(_wMrc_Lst_Cnv)=0
         _wMrc_Lst_Cnv := fConsulta("sam_cnv_convenio",,,,"cnv_desc",{"cnv_desc"},,,,.T.,)
      EndIf
      oxCbx:SetItems( {wBuffer+Space(252)} )
      oxCbx:Select(1)
      oxCbx:Refresh()
      _wMrc_CAnt := ""
   ElseIf wLenBuffer=2
      If ValType(wBuffer)="C"
         wAnt := _wMrc_CAnt
         wAnt := iif(Valtype(wAnt)="C",wAnt,"")
         If .Not.(SubStr(wBuffer,1,1)==wAnt)
            oxCbx:Default()
            wMatriz := _wMrc_Lst_Cnv
            wxLen   := iif(ValType(wMatriz)="A",Len(wMatriz),0)
            wxx     := 00
            For wx = 01 To wxLen
               oxCbx:Add(wMatriz[wx],wxx+1)
            Next
            _wMrc_CAnt := SubStr(wBuffer,1,1)
            oxCbx:SetSize(oxCbx:nWidth,156,.T. )
            oxCbx:Open()
         EndIf      
      EndIf
   EndIf

return .t.
*Fim da Function fBusca_Convenio()

*-----------------------------------------------------------------------------------------------------------*
**---------------------------------------------------------------------------------------------------------**
**                                  Funções Outras                                                         **
**---------------------------------------------------------------------------------------------------------**
*-----------------------------------------------------------------------------------------------------------*
function cDvCPF(wCPF)
*******************************************************************************
* confere o digito verificador do cpf                                         *
* wdig   => cpf a ser conferido o digito                                      *
*           pode ser numerico ou caracter com mascara ou sem mascara          *
*******************************************************************************
Local wcpf1,wdigito,wdgv,wdgv1,wdgv2

   if ValType(wcpf) = "N"
      wcpf := strzero(wcpf,11,0)
   Elseif ValType(wcpf) = "C"
      wcpf := strtran(wcpf,".","")
      wcpf := strtran(wcpf,"/","")
      wcpf := strtran(wcpf,"-","")
      wcpf := strzero(val(wcpf),11,0)
   EndIf

   wdigito := val(substr(wcpf,10,2))                    && digito que foi passado no cpf original
   wcpf1   := val(substr(wcpf,1,09))                    && cpf completo (sem o digito "049164578")
   wdgv1   := str(cDigV(wcpf1),1,0)                       && modulo 11 do gcg completo e sem o digito "049164578"                                   => "3"
   wdgv2   := str(cDigV(val(str(wcpf1,10,0)+wdgv1)),1,0)  && modulo 11 do gcg completo e sem o digito "049164578" juntando o 1ä digito "0491645783" => "8"
   wdgv    := wdgv1+wdgv2                                 && "38"

   if wDigito <> val(wdgv)  && se o digito Informado <> do calculado
      return .f.
   EndIf

return .t.
*fim da function cDvCPF(wCPF)

function cDvCGC(wCGC)
*******************************************************************************
* confere o digito verificador do cgc                                         *
* wdig   => cgc a ser conferido o digito                                      *
*           pode ser numerico ou caracter com mascara ou sem mascara          *
*******************************************************************************
Local wcgc1,wdigito,wdgv,wdgv1,wdgv2

   If     ValType(wcgc) = "N"
      wcgc := strzero(wcgc,15,0)
   ElseIf ValType(wcgc) = "C"
      wcgc := strtran(wcgc,".","")
      wcgc := strtran(wcgc,"/","")
      wcgc := strtran(wcgc,"-","")
      wcgc := strzero(val(wcgc),15,0)
   EndIf

   wdigito := val(substr(wcgc,14,2))                    && digito que foi passado no cgc original
   wcgc1   := val(substr(wcgc,1,13))                    && gcg completo (com filial e sem o digito "587258960001")
   wdgv1   := str(cDigV(wcgc1,1),1,0)                       && modulo 11 do gcg completo com filial e sem o digito "587258960001"                                         =>  "5"
   wdgv2   := str(cDigV(val(str(wcgc1,14,0)+wdgv1),1),1,0)  && modulo 11 do gcg completo com filial e sem o digito "587258960001"  juntando o 1ä digito "5872589600015"  =>  "6"
   wdgv    := wdgv1+wdgv2                                 && "56"

   if wDigito <> val(wdgv)  && se o digito Informado <> do calculado
      return .f.
   EndIf

return .t.
*fim da function cDvCGC(wCGC)

function cDigV(wvalor,wmodo)
*******************************************************************************
* calcula o digito verificador (modulo 11 )                                   *
* wdig   => (NUM 1 a 10) valor a ser calculado o digito                       *
* wmodo  => (NUM 1) modo de calculo: default = 0                              *
*           wmodo=0 -> padrao (usado no cpf)  ( *2 *3 *4 *5 *6 *7 *8 *9 *10 *11 *12 *13 *14 ...)
*           wmodo=1 -> outros (usado no cgc)  ( *2 *3 *4 *5 *6 *7 *8 *9 *2 *3 *4 *5 *6 *7 *8...)
*******************************************************************************
Local wChar[20],wDig,wx

   wmodo  := iif(pcount()=1,0,wmodo)
   wvalor := str(wvalor,18,0)

   aFill(wchar,0)
   For wx=1 to 19
       wChar[wx] := val(SubStr(wvalor,wx,1))
   Next

   If wmodo = 0  // se For modulo 11 padrao (cpf)
      wValor := (wchar[01]*19) + (wchar[02]*18) + (wchar[03]*17) + (wchar[04]*16) + (wchar[05]*15) + (wchar[06]*14) + (wchar[07]*13) + (wchar[08]*12) + (wchar[09]*11) + ;
                (wchar[10]*10) + (wchar[11]*09) + (wchar[12]*08) + (wchar[13]*07) + (wchar[14]*06) + (wchar[15]*05) + (wchar[16]*04) + (wchar[17]*03) + (wchar[18]*02)
   Else
      wValor := (wchar[01]*03) + (wchar[02]*02) + (wchar[03]*09) + (wchar[04]*08) + (wchar[05]*07) + (wchar[06]*06) + (wchar[07]*05) + (wchar[08]*04) + (wchar[09]*03) + ;
                (wchar[10]*02) + (wchar[11]*09) + (wchar[12]*08) + (wchar[13]*07) + (wchar[14]*06) + (wchar[15]*05) + (wchar[16]*04) + (wchar[17]*03) + (wchar[18]*02)
   EndIf
   wvalor := (wvalor*10)/11
   wvalor := wvalor-int(wvalor)
   wvalor := round((wvalor*11),0)
   wdig   := iif(wvalor=10,0,wvalor)

return(wdig)
*fim da function cDigV()

function cSave(wArq,wMatrixNome,wNew,wStart)
*****************************************************************************************
*  Grava o conteudo de uma matrix(wMatrixNome) em arquivo (wArq)                        *
*****************************************************************************************
Local wArq_Handle , wMatrixOrigem , wLen_Arq ,wLenDif 
   wStart := iIf(ValType(wStart)="N",wStart,0)
   wNew   := IIf(ValType(wNew)="L",wNew,.F.)
   If wNew 
      wArq_Handle := FCreate(wArq)
   Else
      wArq_Handle = fOpen(wArq,1)   //  abre arquivo com os seguinte modos de abertura (0-leitura) (1-gravacao) (2-leitura e gravacao)
      fSeek(wArq_Handle,-1,2)
   EndIf 

   If wStart > 0  
      wLen_Arq := fSeek(wArq_Handle,0,2)
      wLenDif  := wStart - wLen_Arq
      if wLenDif > 0
         fWrite(wArq_Handle,Replicate(" ",wLenDif))
      EndIf
      fSeek(wArq_Handle,wStart,0)
   EndIf

   wMatrixOrigem := &wMatrixNome

   cSaveAux(wMatrixNome,wMatrixOrigem,wArq_Handle)
   
   FClose( wArq_Handle )

Return nil
*Fim da Function cSave()

function cSaveAux(wMatrixNome,wMatrixOrigem,wArq_Handle)
*****************************************************************************************
*  funcao auxiliar da cSave()                                                           *
*****************************************************************************************
Local wLen, wType, wx

   FWrite( wArq_Handle, XcCript( CHR(13) + CHR(10)+"#%#" + wMatrixNome ))
   wLen := Len( wMatrixOrigem )
   For wx := 1 to wLen
      wType := ValType( wMatrixOrigem[wx] )

      Do Case
         Case ( wType == "A" )
            cSaveAux(wMatrixNome+"["+strzero(wx,5)+"]",wMatrixOrigem[wx],wArq_Handle)
         Case ( wType == "B" )
         Case ( wType == "C" )
//          FWrite( wArq_Handle, XcCript( "#C" + StrZero( Len( wMatrixOrigem[wx] ), 5 ) + wMatrixOrigem[wx] ) )
            FWrite( wArq_Handle, XcCript( "#C" + StrZero( Len( TRIM(wMatrixOrigem[wx]) ), 5 ) + TRIM(wMatrixOrigem[wx])))
         Case ( wType == "D" )
            FWrite( wArq_Handle, XcCript("#D" + DToC( wMatrixOrigem[wx] ) ))
         Case ( wType == "L" )
            FWrite( wArq_Handle, XcCript("L" + IIf( wMatrixOrigem[wx], "T", "F" ) ))
         Case ( wType == "N" )
            FWrite( wArq_Handle, XcCript("#N" + StrZero( Len( StrZero( wMatrixOrigem[wx] ) ), 2 ) + Str( wMatrixOrigem[wx] ) ))
      EndCase
   Next

Return nil
*Fim da Function cSaveAux()

Function cRestore(wArq,wStart)
*****************************************************************************************
*  Restaura um arquivo de matrix para a memoria                                         *
*****************************************************************************************
Local wArq_Handle,wLen, wx, wy, wType, wxBuffer, wxBufferLen, wNivelAnterior , wNivelAtual , wLenNivel , wQuebra
Private wMacro, wMatrixNome , wMatrixLenNome , wConteudo
   
   If .not. file(wArq)
      ccancel("cRestore(), Arquivo não encontrado:" + curDrive()+ ":/"+ curDir()+ "/"+ wArq)
   Endif

//   wArq_Handle := FOpen( wArq )
   wArq_Handle := FOpen( curDrive()+ ":/"+ curDir()+ "/"+ wArq)
   wQuebra := chr(13)+chr(10)   
   wStart := iIf(ValType(wStart)="N",wStart,0)
   fSeek(wArq_Handle,wStart,1)
   wxBuffer := FreadStr(wArq_Handle,100663296)
   wxBuffer := wxBuffer + chr(13)+chr(10)
   //wxBuffer := cDecript(wxBuffer)

   wxBufferLen := Len(wxBuffer)             

   For wx:=1 to wxBufferLen

      If SubStr(wxBuffer,wx,2) = wQuebra
      //If SubStr(wxBuffer,wx,2) = chr(13)+chr(10)
         wx := wx + 2
      EndIf

      If subStr(wxBuffer,wx,3) = "#%#"
         wMatrixNome    := Space(00)
         wMatrixLenNome := 0
         
         For wx:=wx+3 to wxBufferLen 
         
             If subStr(wxBuffer,wx,1) = "#" .or. subStr(wxBuffer,wx,2) = wQuebra
             //If subStr(wxBuffer,wx,1) = "#" .or. subStr(wxBuffer,wx,2) = chr(13)+chr(10)
                If Right(wMatrixNome,1) = "]"
                   //wNivelAnterior  := Substr(wMatrixNome,1,len(wMatrixNome)-7)
                   //wNivelAtual     := Val(Substr(wMatrixNome,len(wMatrixNome)-5,5))
                   wNivelAnterior  := Substr(wMatrixNome,1,wMatrixLenNome -7)
                   wNivelAtual     := Val(Substr(wMatrixNome,wMatrixLenNome -5,5))
                   wLenNivel       := len(&wNivelAnterior) 
                   For wy=wLenNivel to wNivelAtual-1
                      aAdd(&wNivelAnterior,{})
                   Next
                EndIf
                Exit
             EndIf
             wMatrixNome    := wMatrixNome + subStr(wxBuffer,wx,1)                          
             wMatrixLenNome := wMatrixLenNome + 1
         Next
         wMacro    := "asize(&wMatrixNome ,0) "
         wMacro := &wMacro

      EndIf
   
      wType := subStr(wxBuffer,wx+1,1)
      
      //Do Case
      //   Case ( wType == "A" )
      //   Case ( wType == "B" )
      //   Case ( wType == "C" )
      If wType =="C"
            wLen      := Val(subStr(wxBuffer,wx+2,5))
            wConteudo := subStr(wxBuffer,wx+7,wLen)
            wMacro    := "aadd( &wMatrixNome , '&wConteudo') "
            wMacro := &wMacro
            wx := wx + 6 + wLen 
         //Case ( wType == "N" )
      ElseIf wType =="N"
            wLen      := Val(subStr(wxBuffer,wx+2,2))
            wConteudo := subStr(wxBuffer,wx+4,wLen)
            wMacro    := "aadd( &wMatrixNome , &wConteudo) "
            wMacro := &wMacro
            wx := wx + 3 + wLen 
         //Case ( wType == "D" )
      ElseIf wType =="D"
            wLen      := 10
            wConteudo := subStr(wxBuffer,wx+2,wLen)
            wMacro    := "aadd( &wMatrixNome , ctod('&wConteudo')) "
            wMacro := &wMacro
            wx := wx + 1 + wLen 
         //Case ( wType == "L" )
      ElseIf wType =="L"
            wLen      := 1
            wConteudo := "." + subStr(wxBuffer,wx+2,wLen) + "."
            wMacro    := "aadd( &wMatrixNome ,&wConteudo) "
            wMacro := &wMacro
            wx := wx + 1 + wLen 
      ElseIf wType =="A"
      ElseIf wType =="B"
      EndIf
      //EndCase

   Next

   FClose( wArq_Handle )

Return nil
*Fim da Function Restore_Aux(wArq_Handle)

function cClipBoard(wVar)
***************************************************************************************************************
* Carrega o conteudo da variavel (wVar) na área de mémoria transitoria do windows (copy/Paste)                *
* wVar -> Variavel a ser carregada (copy)                                                                     *
***************************************************************************************************************
    If ValType(wVar) = "N"
       wVar := alltrim(str(wVar))
    ElseIf ValType(wVar) = "D"
       wVar := dtoc(wVar)
    EndIf

   __oClpMaster:Open()
   __oClpMaster:Clear()
   __oClpMaster:SetText(wVar)
Return nil
*fim da function function cClipBoard(wVar)

function cextenso(wvalor,wmoeda)
*********************************************************************************************
* funcao para gerar o valor por extenso de um numero                                        *
* wvalor => (num) valor a ser escrito por extenso (tamanho 16,2)                            *
* wmoeda => (cha) nome da moeda a ser impresso (default = "Reais")                          *
* ex: wext := cextenso(1250)  => "hum mil e duzentos e cinquenta reais"                     *
*     wext := cextenso(1250,"dolar")  => "hum mil e duzentos e cinquenta dolares"           *
*     wext := cextenso(1250,"btn")  => "hum mil e duzentos e cinquenta btns"                *
*********************************************************************************************
private wsingular,wplural,wcentavos,wcentena,wmilhares,wmilhoes,wbilhoes,wtrilhoes,wresp

   If wvalor = 0
      return("")
   ElseIf wvalor < 0
      wvalor = wvalor * (-1)
   EndIf

   wvalor := StrZero(wValor,16,2)

   if pcount() = 1
      wmoeda    := "Real "
      wsingular := "Real "
      wplural   := "Reais "
   elseif pcount() = 2
      wmoeda    := AllTrim(Lower(wmoeda))
      If len(wmoeda) = 0     // se foi passado a moeda   " "  (nenhuma)
         wsingular := space(00)
         wplural   := space(00)
      Else
         wSingular := wmoeda
         if right(wmoeda,1)="r"
            wPlural := wmoeda+"es "
         else
            wPlural := wmoeda+"s "
         endif
      endif
   endif

   wmoeda    := iif( Val(wMoeda) > 1 , upper(substr(wmoeda,1,1)) + lower(substr(wmoeda,2)), " ")
   wcentavos := cextensoaux("0"+substr(wvalor,15,2))
   wcentena  := cextensoaux(substr(wvalor,11,3))
   wmilhares := cextensoaux(substr(wvalor,08,3))
   wmilhoes  := cextensoaux(substr(wvalor,05,3))
   wbilhoes  := cextensoaux(substr(wvalor,02,3))
   wtrilhoes := cextensoaux(substr(wvalor,01,1))
   wresp     := ""
   if Len(wTrilhoes) > 0
      wResp := wResp + wtrilhoes + " " + if(wtrilhoes="Hum","Trilhão ","Trilhões ")
      wResp := wResp + if(len(wbilhoes+wmilhoes+wmilhares+wcentena+wcentavos) >0,"e ","")
   endif
   if Len(wbilhoes) > 0
      wResp := wResp + wbilhoes + " " + if(wbilhoes="Hum","Bilhão ","Bilhões ")
      wResp := wResp + if(len(wmilhoes+wmilhares+wcentena+wcentavos) >0,"e ","")
   endif
   if Len(wMilhoes) > 0
      wResp := wResp + wmilhoes + " " + if(wmilhoes="Hum","Milhão ","Milhões ")
      wResp := wResp + if(len(wmilhares+wcentena+wcentavos) >0,"e ","")
   endif
   if len(wmilhares) > 0
      wResp := wResp + wmilhares + " " + "Mil "
      wResp := wResp + if(len(wcentena+wcentavos) >0,"e ","")
   endif
   if right(wresp,4) $ "Milhão Bilhão Trilhão Milhões Bilhões Trilhões "
      wResp := wResp + "de"
   endif
   wResp := wResp + wcentena + " " + if(val(wvalor) < 2,wsingular,wplural)
   wResp := wResp + if(len(wcentavos) >0,"e ","")
   wResp := if(val(wvalor) >= 1,wresp,space(00))
   
   if Len(wCentavos) > 0
      if Lower(wMoeda) = lower("urv")
         wResp := wResp + wcentavos + " " + if(wcentavos="Hum","Centésimo","Centésimos")
      else
         wResp := wResp + wcentavos + " " + if(wcentavos="Hum","Centavo","Centavos")
      endif
   endif

return (Alltrim(wResp))
*fim da function cExtenso

function cExtensoAux(wcentena)
private wcen,wdez,wuni,wwcen,wwdez,wwuni,wwext,wunid,wdeze1,wdeze2,wcent
*******************************************************************************************
* funcao auxiliar da funcao cextenso
* wcentena => (cha) centena (999) a ser escrito por extenso
* ex:
*    wcen = cextensoaux("125")  => "Cento e Vinte e Cinco"
*********************************************************************************
declare wunid[10],wdeze1[10],wdeze2[10],wcent[10]

   wUnid[1]   := "Hum"
   wUnid[2]   := "Dois"
   wUnid[3]   := "Três"
   wUnid[4]   := "Quatro"
   wUnid[5]   := "Cinco"
   wUnid[6]   := "Seis"
   wUnid[7]   := "Sete"
   wUnid[8]   := "Oito"
   wUnid[9]   := "Nove"
   wUnid[10]  := ""
   wDeze1[1]  := "Onze"
   wDeze1[2]  := "Doze"
   wDeze1[3]  := "Treze"
   wDeze1[4]  := "Quatorze"
   wDeze1[5]  := "Quinze"
   wDeze1[6]  := "Dezesseis"
   wDeze1[7]  := "Dezessete"
   wDeze1[8]  := "Dezoito"
   wDeze1[9]  := "Dezenove"
   wDeze1[10] := ""
   wDeze2[1]  := "Dez"
   wDeze2[2]  := "Vinte"
   wDeze2[3]  := "Trinta"
   wDeze2[4]  := "Quarenta"
   wDeze2[5]  := "Cinquenta"
   wDeze2[6]  := "Sessenta"
   wDeze2[7]  := "Setenta"
   wDeze2[8]  := "Oitenta"
   wDeze2[9]  := "Noventa"
   wDeze2[10] := ""
   wCent[1]   := "Cento"
   wCent[2]   := "Duzentos"
   wCent[3]   := "Trezentos"
   wCent[4]   := "Quatrocentos"
   wCent[5]   := "Quinhentos"
   wCent[6]   := "Seiscentos"
   wCent[7]   := "Setecentos"
   wCent[8]   := "Oitocentos"
   wCent[9]   := "Novecentos"
   wCent[10]  := ""
   wCen       := substr(wcentena,1,1)
   wDez       := substr(wcentena,2,1)
   wUni       := substr(wcentena,3,1)

   If Val(wCentena) = 10
      wwCen := ""
      wwDez := "Dez"
      wwUni := ""
   ElseIf val(wcentena) = 100
      wwCen := "Cem"
      wwDez := ""
      wwUni := ""
   else
      If Val(wCen) = 0
         wCen := "10"
      EndIf
      If Val(wDez) = 0
         wDez := "10"
      EndIf
      If Val(wUni) = 0
         wUni = "10"
      EndIf
      wwCen := wcent [Val(wCen)]
      wwDez := wdeze2[Val(wDez)]
      wwUni := wunid [Val(wUni)]
      if val(wdez) = 1 .And. val(wuni) <> 10
         wwDez := wdeze1[val(wuni)]
         wwUni := space(00)
      endif
   endif
   wwext := ""
   if len(wwCen) > 0
      wwext := wwext + wwCen
      if Len(wwDez) > 0 .Or. Len(wwUni) > 0
         wwext := wwext + " e "
      endif
   endif
   if len(wwdez) > 0
      wwext := wwext + wwdez
      if len(wwuni) > 0
         wwext := wwext +" e "
      endif
   endif
   if len(wwuni) > 0
      wwext := wwext + wwuni
   endif

return(wwext)
*fim da function cExtensoAux()

Function cCancel(wwpmsg1,wwpmsg2,wwpmsg3,wwpmsg4,wwpmsg5)
****************************************************************************
* cancela a execucao de um programa e mostra as mensagens (wmpmsgn) na tela*
* wwpmsg1   => 1. parte da mensagem; aparecera na linha xx                 *
* wwpmsg2   => 2. parte da mensagem; aparecera na linha xx                 *
* wwpmsg3   => 3. parte da mensagem; aparecera na linha xx                 *
* wwpmsg4   => 4. parte da mensagem; aparecera na linha xx                 *
* wwpmsg5   => 5. parte da mensagem; aparecera na linha xx                 *
****************************************************************************
Local wCab1,wCab2,wPrograma

Local WCRLF := chr(13)+chr(10)

wPrograma  := Space(00)
If Len(wc_Prog)>0
	wPrograma  := Upper(AllTrim(wc_Prog[Len(wc_Prog)]))
	wCab1 := "O programa " + wPrograma + " está sendo cancelado"
Else
	wCab1 := "O Aplicativo está sendo cancelado"
EndIf

wCab2 := "pelo(s) seguinte(s) motivo(s):"

//cCaseLog("CCANCEL",wc_FRM_Act,"CCANCEL()#" + wCab1 +chr(13)+chr(10)+ wCab2 +chr(13)+chr(10)+ wwpmsg1)  // ciceroX

cwMsg(4 , wCab1 +WCRLF+WCRLF + wCab2 +WCRLF+WCRLF + wwpmsg1,"Erro")

Winexec("Taskkill /f /im ccase.exe ")

*FreeLib32(nDllWeb)
*FreeLibrary(hRichDLL)
*
*//If ValType(oM_WinMain[1])="O"     //cicerosql
*//   oM_WinMain[1]:End()
*//EndIf
*
*FreeResources()
*ErrorLevel(1)
*? Kennen  // forcar dar erro
*Quit

Return .f.
*fim da Function cCancel()

Function cEmpty(wVar,wPicure)
**********************************************************************************
* Consiste se a Variavel esta indefinda (ValType="U") ou vazia (zero ou Space(00)*
**********************************************************************************
Local wwPicure , wwVar 

   If ValType(wPicure) <> "U" .and. ValType(wVar) = "C"
      wwPicure := strTran(wPicure ," ","")
      wwPicure := strTran(wwPicure,"9","")
      wwPicure := strTran(wwPicure,"!","")
      wwPicure := strTran(wwPicure,"A","")
      wwPicure := strTran(wwPicure,"X","")
      wwVar    := strTran(wVar  ," ","")
      If Len(wwPicure)>0
         If wwPicure==wwVar    // Se não For exatamente igual ( NUNCA mude para <> ou # )
            Return .T.
         Else
            Return .F.
         EndIf
      EndIf
   EndIf

   If ValType(wVar) = "U"
      Return .t.   
   ElseIf ValType(wVar) = "C"
      If Len(AllTrim(wVar)) = 0
         Return .t.   
      EndIf   
   ElseIf ValType(wVar) = "N"
      If wVar = 0
         Return .t.   
      EndIf   
   ElseIf ValType(wVar) = "D"
      wwVar := StrTran(dtoc(wVar),"/","")
      If Len(AllTrim(wwVar)) = 0
         Return .t.   
      EndIf   
   ElseIf ValType(wVar) = "A"
      If Len(wVar) = 0
         Return .t.   
      EndIf   
   EndIf

Return .f.
*Fim da Function cEmpty(wVar,wPicure)


Function cwModulo(wValor)
********************************************************************************
*           funcao para retornar o modulo (positivo) de um valor               *
* wvalor => valor a ser calculado                                              *
*           ex: cmodulo(10 * -3) => 30 (+30)                                   *
********************************************************************************

Return If(wvalor>0,wvalor,wvalor*(-1))
*fim da Function cwModulo(wValor)

Function cNvl(wValor,wTroca)
********************************************************************************
*      Função que verifica se o valor é Nulo e altera pelo valor de Troca      *
********************************************************************************
   If ValType(wValor)="U"
      wValor := wTroca
   EndIf

Return wValor
*fim da Function cNvl(wValor,wTroca)

Function fReadLine(wArq_Handle,wBuffer,wBlockSize,wCharQuebraLine) 
*******************************************************************************************************
*             Funcao para Ler um arquivo txt (dos) linha por linha                                    *
*-----------------------------------------------------------------------------------------------------*
* wArq_Handle      => Codigo do fileHandle do arquivo gerado pelo fOpen()                             *
* wBuffer          => Variavel Privada passada como referencia (@) que conterá o buffer               *
* wBlockSize       => Tamanho do bloco para leitura fisica dos registros                              *
* wCharQuebraLine  => Caracteres que delimitam a linha (default= chr(13)+chr(10)                      *
*******************************************************************************************************
Local wQuebraLen, wCharQuebraLineX, wLinha, wBufferLen, wChar, wx , wwBuffer
wBlockSize      := iif(ValType(wBlockSize)="U", 1024 ,wBlockSize)
wCharQuebraLine := iif(ValType(wCharQuebraLine)="U",chr(13)+chr(10),wCharQuebraLine)

wQuebraLen  := Len(wCharQuebraLine)
wCharQuebraLineX := substr(wCharQuebraLine,1,1)

wLinha := space(00)
Do While .t.

   wBufferLen := Len(wBuffer)

   If wBufferLen = 0 
      wwBuffer := FreadStr(wArq_Handle,wBlockSize)
      If Len(wwBuffer) > 0 
         wBuffer    := wBuffer + wwBuffer
         wBufferLen := Len(wBuffer)
      EndIf
   EndIf

   If wBufferLen = 0
      If Len(wLinha) > 0
          Return wLinha
      Else
         Return "#eof#"
      EndIf   
   EndIf      

   For wx=1 to wBufferLen
       wchar := substr(wBuffer,wx,1)
       If wCharQuebraLineX = wChar
          If (wBufferLen-wx)<wQuebraLen
             wwBuffer := FreadStr(wArq_Handle,wBlockSize)
             If Len(wwBuffer) > 0 
                wBuffer    := wBuffer + wwBuffer
                wBufferLen := Len(wBuffer)
             EndIf
          EndIf
       EndIf
       
       If substr(wBuffer,wx,wQuebraLen) = wCharQuebraLine
          wx := wx + wQuebraLen
          wBuffer := substr(wBuffer,wx)
          Return wLinha
       EndIf

       wLinha := wLinha + wChar
   Next
   wBuffer := substr(wBuffer,wx)

EndDo
Return wLinha
*fim da Function fReadLine(wArq_Handle,wBuffer,wBlockSize,wCharQuebraLine)


function MsgGet2( cTitle, cText1, uVar1, cText2, uVar2)

   local oDlg
   local uTemp1 := uVar1
   local uTemp2 := uVar2
   local lOk   := .f.

   DEFAULT cText1 := "", cText2 := ""

   DEFINE DIALOG oDlg FROM 10, 20 TO 20, 58 TITLE cTitle

   @ 0.1, 1 SAY cText1 OF oDlg SIZE 250, 10
   @ 1.7, 1 SAY cText2 OF oDlg SIZE 250, 10

   @ 0.9, 1 GET uTemp1 SIZE 130, 12 OF oDlg
   @ 2.7, 1 GET uTemp2 SIZE 130, 12 OF oDlg

   @ 3, 05 BUTTON "&Ok"      OF oDlg SIZE 35, 12 ACTION ( oDlg:End(), lOk := .t. ) DEFAULT
   @ 3, 15 BUTTON "&Cancela" OF oDlg SIZE 35, 12 ACTION ( oDlg:End(), lOk := .f. )

   ACTIVATE DIALOG oDlg CENTERED

   If lOk
      uVar1 := uTemp1
      uVar2 := uTemp2
   EndIf

return lOk

Function __replace(__p_Text,__p_String_Old,__p_String_New,__p_Sensitive,__p_Chars_Include_I,__p_Chars_Include_F,__p_Chars_Exception_I,__p_Chars_Exception_F )
Local wLenT,wLenO,wLenC,wSens,wNewText := "",wStrTrim,wEquals,wStrOld,wx,wz,wBo_AlteraI,wBo_AlteraE
Local wCharsIncludeI,wCharsIncludeF,wCharsExceptionI,wCharsExceptionF,wStrAntes,wStrApos,wM_String

   wM_String := {}
      
	wLenT := Len(__p_Text)
	wLenO := Len(__p_String_Old)
	If ValType(__p_Sensitive)<>"L"
		wSens := .T.
	Else
		wSens := __p_Sensitive
	EndIf

	__p_Chars_Include_I   := iif(valtype(__p_Chars_Include_I  )="U",{},__p_Chars_Include_I  )
	__p_Chars_Include_F   := iif(valtype(__p_Chars_Include_F  )="U",{},__p_Chars_Include_F  )
	__p_Chars_Exception_I := iif(valtype(__p_Chars_Exception_I)="U",{},__p_Chars_Exception_I)
	__p_Chars_Exception_F := iif(valtype(__p_Chars_Exception_F)="U",{},__p_Chars_Exception_F)

   For wx := 01 to wLenT                                 
		wCharsIncludeI   := .F.
		wCharsIncludeF   := .F.
		wCharsExceptionI := .F.
		wCharsExceptionF := .F.
	   wBo_AlteraI      := "N"
	   wBo_AlteraE      := "N"

 		wStrTrim  := SubStr(__p_Text,wx,wLenO)
 		If wx < 6
 			wStrAntes := ""
 		Else
 			wStrAntes := SubStr(__p_Text,wx-5,5)
 		EndIf
 		
      wStrApos  := SubStr(__p_Text,wx+wLenO,5)

		If wSens
      	wEquals := wStrTrim == __p_String_Old
      Else 
      	wEquals := clower(wStrTrim) == clower(__p_String_Old) 
      EndIf

      If wEquals
			wCharsIncludeI   := .T.
			wCharsIncludeF   := .T.
			wCharsExceptionI := .F.
			wCharsExceptionF := .F.
		   wBo_AlteraI      := "S"
		   wBo_AlteraE      := "S"

	      For wz := 01 To Len(__p_Chars_Include_I)
 	    		wCharsIncludeI := .F.
	      	wLenC := Len(__p_Chars_Include_I[wz])
	      
 				wStrTrim := SubStr(__p_Text,wx-wLenC,wLenC)

				If wSens
		      	wCharsIncludeI := wStrTrim == __p_Chars_Include_I[wz]
		      Else 
		      	wCharsIncludeI := clower(wStrTrim) == clower(__p_Chars_Include_I[wz]) 
		      EndIf

		      If wCharsIncludeI
	      		Exit
		      EndIf
	      Next

	      For wz := 01 To Len(__p_Chars_Include_F)
     			wCharsIncludeF := .F.
	      	wLenC := Len(__p_Chars_Include_F[wz])
	      
 				wStrTrim := SubStr(__p_Text,wx+wLenO,wLenC)

				If wSens
		      	wCharsIncludeF := wStrTrim == __p_Chars_Include_F[wz]
		      Else 
		      	wCharsIncludeF := clower(wStrTrim) == clower(__p_Chars_Include_F[wz]) 
		      EndIf
		      
		      If wCharsIncludeF
	      		Exit
		      EndIf
	      Next

	      If wCharsIncludeI.And.wCharsIncludeF
	      	wBo_AlteraI := "S"
	      Else
	      	wBo_AlteraI := "N"
	      EndIf

	      For wz := 01 To Len(__p_Chars_Exception_I)
	      	wCharsExceptionI := .F.
	      	wLenC := Len(__p_Chars_Exception_I[wz])
	      
 				wStrTrim := SubStr(__p_Text,wx-wLenC,wLenC)
				If wSens
		      	wCharsExceptionI := wStrTrim == __p_Chars_Exception_I[wz]
		      Else 
		      	wCharsExceptionI := clower(wStrTrim) == clower(__p_Chars_Exception_I[wz]) 
		      EndIf

		      If wCharsExceptionI
		      	Exit
		      EndIf
	      Next
	      
	      If wCharsExceptionI
	      	wBo_AlteraE := "N"
	      EndIf
	      
			If wBo_AlteraE = "S"
		      For wz := 01 To Len(__p_Chars_Exception_F)
		      	wCharsExceptionF := .F.
		      	wLenC := Len(__p_Chars_Exception_F[wz])
		      
	 				wStrTrim := SubStr(__p_Text,wx+wLenO,wLenC)

					If wSens
			      	wCharsExceptionF := wStrTrim == __p_Chars_Exception_F[wz]
			      Else 
			      	wCharsExceptionF := clower(wStrTrim) == clower(__p_Chars_Exception_F[wz]) 
			      EndIf
			      
			      If wCharsExceptionF
			      	Exit
			      EndIf
		      Next

		      If wCharsExceptionF
		      	wBo_AlteraE := "N"
		      EndIf
	      EndIf
      EndIf
      
 		If wBo_AlteraI = "S" .And. wBo_AlteraE = "S"
			wNewText := wNewText + __p_String_New           

			aAdd( wM_String , { wStrAntes+wStrTrim+wStrApos , wStrAntes+__p_String_New+wStrApos })

			wx := (wx-1) + wLenO
 		Else                                               
			wNewText := wNewText + SubStr(__p_Text,wx,1)    
 		EndIf
    Next
            
Return {wNewText,wM_String}

function cWebSeq(wCol)
*******************************************************************************
* Função apenas de referência para a ccase web                                *
*******************************************************************************
return 0
*Fim da function cWebSeq()
