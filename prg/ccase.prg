********************************************************************************* 
** 849 "Error to Access SQL Connector."                                        **
**  Menu do cCase (versao windows)                                             **
**  Programa     : cCase                                                       **
**  Chamado por  :                                                             **
**  Chama        :                                                             **
**  Le           :                                                             **
**  Grava        :                                                             **
**  Data         : 05/12/2000                                                  **
**  Autor        : C_InFormatica (CJT/TDB)                                     **
*********************************************************************************
#include "FiveWin.ch"
#include "dll.ch"
#include "Directry.ch"
#include "Common.ch"
#include "Set.ch"
#include "Constant.ch"
#include "barcode.ch"
#include 'WinINet.ch'
********************************************************************************
*                       DIferenÎas entre Banco de Dados                        *
********************************************************************************
* ACCESS                                                                       *
* ----> null     Ex.: Obj_Nome = null                                          *
********************************************************************************
* MYSQL                                                                        *
* ----> is null  Ex.: Obj_Nome is null                                         *
********************************************************************************

STATIC oMenu   // Menu window object
Static xdll
//STATIC cCars   := '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%'
//STATIC aBarras :={'1110100010101110',;
//                  '1011100010101110',;
//                  '1110111000101010',;
//                  '1010001110101110',;
//                  '1110100011101010',;
//                  '1011100011101010',;
//                  '1010001011101110',;
//                  '1110100010111010',;
//                  '1011100010111010',;
//                  '1010001110111010',;
//                  '1110101000101110',;
//                  '1011101000101110',;
//                  '1110111010001010',;
//                  '1010111000101110',;
//                  '1110101110001010',;//E
//                  '1011101110001010',;
//                  '1010100011101110',;
//                  '1110101000111010',;
//                  '1011101000111010',;
//                  '1010111000111010',;
//                  '1110101010001110',; //K
//                  '1011101010001110',;
//                  '1110111010100010',;
//                  '1010111010001110',;
//                  '1110101110100010',;
//                  '1011101110100010',;//p
//                  '1010101110001110',;
//                  '1110101011100010',;
//                  '1011101011100010',;
//                  '1010111011100010',;
//                  '1110001010101110',;
//                  '1000111010101110',;
//                  '1110001110101010',;
//                  '1000101110101110',;
//                  '1110001011101010',;
//                  '1000111011101010',;//Z
//                  '1000101011101110',;
//                  '1110001010111010',;
//                  '1000111010111010',;// ' '
//                  '1000101110111010',;
//                  '1000100010100010',;
//                  '1000100010100010',;
//                  '1000101000100010',;
//                  '1010001000100010'}

MEMVAR wWhenMenuItem,oFontMemo,oCs_Geral,oCNX_odbc,__oIconMsn1,__oIconWF
MEMVAR wM_Odbc_Login,wM_Tabelas,wM_Relacionamento,wM_RelCursor
MEMVAR oM_Dlg,wM_Dlg,oM_Fld,wM_Case,wM_Folder,wM_Dominio,wM_Objeto,oM_Button,oM_Say,wxM_Objeto,oM_Tree
MEMVAR oM_BtnCombo,wM_Work,wWork,wM_ObjetoFRM,oM_WinMain,wM_Menu,__wM_cCase_IMG,oM_BtnBar,wM_Menu_Global
MEMVAR oM_Brw,oM_Brw_Say,wM_BrwLin,wM_Grid_Col_Order,wM_Case_Col_Order,wM_Grid,wM_Grid_Order,wM_Grid_Seq
MEMVAR wTab_Setup,wM_Tab_Nome,wM_Tab_Filter,wM_Tab_PosFnc,wM_Control,oM_BtnAcs,__wc_FRM
MEMVAR wc_FRM_Act,wc_Session,wc_Log,__wc_Clock_Off,__wc_Clock_On,__wc_Clock //ciceroX
MEMVAR wM_Opcao,wc_Sql,wc_Prog,wc_User,__wKeySeek,__wKeyAcento,wc_Case_Seq,wc_Sistema,wACS_Perfil_TP,wc_funcao
MEMVAR wINI_User , wINI_Pws , wINI_Ip  //cicero140709
MEMVAR wFLd_Num_Obj,wFld_Leg_Stru,wFld_PreFnc,wFld_PosFnc,wFld_Acesso,wc_cli,wc_SQL_tp,wc_SQL_Sufixo,wc_MySqlServer,wc_MySqlLocal,wc_SQL_NewError  // ciceroSQL
MEMVAR __oMsgWin,__oMsnTray,__wMVaruser,__wOpenRichText,__wVarRichText,__wTmpRichText,__oRichTmp
MEMVAR __oWFWin,__oWFTray
MEMVAR __wMsgNBold,__wMsgNItalic,__wMsgNUnder,__wMsgNStrick,__wdbg_MemoCmd
MEMVAR __wMCase_FRM,__wMCase_Obj,__wObj_Nome,__wObj_Tp,__wObj_Seq,__wobjeto,__wobjsay,__wdominio,__wrequerido,__wconteudo,__wgrid,__wpicture

MEMVAR __vProcedure,__oFldPrpPrc,__oFldObjPrc,__oWndProcedure,__wMatrizPrcMemo

MEMVAR __wM_Imp_REL,__wM_Imp_PAG,__wM_Imp_CUR,__wM_Imp_CMP,__wM_Imp_SAY,__wM_Imp_BOX,__wM_Imp_RFM,__wM_Imp_IMG,__wM_Imp_PAR
MEMVAR __wM_RelFiltro,__wMRelOrderBy,__wTpRel,__wMCabecalho,__wMParCab,__wMRodape,__wMParRod
MEMVAR oFont,oFontBold,__wMsgNUsrArea,__wMsgNUsrNick,__wMsgNAssunto
MEMVAR __wMRelObj,__wPrn_Largura,__nRowStep,__nColStep,__wOrienta,__wObj_Rel
MEMVAR __oFontCmp,__oFontTit,__oFontPag,__oFontRfm,__oFontRfmTit,__oFontSay,__oPenDefault,__oFontDefaultCmp,__oFontDefaultTit
MEMVAR __oPrn,__wRelItem,__wTotaliza,__wTitle,__wFormato,__wTitlePag,__wTitleBox,__wAutoSize,__wRodape

MEMVAR wc_Cursor,wc_CursorAux,wxCursor,wxCursorAux,_wM_Relatorio,__wM_Font,__wMMsgTalk,__wM_Pen
MEMVAR wCS_Grid ,wCS_Conteudo,wCS_AntConteudo,wCS_Coluna,wCS_LinDesloc ,wCS_ObjCab ,wCS_TypeVar,wCS_Cabeca,wCS_TpWhen,wCS_Origem ,wCS_Formato
MEMVAR wCS_Tamanho,wCS_Picture,wCS_AlinDireita,wCS_ObjGet,wCS_ColDesloc ,wCS_GridOrder,wCS_GridSeq,wCS_When ,wCS_Valid,wCS_Function,wCS_AuxFunction,wCS_GridOrderTp
MEMVAR wCS_TipoGet,wCS_Filtro ,wCS_Requerido ,wCS_Unique,wCS_CabCol_Grid,wCS_Atrib_Lst,wCS_TabNome,wCS_Key_Col,wCS_Action,wCS_Maiuscula,wCS_HScroll
MEMVAR wCS_Key_Tp,wCS_QtdLin ,wCS_ObjDesloc ,wCS_ObjNome,wCS_QtdCol_Grid,wCS_Key_Exc_Tp,wCS_TpValid,wCS_DefVar,wCS_ObjRef,wCS_Acento ,wCS_Border
MEMVAR wCS_F1Conteudo,wCS_F1ObjGet,wCS_F1ObjCab,wCS_F2Conteudo,wCS_F2ObjGet,wCS_F2ObjCab ,wCS_Frame,wCS_PassWord,wCS_Change,wCS_Expande, wCS_Acesso,wCS_Descricao,wCS_Vertical

MEMVAR wG_Atual,wG_Anterior,wG_GoTo,wM_Grid_Ant,wBt_Inclui,wBt_Altera,wBt_Exclui,wBt_Grava,wBt_Cancel
MEMVAR wGrid,wM_Fld_Ant,wM_Fld_Atual,__wc_Path_IMG,wc_emp
MEMVAR wMBrwSTRCampos,wMBrwCabeca,wMBrwColSize,wMBrwColAlinha,wMBrwCampos,wMFunc_Atrib,wMFunc_Refresh
MEMVAR wMFunc_DbClick,wMFunc_rClick,wMFunc_Change,wMGrid_Col,wMCase_Col ,wM_Colunas,wM_Indices,wMFunc_ClrGTxt,wMFunc_ClrSTxt
MEMVAR wx_Menu,wXOSay_Cabeca,wXCabecalho,wM_Grid_Cursor,wMgrupos,wMrel,wM_User,wM_Name_User,wM_Sis_User

*----------------SCRIPT--------------------------*
MEMVAR wBlc , wBlx, wBlc_Open , wSMatrix , wScriptReturn , wIf_Open , wIfNum, wWhile_Open , wWhileNum , wFor_Open , wForNum ,  wcDebug
MEMVAR wdbg_MProc, wdbg_MLin , wdbg_MVar, wdbg_Goto,wdbg_Trace,wdbg_Lin,wc_Prc_Trace // ciceroSQL
*------------------------------------------------*
MEMVAR wc_Epoca,wM_ACS_Restricao,wM_Sinonimo,wc_Acs_Enter,oXMeter,wM_ID_Brw,nDllWeb,hRichDLL,__wc_DataBLOB,__oAtualizaCCASE,__oMeterAtualiza

MEMVAR hWinINet
                                                                                                          
MEMVAR oBrwSay,wXoBrw,_wMM_Grid,_wBrwLin,wGrid_Order,_wAbre_Pesquisa,oxCbx,_wMrc_CAnt,wLenBuffer,wBuffer,_wMrc_Lst_Cnv

MEMVAR __wc_IDE_objeto,__wc_IDE_ObjPrp,__wc_IDE_ObjTab,__wc_IDE_Menu_Open,__wc_IDE_Menu_Objeto,__wc_IDE_Menu_ObjPrp,__wc_IDE_Menu_ObjTab,__wc_IDE_ObjOpen,__wc_IDE_Tree
MEMVAR __wMCase_IDE_Obj,__wMCase_IDE_Var,__wMCase_IDE_Menu,__wMCase_IDE_Prp,__wSuperLFRM,__wSuperMFRM,__wSuperLPRC,__wSuperMPRC,__oClpMaster,__wc_IDE_ObjVar,__wc_IDE_NewObj,__wc_IDE_NewObjOpen

MEMVAR _wP_TYPE,_wP_TITLE,_wP_CONTEUDO,_wP_TABLE,_wP_TOOLTIP,_wP_ITEM_OBJ,_wP_ITEM_CAB,_wP_SELECT_KEY,_wP_INSERT_KEY,_wP_UPDATE_KEY,_wP_DELETE_KEY,_wP_GERACONTEUDO
MEMVAR _wP_EXPRESSION,_wP_ORDERBY,_wP_SORT,_wP_REQUERIDO,_wP_CRIPTOGRAFADO,_wP_IMAGEM_PRI,_wP_IMAGEM_SEC,_wP_LINHA,_wP_COLUNA,_wP_ALTURA,_wP_LARGURA

MEMVAR _wP_GRD_ATIVO,_wP_FLT_ATIVO,_wP_FLT_ATUAL,_wP_NIVEL,_wP_GRD_GET,_wP_GRD_IMG

MEMVAR _wP_WHEN,_wP_POS_FNC,_wP_PRE_FNC,_wP_MUDA_ITEM_FNC,_wP_DCLICK,_wP_LCLICK,_wP_RCLICK

MEMVAR _wP_DEFAULT,_wP_PICTURE,_wP_ACESSO,_wP_PESQUISA,_wP_FRAME,_wP_DOMINIO,_wP_DESCRICAO,_wP_TAMANHO,_wP_DECIMAL,_wP_SISTEMA,_wP_ACAO,_wP_ACTION,_wP_SEQUENCE 

MEMVAR _wP_OBJ_SEQ,_wP_OBJ_NOME,_wP_OBJ_TP,_wP_OBJ_NOME_PAI,_wP_VERTICAL,_wP_PROGRAMA,_wP_OBJ_DESLOC,_wP_WHEN_DEFAULT,_wP_JOIN_LST,_wP_PROCEDURE,_wP_POSICAO
MEMVAR _wP_CENTER,_wP_VSCROLL,_wP_HSCROLL,_wP_DESLOC_LINHA,_wP_VALID_LST,_wP_OBJ_ANT,_wP_OBJ_POS,_wP_STYLE,_wP_SEPARADOR,_wP_ESTRUTURA,_wP_PESQ_RELAC,_wP_FONT
MEMVAR _wP_QUEBRA,_wP_ALINHA,_wP_VALID_TP,_wP_WHERE

MEMVAR _wP_DESTROY,_wP_END,_wP_VALID,_wP_OPTION,_wP_LOSTFOCUS,_wP_FOCUS,_wP_SETFOCUS,_wP_CLICK,_wP_SETIMAGE,_wP_HIDE,_wP_SHOW,_wP_GO_FIRST,_wP_GO_PREVIOUS,_wP_GO_NEXT,_wP_GO_LAST


Function Main(paramDLL,wMainParm2)
******************************************************************************
*              funcao para chamada do menu principal do sistema              *
******************************************************************************
Local wWndHandle,wx
       *----- variaveis publicas do sistema    ----------------------------*
public oFont,oFontBold,oCs_Geral,wxTpCursor,oFontMemo,oCNX_odbc,nDllWeb,hRichDLL
Public hWinINet
Public _wAbre_Pesquisa := .T.
Public wCs_Alloc := 0

       * --------- variaveis publicas controladores de arquivos ---------- *
     nDllWeb  := LoadLib32("avicap32.dll")
     hRichDLL := LoadLibrary("riched20.dll")
     hWinINet := LoadLib32( "WinINet.dll" )

   __MVPUBLIC("oM_Dlg" )
   __MVPUBLIC("oM_Fld" )
   __MVPUBLIC("oM_Brw" )
   __MVPUBLIC("oM_Brw_Say" )
   __MVPUBLIC("oM_Button" )
   __MVPUBLIC("oM_BtnAcs" )
   __MVPUBLIC("oM_Say" )
   __MVPUBLIC("oM_BtnCombo" )
   __MVPUBLIC("oM_BtnBar" )

   __MVPUBLIC("wMBrwSTRCampos" )
   __MVPUBLIC("wMBrwCabeca" )
   __MVPUBLIC("wMBrwColSize" )
   __MVPUBLIC("wMBrwColAlinha" )
   __MVPUBLIC("wMBrwCampos" )
   __MVPUBLIC("wMFunc_Atrib" )
   __MVPUBLIC("wMFunc_Refresh" )
   __MVPUBLIC("wMFunc_DbClick" )
   __MVPUBLIC("wMFunc_rClick" )
   __MVPUBLIC("wMFunc_Change" )
   __MVPUBLIC("wMFunc_ClrGTxt" )
   __MVPUBLIC("wMFunc_ClrSTxt" )
   __MVPUBLIC("wMGrid_Col" )
   __MVPUBLIC("wMCase_Col" )
   __MVPUBLIC("wM_Opcao" )
   __MVPUBLIC("wc_Prog" )
   __MVPUBLIC("wM_Odbc_Login" )
   __MVPUBLIC("wM_Tabelas" )
   __MVPUBLIC("wM_Relacionamento" )
   __MVPUBLIC("wM_Dlg" )
   __MVPUBLIC("wM_BrwLin" )
   __MVPUBLIC("wM_Grid_Col_Order" )
   __MVPUBLIC("wM_Case_Col_Order" )
   __MVPUBLIC("__wKeySeek" )
   __MVPUBLIC("__wKeyAcento" )
   __MVPUBLIC("wM_Case" )
   __MVPUBLIC("wM_Folder" )
   __MVPUBLIC("oM_Tree" )
   __MVPUBLIC("wTab_Setup" )
   __MVPUBLIC("wM_Tab_Nome" )
   __MVPUBLIC("wM_Tab_Filter" )
   __MVPUBLIC("wM_Dominio" )
   __MVPUBLIC("wM_Objeto" )
   __MVPUBLIC("wM_ObjetoFRM" )
   __MVPUBLIC("wxM_Objeto" )
   __MVPUBLIC("wc_Case_Seq" )
   __MVPUBLIC("wM_Grid_Order" )
   __MVPUBLIC("wM_Grid" )
   __MVPUBLIC("wM_Work" )
   __MVPUBLIC("wWork" )
   __MVPUBLIC("wM_Grid_Seq" )
   __MVPUBLIC("wM_Tab_PosFnc" )
   __MVPUBLIC("wc_User" )
   __MVPUBLIC("wACS_Perfil_TP" )
   __MVPUBLIC("__wM_cCase_IMG" )
   __MVPUBLIC("wWhenMenuItem" )
   __MVPUBLIC("wBt_Inclui" )
   __MVPUBLIC("wBt_Altera" )
   __MVPUBLIC("wBt_Exclui" )
   __MVPUBLIC("wBt_Grava" )
   __MVPUBLIC("wBt_Cancel" )
   __MVPUBLIC("wM_Control" )
   __MVPUBLIC("wM_Grid_Cursor" )
   __MVPUBLIC("wM_Colunas" )
   __MVPUBLIC("wM_Indices" )
   __MVPUBLIC("wMgrupos" )
   __MVPUBLIC("wMrel" )
   __MVPUBLIC("wM_User" )
   __MVPUBLIC("wM_Name_User" )
   __MVPUBLIC("wM_Sis_User" )
   __MVPUBLIC("wM_ACS_Restricao")
   __MVPUBLIC("wM_Sinonimo")
   __MVPUBLIC("wM_RelCursor")
   __MVPUBLIC("wM_Menu_Global")
   __MVPUBLIC("__wc_Path_IMG")
   __MVPUBLIC("_wM_Relatorio")

   __MVPUBLIC("__wc_FRM")
   __MVPUBLIC("wc_emp")
   __MVPUBLIC("wc_Sistema" )
   __MVPUBLIC("wc_Session" )  //ciceroX
   __MVPUBLIC("wc_FRM_Act" )  //ciceroX
   __MVPUBLIC("wc_Log" )  //ciceroX
   __MVPUBLIC("wc_Sql" )
   __MVPUBLIC("wc_Acs_Enter")
   __MVPUBLIC("wc_Epoca")
   __MVPUBLIC("wc_cli")
   __MVPUBLIC("__wM_Font")
   __MVPUBLIC("__wM_Pen")
   __MVPUBLIC("__wc_DataBLOB")

   Public wc_Prc_Trace    := space(00)  // ciceroSQL
   Public wc_SQL          := space(00) // ciceroSQL
   Public wc_SQL_tp       := "M"       // ciceroSQL
   Public wc_SQL_Sufixo   := Space(00) // ciceroSQL
   Public wc_SQL_NewError := Space(00) // ciceroSQL
   Public wc_MySqlServer  := Space(00) // ciceroSQL
   Public wc_MySqlLocal   := Space(00) // ciceroSQL
   Public wINI_User       :=space(00)
   Public wINI_Pws        :=space(00)
   Public wINI_Ip         :=space(00)

   Public oM_WinMain      := {}
   Public __wVarRichText  := ""
   Public __wOpenRichText := .F.
   Public __wTmpRichText  := ""
   Public __wMCase_Obj := {}
   Public __wMCase_FRM := {}
   Public __wObj_Nome  := 01
   Public __wObj_Tp    := 02
   Public __wObj_Seq   := 03
   Public __wobjeto    := 04
   Public __wobjsay    := 05
   Public __wdominio   := 06
   Public __wrequerido := 07
   Public __wconteudo  := 08
   Public __wgrid      := 09
   Public __wpicture   := 10
   Public __oClpMaster

   Public wc_Cursor    := {}
   Public wc_CursorAux := {}
   Public wxCursor     := {}
   Public wxCursorAux  := {}

   Public __wc_IDE_Tree        := nil
   Public __wc_IDE_objeto      := nil
   Public __wc_IDE_ObjPrp      := nil
   Public __wc_IDE_ObjTab      := nil
   Public __wc_IDE_ObjVar      := nil
   Public __wc_IDE_NewObj      := nil

   Public __wc_IDE_NewObjOpen  := .F.
   Public __wc_IDE_ObjOpen     := .F.
   Public __wc_IDE_Menu_Open   := .F.

   Public __wc_IDE_Menu_Objeto := nil
   Public __wc_IDE_Menu_ObjPrp := nil
   Public __wc_IDE_Menu_ObjTab := nil

   Public __wMCase_IDE_Obj     := {}
   Public __wMCase_IDE_Var     := {}
   Public __wMCase_IDE_Menu    := {}
   Public __wMCase_IDE_Prp     := {}
                               
   Public __wSuperLFRM         := 01
   Public __wSuperMFRM         := {}
   Public __wSuperLPRC         := 01
   Public __wSuperMPRC         := {}

   Public wdbg_Trace   := {}
   Public wdbg_Lin     := 0

   Public __vProcedure       := {}
   Public __oFldObjPrc       := nil
   Public __oFldPrpPrc       := {}
   Public __oWndProcedure    := nil
   Public wc_funcao          := ""

   Public _wP_LINHA          := "linha"
   Public _wP_COLUNA         := "coluna"
   Public _wP_ALTURA         := "altura"
   Public _wP_LARGURA        := "largura"
                             
   Public _wP_TYPE           := "type"
   Public _wP_TITLE          := "title"
   Public _wP_CONTEUDO       := "conteudo"
   Public _wP_TABLE          := "tab_nome"
   Public _wP_TOOLTIP        := "tooltip"
   Public _wP_ITEM_OBJ       := "item_obj"
   Public _wP_ITEM_CAB       := "item_cab"
   Public _wP_SELECT_KEY     := "select_key"
   Public _wP_INSERT_KEY     := "insert_key"
   Public _wP_UPDATE_KEY     := "update_key"
   Public _wP_DELETE_KEY     := "delete_key"
   Public _wP_GERACONTEUDO   := "gera_conteudo"
   Public _wP_EXPRESSION     := "expression"
   Public _wP_ORDERBY        := "orderby"
   Public _wP_SORT           := "sort"
   Public _wP_REQUERIDO      := "requerido"
   Public _wP_CRIPTOGRAFADO  := "password"
   Public _wP_IMAGEM_PRI     := "imagem_pri"
   Public _wP_IMAGEM_SEC     := "imagem_sec"

   Public _wP_GRD_ATIVO      := "grd_ativo"
   Public _wP_FLT_ATIVO      := "flt_ativo"
   Public _wP_FLT_ATUAL      := "flt_atual"
   Public _wP_NIVEL          := "nivel"
   Public _wP_GRD_GET        := "grd_get"
   Public _wP_GRD_IMG        := "grd_img"

   Public _wP_WHEN           := "when"
   Public _wP_POS_FNC        := "pos_fnc"
   Public _wP_PRE_FNC        := "pre_fnc"
   Public _wP_MUDA_ITEM_FNC  := "muda_item_fnc"
   Public _wP_DCLICK         := "doble_click"  // "d_click"
   Public _wP_LCLICK         := "l_click"
   Public _wP_RCLICK         := "r_click"
                             
   Public _wP_CLR_BACK       := "clr_back"
   Public _wP_CLR_TEXT       := "clr_text"

   Public _wP_CLR_HEAD_BACK  := "clr_head_back"
   Public _wP_CLR_HEAD_TEXT  := "clr_head_text"
   Public _wP_CLR_GRD_BACK   := "clr_grid_back"  // "clr_grd_back"
   Public _wP_CLR_GRD_TEXT   := "clr_grid_text"  // "clr_grd_text"
   Public _wP_CLR_FOCUS_BACK := "clr_focus_back"
   Public _wP_CLR_FOCUS_TEXT := "clr_focus_text"
   Public _wP_PRE_FNC_INC    := "pre_fnc_inc"
   Public _wP_POS_FNC_INC    := "pos_fnc_inc"
   Public _wP_PRE_FNC_ALT    := "pre_fnc_alt"
   Public _wP_POS_FNC_ALT    := "pos_fnc_alt"
   Public _wP_PRE_FNC_GRV    := "pre_fnc_grv"
   Public _wP_POS_FNC_GRV    := "pos_fnc_grv"
   Public _wP_PRE_FNC_EXC    := "pre_fnc_exc"
   Public _wP_POS_FNC_EXC    := "pos_fnc_exc"
   Public _wP_PSQ_FNC        := "psq_fnc"
   Public _wP_WHEN_INC       := "when_inc"
   Public _wP_WHEN_ALT       := "when_alt"
   Public _wP_WHEN_GRV       := "when_grv"
   Public _wP_WHEN_EXC       := "when_exc"

   Public _wP_ALLOCSTM       := "allocstatement" 
   Public _wP_DATABASE       := "database"
   Public _wP_COLUMN         := "column"
   Public _wP_DEFAULT        := "default"
   Public _wP_PICTURE        := "picture"
   Public _wP_ACESSO         := "acesso"
   Public _wP_PESQUISA       := "pesquisa"
   Public _wP_FRAME          := "frame"
   Public _wP_DOMINIO        := "dominio"
   Public _wP_DESCRICAO      := "descricao"
   Public _wP_TAMANHO        := "tamanho"
   Public _wP_DECIMAL        := "decimal"
   Public _wP_SISTEMA        := "sistema"
   Public _wP_ACAO           := "acao"
   Public _wP_ACTION         := "acao"
   Public _wP_SEQUENCE       := "sequence"

   Public _wP_OBJ_SEQ        := "obj_seq"
   Public _wP_OBJ_NOME       := "obj_nome"
   Public _wP_OBJ_TP         := "obj_tp"
   Public _wP_OBJ_NOME_PAI   := "obj_nome_pai"
   Public _wP_VERTICAL       := "vertical"
   Public _wP_PROGRAMA       := "programa"
   Public _wP_OBJ_DESLOC     := "obj_desloc"
   Public _wP_WHEN_DEFAULT   := "when_default"
   Public _wP_JOIN_LST       := "join_lst"
   Public _wP_PROCEDURE      := "procedure"
   Public _wP_POSICAO        := "posicao"
   Public _wP_CENTER         := "centro"
   Public _wP_VSCROLL        := "v_scroll"
   Public _wP_HSCROLL        := "h_scroll"
   Public _wP_DESLOC_LINHA   := "desloc_linha"
   Public _wP_VALID_LST      := "valid_lst"
   Public _wP_OBJ_ANT        := "obj_ant"
   Public _wP_OBJ_POS        := "obj_pos"
   Public _wP_STYLE          := "style"
   Public _wP_SEPARADOR      := "separador"
   Public _wP_ESTRUTURA      := "estrutura"
   Public _wP_PESQ_RELAC     := "pesq_relac"
   Public _wP_FONT           := "font"
   Public _wP_QUEBRA         := "quebra"
   Public _wP_ALINHA         := "alinha"
   Public _wP_VALID_TP       := "valid_tp"
   Public _wP_WHERE          := "where"

   Public _wP_DESTROY        := "destroy()"
   Public _wP_END            := "end()"
   Public _wP_VALID          := "valid()"
   Public _wP_OPTION         := "option()"
   Public _wP_LOSTFOCUS      := "lostfocus()"
   Public _wP_FOCUS          := "focus()"
   Public _wP_SETFOCUS       := "setfocus()"
   Public _wP_CLICK          := "click()"
   Public _wP_SETIMAGE       := "setimage()"
   Public _wP_HIDE           := "hide()"
   Public _wP_SHOW           := "show()"
   Public _wP_GO_FIRST       := "go_first()"
   Public _wP_GO_PREVIOUS    := "go_previous()"
   Public _wP_GO_NEXT        := "go_next()"
   Public _wP_GO_LAST        := "go_last()"

// __MVPUBLIC("wc_Stru_PC" )
// __MVPUBLIC("wc_Stru_CC" )
// __MVPUBLIC("wc_Stru_Fornec" )
// __MVPUBLIC("wc_Stru_Cliente" )
// __MVPUBLIC("wc_Stru_Material" )

   Public wM_ACS_Restricao := {}
   Public wM_Sinonimo      := {}

   aadd(wM_Sinonimo,{"a1","a2"})
   aadd(wM_Sinonimo,{"b1","b2"})
   aadd(wM_Sinonimo,{"c1","c2"})
   aadd(wM_Sinonimo,{"d1","d2"})

// *testex(wM_Sinonimo[1])
// *testex(wM_Sinonimo[2])

   _wM_Relatorio           := {}
   wACS_Perfil_TP          := space(00)
   wc_Sistema              := Space(00)
   wc_Session              := 0 // ciceroX
   wc_FRM_Act              := Space(00) // ciceroX
   wc_Log                  := .f. // ciceroX
   __wc_FRM                := 0
   __wc_Clock_Off          := 0
   __wc_Clock_On           := 0
   __wc_Clock              := 0
   wMBrwSTRCampos          := {}
   wMBrwCabeca             := {}
   wMBrwColSize            := {}
   wMBrwColAlinha          := {}
   wMBrwCampos             := {}
   wMFunc_Atrib            := {}
   wMFunc_Refresh          := {}
   wMFunc_DbClick          := {}
   wMFunc_rClick           := {}
   wMFunc_Change           := {}
   wMFunc_ClrGTxt          := {}
   wMFunc_ClrSTxt          := {}
   wMGrid_Col              := {}
   wMCase_Col              := {}
   wM_Grid_Cursor          := {}
   wM_Opcao                := {}
   wM_Odbc_Login           := {}
   wM_Relacionamento       := {}
                           
   oM_Dlg                  := {}
   wM_Dlg                  := {}
   oM_Fld                  := {}
   oM_Brw                  := {}
   oM_Brw_Say              := {}
   wM_BrwLin               := {}
   wM_Grid_Col_Order       := {}
   wM_Case_Col_Order       := {}
   wM_Case                 := {}
   wM_Folder               := {}
   oM_Tree                 := {}
   wTab_Setup              := {}
   wM_Tab_Nome             := {}
   wM_Tab_Filter           := {}
   wM_Dominio              := {}
   wM_Objeto               := {}
   wM_ObjetoFRM            := {}
   wxM_Objeto              := {}
   oM_Button               := {}
   oM_BtnAcs               := {}
   wM_Grid_Order           := {}
   wM_Grid                 := {}
   oM_Say                  := {}
   oM_BtnCombo             := {}
   wM_Work                 := {}
   wWork                   := {}
   wM_Grid_Seq             := {}
   wM_Tab_PosFnc           := {}
   oM_BtnBar               := {}
   __wM_cCase_IMG          := {}
   wM_Control              := {}
   wM_Tabelas              := {}
   wM_Colunas              := {}
   wM_Indices              := {}
   wWhenMenuItem           := .T.
   wc_Case_Seq             := 00
   __wKeyAcento            := 00
   wBt_Inclui              := 01
   wBt_Altera              := 02
   wBt_Exclui              := 03
   wBt_Grava               := 04
   wBt_Cancel              := 05
   wc_User                 := Space(00)
   wc_Prog                 := {}
   wMgrupos                := {}
   wMrel                   := {}
   wM_User                 := {}
   wc_Epoca                := 2000
   wM_Sis_User             := {}
   __wc_Path_IMG           := ""
   wc_emp                  := 00
   wc_cli                  := 00
   __wM_Font               := {}
   __wM_Pen                := {}

   Public __wMMsgTalk      := {}
   Public __wMsgTalkWnd    := "" 
   Public __wMsgTalkTxt    := "" 
   Public __wMsgTalkCheck  := .F.
   Public __wMsg_Open      := 0
   Public __wWF_Open       := 0
   Public __wc_abre_wf     := "N"
   Public __wMsgPesqDt1
   Public __wMsgPesqDt2
   Public __wMsgPesqNome
   Public __oMsgWin
   Public __oMsnTray
   Public __oWFWin
   Public __oWFTray
   Public __oMsnTree
   Public __oIconMsn1
   Public __oIconWF
   Public __oDescanso
   Public __oDescansoWF
   Public __oRichTmp
   Public __wMsgCAssunto
   Public __wMsgCTexto
   Public __wMsgCLin
   Public __wMsgCGrid
   Public __wMsgNUsrArea
   Public __wMsgNUsrNick
   Public __wMsgNAssunto
   Public __wMsgNTexto
   Public __wMsgNMemo
   Public __wMsgSalvaModelo
   Public __wMsgNBold  
   Public __wMsgNItalic
   Public __wMsgNUnder 
   Public __wMsgNStrick
   Public __wMsgCGrid_Col_Order
   Public __wMsgCGrid_Order
   Public __wSmtpServer
   Public __wSmtpPort
   Public __wSmtpA
   Public __wSmtpB
   Public __oMRefreshMsg
   Public __wMsgNCheckEmail   := .F.
   Public __wMsgRefreshBarMsg := .T.
   Public __wMsgNPara         := ""
   Public __wMsgNEmail        := ""
   Public __wMsgNAnexo        := ""
   Public __wMsgNUserPara     := {}
   Public __wMsgNUserEmail    := {}
   Public __wMsgNUserAnexo    := {}
   Public __oWinMsgDest
   Public __oTreeCheckMsg
   Public __oWinMsgModelo
   Public __oTreeModelo

   Public __wWFTexto
   Public __wWFLin
   Public __wWFGrid
   Public __wWFGrid_Col_Order
   Public __wWFGrid_Order

   aAdd(wc_Prog,"")
   ********* inicio das definicoes exclusivas c_info ****************************

   /* -------------------- definicoes das variaveis do FOLDER --------------------- */
   public wFLd_Num_Obj  := 01
   public wFld_Leg_Stru := 02
   public wFld_PreFnc   := 03
   public wFld_PosFnc   := 04
   public wFld_Acesso   := 05
   public wM_Fld_Atual  := {}
   public wM_Fld_Ant    := {}
   *-------------------------------------------------------------------------*

   ********* inicio das definicoes exclusivas c_info ****************************

   *-------------- definicoes das variaveis da cCase --------------------- */
   public wCS_Grid        := 00
   public wCS_Conteudo    := 01
   public wCS_AntConteudo := 02
   public wCS_Coluna      := 03
   public wCS_Cabeca      := 04
   public wCS_TypeVar     := 05
   public wCS_DefVar      := 06
   public wCS_LinDesloc   := 07
   public wCS_ColDesloc   := 08
   public wCS_Tamanho     := 09
   public wCS_Picture     := 10
   public wCS_AlinDireita := 11
   public wCS_Requerido   := 12
   public wCS_ObjGet      := 13
   public wCS_When        := 14
   public wCS_Valid       := 15
   public wCS_GridSeq     := 16
   public wCS_GridOrder   := 17
   public wCS_Formato     := 18
   public wCS_Filtro      := 19
   public wCS_Unique      := 20
   public wCS_Key_Tp      := 21
   public wCS_Key_Col     := 22
   public wCS_Function    := 23
   public wCS_ObjCab      := 24
   public wCS_ObjDesloc   := 25
   public wCS_TpWhen      := 26
   public wCS_ObjRef      := 27
   public wCS_QtdLin      := 28
   public wCS_ObjNome     := 29
   public wCS_TabNome     := 30
   public wCS_QtdCol_Grid := 31
   public wCS_CabCol_Grid := 32
   public wCS_Atrib_Lst   := 33
   public wCS_Key_Exc_Tp  := 34
   public wCS_TpValid     := 35
   public wCS_Origem      := 36
   public wCS_AuxFunction := 37
   public wCS_Maiuscula   := 38
   public wCS_Acento      := 39
   public wCS_HScroll     := 40
   public wCS_F1Conteudo  := 41
   public wCS_F1ObjGet    := 42
   public wCS_F1ObjCab    := 43
   public wCS_F2Conteudo  := 44
   public wCS_F2ObjGet    := 45
   public wCS_F2ObjCab    := 46
   public wCS_Frame       := 47
   public wCS_PassWord    := 48
   public wCS_Change      := 49
   public wCS_Border      := 50
   public wCS_Expande     := 51
   public wCS_Acesso      := 52
   public wCS_Descricao   := 53
   public wCS_Vertical    := 54
   public wCS_GridOrderTp := 55
   *-----------------------------------------------------------------------*

   * -------------- definicoes das variaveis do Controle de Grid  --------------- *
   public wM_Grid_Ant := {}
   public wG_Atual    := 1
   public wG_Anterior := 2
   public wG_GoTo     := 3
   *-------------------------------------------------------------------------------*

   Public __wc_Cursor    := {}
   Public __wc_CursorAux := {}
   Public wxCursor       := {}
   Public wxCursorAux    := {}

   PUBLIC wM_ID_Brw := {}
   
   set century on
   set date  to british
   set epoch to 1920

   DEFINE FONT  oFont      NAME  "Arial" SIZE 05, 14
   DEFINE FONT  oFontBold  NAME  "Arial" SIZE 05, 14 BOLD
   oFontMemo := TFont():New("Courier New",08,19,,,,,,,,,,,,,,)

   c_cCaseINI_Atribui()  //  funcao para Atribuir os parametros da cCase.ini          

   if Valtype(paramDLL) = "C"
      if Substr(lower(trim(paramDLL)),1,6) = "config"
         cSql_Cria_Odbc(paramDLL) // Funcao para criar a odbc na maquina do usuario  (SysCare)
         quit
      EndIf
   EndIf

   c_Define_Tabelas()

   *--------------------------------------------Parâmetros inicial da cCase.exe-----------------------------------------------*
   if Valtype(paramDLL) = "C"

      cCase_ATualiza_Dlg(lower(trim(paramDLL)),wMainParm2)
      
      Quit
      
    //if Substr(lower(trim(paramDLL)),1,6) = "backup"
    //   cCase_ATualiza_Versao(1,wMainParm2)  // backup
    //ElseIf Substr(lower(trim(paramDLL)),1,6) = "update"
    //   cCase_ATualiza_Versao(2,wMainParm2)  // update
    //ElseIf Substr(lower(trim(paramDLL)),1,9) = "ccase.exe"
    //   cCase_ATualiza_Versao(3,wMainParm2)  // 
    //ElseIf Substr(lower(trim(paramDLL)),1,6) = "config"
    //Else
    //   MsgInfo("            Parâmetros inválidos." + chr(13)+chr(10) + chr(13)+chr(10) +" Backup -> Backup de atualização da cCase" + chr(13)+chr(10) + " Update -> Restore de atualização da cCase"+ chr(13)+chr(10) + " cCase.exe -> Extrai o Arquivo upd\ccase.exe"+ chr(13)+chr(10) + " config -> Configura o SysCare (Registra Odbc, cria conexão e atalho)" + chr(13)+chr(10) + " configUser -> Configura o SysCare (cria conexão e atalho)")
    //EndIf
    //
    //quit

   EndIf

   If .Not.__f(paramDLL)
      Return .F.
   EndIf
   *--------------------------------------------------------------------------------------------------------------------------*
/*
wwork := fConnect_Tabela( "ccase_obj" , "Select * from ccase_prp " )
msginfo("A1")
wwork := fConnect_Tabela( "ccase_obj" , "Select * from ccase_prp  where prp_nome = 'A1'" )
msginfo("A2")
wwork := fConnect_Tabela( "ccase_obj" , "Select * from ccase_prp  where prp_nome = 'A2'" )
msginfo("A3")
wwork := fConnect_Tabela( "ccase_obj" , "Select * from ccase_prp  where prp_nome = 'A3'" )
msginfo("A4")
wwork := fConnect_Tabela( "ccase_obj" , "Select * from ccase_prp  where prp_nome = 'A4'" )
msginfo("A2")

return .t.
quit
*/
   *--------------------------------------------------------------------------------------------------------------------------*
   wc_Session := cCaseSequence("ccase_session")        // ciceroX

   fObj_LoadAll("FRM_Sys_Acesso")

   SetKey( VK_F2, { | nKey | cSysCareMSG()                  })     // cicerox
   SetKey( VK_F5, { | nKey | fKey_Func(1)                   })     // cicerox

   If (wc_user='C'         .Or.;
       wc_user='AFEITOZA'  .Or.;
       wc_user='DVALENTE'  .Or.;
       wc_user='FTEIXEIRA' .Or.;
       wc_user='RGOMES'    .Or.;
       wc_user='AILTON'    .Or.;
       wc_user='DENIS'     .Or.;
       wc_user='ROBSON'    .Or.;
       wc_user='FERNANDO') .And. wc_funcao=="DESE"

      SetKey( VK_F7 , { | nKey | fObj_LoadAll("__FRM_Propriedades") })     // Thiago - fev.2011
      SetKey( VK_F8 , { | nKey | msginfo(wc_FRM_Act,wc_sistema) })     // cicerox
      SetKey( VK_F9 , { | nKey | __fSuper_IDE()                 })     // cicerox
      //SetKey( VK_F10, { | nKey | __fSuper_Menu()                })     // cicerox
   EndIf

   If wc_Acs_Enter = .T.
      fUpdate2("acs_usuario","usr_cod="+Campo(wc_user),{"usr_connect",1})
      __fCase_Var()
      __fCase_IDE_Prp_Lst()
      __fCase_Menu()
      __oRichTmp:End()
   EndIf

   FreeLib32(nDllWeb)
   FreeLibrary(hRichDLL)
   FreeLib32( hWinINet )

Return ( NIL )
*fim da Function Main()

********************************************************************************
*                       DIferenÎas entre Banco de Dados                        *
********************************************************************************
* ACCESS                                                                       *
* ----> null     Ex.: Obj_Nome = null                                          *
********************************************************************************
* MYSQL                                                                        *
* ----> is null  Ex.: Obj_Nome is null                                         *
********************************************************************************
********************************************************************************
*            Conjunto de FunÎ„es para funcionamento da c_info95.LIB            *
********************************************************************************
Function __f(paramDLL)
Local __M,__v985432761,__x,__handle,__buffer,__buflen,__bytesHandle
Local _wA,_wC:="1",_wB:="5"+chr(47),_wD,_wH:="0",_wF,_wE:="1",_wG,_wX
Local __Return,__msgErr,__pw,__contra,__wDllExe := "ccase.dll"

   __Return := .F.

   _wA := "0"
   _wD := "8"+chr(47)
   _wX := cDate()

   _wG :="2"
   _wH :="0"
   _wE :="1"   
   _wF :="3" 
// _wF :="5"    // Assunção

   If valtype(paramDLL)="C"
      If lower(paramDLL)="-dll"

         __handle := fOpen(__wDllExe,2)
         If __handle = -1
            If MsgYesNo("Deseja criar o arquivo "+__wDllExe+" ?","Atenção")
               __pw     := Space(100)
               __contra := 0
               If MsgGetPw( "Cria arquivo "+__wDllExe,@__pw,@__contra)
                  If Encrypt(__pw) = '/(PAÉR$0eŠ®Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"Dˆ"'
                     If __contra = fSeek(fOpen("ccase.exe",0),-1,2)
                        __handle := FCreate(__wDllExe)
                        fSeek(__handle,-1,2)
                        __M := GETMAC()
                        __v985432761 := ""
                        For __x := 01 To Len(__M)
                           __v985432761 := __v985432761 + AllTrim(__M[__x,2])
                        Next

                        fSeek(__handle,-1,2)
                        fWrite(__handle,HB_B64ENCODE(Encrypt(__v985432761)))
                        MsgInfo("Arquivo criado com sucesso","Atenção")
                     Else
                        MsgStop("Contra Senha Inválida","Erro...")
                     EndIf
                  Else
                     MsgStop("Senha Inválida","Erro...")
                  EndIf
               EndIf
               fClose( __handle )
            EndIf
         EndIf
      EndIf
   EndIf

//   _wG := "2"
//   _wF := "0" 

   If _wX>=cTod(StrTran(_wC+_wB+_wA+_wD+_wG+_wH+_wE+_wF,chr(47),chr(63)))
      __msgErr := "Error to Access SQL Connector."
      __handle := fOpen(__wDllExe,0)
      If __handle = -1
         MsgStop(__msgErr,"(error: 1)")
      Else
         __buffer := space(512)
         fRead(__handle,@__buffer,512)
         fClose(__handle)
         __buffer := AllTrim(__buffer)
      
         __M := GETMAC()
         __v985432761 := ""
         For __x := 01 To Len(__M)
            __v985432761 := __v985432761 + AllTrim(__M[__x,2])
         Next
      
         If __v985432761 == Decrypt(HB_B64DECODE(__buffer))
            __Return := .T.
         Else
            MsgStop(__msgErr,"(error: 2)")
         EndIf
      EndIf
   Else
      __Return := .T.
   EndIf
Return __Return
Function fVar()
Return .t.
Function fVarEmp()
Return .t.
Function fCriaArq()
Return .t.
Function fOpenFunction()
   cGetFile32( "*.txt" , "teste" ) // <cTitle>, [<nDefaultMask>], [<cInitialDirectory>], [lSave], [nFlags], [cInitialFile] )
Return .t.
function MsgGetPw( cTitle, uVar1, uVar2)
   local oDlg, oBmp
   local uTemp1 := uVar1
   local uTemp2 := uVar2
   local lOk    := .f.
   DEFINE DIALOG oDlg FROM 10, 20 TO 19, 58 TITLE cTitle

   @ 0.1, 3.2 SAY "Senha"        OF oDlg SIZE 200, 10
   @ 1.7, 3.2 SAY "Contra-Senha" OF oDlg SIZE 200, 10

   @ 0.9, 2.0 GET uTemp1 SIZE 120, 12 OF oDlg PASSWORD
   @ 2.7, 2.0 GET uTemp2 SIZE 120, 12 OF oDlg PASSWORD PICTURE "9999999999999999999" RIGHT
   @ 2.9, 07.5 BUTTON "&Ok"     OF oDlg SIZE 35, 12 ACTION ( oDlg:End(), lOk := .t. ) DEFAULT
   @ 2.9, 16.5 BUTTON "&Cancel" OF oDlg SIZE 35, 12 ACTION ( oDlg:End(), lOk := .f. )
   ACTIVATE DIALOG oDlg CENTERED
   if lOk
      uVar1 := uTemp1
      uVar2 := uTemp2
   endif
return lOk
********************************************************************************
********************************************************************************

function fCase_Objetos_Externos()
*******************************************************************************************************
* Compila os objetos externos - que são utilizados em procedures no entanto não são linkeditados      *
*******************************************************************************************************

wqout()           // comando para encerrar o clipper

OpenComm()        // Impressora Cronos; impressão de cheques
BuildCommDcb()    // Impressora Cronos; impressão de cheques
SetCommState()    // Impressora Cronos; impressão de cheques
CloseComm()       // Impressora Cronos; impressão de cheques
WriteComm()       // Impressora Cronos; impressão de cheques 
GetCommError()    // Impressora Cronos; impressão de cheques

return nil
*Fim da function fCase_Objetos_Externos()

Function clinha(wwlinha)
********************************************************************************
*      funcao para transFormar a medida da Linha de PIXEL p/ Cent­metros       *
********************************************************************************
   wwlinha := wwlinha * 13
Return(wwlinha)
*fim da Function clinha()

Function ccoluna(wwcoluna)
********************************************************************************
*      funcao para transFormar a medida da Coluna de PIXEL p/ Cent­metros      *
********************************************************************************
   wwcoluna := wwcoluna * 8
Return(wwcoluna)
*fim da Function ccoluna(wwcoluna)

Function cKeyPressConvert(nKey)
*************************************************************************************************
*       Retorna o c½dgo ASCII da ultima tecla pressionada (somente caracteres)
*************************************************************************************************
Local wKeyRet:=00

   If (nKey >=65 .AND. nKey<=090) 
       wKeyRet := nKey
      If oM_WinMain[1]:oMsgBar:oKeyCaps:lActive         // Se o Caps Lock estiver Ligado
         If GetKeyState(16)   // ShIft pressionado
            wKeyRet := wKeyRet+32    // minusculo
         EndIf
      Else                                         // Se o Caps Lock estiver Desligado
         If .not.GetKeyState(16)   // ShIft NAO pressionado
            wKeyRet := wKeyRet+32    // minusculo
         EndIf
      EndIf
   EndIf

   If nKey=32
      wKeyRet := 32       // Space Bar
   ElseIf nKey=48       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 41       // )
      Else
         wKeyRet := 48       // 0
      EndIf
   ElseIf nKey=49
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 33       // !
      Else
         wKeyRet := 49       // 1
      EndIf
   ElseIf nKey=50       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 64      // @
      Else
         wKeyRet := 50       // 2
      EndIf
   ElseIf nKey=51       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 35       // #
      Else
         wKeyRet := 51       // 3
      EndIf
   ElseIf nKey=52       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 36       // $
      Else
         wKeyRet := 52       // 4
      EndIf
   ElseIf nKey=53       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 37       // %
      Else
         wKeyRet := 53       // 5
      EndIf
   ElseIf nKey=54      
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 168     // ¨   
         __wKeyAcento := iIf(__wKeyAcento=wKeyRet, 0  , wKeyRet)
      Else
         wKeyRet := 54      // 6
      EndIf
   ElseIf nKey=55      
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 38      // &
      Else
         wKeyRet := 55      // 7
      EndIf
   ElseIf nKey=56      
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 42      // *
      Else
         wKeyRet := 56      // 8
      EndIf
   ElseIf nKey=57      
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 40      // (
      Else
         wKeyRet := 57      // 9
      EndIf
   ElseIf nKey=96
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 48      // 0
      EndIf
   ElseIf nKey=97
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 49     // 1
      EndIf
   ElseIf nKey=98
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 50     // 2
      EndIf
   ElseIf nKey=99
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 51     // 3
      EndIf
   ElseIf nKey=100
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 52     // 4
      EndIf
   ElseIf nKey=101
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 53     // 5
      EndIf
   ElseIf nKey=102
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 54     // 6
      EndIf
   ElseIf nKey=103
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 55     // 7
      EndIf
   ElseIf nKey=104
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 56     // 8
      EndIf
   ElseIf nKey=105
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 57     // 9
      EndIf
   ElseIf nKey=106
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 42      // *
      EndIf
   ElseIf nKey=107
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 43      // +
      EndIf
   ElseIf nKey=108
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 46      // .
      EndIf
   ElseIf nKey=109
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 45      // -
      EndIf
   ElseIf nKey=110
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 44      // ,
      EndIf
   ElseIf nKey=111
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 00      // 
      Else
         wKeyRet := 47      // /
      EndIf

   ElseIf nKey=188       
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 60       // <
      Else
         wKeyRet := 44       // ,
      EndIf
   ElseIf nKey=187   
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 43       // +
      Else
         wKeyRet := 61       // =
      EndIf
   ElseIf nKey=189   
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 95         // _
      Else
         wKeyRet := 45         // -
      EndIf
   ElseIf nKey=198   
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 62         // >
      Else
         wKeyRet := 46         // .
      EndIf
   ElseIf nKey=190   
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 62         // >
      Else
         wKeyRet := 46         // .
      EndIf
   ElseIf nKey=191  
      If GetKeyState(16)  // se Shift 
         wKeyRet := 58         //  :
      Else
         wKeyRet := 59         //  ;
      EndIf
   ElseIf nKey=192  
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 34         //  "
      Else
         wKeyRet := 39         //  '
      EndIf
   ElseIf nKey=219 
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 96         //  `
         __wKeyAcento := iIf(__wKeyAcento=wKeyRet, 0  , wKeyRet)
      Else
         wKeyRet    := 180     //  ´
         __wKeyAcento := iIf(__wKeyAcento=wKeyRet, 0  , wKeyRet)
      EndIf
   ElseIf nKey=220  
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 125         //  ]
      Else
         wKeyRet := 93          //  }
      EndIf
   ElseIf nKey=221 
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 123         //  [  
      Else
         wKeyRet := 91          //  {
      EndIf
   ElseIf nKey=222
      If GetKeyState(16)  // se ShIft 
         wKeyRet    := 94          //  ^
         __wKeyAcento := iIf(__wKeyAcento=wKeyRet, 0  , wKeyRet)
      Else
         wKeyRet    := 126         //  ~
         __wKeyAcento := iIf(__wKeyAcento=wKeyRet, 0  , wKeyRet)
      EndIf
   ElseIf nKey=223
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 63          //  Interrogação
      Else
         wKeyRet := 47          //  /
      EndIf
   ElseIf nKey=226
      If GetKeyState(16)  // se ShIft 
         wKeyRet := 124         //  |
      Else
         wKeyRet := 92          //  \
      EndIf
   EndIf

   If .Not.cEmpty(__wKeyAcento)
      If __wKeyAcento = wKeyRet
         wKeyRet    := 00
      Else
         If     __wKeyAcento = 126     //  ~  TIL
            If     wKeyRet = 65      //  A
               wKeyRet := 195        //  Ã
            ElseIf wKeyRet = 97      //  a
               wKeyRet := 227        //  ã
            ElseIf wKeyRet = 79      //  O
               wKeyRet := 213        //  Õ
            ElseIf wKeyRet = 111     //  o
               wKeyRet := 245        //  õ
            EndIf   
         ElseIf __wKeyAcento = 94      //  ^  CIRCUNFLEXO
            If     wKeyRet = 65      //  A
               wKeyRet := 194        //  Â
            ElseIf wKeyRet = 97      //  a
               wKeyRet := 226        //  â
            ElseIf wKeyRet = 69      //  E
               wKeyRet := 202        //  Ê
            ElseIf wKeyRet = 101     //  e
               wKeyRet := 234        //  ê
            ElseIf wKeyRet = 79      //  O
               wKeyRet := 212        //  Ô
            ElseIf wKeyRet = 111     //  o
               wKeyRet := 244        //  ô
            EndIf   
         ElseIf __wKeyAcento = 168     // ¨   TREMA
            If wKeyRet     = 85      //  U
               wKeyRet := 220        //  Ü
            ElseIf wKeyRet = 117     //  u
               wKeyRet := 252        //  ü
            EndIf   
         ElseIf __wKeyAcento = 96      // `  CRASE
            If     wKeyRet = 65      //  A
               wKeyRet := 192        //  À
            ElseIf wKeyRet = 97      //  a
               wKeyRet := 224        //  à
            EndIf   
         ElseIf __wKeyAcento = 180    // ´  AGUDO
            If     wKeyRet = 65      //  A
               wKeyRet := 193        //  Á
            ElseIf wKeyRet = 97      //  a
               wKeyRet := 225        //  á
            ElseIf wKeyRet = 69      //  E
               wKeyRet := 201        //  É
            ElseIf wKeyRet = 101     //  e
               wKeyRet := 233        //  é
            ElseIf wKeyRet = 73      //  I
               wKeyRet := 205        //  Í
            ElseIf wKeyRet = 105     //  i
               wKeyRet := 237        //  í
            ElseIf wKeyRet = 79      //  O
               wKeyRet := 211        //  Ó
            ElseIf wKeyRet = 111     //  o
               wKeyRet := 243        //  ó
            ElseIf wKeyRet = 85      //  U
               wKeyRet := 218        //  Ú
            ElseIf wKeyRet = 117     //  u
               wKeyRet := 250        //  ú
            EndIf   
         EndIf
         __wKeyAcento := 0
      EndIf
   EndIf

Return wKeyRet
* Fim da Function cKeyPressConvert()

Function c_Say(wObjRef,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wwTexto,wBold)
*******************************************************************************
*             funcao para montar a funcao c_Say                                *
*******************************************************************************
Local wPixel,wBoldFont,oSay,wInicio_Lin,wInicio_Col,wTLin,wTCol
Local wnTop := 0 , wnLeft := 0 , wnWidth := 0 , wnHeight := 0

   wDesloc_Lin := iIf(ValType(wDesloc_Lin)<>"N",0,wDesloc_Lin)
   wDesloc_Col := iIf(ValType(wDesloc_Col)<>"N",0,wDesloc_Col)

   wTLin := 18.0   // Tamanho da Linha
   wTCol := 03.5   // Tamanho da Coluna

   wDesloc_Lin := wDesloc_Lin  * wTLin
   wDesloc_Col := wDesloc_Col  * wTCol

   wnTop := 0 ; wnLeft := 0 ; wnWidth := 0 ; wnHeight := 0

   If cEmpty(wObj_Desloc)
      wInicio_Lin := 0
      wInicio_Col := 0
   Else
      wnTop    := wObj_Desloc:nTop
      wnLeft   := wObj_Desloc:nLeft
      wnWidth  := wObj_Desloc:nwidth
      wnHeight := wObj_Desloc:nHeight

      wInicio_Lin := wnTop
      wInicio_Col := wnLeft + wnWidth
      If wDesloc_Lin = 0
         wDesloc_Col := wDesloc_Col + wInicio_Col
         If Upper(wObj_Desloc:ClassName) = "TGET"
            wDesloc_Lin := wDesloc_Lin + 01
         EndIf
      EndIf
      wDesloc_Lin := wDesloc_Lin + wInicio_Lin
   EndIf

   wwtexto := iIf(cEmpty(wwtexto),Space(00),wwtexto)
   wPixel  := c_Pixel_Len(wwtexto,wBold)

   If cEmpty(wBold)
      wBoldFont := "oFont"
   ElseIf ValType(wBold)="L"
      If wBold
         wBoldFont := "oFontBold"
      Else
         wBoldFont := "oFont" 
      EndIf
   EndIf

   If .Not.cEmpty(wwTexto)
      oSay := TSay():New( wDesloc_Lin , wDesloc_Col , {|| wwtexto},wObjRef,, &wBoldFont, .F. , .F. , .F. , .T. ,,, wPixel, 07 , .F. , .F. , .F. , .F. , .F. )   //mostra o conteudo do texto na tela
      aAdd( oM_Say, oSay )
   EndIf

Return oSay
*fim da Function c_Say()

Function c_PopUp( wObj_Desloc , wDesloc_Lin , wDesloc_Col , wMatriz )
************************************************************************************************
*                                 Função para gerar Menu POPUP                                 *
************************************************************************************************
Local oPopup , wx:=00 , wMacro , wxLen , wWhen
     
   oPopup := MenuBegin( .T. )
   wxLen  := Len(wMatriz)

   For wx := 01 To wxLen
       wMacro := wMatriz[wx,2]
       wWhen  := wMatriz[wx,3]
       MenuAddItem( wMatriz[wx,01],,.F.,,{|oMenuItem|&wMacro},,,,,,,.F.,,{||&wWhen},.F.)
   Next
   MenuAddItem()
   MenuAddItem( "&Exit",, .F.,,{|oMenuItem|oPopup:End()},,,,,,, .F.,,, .F. )
   MenuEnd()

   oPopup:Activate( wDesloc_Lin , wDesloc_Col , wObj_Desloc )

Return .T.
* fim da Function c_PopUp()

Function cDominio(wDom_Nome,wItemBranco)
************************************************************************************************
*                     Funcao para Carregar o DIminio correspondente                            *
************************************************************************************************
Local wRetorno,wResp,wPos,wWhere,wx:=00,wM_Dom := {},wObj_Nome,wCod,wDsc,wxLen,wPrp_Nome
   
   wPos := cScan(wM_Dominio,wDom_Nome,01 )
   If wPos > 0
      wRetorno := wM_Dominio[wPos,2]
   Else
      wDom_Nome := Lower(AllTrim(wDom_Nome))

      wWhere := "  ( cCase_Obj_Prp.Obj_Nome="+Campo(Trim(wDom_Nome))
      wWhere := wWhere + " Or cCase_Obj_Prp.Obj_Nome Like " + Campo(Trim(wDom_Nome) + ".%") + ")"
      wResp := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj_Prp.Obj_Nome","Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Seq")
      wxLen := Len(wResp)

      If cNvl(wItemBranco,.F.)
         aAdd(wM_Dom,"")
      EndIf

      For wx := 01 To wxLen
         wPrp_Nome := Upper(AllTrim(wResp[wx,02]))
         If     wPrp_Nome == "DOM_COD"
            wCod := AllTrim(wResp[wx,03])
         ElseIf wPrp_Nome == "DOM_DSC"
            wDsc := AllTrim(wResp[wx,03])
         EndIf

         If wx < wxLen
            wObj_Nome := wResp[wx+1,01]
         Else
            wObj_Nome := Space(00)
         EndIf
   
         If wObj_Nome <> wResp[wx,01] .or. cEmpty(wObj_Nome)
            If .Not.cEmpty(wCod) .And. cEmpty(wDsc)
               aAdd(wM_Dom,wCod )
               wCod := Space(00)
            ElseIf .Not.cEmpty(wCod) .And. .not.cEmpty(wDsc)
   
               aAdd(wM_Dom,wCod + "-" + wDsc )
               wCod := Space(00)
               wDsc := Space(00)
            EndIf
         EndIf
      Next
      aAdd(wM_Dominio,{wDom_Nome})
      aAdd(wM_Dominio[Len(wM_Dominio)],wM_Dom)
      wRetorno := wM_Dominio[Len(wM_Dominio),2]
   EndIf

Return(wRetorno)
*fim da Function cDominio(wDom_Nome)

Function cDominio_Atrib(wValor,wDominio,wRequerido)
*************************************************************************************************
*                                 Atribui o Dominio na variavel                                 *
*************************************************************************************************
Local wx,wMatriz,wRetorno,wDom_Pesq,wMM

   wValor := AllTrim(wValor)
   If cEmpty(wDominio)
      wValor   := wValor + "-"
      wRetorno := SubStr(wValor,1,At("-",wValor)-1)
      wRetorno := StrTran(wRetorno,"-","")
   Else
      If     ValType(wDominio)="C"
      	wMatriz := cDominio(wDominio)
      ElseIf ValType(wDominio)="A"
      	wMatriz := wDominio
      EndIf
      wRequerido := cNvl(wRequerido,.F.)
      wRequerido := iIf(ValType(wRequerido)="C",iif(wRequerido="S",.T.,.F.),wRequerido)
      If .Not.wRequerido
         wMM := wMatriz
         wMatriz := {}
         aAdd(wMatriz,"")
         For wx := 01 To Len(wMM)
            aAdd(wMatriz,wMM[wx])
         Next
      EndIf

      For wx := 01 To Len(wMatriz)
         wDom_Pesq := cUpper(AllTrim(wMatriz[wx]))
         If cUpper(wValor) == SubStr(wDom_Pesq,1,At("-",wDom_Pesq)-1)
            wRetorno := wMatriz[wx]
         EndIf
      Next
   EndIf
   
   If cEmpty(wRetorno)
      wRetorno := wValor
   EndIf

Return wRetorno
*fim da Function cDominio_Atrib(wValor,wDominio,wRequerido)

Function fCaseDefVar(wGrid)
****************************************************************************************************
*                          funcao interna definir variaveis                    *
***********************************************************************************************************
Local wx := 00,wMatriz,wPos,wSoma := 00,wTabela := Space(00),wy,wxLen1,wxLen2
Local wDefVar,wResp,wPosA:=00,wPos2:=00,wCompara := Space(00),wColuna,wM_Seq
Local wN_Coluna := 00,wz := 00,wConteudo,wTam,wPic,wDec,wPicture

   If Len(wM_Case)=0
      Return .F.
   EndIf

   wxLen1 := Len(wM_Case[wGrid,wCS_Coluna])
   For wx := 01 To wxLen1

      wDefVar := cDefVar(wM_Case[wGrid,wCS_DefVar,wx],wM_Case[wGrid,wCS_TypeVar,wx],wGrid)
      If wM_Case[wGrid,wCS_Formato,wx] = 00

         If .Not.cEmpty(wM_Case[wGrid,wCS_DefVar,wx])
            wM_Case[wGrid,wCS_Conteudo,wx] := wDefVar
         Else
            If .Not.cEmpty(wM_Case[wGrid,wCS_Key_Col,wx])
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Key_Col,wx])
            Else
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Coluna,wx])
            EndIf
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 21
         If At("FGRD_VLR_ANTERIOR",Upper(wM_Case[wGrid,wCS_When,wx]) ) = 0
            If .Not.cEmpty(wM_Case[wGrid,wCS_Key_Col,wx])
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Key_Col,wx])
            Else
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Coluna,wx])
            EndIf
         EndIf
         If cEmpty(wM_Case[wGrid,wCS_Conteudo,wx])
            wM_Case[wGrid,wCS_Conteudo,wx] := wDefVar
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 20 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 23 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 33 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 40
         wM_Case[wGrid,wCS_Conteudo,wx] := wDefVar
         wM_Case[wGrid,wCS_AntConteudo,wx] := {wDefVar,wDefVar,wDefVar}
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 49
         wM_Case[wGrid,wCS_Conteudo,wx]    := {wDefVar,wDefVar}
         wM_Case[wGrid,wCS_AntConteudo,wx] := {wDefVar,wDefVar,wDefVar}
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 26 .Or. wM_Case[wGrid,wCS_Formato,wx] = 02

         If .Not.cEmpty(wM_Case[wGrid,wCS_Atrib_Lst,wx])
            wPos := At("#",wM_Case[wGrid,wCS_Atrib_Lst,wx] )
            If cEmpty(wPos)
               wPosA := At(".",wM_Case[wGrid,wCS_Atrib_Lst,wx] )
               If wPosA>0
                  wTabela := SubStr(wM_Case[wGrid,wCS_Atrib_Lst,wx],1,wPosA-1)
                  wColuna := SubStr(wM_Case[wGrid,wCS_Atrib_Lst,wx],wPosA+1)
               Else
                  wTabela := wM_Case[wGrid,wCS_Atrib_Lst,wx]
                  wColuna := wM_Case[wGrid,wCS_Coluna,wx]
               EndIf
               wResp := fConsulta2(wTabela,{"MAX("+wColuna+")"} )
               If Len(wResp)>0
                  wTam :=00; wPic:=00; wDec:=00
                  wPicture := AllTrim(wM_Case[wGrid,wCS_Picture,wx])
                  wTam := Len(wPicture)
                  wPic := At(".",wPicture)
                  If wPic>0
                     wDec := Len(SubStr(wPicture,wPic+1))
                  EndIf
                  wM_Case[wGrid,wCS_Conteudo,wx] := Val(Str(wResp[01,01],wTam,wDec)) + iIf(cEmpty(wDefVar),1,wDefVar)
               EndIf
            EndIf
         Else
            wM_Seq := {}
            For wy := 01 To Len(wM_Grid[wGrid])
               aAdd(wM_Seq,wM_Grid[wGrid,wy,wx] )
            Next
            aSort(wM_Seq,,,{|x,y| x < y })

            wM_Case[wGrid,wCS_Conteudo,wx] := wM_Seq[Len(wM_Seq)] + iIf(cEmpty(wDefVar),1,wDefVar)
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 27
         wM_Case[wGrid,wCS_Conteudo,wx] := cTime()
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 30 .or. wM_Case[wGrid,wCS_Formato,wx] = 39

         If .Not.cEmpty(wM_Case[wGrid,wCS_AuxFunction,wx])
            wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
            wMatriz := &wMatriz
            wxLen2 := Len(wMatriz)
            If ValType(wDefVar) = "N"
               If wDefVar>0 .And. wDefVar <= wxLen2
                  wM_Case[wGrid,wCS_Conteudo,wx] := wMatriz[wDefVar]
               EndIf
            ElseIf wxLen2>0 .And. ValType(wDefVar)<>"U"
               wPos := 00 ; wy := 00
               For wy := 01 to wxLen2
	               wPos := At("-",wMatriz[wy])
	               wPos := iIf(cEmpty(wPos),At("#",wMatriz[wy]),wPos)
	               wPos := wPos-1
                  If SubStr(wDefVar,1,wPos) == SubStr(wMatriz[wy],1,wPos)
                     wM_Case[wGrid,wCS_Conteudo,wx] := wMatriz[wy]
                     Exit
                  EndIf
               Next
            EndIf

            If ValType(wDefVar)="U" .Or. cEmpty(wM_Case[wGrid,wCS_Conteudo,wx])
               If wxLen2>0
                  wM_Case[wGrid,wCS_Conteudo,wx] := wMatriz[01]
               EndIf
            EndIf
         EndIf
	   EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 36
         wM_Case[wGrid,wCS_ObjGet,wx]:SetItems({wDefVar,wDefVar,wDefVar})
         wM_Case[wGrid,wCS_Conteudo,wx] := wDefVar
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] >= 50 .And. wM_Case[wGrid,wCS_Formato,wx] <= 59
         If .Not.cEmpty(wDefVar)
            wM_Case[wGrid,wCS_Conteudo,wx] := iIf(ValType(wDefVar)<>"N",Val(wDefVar),wDefVar)
         Else
            wM_Case[wGrid,wCS_Conteudo,wx] := 01
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] >= 60 .And. wM_Case[wGrid,wCS_Formato,wx] <= 69
         wM_Case[wGrid,wCS_Conteudo,wx] := .F.
      EndIf

   Next

Return .t.
*fim da Function fCaseDefVar(wGrid)

Function fCaseAtrib(wGrid)
********************************************************************************
*  funcao p/ Atribuir os Valores da Matriz (wM_Grid) nas Variaveis (wM_Case)   *
********************************************************************************
Local wx,wy,wResp,wKeyDbf,wKeySql,wvar,wMatriz,wPos,wxLen1,wxLen2,wGrdVlr,wCabeca

   If Len(wM_Case)=0
      Return .F.
   EndIf

   wxLen1:= Len(wM_Case[wGrid,wCS_Coluna])
   For wx:= 01 To wxLen1
      wGrdVlr := wM_Grid[wGrid,wM_BrwLin[wGrid],wx]
      wCabeca := wM_Case[wGrid,wCS_Cabeca,wx]
      wCabeca := AllTrim(iif(cEmpty(wCabeca),wM_Case[wGrid,wCS_Descricao,wx],wCabeca))

      If wM_Case[wGrid,wCS_Formato,wx] = 21
         If At("FGRD_VLR_ANTERIOR",Upper(wM_Case[wGrid,wCS_When,wx]) ) = 0
            If .Not.cEmpty(wM_Case[wGrid,wCS_Key_Col,wx])
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Key_Col,wx])
            Else
               wM_Case[wGrid,wCS_Conteudo,wx] := fGrd_Vlr_Anterior(wM_Case[wGrid,wCS_Coluna,wx])
            EndIf
         EndIf
         If cEmpty(wM_Case[wGrid,wCS_Conteudo,wx])
            wM_Case[wGrid,wCS_Conteudo,wx] := wGrdVlr
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 00 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 02 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 04 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 20 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 23 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 26 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 27 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 40 .Or.; 
         wM_Case[wGrid,wCS_Formato,wx] = 43

         wM_Case[wGrid,wCS_Conteudo,wx] := wGrdVlr
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 49
         wGrdVlr := StrTran(wGrdVlr,"$|#/#|@","\")
         wGrdVlr := StrTran(wGrdVlr,'@|#"#|$',"'")

         __wTmpRichText := wGrdVlr
         __oRichTmp:Refresh()

         wM_Case[wGrid,wCS_Conteudo,wx] := {__oRichTmp:GetText(),wGrdVlr}
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 30
         wM_Case[wGrid,wCS_Conteudo,wx] := fAtrib_Combo(wGrdVlr,wM_Case[wGrid,wCS_ObjGet,wx])
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 33
         wM_Case[wGrid,wCS_Conteudo,wx] := wGrdVlr
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 36
         wM_Case[wGrid,wCS_ObjGet,wx]:SetItems({wGrdVlr})
         wM_Case[wGrid,wCS_Conteudo,wx] := wGrdVlr
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 39
         If cEmpty(wM_Case[wGrid,wCS_AuxFunction,wx])
            cCancel("fCaseAtrib() -1- não a um Domínio para o Campo " + wCabeca + " (ComboBox) " )
         EndIf

         wPos := 00
         wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
         wMatriz := &wMatriz
         If ValType(wMatriz)<>"A"
            cCancel("fCaseAtrib() -2- não a um Domínio para o Campo " + wCabeca + " (ComboBox) " )
         EndIf
         wxLen2 := Len(wMatriz)

         If ValType(wGrdVlr) = "U"
            wM_Case[wGrid,wCS_Conteudo,wx] := wMatriz[1]
         ElseIf wxLen2>0
            If ValType(wGrdVlr)="C"
               wGrdVlr := Trim(wGrdVlr)
            ElseIf ValType(wGrdVlr)="N"
               wGrdVlr := Trim(Str(wGrdVlr))
            EndIf
            For wy := 01 to wxLen2
               wPos := At("-",wMatriz[wy])
               wPos := iIf(cEmpty(wPos),At("#",wMatriz[wy]),wPos)
               wPos := wPos-1
               If wPos>0
                  If SubStr(wMatriz[wy],1,wPos) == SubStr(wGrdVlr,1,wPos)
                     wM_Case[wGrid,wCS_Conteudo,wx] := wMatriz[wy]
                     Exit
                  EndIf
               EndIf
            Next

            If wPos<=0 .Or. cEmpty(wM_Case[wGrid,wCS_Conteudo,wx])
               wM_Case[wGrid,wCS_Conteudo,wx] := Space(00)
            EndIf
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 50

         If cEmpty(wM_Case[wGrid,wCS_AuxFunction,wx])
            cCancel("fCaseAtrib() -3- não a um Domínio para o Campo " + wCabeca + " (Option Button) " )
         EndIf

         wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
         wMatriz := &wMatriz
         If ValType(wMatriz)<>"A"
            cCancel("fCaseAtrib() -4- não a um Domínio para o Campo " + wCabeca + " (Option Button) " )
         EndIf

         wVar := iIf(wM_Case[wGrid,wCS_TypeVar,wx]="N",Str(wGrdVlr),wGrdVlr)
         If .Not.cEmpty(wVar)
            If ValType(wVar)<>"C"
               wVar := Space(00)
            EndIf
            wxLen2 := Len(wMatriz)
            For wy := 01 To wxLen2
               If SubStr(wMatriz[wy],1,Len(wVar)) == wVar
                  wM_Case[wGrid,wCS_Conteudo,wx] := wy
                  Exit
               EndIf
            Next
         Else
            wM_Case[wGrid,wCS_Conteudo,wx] := 01
         EndIf
      EndIf

      If wM_Case[wGrid,wCS_Formato,wx] = 60
         If ValType(wGrdVlr) = "C"
            If wGrdVlr = "S"
               wM_Case[wGrid,wCS_Conteudo,wx] := .T.
            Else
               wM_Case[wGrid,wCS_Conteudo,wx] := .F.
            EndIf
         Else
            wM_Case[wGrid,wCS_Conteudo,wx] := .F.
         EndIf
      EndIf
   Next

Return NIL
*fim da Function fCaseAtrib()

Function fCaseRefresh(wGrid)
********************************************************************************
*            Funcao interna para Refresh() no Gets do Grid Informado           *
********************************************************************************
Local wx,wxLen

   If Len(wM_Case)=0
      Return .F.
   EndIf

   wxLen := Len(wM_Case[wGrid,wCS_Coluna])
   For wx:= 01 to wxLen
      If wM_Case[wGrid,wCS_Formato,wx] > 09 .and. wM_Case[wGrid,wCS_Formato,wx] <> 95 // webcam
         If .Not.cEmpty(wM_Case[wGrid,wCS_ObjGet,wx])
            wM_Case[wGrid,wCS_ObjGet,wx]:Refresh()
         EndIf
      EndIf
   Next

Return .t.
* fim da Function fCaseRefresh()

Function fCaseMtAtrib(wGrid)
********************************************************************************
*            Funcao interna para Refresh() no Gets do Grid Informado           *
********************************************************************************
Local wx,wxLen,wwLin,wMatriz,wPos,wWork,wAux_Function,wwx

   If Len(wM_Grid)=0
      Return .F.
   EndIf

   wxLen := Len(wM_Case[wGrid,wCS_Coluna])

   If wM_Opcao[Len(oM_Dlg)]="inclui"
      For wx = 01 to wxLen
         If wM_Case[wGrid,wCS_Requerido,wx]
            If cEmpty(wM_Grid[wGrid,00001,wx])
               aSize(wM_Grid[wGrid],0 )
               Exit
            EndIf
         EndIf
      Next

      aAdd(wM_Grid[wGrid],Array(wxLen))
      wwLin := Len(wM_Grid[wGrid])
      wx := 00
      For wx:= 01 to wxLen
         If ValType(wM_Case[wGrid,wCS_Conteudo,wx]) = "L"
            wWork := iIf(wM_Case[wGrid,wCS_Conteudo,wx],"S","N")
         ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 30 .And. wM_Case[wGrid,wCS_Formato,wx] <= 39
            wPos := At("-",wM_Case[wGrid,wCS_Conteudo,wx] )
            If wPos>0
               wWork := SubStr(wM_Case[wGrid,wCS_Conteudo,wx],1,wPos-1)
            Else
               wWork := wM_Case[wGrid,wCS_Conteudo,wx]
            EndIf
         ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 50 .And. wM_Case[wGrid,wCS_Formato,wx] <= 59
            wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
            wMatriz := &wMatriz
            If ValType(wMatriz)<>"A"
               Loop
            EndIf
            wPos := At("-",wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]] )
            If wPos=0
               wPos := 03
            EndIf
            wWork := SubStr(wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]],1,wPos-1)
         ElseIf wM_Case[wGrid,wCS_Formato,wx] = 49
            wWork := wM_Case[wGrid,wCS_Conteudo,wx][2]
            wWork := StrTran(wWork,"\","$|#/#|@")
            wWork := StrTran(wWork,"'",'@|#"#|$')
         Else
            wWork := wM_Case[wGrid,wCS_Conteudo,wx]
         EndIf
         wM_Grid[wGrid,wwLin,wx] := wWork
      Next
   ElseIf wM_Opcao[Len(oM_Dlg)]="altera"
      For wx := 01 to wxLen
         If ValType(wM_Case[wGrid,wCS_Conteudo,wx]) = "L"
            wWork := iIf(wM_Case[wGrid,wCS_Conteudo,wx],"S","N")
         ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 30 .And. wM_Case[wGrid,wCS_Formato,wx] <= 39
            wPos := At("-",wM_Case[wGrid,wCS_Conteudo,wx] )
            If wPos>0
               wWork := SubStr(wM_Case[wGrid,wCS_Conteudo,wx],1,wPos-1)
            Else
               wWork := wM_Case[wGrid,wCS_Conteudo,wx]
            EndIf

            wAux_Function := wM_Case[wGrid,wCS_AuxFunction,wx]
            If .Not.cEmpty(wAux_Function)
               wAux_Function := &wAux_Function
               For wwx := 01 To Len(wAux_Function)
                  If wPos>0
                     If SubStr(wAux_Function[wwx],1,wPos)=wWork
                        wWork := wAux_Function[wwx]
                        Exit
                     EndIf
                  Else
                     If wAux_Function[wwx]=wWork
                        wWork := wAux_Function[wwx]
                        Exit
                     EndIf
                  EndIf
               Next
            EndIf
         ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 50 .And. wM_Case[wGrid,wCS_Formato,wx] <= 59
            wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
            wMatriz := &wMatriz
            If ValType(wMatriz)<>"A"
               Loop
            EndIf
            wPos := At("-",wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]] )
            If wPos=0
               wPos := 03
            EndIf
            wWork := SubStr(wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]],1,wPos-1)
         ElseIf wM_Case[wGrid,wCS_Formato,wx] = 49
            wWork := wM_Case[wGrid,wCS_Conteudo,wx][2]
            wWork := StrTran(wWork,"\","$|#/#|@")
            wWork := StrTran(wWork,"'",'@|#"#|$')
         Else
            wWork := wM_Case[wGrid,wCS_Conteudo,wx]
         EndIf
         wM_Grid[wGrid,wM_BrwLin[wGrid],wx] := wWork
      Next
   EndIf

Return .t.
* fim da Function fCaseMtAtrib(wGrid)

Function fCaseScroll(wObjGrid,wGrid,wGoto)
********************************************************************************
*                 Controle do Scroll Vertical do Grid                          *
********************************************************************************
Local wM_Cursor,wx,wy,wz,wInicio,wFinal,wMCamposAux,wMXTabela,wWork,wKeySql,wxM_Cursor,wVez,wPos_Fnc,wLenGrd
Local wLinTop,wLinBot,wTabela,wMChave,wComp1,wComp2,wInsert,wUnique,wNewIni,wNewFim,wLinha,wItem,wFator,wxLen
Local wLenKey

   If ValType(wObjGrid)<>"O" .Or. wObjGrid:nVScrollPos = 0
      Return .T.
   EndIf
  
   wInsert := wObjGrid:nRowCount()
   wFator  := 01
  
   If     wInsert >= 01 .And. wInsert <= 05
      wFator := 05
   ElseIf wInsert >= 06 .And. wInsert <= 10
      wFator := 04
   ElseIf wInsert >= 11 .And. wInsert <= 15
      wFator := 03
   ElseIf wInsert >= 16 .And. wInsert <= 20
      wFator := 02
   EndIf

   wLenGrd := Len(wM_Grid[wGrid])  
  
   For wVez := 01 To 02
      If wVez = 01
         wItem := wObjGrid:nVScrollPos
      Else
         If wGoto > wObjGrid:nVScrollPos
            wItem := wObjGrid:nVScrollPos - (wInsert*wFator)
         Else
            wItem := wObjGrid:nVScrollPos + (wInsert*wFator)
         EndIf
      EndIf

      If wItem>= 1 .And. wItem <= wLenGrd
         If wM_Grid[wGrid,wItem,01] = Nil
      
            wx    := 00
            wxLen := Len(wM_Grid_Cursor)
            For wx:= 01 To wxLen
               If wM_Grid_Cursor[wx,01] = wGrid
                  wM_Cursor := wM_Grid_Cursor[wx,02]
                  wTabela   := wM_Grid_Cursor[wx,03]
                  wMChave   := wM_Grid_Cursor[wx,04]
                  wUnique   := wM_Grid_Cursor[wx,05]
                  wPos_Fnc  := wM_Grid_Cursor[wx,06]
                  Exit
               EndIf
            Next
      
            wx      := 00
            wLinTop := 00
            wLinBot := 00
      
            If ValType(wMChave)="A"
               wLenKey := Len(wMChave)
            Else
               wLenKey := 0
            EndIf
            If wLenKey>0
               wMCamposAux :={}
               wMXTabela   :={}
               aAdd(wMXTabela,wTabela)
               wz    := 00
               wxLen := Len(wM_Case[wGrid,wCS_Coluna])
               For wz:= 01 To wxLen
                  If wM_Case[wGrid,wCS_Origem,cNC(wM_Case[wGrid,wCS_Coluna][wz],wGrid,,"fCaseScroll")]
                     If cEmpty(wM_Case[wGrid,wCS_TabNome,wz])
                        wWork := wTabela                       + "." + wM_Case[wGrid,wCS_Coluna][wz]
                     Else
                        wWork := wM_Case[wGrid,wCS_TabNome,wz] + "." + wM_Case[wGrid,wCS_Coluna][wz]
                        If cScan(wMXTabela,wM_Case[wGrid,wCS_TabNome,wz]) = 0
                           aAdd(wMXTabela,wM_Case[wGrid,wCS_TabNome,wz])
                        EndIf
                     EndIf
               
                     If wM_Case[wGrid,wCS_TypeVar,cNC(wM_Case[wGrid,wCS_Coluna][wz],wGrid,,"fCaseScroll")]="D"
                        aAdd( wMCamposAux , "DATE_ForMAT(" + wWork + ",'%d/%m/%Y')" )
                     Else
                        aAdd( wMCamposAux , wWork )
                     EndIf
                  Else
                     aAdd( wMCamposAux , "'A'" )      // coluna fixa para nao perder a sequencia do select
                  EndIf
               Next
            EndIf

            wx := 00
            For wx := 01 To wInsert
               If     wx < wObjGrid:nRowPos
                  wLinTop := wLinTop + 01
               ElseIf wx > wObjGrid:nRowPos
                  wLinBot := wLinBot + 01
               EndIf
            Next
            
            wInicio := wItem - wLinTop - 1
            If wInicio <= 0
               wInicio := 01
            EndIf
            
            wFinal  := wItem + wLinBot + 1
            If wFinal > wLenGrd
               wFinal := wLenGrd
            EndIf
      
            If wLenKey>0
               If wUnique
                  wx      := 00
                  wKeySql := Space(00)
                  wNewIni := wInicio
                  wNewFim := wFinal
                  
                  If wVez=2
                     wy := 00
                     For wy := wInicio To 1 Step -1
                        If ValType(wM_Grid[wGrid,wy,01])<>"U"
                           wNewIni := wy+1
                           Exit
                        EndIf
                     Next
                     wy := 00
                     For wy := wNewIni To wFinal
                        If ValType(wM_Grid[wGrid,wy,01])<>"U"
                           wNewFim := wy-1
                           Exit
                        EndIf
                     Next
                  EndIf   

                  For wx = wNewIni To wNewFim
                     wy    := 00
                     For wy:= 01 To wLenKey
                        wKeySql := wKeySql + iIf(cEmpty(wKeySql),""," And ") + wMChave[wy] + "=" + Campo(wM_Cursor[wx,wy],ValType(wM_Cursor[wx,wy]))
                     Next   
                     wxM_Cursor := fConsulta2(wMXTabela,wMCamposAux,wKeySql)
                     wKeySql    := Space(00)
                     If Len(wxM_Cursor) > 0
                        c_Grid_Carrega_Matrix( 03 , wGrid , wxM_Cursor[1] , wPos_Fnc ,,, wx )
                     EndIf
                  Next
               Else
                  
                  wNewIni := 00
                  wNewFim := 00
                  wInicio := wInicio - (wInsert*wFator)
                  wFinal  := wFinal  + (wInsert*wFator)

                  If wInicio <= 0
                     wInicio := 01
                  EndIf
                  If wFinal > wLenGrd
                     wFinal := wLenGrd
                  EndIf
  
                  If wVez = 1
                     If wM_Grid[wGrid,wInicio,01] = Nil
                        wNewIni := wInicio
                     Else
                        wy := 00
                        For wy := wInicio To wItem
                           If wM_Grid[wGrid,wy,01] = Nil
                              wNewIni := wy
                              Exit
                           EndIf
                        Next
                     EndIf
                     If wM_Grid[wGrid,wFinal,01] = Nil
                        wNewFim := wFinal
                     Else
                        wy := 00
                        For wy := wFinal To wItem Step -1
                           If wM_Grid[wGrid,wy,01] = Nil
                              wNewFim := wy
                              Exit
                           EndIf
                        Next
                     EndIf
                  Else
                     wNewIni := wInicio
                     wy := 00
                     For wy := wItem To 1 Step -1
                        If ValType(wM_Grid[wGrid,wy,01])<>"U"
                           wNewIni := wy+1
                           Exit
                        EndIf
                     Next

                     wNewFim := wFinal
                     wy := 00
                     For wy := wNewIni To wFinal
                        If ValType(wM_Grid[wGrid,wy,01])<>"U"
                           wNewFim := wy-1
                           Exit
                        EndIf
                     Next
                  EndIf

                  For wy := wNewIni To wNewFim
                      wKeySql := wMChave[1] + "=" + Campo(wM_Cursor[wy,01],ValType(wM_Cursor[wy,01]))

                      wxM_Cursor := fConsulta2(wMXTabela,wMCamposAux,wKeySql)
                      If Len(wxM_Cursor) > 0
                         c_Grid_Carrega_Matrix( 03 , wGrid , wxM_Cursor[1] , wPos_Fnc ,,, wy )
                      EndIf
                  Next
               EndIf
            Else
               c_Grid_Carrega_Matrix( 02 , wGrid , wM_Cursor , wPos_Fnc , wInicio , wFinal)
            EndIf
            wObjGrid:Refresh()
            If wVez=1 .And. wItem=1
               cFolder_Enable()
               oM_Dlg[Len(oM_Dlg)]:aEvalWhen()
               wx:=00
               For wx := 01 To Len(oM_Button)
                  oM_Button[wx]:Refresh()
               Next
            EndIf
         EndIf
      EndIf
   Next  

Return .t.
* fim da Function fCaseScroll(wGrid)

Function __fCase_Grid_Monta(wObj_Ref,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wTotLin,wTotCol,wTipoWhen,wPre_Fnc,wPos_Fnc,wGeraConteudo,wFunc_DbClick,wFunc_rClick,wFunc_Change,wGrid_Tp,wAscend,wRowNum,wChave,wCol_Nome,wSeparador,wAux_Function,wClrGTxt,wClrSTxt)
************************************************************************************
*                 Funcao cCase (wM_Case)  para montar o c_Grid                     *
************************************************************************************
* wGrid         - Sequência do Grid correspondente                                 *
* wObj_Ref      - Objeto de Referência para Ficar Sobreposto                       *
* wObj_Desloc   - Objeto de Referência para Deslocamento de posiÎ„es               *
* wDesloc_Lin   - Quantidade de Linhas de deslocamento                             *
* wDesloc_Col   - Quantidade de Colunas de deslocamento                            *
* wTotLin       - Quantidade de Linhas que o Grid terÿ ( unidade = item na tela )  *
* wTotCol       - Tamanho do Comprimento do Grid                                   *
* wWhen         - When do Grid                                                     *
* wGeraConteudo - Se executa a função c_Grid_Cria_Matrix no inicio do programa     *
************************************************************************************
Local wXM_Case := {} , wYM_Case [8,0] , wZM_Case [4,0] , wx := 00 , wXObj_Desloc , wXObj_Ref , wMMcase , wObj
Local wLenDlg , wLastDlg , wXGera , wxLen

   wGeraConteudo := iIf(ValType(wGeraConteudo)<>"L",.F.,wGeraConteudo)

   wMMcase := wM_Case[wc_Case_Seq]
   wMMcase := aTranspose(wMMcase)
   aSort( wMMcase ,,,{|x,y| x[wCS_GridSeq] < y[wCS_GridSeq]})   // ordena a coluna em ordem CRESCENTE  (wCS_GridSeq)
   If Len(wMMcase) = 0
      cCancel("__fCase_Grid_Monta() - Grid " + StrZero(wc_Case_Seq ,3,0) + " Vazio")
   EndIf
   wMMcase := aTranspose(wMMcase)
   *-------------------------------------------------------------------------------*
   
   wx := 00
   wxLen := Len(wM_Case[wc_Case_Seq ,wCS_Coluna])
   For wx=1 to wxLen
     aAdd( wXM_Case, { wMMcase[wCS_GridSeq,wx] ,  wMMcase[wCS_Coluna,wx] , wMMcase[wCS_CabCol_Grid,wx]  ,  wMMcase[wCS_TabNome,wx] ,  wMMcase[wCS_QtdCol_Grid,wx],  wMMcase[wCS_AlinDireita,wx] , wMMcase[wCS_TypeVar,wx] , wMMcase[wCS_Picture,wx] })
   Next
   
   wx := 00
   For wx=1 to Len(wXM_Case)
      aAdd( wYM_Case[1],  wXM_Case[wx,1])       // wCS_GridSeq
      aAdd( wYM_Case[2],  wXM_Case[wx,2] )      // wCS_Coluna
      If wXM_Case[wx,1] > 0                     // Se tem GridSeq 
         aAdd( wYM_Case[3],  wXM_Case[wx,3] )   // wCS_CabCol_Grid
      Else                                      
         aAdd( wYM_Case[3],  "" )               
      EndIf                                     
      aAdd( wYM_Case[4],  wXM_Case[wx,4] )      // wCS_TabNome
      aAdd( wYM_Case[5],  wXM_Case[wx,5] )      // wCS_QtdCol_Grid
      aAdd( wYM_Case[6],  wXM_Case[wx,6] )      // wCS_AlinDireita
      If wXM_Case[wx,7] = "N"                   // wCS_TypeVar
         aAdd( wYM_Case[8],  wXM_Case[wx,8] )   // wCS_Picture
      Else
         aAdd( wYM_Case[8],  ""             )   // wCS_Picture
      EndIf
   Next
   *-------------------------------------------------------------------------------*

   *-------------------------------------------------------------------------------*
   wXM_Case := {}
   wx := 00
   For wx:= 01 to wxLen
       aAdd( wXM_Case, { wM_Case[wc_Case_Seq ,wCS_GridSeq,wx] ,  wM_Case[wc_Case_Seq ,wCS_Coluna,wx] , wM_Case[wc_Case_Seq ,wCS_Cabeca,wx] , wM_Case[wc_Case_Seq ,wCS_TabNome,wx] })
   Next
   
   wx := 00                       
   For wx=1 to Len(wXM_Case)
       aAdd( wZM_Case[1],  wXM_Case[wx,1])     // wCS_GridSeq
       aAdd( wZM_Case[2],  wXM_Case[wx,2] )    // wCS_Coluna
       If wXM_Case[wx,1] > 0 
          aAdd( wZM_Case[3],  wXM_Case[wx,3] ) // wCS_Cabeca
       Else
          aAdd( wZM_Case[3],  "" )            
       EndIf
       aAdd( wZM_Case[4],  wXM_Case[wx,4] )    // wCS_TabNome
   Next
   *-------------------------------------------------------------------------------*

   If .Not.cEmpty(wObj_Desloc)
      wXObj_Desloc := &wObj_Desloc
   EndIf   
   wXObj_Ref := &wObj_Ref

   wDesloc_Lin := Val(wDesloc_Lin)
   wDesloc_Col := Val(wDesloc_Col)
   wTotLin     := Val(wTotLin)
   wTotCol     := Val(wTotCol)
   wLenDlg     := Len(oM_Dlg)

   wPre_Fnc := c_When(wTipoWhen,wPre_Fnc)
   wLastDlg := wLenDlg-1
   wXGera   := .F.

   If Len(oM_Brw)=0 //.Or. wGrid_Tp=2 .Or. wLenDlg>1
      wXGera := wGeraConteudo
   ElseIf wLenDlg>1
	      If Len(wM_Dlg[1])>0
         If wM_Dlg[wLastDlg,1]+1=wc_Case_Seq 
            wXGera := wGeraConteudo
         EndIf
      EndIf
   EndIf

   wObj := c_Grid( wc_Case_Seq , wM_Tab_Nome[wc_Case_Seq] , {wXObj_Desloc,wDesloc_Lin,wDesloc_Col,wTotLin,wTotCol },wYM_Case[4],wYM_Case[2],wZM_Case[4],wZM_Case[2],wYM_Case[3],wYM_Case[5],wYM_Case[6],wYM_Case[8], "fCaseAtrib("+Str(wc_Case_Seq,2,0)+")", "fCaseRefresh("+Str(wc_Case_Seq,2,0)+")", wXObj_Ref , wPre_Fnc , wPos_Fnc ,wXGera,wFunc_DbClick,wFunc_rClick,wFunc_Change,wGrid_Tp,wAscend,wRowNum,wChave,wCol_Nome,wSeparador,wAux_Function,wClrGTxt,wClrSTxt)  // Cria o Grid
   aAdd( wM_Tab_PosFnc , {wGeraConteudo , wPos_Fnc , wAscend , wRowNum , wChave , wAux_Function })

Return wObj
*Fim da Function __fCase_Grid_Monta()

Function c_Grid(wGrid,wTabela,wM_Posicao,wM_Tab_Campos,wM_Campos,wMM_Tab_Campos,wMM_Campos,wM_Cabecalho,wM_ColSize,wM_ColAlinha,wM_Picture,wXFunc_Atrib,wXFunc_Refresh,wDlg,wPre_Fnc,wPos_Fnc,wGeraConteudo,wXFunc_DbClick,wXFunc_rClick,wXFunc_Change,wTpGrid,wAscend,wRowNum,wChave,wCol_Nome,wSeparador,wAux_Function,wClrGTxt,wClrSTxt)
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wx , wTLin , wTCol , wXTCol , woBrw , oBrwSay , wnTop , wnLeft , wnWidth , wnHeight , wXFuncion
Local wObj_Desloc , wPos1 , wPos2 , wPos3 , wPos4 , wBrwCampos, wXWhen , wXXGrid , wMAction , wxLen , wxxx

If Upper(AllTrim(oM_Dlg[Len(oM_Dlg)]:ClassName)) = "TDIALOG"
   wTLin := 08.20                              // Tamanho da Linha
   wTCol := 04.00                              // Tamanho da Coluna
Else
   wTLin := 16.40                              // Tamanho da Linha
   wTCol := 08.00                              // Tamanho da Coluna
EndIf

wXXGrid  := Strzero(wGrid,2,0)
__wKeySeek := Space(00)

aAdd( wM_BrwLin , 01 )

* --------------------------------------------Carrega a Matrix-------------------------------------------------- *
aAdd( wM_Grid , {} )
c_Grid_Cria_Matrix( wGrid , wTabela , wMM_Tab_Campos , wMM_Campos ,,,,, wGeraConteudo , wPos_Fnc , wAscend , wRowNum, wChave)
* -------------------------------------------------------------------------------------------------------------- *

*------------------Monta as Colunas e os Cabecalhos------------------------*
aAdd( wMBrwSTRCampos , Space(00) )
aAdd( wMBrwCampos    , {}        )
aAdd( wMBrwCabeca    , {}        )
aAdd( wMBrwColSize   , {}        )
aAdd( wMBrwColAlinha , {}        )
aAdd( wMGrid_Col     , 0         )
aAdd( wMCase_Col     , 0         )
aAdd( wMFunc_DbClick , Space(00) )
aAdd( wMFunc_rClick  , Space(00) )
aAdd( wMFunc_Change  , Space(00) )
aAdd( wMFunc_ClrGTxt , Space(00) )
aAdd( wMFunc_ClrSTxt , Space(00) )

wx    := 00
wxLen := Len(wM_Cabecalho)
For wx:= 01 To wxLen

   If cEmpty(wM_Cabecalho[wx]) 
      Loop               
   EndIf                 
                         
   If Len(wMBrwCabeca[wGrid]) = 16  // Limite de Colunas no Grid
      Exit               
   EndIf                 
   wMBrwSTRCampos  [wGrid] := wMBrwSTRCampos[wGrid] + "c_Grid_Format( wM_Grid["+wXXGrid+",wM_BrwLin["+wXXGrid+"] ," + Str( cNC(wM_Campos[wx],wGrid) ,3,0) +"],'" + AllTrim(wM_Picture[wx]) + "'),"
   Aadd(wMBrwCabeca[wGrid] , wM_Cabecalho[wx] )

   If     wM_ColSize[wx] <= 01
          wXTCol := 10   
   ElseIf wM_ColSize[wx] <= 02
          wXTCol := 09   
   ElseIf wM_ColSize[wx] <= 03
          wXTCol := 08.5 
   ElseIf wM_ColSize[wx] <= 05
          wXTCol := 08.0 
   ElseIf wM_ColSize[wx] <= 08
          wXTCol := 07.5 
   ElseIf wM_ColSize[wx] <= 10
          wXTCol := 07.5 
   ElseIf wM_ColSize[wx] <= 20
          wXTCol := 06.5 
   Else
          wXTCol := 06.0 
   EndIf
   Aadd(wMBrwCampos   [wGrid] , wM_Campos[wx] )
   Aadd(wMBrwColSize  [wGrid] , wM_ColSize[wx] * wXTCol )
   Aadd(wMBrwColAlinha[wGrid] , wM_ColAlinha[wx] )
Next                      
wMBrwSTRCampos[wGrid] := AllTrim(wMBrwSTRCampos[wGrid])
wMBrwSTRCampos[wGrid] := SubStr(wMBrwSTRCampos[wGrid],1,Len(wMBrwSTRCampos[wGrid])-1)        // retira a virgula do final
wBrwCampos            := wMBrwSTRCampos[wGrid]
*--------------------------------------------------------------------------*

*--------------------------------------------------------------------------*
If ValType(wM_Posicao[1])<>"U"   // se foi passado o objeto de deslocamento
   wObj_Desloc := wM_Posicao[1]
   wnTop := 0 ; wnTop := 0 ; wnLeft := 0 ; wnWidth := 0 ; wnHeight := 0
   wnTop    := wObj_Desloc:nTop
   wnLeft   := wObj_Desloc:nLeft
   wnWidth  := wObj_Desloc:nwidth
   wnHeight := wObj_Desloc:nHeight

   If wObj_Desloc:classname $ "TBUTTON,TBTNBMP"
      wnTop := wnTop + wnHeight 
   EndIf

   wPos1 := (wM_Posicao[2] * wTLin ) + wnTop
   wPos2 := (wM_Posicao[3] * wTCol ) + wnLeft
Else
   wPos1 :=  wM_Posicao[2] * wTLin
   wPos2 :=  wM_Posicao[3] * wTCol
EndIf
*--------------------------------------------------------------------------*
wPos3 := (wM_Posicao[4] + 2) * wTLin 
wPos4 := (wM_Posicao[5] * wTCol )

wPre_Fnc := iIf(ValType(wPre_Fnc)="U",.T.,wPre_Fnc)
wXWhen   := iIf(ValType(wPre_Fnc)="C" ,iIf(Len(Trim(wPre_Fnc))=0,.T.,wPre_Fnc) , wPre_Fnc )
wXWhen   := iIf(ValType(wXWhen)  ="L",iIf(wXWhen,".T.",".F."),wXWhen )

*-------------------------Cria o Objeto Browse-----------------------------*
wBrwCampos := "{||{" + wBrwCampos + "}}"
wXWhen     := "{||(" + wXWhen + ")}"
woBrw      := TWBrowse():New( wPos1,wPos2, wPos4, wPos3, &(wBrwCampos) , wMBrwCabeca[wGrid] , wMBrwColSize[wGrid] , wDlg ,,,,,,, oFont ,,,, wXXGrid , .F.,, .T., &(wXWhen) , .F.,,, )
*--------------------------------------------------------------------------*

*-------------Monta a pesquisa por coluna do Grid (HeadClick)--------------*
woBrw:aActions  := {}
woBrw:aJustIfy  := {}
wMAction        := {}

aAdd( wMFunc_Atrib      , wXFunc_Atrib   )
aAdd( wMFunc_Refresh    , wXFunc_Refresh )
aAdd( wM_Grid_Col_Order , 01             )
aAdd( wM_Case_Col_Order , 01             )
aAdd( wM_Grid_Order     , {}             )

wx    :=00
wxLen := Len(wMBrwCabeca[wGrid])
For wx:=01 To wxLen
    wMGrid_Col[wGrid] := AllTrim(Str(wx))
    wMCase_Col[wGrid] := AllTrim(Str(cNC(wMBrwCampos[wGrid][wx],wGrid,,"c_Grid")))

    aAdd( wMAction , "c_Grid_Sort_Matrix("+wXXGrid+","+wMGrid_Col[wGrid]+","+wMCase_Col[wGrid]+")" )
    aAdd( woBrw:aActions, { |x,y,nCol| &(wMAction[oM_Brw[wM_Grid_Seq[wG_Atual]]:nAtCol(nCol)]),__wKeySeek:=Space(00),oM_Brw_Say[wM_Grid_Seq[wG_Atual]]:Refresh(),oM_Brw[wM_Grid_Seq[wG_Atual]]:GoTop() , oM_Brw[wM_Grid_Seq[wG_Atual]]:Refresh()} )
    aAdd( wM_Grid_Order[Len(wM_Grid_Order)] , .f. )     // Ordem de ClassIficacao da Coluna (x) (.t. Ascendente)  (.f. Descendente)
    aAdd( woBrw:aJustIfy, wMBrwColAlinha[wGrid][wx] )   // alinhado a Direita (.t.) ou Esquerda (.f.)
Next
*--------------------------------------------------------------------------*

*--------------------------------------------------------------------------*
wMFunc_DbClick[wGrid]    := iIf(ValType(wXFunc_DbClick)<>"C",".T." ,AllTrim(wXFunc_DbClick))
wMFunc_rClick [wGrid]    := iIf(ValType(wXFunc_rClick) <>"C",".T." ,AllTrim(wXFunc_rClick))
wMFunc_Change [wGrid]    := iIf(ValType(wXFunc_Change) <>"C",".T." ,AllTrim(wXFunc_Change))
wMFunc_DbClick[wGrid]    := iIf(cEmpty(wMFunc_DbClick[wGrid]),".T.",wMFunc_DbClick[wGrid])
wMFunc_rClick [wGrid]    := iIf(cEmpty(wMFunc_rClick [wGrid]),".T.",wMFunc_rClick [wGrid])
wMFunc_Change [wGrid]    := iIf(cEmpty(wMFunc_Change [wGrid]),".T.",wMFunc_Change [wGrid])
wMFunc_ClrGTxt[wGrid]    := iIf(cEmpty(wClrGTxt),"cColor('Preto')" ,wClrGTxt)
wMFunc_ClrSTxt[wGrid]    := iIf(cEmpty(wClrSTxt),"cColor('Branco')",wClrSTxt)

If wTpGrid < 3
   If wTpGrid = 02  // ComboDB
      wMFunc_DbClick[wGrid] := "(cCombo_Atrib(" + Str(fGrid_Ant()) +","+ Str(wGrid) +")," + wMFunc_DbClick[wGrid] +")"
   EndIf
   
   woBrw:cAlias        := "ARRAY"
   woBrw:bLogicLen     := { || Len(wM_Grid[wM_Grid_Seq[wG_Atual]]) }
   woBrw:bGoTop        := { || wM_BrwLin[wM_Grid_Seq[wG_Atual]]  := 01 }
   woBrw:bGoBottom     := { || wM_BrwLin[wM_Grid_Seq[wG_Atual]]  := Eval( oM_Brw[wM_Grid_Seq[wG_Atual]]:bLogicLen , oM_Brw[wM_Grid_Seq[wG_Atual]] ) }
   woBrw:bkeydown      := { | nKey, nFlags | c_Grid_Seek_Matrix(nKey,nFlags),iIf(nKey=13,(&(wMFunc_DbClick[wM_Grid_Seq[wG_Atual]])),) }
   woBrw:bChange       := { |Self| fCaseScroll(Self,wM_Grid_Seq[wG_Atual],wM_Grid_Seq[wG_GoTo]),&(wMFunc_Atrib[wM_Grid_Seq[wG_Atual]]),&(wMFunc_Refresh[wM_Grid_Seq[wG_Atual]]),&(wMFunc_Change[wM_Grid_Seq[wG_Atual]]) }
   woBrw:bLDblClick    := { || &(wMFunc_DbClick[wM_Grid_Seq[wG_Atual]]) }
   woBrw:bSkip         := { | nwant , nOld | nOld := wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] , wM_Grid_Seq[wG_GoTo] := nOld , wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] += nwant , wM_BrwLin[m->wM_Grid_Seq[wG_Atual]]  := Min( Max( wM_BrwLin[m->wM_Grid_Seq[wG_Atual]],1 ), Eval( oM_Brw[m->wM_Grid_Seq[wG_Atual]]:bLogicLen , oM_Brw[wM_Grid_Seq[wG_Atual]]) ) , wM_BrwLin[m->wM_Grid_Seq[wG_Atual]]  - nOld }
   woBrw:nClrText      := { || &(wMFunc_ClrGTxt[wM_Grid_Seq[wG_Atual]]) }
   woBrw:nClrForeFocus := { || &(wMFunc_ClrSTxt[wM_Grid_Seq[wG_Atual]]) }
   woBrw:nLineStyle    := 1

//  woBrw:lEditCol( 01,@wTESTE,"!!!",,,,, )

ElseIf wTpGrid = 3
// woBrw:SetTree( oTree )
// woBrw:nLineStyle := 3  // no lines
//
// TreeEnd()
EndIf

woBrw:bRClicked  := { | nRow,nCol,nKeyFlags,Self| fControlGrid(Self),&(wMFunc_rClick[wM_Grid_Seq[wG_Atual]]) }
woBrw:bLClicked  := { | nRow,nCol,nKeyFlags,Self| fControlGrid(Self) }

If Upper(AllTrim(oM_Dlg[Len(oM_Dlg)]:ClassName)) = "TDIALOG"
   oBrwSay := TSay():New( woBrw:nTop+woBrw:nHeight+1 , woBrw:nLeft , {|| __wKeySeek },wDlg, "" ,, .F., .F., .T., .T., "R+/W" ,, woBrw:nWidth ,09, .F., .F., .F., .F., .F. )
Else
   oBrwSay := TSay():New( woBrw:nTop+woBrw:nHeight+1 , woBrw:nLeft , {|| __wKeySeek },wDlg, "" ,, .F., .F., .T., .T., "R+/W" ,, woBrw:nWidth ,18, .F., .F., .F., .F., .F. )
   oBrwSay:Set3DLooK()
EndIf
*--------------------------------------------------------------------------*

aAdd( wM_Control , { woBrw , Len(wM_Control)+1 , })
aAdd( oM_Brw     , woBrw   )
aAdd( oM_Brw_Say , oBrwSay )

If .Not.cEmpty(wAux_Function)
   wXFuncion := AllTrim(wAux_Function)
   wXFuncion := &wXFuncion
EndIf

Return woBrw
*Fim da Function c_Grid()

Function c_Grid_Cria_Matrix( wGrid , wTabela , wM_Tab_Campos , wM_Campos , wKeyDbf , wKeySql , wOrderDbf , wOrderSql , wGeraConteudo , wPos_Fnc , wAscend , wRowNum , wChave)
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wwLin, wWork , wAlias, wRecno, wIndexOrd, wx,wy,wResp,wxy:=0,wComparacao,wGKeyDbf,wGKeySql,wxMIndice:={},wTam,wOrderBy
Local wM_Pesquisa:={},wF,wUniq_Ant,wUniq_Atual,wUniq_Campo,wOpcDB,wMacro,wGOrderDbf,wGOrderSql,wMCamposAux,wDec,wLen,wMM
Local wMXTabela,wLoop,wPos,wM_Melhor_NTX,wxx,wDefVar , wXM_Cursor , wM_Num_Mat,wU_KeySql,wT,wZ,wIdx_Unique,wCarrega,wM_Chave
Local wxLen,wxLen1,wxLen2,wFiltro,wM_Cursor

   wGeraConteudo := iIf(ValType(wGeraConteudo)<>"L",.F.       ,wGeraConteudo)
   wComparacao   := Space(00)
   wU_KeySql     := Space(00)
   wFiltro       := .F.

   wKeySql   := iIf(ValType(wKeySql)<>"C","''",wKeySql)
   If Len(wKeySql)=0
      wKeySql:= "''"
   EndIf
   wKeyDbf   := iIf(ValType(wKeyDbf) <>"C",Space(00),wKeyDbf  )
   wOrderDbf := iIf(ValType(wOrderDbf)="U",00       ,wOrderDbf)
   wOrderSql := iIf(ValType(wOrderSql)="U",Space(00),wOrderSql)

   aSize( wM_Grid[wGrid], 0 )   // rever
   *--------------------------------------------Carrega a Matrix-----------------------------------------------*

   *---------------------------Carrega Campos para Chave UNIQUE no próprio GRID -------------------------------*
   wUniq_Campo := Space(00)
   wxLen := Len(wM_Case[wGrid,wCS_Coluna])
   wxLen2:= Len(wM_Campos)

   For wxy := 01 To wxLen
      If wM_Case[wGrid,wCS_Unique,wxy] = .T.
         If     wM_Case[wGrid,wCS_TypeVar,wxy] = "C"
            wUniq_Campo := wUniq_Campo + iIf(cEmpty(wUniq_Campo),"","+") + wM_Case[wGrid,wCS_Coluna,wxy]
         ElseIf wM_Case[wGrid,wCS_TypeVar,wxy] = "N"
            wUniq_Campo := wUniq_Campo + iIf(cEmpty(wUniq_Campo),"","+") + "Str(" + wM_Case[wGrid,wCS_Coluna,wxy] + ")"
         ElseIf wM_Case[wGrid,wCS_TypeVar,wxy] = "D"
            wUniq_Campo := wUniq_Campo + iIf(cEmpty(wUniq_Campo),"","+") + "DtoC(" + wM_Case[wGrid,wCS_Coluna,wxy] + ")"
         EndIf
      EndIf
      If .Not.cEmpty(wM_Case[wGrid,wCS_F1Conteudo,wxy])
         wFiltro := .T.
      EndIf
   Next
   *-----------------------------------------------------------------------------------------------------------*

   If wGeraConteudo
      wM_Pesquisa := c_Gera_Key(wGrid,1,wCS_Key_Tp)              // Monta Grid
      wGKeyDbf    := wM_Pesquisa[1]
      wGKeySql    := wM_Pesquisa[2]
      wGOrderDbf  := wM_Pesquisa[3]
      wGOrderSql  := wM_Pesquisa[4]
   EndIf

// wPos := cScan( wM_Tabelas , wTabela , 01 ) 
   wPos := cScanBin( wM_Tabelas , upper(wTabela) , 01 ) 
   If wPos<>0
      wOpcDB := wM_Tabelas[wPos,02]                                                       // Grava a inFormação do Tipo de Banco de Dados ("D"-DBF) ("O"-ORACLE) ("S"-SQL SERVER) ("A"-ACCESS) ("M"-MySQL)
   EndIf                                                                                       

   If wOpcDB = "D"                                    // Opcao de Banco de Dados ("D"-DBF)
      *-----------------------------------------------------------------------------------------------------------*
      wAlias    := Alias()   
      wRecno    := recno()   
      wIndexOrd := indexord()

      If .Not.wFiltro                                 // Se não tiver sido carregada com os Filtros
         If Len(Trim(wKeyDbf))>0
            cwselect(wTabela)                         // Abre o arquivo de dados
            DbGotop()                                 // Vai p/ o Primeiro Registro do Arquivo
            If wOrderDbf > 0
               Set Order To wOrderDbf                 // Ordena o Arquivo pelo Índice desejado
            EndIf

            wMacro      := "DbSeek(" + iIf(ValType(wKeyDbf)="N",Str(wKeyDbf), wKeyDbf ) + ",.T.)"  // Cria uma Variavel com a Chave de Pesquisa
            wMacro      := &wMacro
            wComparacao := fCria_Melhor_Comparacao( wKeyDbf , wKeySql )
         Else
            If wGeraConteudo
               If wGOrderDbf > 0                       
                  Set Order To wGOrderDbf                  // Ordena o Arquivo pelo Índice desejado
               EndIf                                  
               wMacro   := "DbSeek(" + wGKeyDbf + ",.T.)"  // Cria uma Variavel com a Chave de Pesquisa
               wMacro   := &wMacro
               If wMacro
                  wComparacao := " .Not. Eof() " + " .And. " + &wGKeySql
               Else
                  DbGotop()                               // Vai p/ o Primeiro Registro do Arquivo
                  wComparacao := " .Not. Eof() "
               EndIf   
            Else
               wComparacao := " .F. "
            EndIf
         EndIf
      Else
         wx := 00
         For wx := 01 To Len(wM_Case[wGrid,wCS_Coluna])
            If wM_Case[wGrid,wCS_Filtro,wx]>0
               aAdd( wxMIndice , { wM_Case[wGrid,wCS_Coluna,wx] , wM_Case[wGrid,wCS_F1Conteudo,wx] , wM_Case[wGrid,wCS_F2Conteudo,wx] })
            EndIf
         Next
         wM_Melhor_NTX := C_Melhor_Ntx(wTabela,wxMIndice)
   
         cwselect(wTabela)
         If wOrderDbf > 0       
            Set Order To wM_Melhor_NTX[1]                           // Melhor Índice
         EndIf                                                      
         If .not. cEmpty(wM_Melhor_NTX[2])                           // Melhor Seek
            wMacro      := "DbSeek(" + wM_Melhor_NTX[2] + ",.T.)"
            wMacro      := &wMacro
            wComparacao := wM_Melhor_NTX[3]                         // Melhor Comparação
         Else
            DbGotop()                                               // Vai p/ o Primeiro Registro do Arquivo
            wComparacao := " .Not. Eof() "
         EndIf
      EndIf   
      wUniq_Ant   := Space(00)
      wUniq_Atual := Space(00)
   
      Do While &wComparacao
   
         If Len(wM_Tab_Filter[wGrid]) > 0 .And. AllTrim(wM_Tab_Filter[wGrid])<>"''"     // Se tem filtro
            wMacro := wM_Tab_Filter[wGrid]
            wMacro := iIf(ValType(wMacro)="L", iIf(wMacro=.T.,'.T.','.F.'),wMacro)
            If .Not. ( &wMacro ) 
               DbSkip()          
               Loop
            EndIf
         EndIf
   
         If .Not.cEmpty(wUniq_Campo)
            wUniq_Ant   := wUniq_Atual
            wUniq_Atual := &wUniq_Campo
            If wUniq_Ant = wUniq_Atual
               DbSkip()          
               Loop
            EndIf
         EndIf
   
         aAdd(wM_Grid[wGrid],{})

         wwLin := Len(wM_Grid[wGrid])
         wx    := 00
         For wx:= 01 To wxLen2
            wWork :=Space(00)
            
            If wM_Case[wGrid,wCS_Origem,wx]
               wWork := wM_Campos[wx]
               wWork := &wWork
            EndIf

            If .Not.cEmpty(wM_Case[wGrid,wCS_Function,wx])
               For wy := (wx-1) To 01 Step -1
                  If wM_Case[wGrid,wCS_Formato,wy] = 49
                     wM_Case[wGrid,wCS_Conteudo,wy] := {wM_Grid[wGrid,wwLin,wy],wM_Grid[wGrid,wwLin,wy]}
                  Else
                     wM_Case[wGrid,wCS_Conteudo,wy] := wM_Grid[wGrid,wwLin,wy]
                  EndIf
               Next
               wMacro := wM_Case[wGrid,wCS_Function,wx]
               wWork  := &wMacro
            EndIf

            If .Not.cEmpty(wWork) 
               aAdd(wM_Grid[wGrid,wwLin],wWork)
            Else
               wDefVar := wM_Case[wGrid,wCS_DefVar,wx]
               wDefVar := &wDefVar
               aAdd(wM_Grid[wGrid,wwLin],wDefVar)
            EndIf
         Next
         DbSkip()            
      EndDo                  
      *-----------------------------------------------------------------------------------------------------------*
   Else    // ("O"-ORACLE) ("S"-SQL SERVER) ("A"-ACCESS) ("M"-MySQL)
      *-----------------------------------------------------------------------------------------------------------*
      If wGeraConteudo
         wKeySql := c_Sql_TiraPonto(wKeySql)
         If .Not.wFiltro                                                     // Se não tiver sido carregada com os Filtros
            If .Not.cEmpty(wKeySql) .And. wKeySql <> "''"
               If SubStr(wKeySql,1,1) = '"' .or. SubStr(wKeySql,1,1) = "'"   // CICERO 10/09/2003 se For para expandir
                  wKeySql := &wKeySql
               EndIf
            Else
               wKeySql   := c_Sql_TiraPonto(wGKeySql)
               wOrderSql := wGOrderSql
               If SubStr(wKeySql,1,1) = '"' .or. SubStr(wKeySql,1,1) = "'"   // CICERO 10/09/2003 se For para expandir
                  wKeySql := &wKeySql
               EndIf
            EndIf
         EndIf
         *---------------------------Carrega Campos para Chave UNIQUE no próprio GRID -------------------------------*

         *-----------------------------------------------------------------------------------------------------------*
         wM_Chave    :={}
         wMCamposAux :={}
         wMXTabela   :={}
         aAdd(wMXTabela,wTabela)
         wx := 00
         wIdx_Unique := .F.
         If .Not.cEmpty(wChave)
            wOrderBy := Space(00)
            wM_Chave := cStrToMatriz(wChave,"#")
            wy       := 00
            wxLen1   := Len(wM_Chave)
            For wy= 01 to wxLen1
               If wIdx_Unique=.F.
                  For wx= 01 to wxLen2

                     If Upper(wM_Campos[wx]) = Upper(wM_Chave[wy])
                        If wM_Case[wGrid,wCS_Unique,cNC(wM_Campos[wx],wGrid,,"c_Grid_Cria_Matrix")]
                           wIdx_Unique := .T.
                        EndIf
                     EndIf
                  Next
               EndIf
               wOrderBy := wOrderBy + iIf(cEmpty(wOrderBy),"",",") + wM_Chave[wy]
            Next
            wM_Cursor := fConsulta( wMXTabela ,, wKeySql ,, wOrderBy , wM_Chave , wAscend , wRowNum , wIdx_Unique )
            If wc_user="C"
               clog_sql("G1- " + wc_sql)
            EndIf

            wCarrega  := .F.
         Else
            For wx=1 to wxLen2
               If wM_Case[wGrid,wCS_Origem,cNC(wM_Campos[wx],wGrid,,"c_Grid_Cria_Matrix")]
                  If cEmpty(wM_Tab_Campos[wx])
                     wWork := wTabela           + "." + wM_Campos[wx]
                  Else
                     wWork := wM_Tab_Campos[wx] + "." + wM_Campos[wx]
                     If cScan(wMXTabela,wM_Tab_Campos[wx]) = 0
                        aAdd(wMXTabela,wM_Tab_Campos[wx])
                     EndIf
                  EndIf
                  
                  If wM_Case[wGrid,wCS_TypeVar,cNC(wM_Campos[wx],wGrid,,"c_Grid_Cria_Matrix")]="D"
                     aAdd( wMCamposAux , "DATE_FORMAT(" + wWork + ",'%d/%m/%Y')" )
                  Else
                     aAdd( wMCamposAux , wWork )
                  EndIf
               Else
                  aAdd( wMCamposAux , "'A'" )      // coluna fixa para nao perder a sequencia do select
               EndIf
            Next
            
            wM_Cursor := fConsulta( wMXTabela ,, wKeySql ,, wOrderSql , wMCamposAux , wAscend , wRowNum ,,)
            If wc_user="C"
               clog_sql("G2- " + wc_sql)
            EndIf
            wCarrega  := .T.
         EndIf

         wPos := 00
         wx   := 00
         For wx := 01 To Len(wM_Grid_Cursor)
            If wM_Grid_Cursor[wx,01] = wGrid
               wPos := wx
               Exit
            EndIf
         Next
         If wPos = 0
            aAdd( wM_Grid_Cursor,{ wGrid , wM_Cursor , wTabela , wM_Chave , wIdx_Unique , wPos_Fnc })
         Else
            wM_Grid_Cursor[wPos,02] :=  wM_Cursor
            wM_Grid_Cursor[wPos,03] :=  wTabela
            wM_Grid_Cursor[wPos,04] :=  wM_Chave
            wM_Grid_Cursor[wPos,05] :=  wIdx_Unique
            wM_Grid_Cursor[wPos,06] :=  wPos_Fnc
         EndIf
         *-----------------------------------------------------------------------------------------------------------*

         If wCarrega
            c_Grid_Carrega_Matrix( 02 , wGrid , wM_Cursor , wPos_Fnc )
         Else
            c_Grid_Carrega_Matrix( 01 , wGrid , wM_Cursor , wPos_Fnc )
         EndIf   
      EndIf
   EndIf

   wM_BrwLin[wGrid] := 01

   If Len(wM_Grid[wGrid]) = 0                                       // Se esta vazio Cria linha em branco na matrix
      aAdd(wM_Grid[wGrid],{})
      wx    := 00
      wMM   := {}
      For wx = 01 To wxLen2
         wDefVar := cDefVar(wM_Case[wGrid,wCS_DefVar,wx],wM_Case[wGrid,wCS_TypeVar,wx],wGrid)
         wWork   := iIf(wM_Case[wGrid,wCS_TypeVar,wx]="N",0,wDefVar)
         aAdd( wMM , wWork)
      Next
      wM_Grid[wGrid,01] := wMM
   EndIf

Return  .t.
*fim da Function c_Grid_Cria_Matrix()

Function c_Grid_Carrega_Matrix(wTipo,wGrid,wM_Cursor,wPos_Fnc,wInicio,wFim,wLinha)
***************************************************************************************************
* wTipo -> 01 = Carrega o Grid todo com valor Nulo
*          02 = Carrega Linhas e Colunas 
*          03 = Carrega Somente as Colunas
***************************************************************************************************
Local wwLin,wWork,wMacro,wDefVar,wLoop,wLen1,wLen2,wMM
Local wx,wy,wxy,wTam,wDec,wPos,wxx,wF,wQtd,wxWork,wMatriz,wxPos,wxLen

   cursorwait()
   wLen1 := 00
   If ValType(wM_Cursor)="A"
      wLen1 := Len(wM_Cursor)
   EndIf
   If wLen1=0
      CursorArrow()
      Return .T.
   EndIf
   wInicio := iIf(cEmpty(wInicio),01 ,wInicio)
   wFim := iIf(cEmpty(wFim) ,wLen1,wFim)
   wLen2 := Len(wM_Case[wGrid,wCS_Coluna])
   If wTipo = 01
      wM_BrwLin[wGrid] := 01
      wM_Grid[wGrid] := {}
      wMM := Array(wLen1,wLen2)
      wM_Grid[wGrid] := wMM
   ElseIf wTipo = 02
      For wxy := wInicio To wFim
         cursorwait()
         aAdd(wM_Grid[wGrid],{})
         wwLin := Len(wM_Grid[wGrid])
         wx := 00
         For wx = 01 to wLen2
            cursorwait()
            wWork  := Space(0)
            wMacro := Space(0)
            wMM    := Space(0)
            wy := 00
            If wM_Case[wGrid,wCS_Origem,wx]
               If wM_Case[wGrid,wCS_TypeVar,wx]="D"
                  wWork := cTod(wM_Cursor[wxy,wx])
               Else
                  wWork := wM_Cursor[wxy,wx]
               EndIf
            EndIf
            wxWork := space(00)
            If .Not.cEmpty(wM_Case[wGrid,wCS_Function,wx])
               For wy := (wx-1) to 01 Step -1
                  If wM_Case[wGrid,wCS_Formato,wy] = 49
                     wM_Case[wGrid,wCS_Conteudo,wy] := {wM_Grid[wGrid,wwLin,wy],wM_Grid[wGrid,wwLin,wy]}
                  Else
                     If ValType(wM_Grid[wGrid,wwLin,wy])="C"
                        If wM_Case[wGrid,wCS_Origem,wy]
                           wM_Case[wGrid,wCS_Conteudo,wy] := wM_Grid[wGrid,wwLin,wy]
                        EndIf
                     Else
                        wM_Case[wGrid,wCS_Conteudo,wy] := wM_Grid[wGrid,wwLin,wy]
                     EndIf
                  EndIf
               Next
               wM_BrwLin[wGrid] := wwLin
               fWork(wWork)
               wMacro := AllTrim(wM_Case[wGrid,wCS_Function,wx])
               wMM := &wMacro
               If ValType(wMM)="A" .And. .Not.cEmpty(wWork)
                  wMatriz := wMM
                  wxPos   := 00 ; wy := 00
                  wxLen   := Len(wMatriz)

                  For wy := 01 to wxLen
                     wPos := At("-",wMatriz[wy])-1
                     If AllTrim(SubStr(wMatriz[wy],1,wPos)) == AllTrim(wWork)
                        wxWork := wMatriz[wy]
                        Exit
                     EndIf
                  Next
                  If wPos<=0 .Or. cEmpty(wxWork)
                     wxWork := wMatriz[1]
                  EndIf
                  wWork := wxWork
               Else
                  wWork := iIf(ValType(wMM)="A",Space(00),wMM)
               EndIf
            EndIf
            wDefVar := cDefVar(wM_Case[wGrid,wCS_DefVar,wx],wM_Case[wGrid,wCS_TypeVar,wx],wGrid)
            wWork := iIf(cEmpty(wWork),iIf(wM_Case[wGrid,wCS_TypeVar,wx]="N",0,wDefVar),wWork)
            wWork := iIf(ValType(wWork)="C",AllTrim(wWork),wWork)
            aAdd(wM_Grid[wGrid,wwLin],wWork)
            wPos := 00
         Next
         If .Not.cEmpty(wPos_Fnc)
            wM_BrwLin[wGrid] := wwLin
            wF := &wPos_Fnc
         EndIf
      Next
   ElseIf wTipo = 03

      wwLin := wLinha
      wx := 00
      For wx = 01 to wLen2
         cursorwait()
         wWork := Space(0)
         wMacro := Space(0)
         wMM := Space(0)
         wy := 00
         wxPos := 00
         If wM_Case[wGrid,wCS_Origem,wx]
            If wM_Case[wGrid,wCS_TypeVar,wx]="D"
               wWork := cTod(wM_Cursor[wx])
            Else
               wWork := wM_Cursor[wx]
            EndIf
         EndIf
         If .Not.cEmpty(wM_Case[wGrid,wCS_Function,wx])
            For wy := (wx-1) to 01 Step -1
               If wM_Case[wGrid,wCS_Formato,wy] = 49
                  wM_Case[wGrid,wCS_Conteudo,wy] := {wM_Grid[wGrid,wwLin,wy],wM_Grid[wGrid,wwLin,wy]}
               Else
                  If ValType(wM_Grid[wGrid,wwLin,wy])="C"
                     If wM_Case[wGrid,wCS_Origem,wy]
                        wM_Case[wGrid,wCS_Conteudo,wy] := wM_Grid[wGrid,wwLin,wy]
                     EndIf
                  Else
                     wM_Case[wGrid,wCS_Conteudo,wy] := wM_Grid[wGrid,wwLin,wy]
                  EndIf
               EndIf
            Next
            wM_BrwLin[wGrid] := wwLin
            fWork(wWork )
            wMacro := wM_Case[wGrid,wCS_Function,wx]
            wMM := &wMacro
            If ValType(wMM)="A" .And. .Not.cEmpty(wWork)
               wMatriz:= wMM
               wxPos := 00
               wy := 00
               For wy := 01 to Len(wMatriz)
                  wxPos := At("-",wMatriz[wy])-1
                  If wxPos<=0
                     wxPos := Len(AllTrim(wMatriz[wy]))
                  EndIf
                  If ValType(wWork) = "U"
                     wxWork := wMatriz[01]
                  Else
                     If ValType(wWork) = "N"
                        If Val(Trim(SubStr(wMatriz[wy],1,wxPos))) == Val(Trim(Str(wWork,wxPos,0)))
                           wxWork := wMatriz[wy]
                           Exit
                        EndIf
                     ElseIf ValType(wWork) = "C"
                        If SubStr(wMatriz[wy],1,wxPos) == SubStr(wWork,1,wxPos)
                           wxWork := wMatriz[wy]
                           Exit
                        EndIf
                     EndIf
                  EndIf
               Next
               wWork := wxWork
            Else
               wWork := iIf(ValType(wMM)="A",Space(00),wMM)
            EndIf
         EndIf
         wDefVar := cDefVar(wM_Case[wGrid,wCS_DefVar,wx],wM_Case[wGrid,wCS_TypeVar,wx],wGrid)
         wWork := iIf(cEmpty(wWork),iIf(wM_Case[wGrid,wCS_TypeVar,wx]="N",0,wDefVar),wWork)
         wM_Grid[wGrid,wwLin,wx] := iIf(ValType(wWork)="C",AllTrim(wWork),wWork)
      Next
      If .Not.cEmpty(wPos_Fnc)
         wM_BrwLin[wGrid] := wwLin
         wF := &wPos_Fnc
      EndIf
   ElseIf wTipo = 04
      If cEmpty(wGrid)
         wGrid := wM_Grid_Seq[wG_Atual]
      EndIf
      wM_BrwLin[wGrid] := 01
      wM_Grid[wGrid] := {}
      wM_Grid[wGrid] := wM_Cursor
   EndIf
   CursorArrow()

Return .t.
*fim da Function c_Grid_Carrega_Matrix(wTipo,wGrid,wM_Cursor,wPos_Fnc,wInicio,wFim,wLinha)

Function c_Grid_Seek_Matrix(nKey,nFlag)
*******************************************************************************
*                       funcao para pesquisa na dbedit                        *
*******************************************************************************
Local w__wKeySeek,waScan , wKeyPress , wx , wCarrega , wxLen

   cursorwait()
   wKeyPress := cKeyPressConvert(nKey)
   
   If nKey<>13
      wCarrega  := .F.
      wxLen := Len(wM_Grid[wM_Grid_Seq[wG_Atual]])
      For wx := 01 To wxLen
         If wM_Grid[wM_Grid_Seq[wG_Atual],wx,01] = Nil
            wCarrega := .T.
            Exit
         EndIf
      Next
      If wCarrega
         cwMsg(3, "Recarregando as Informações...","Aguarde" , { || fReCarrega(wM_Grid_Seq[wG_Atual])} )
      EndIf
   EndIf

   If wKeyPress > 0 .or. nKey = 8 
      If nKey=8                                                 // se For backspace, elinima o ultimo caracter digitado
         __wKeySeek:=SubStr(__wKeySeek,1,Len(Trim(__wKeySeek))-1)
      Else
         __wKeySeek:=__wKeySeek+CHR(wKeyPress)                           // TransForma o valor ACSII em caracter e soma con o conteudo da variavel
      EndIf
      * -------------------------------------------------------- *
      If ValType(wM_Grid[m->wM_Grid_Seq[wG_Atual],1,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]]]) = "C"
         w__wKeySeek := __wKeySeek
         waScan    := cScan( wM_Grid[m->wM_Grid_Seq[wG_Atual]] , w__wKeySeek ,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]] , "=" )
      ElseIf ValType(wM_Grid[m->wM_Grid_Seq[wG_Atual],1,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]]]) = "N"
         If .Not.CHR(wKeyPress) $ "1234567890.,-" .And. wKeyPress<>8                                   // Se as teclas digitadas Forem dIferentes das usadas p/ nœmeros, são anuladas
            __wKeySeek:=SubStr(__wKeySeek,1,len(trim(__wKeySeek))-1)
         EndIf

         w__wKeySeek := Val(__wKeySeek)
         If wM_Grid_Order[m->wM_Grid_Seq[wG_Atual],wM_Grid_Col_Order[m->wM_Grid_Seq[wG_Atual]]] = .T.  // Se For Ordem Crescente
            waScan := cScan( wM_Grid[m->wM_Grid_Seq[wG_Atual]] , w__wKeySeek ,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]] , ">=" )
         Else
            waScan := cScan( wM_Grid[m->wM_Grid_Seq[wG_Atual]] , w__wKeySeek ,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]] , "<=" )
         EndIf
      ElseIf ValType(wM_Grid[m->wM_Grid_Seq[wG_Atual],1,wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]]]) = "D"
   
         If Len(Trim(__wKeySeek))>10 .Or. (.not. chr(wKeyPress) $ "1234567890")  .and. wKeyPress<>8      // Se as teclas digitadas Forem dIferentes das usadas p/ nœmeros e a quantidade de caracters pesquisados For maior que 10, são anuladas
            __wKeySeek:=SubStr(__wKeySeek,1,len(Trim(__wKeySeek))-1)
         EndIf
   
         If wKeyPress<>8 
            If (Len(Trim(__wKeySeek))=2 .or. Len(Trim(__wKeySeek))=5 )                       // Se digitar o dia ou mês ja traz o caracter '/'=CHR(47) 
               __wKeySeek := __wKeySeek + Upper(CHR(47))
            EndIf
            If Len(Trim(__wKeySeek))=3 .and. SubStr(__wKeySeek,3,1)<>"/"                     // Se o 3õ caracter da pesquisa não For a Barra ('/'), inclui a Barra
               __wKeySeek := SubStr(__wKeySeek,1,2) + "/" +  SubStr(__wKeySeek,3,1)
            EndIf
            If Len(Trim(__wKeySeek))=6 .and. SubStr(__wKeySeek,6,1)<>"/"                     // Se o 6õ caracter da pesquisa não For a Barra ('/'), inclui a Barra
               __wKeySeek := SubStr(__wKeySeek,1,5) + "/" +  SubStr(__wKeySeek,6,1)
            EndIf
         EndIf

         w__wKeySeek := __wKeySeek
      // If Len(Trim(__wKeySeek))>1 .And. Len(Trim(__wKeySeek))< 04                          // Se o Ano não estiver digitado, completa com 2000. ex.: 12/05/02=>12/05/2002
      //    w__wKeySeek := SubStr(__wKeySeek,1,6) + Str( Val(SubStr(__wKeySeek,7)) + 2000 ,4)
      // EndIf

         If Len(Trim(__wKeySeek))>6 .And. Len(Trim(__wKeySeek))< 10                          // Se o Ano não estiver digitado, completa com 2000. ex.: 12/05/02=>12/05/2002
            w__wKeySeek := SubStr(__wKeySeek,1,6) + Str( Val(SubStr(__wKeySeek,7)) + 2000 ,4)
         EndIf
         w__wKeySeek := CtoD(w__wKeySeek)
         waScan    := cScan( wM_Grid[m->wM_Grid_Seq[wG_Atual]] , w__wKeySeek , wM_Case_Col_Order[m->wM_Grid_Seq[wG_Atual]] , "=" )
      EndIf

      oM_Brw_Say[m->wM_Grid_Seq[wG_Atual]]:Refresh()

      If waScan = 0
         cursorarrow()
         Return( NIL )
      EndIf

      wM_BrwLin[m->wM_Grid_Seq[wG_Atual]]   := waScan               // Redefine a Matriz de posição da Linha do Grid com a localiza Posiciona a Cursor do Grid
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:nAt  := waScan               // Posiciona a Cursor do Grid
      Eval( oM_Brw[m->wM_Grid_Seq[wG_Atual]]:bChange )
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]      :Refresh()              // atualiza as inFormacoes no objeto
   EndIf
   cursorarrow()

Return( NIL )
*fim da Function c_Grid_Seek_Matrix(nKey,nFlag)

Function c_Grid_Format(wVar,wPicture)
Local wwLin, wWork , wAlias ,wRecno ,wIndexOrd
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wTam := 00 , wPos := 00 , wDec := 00

   If ValType(wVar) = "C"
      wVar := AllTrim(wVar)
   ElseIf ValType(wVar) = "N"
      If ValType(wPicture)="C"
         wTam := Len(wPicture)
         wPos := At("." , wPicture)
         If wPos>0
            wDec := Len(SubStr(wPicture,wPos+1))
         EndIf   
      EndIf
      wVar := Str(wVar,wTam,wDec)
   ElseIf ValType(wVar) = "D"
      wVar := DtoC(wVar)
   EndIf

Return(wVar)
*Fim da Function c_Grid_Format(wVar)
          
Function c_Grid_Sort_Matrix(wXGrid_Seq,wCol_Grid,wCol_Case)
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wwSeta , wCarrega := .F. , wx , wxLen , wColuna , wLenGrd

   cursorwait()
   wxLen := Len(wM_Grid[wXGrid_Seq])
   For wx := 01 To wxLen
      If wM_Grid[wXGrid_Seq,wx,01] = Nil
         wCarrega := .T.
         Exit
      EndIf
   Next

   If wCarrega
      cwMsg(3, "Recarregando as Informações...","Aguarde" , { || fReCarrega(wXGrid_Seq)} )
   EndIf

   wx := 00
   For wx  := 01 To wxLen
      If wM_Grid[wXGrid_Seq,wx,wCol_Grid] = Nil
         cwMsg(4 ,"Existem itens inválidos nesta Consulta.","Erro")
         Return .F.
      EndIf
   Next      

   If wM_Grid_Order[wXGrid_Seq,wCol_Grid] = .T.                             // Se estiver Crescente
//    If wc_user = "C"
//       aSort( wM_Grid[wXGrid_Seq] ,,,{|x,y| Upper(x[wCol_Case]) > Upper(y[wCol_Case])})   // ordena a coluna em ordem DECRESCENTE
//    Else
         aSort( wM_Grid[wXGrid_Seq] ,,,{|x,y| x[wCol_Case] > y[wCol_Case]})   // ordena a coluna em ordem DECRESCENTE
//    EndIf
      wM_Grid_Order[wXGrid_Seq,wCol_Grid] = .F.
      wwSeta := Chr(24)
      wwSeta := "^"
   Else
//    If wc_user = "C"
//       aSort( wM_Grid[wXGrid_Seq] ,,,{|x,y| Upper(x[wCol_Case]) < Upper(y[wCol_Case])})   // ordena a coluna em ordem CRESCENTE
//    Else
         aSort( wM_Grid[wXGrid_Seq] ,,,{|x,y| x[wCol_Case] < y[wCol_Case]})   // ordena a coluna em ordem CRESCENTE
//    EndIf
      wM_Grid_Order[wXGrid_Seq,wCol_Grid] = .T.
      wwSeta := Chr(25)
      wwSeta := "v"
   EndIf

   oM_Brw[wXGrid_Seq]:aHeaders[wM_Grid_Col_Order[wXGrid_Seq]] := AllTrim(StrTran(oM_Brw[wXGrid_Seq]:aheaders[wM_Grid_Col_Order[wXGrid_Seq]],Chr(24),""))  // Retira a Seta para Cima da coluna anterior
   oM_Brw[wXGrid_Seq]:aHeaders[wM_Grid_Col_Order[wXGrid_Seq]] := AllTrim(StrTran(oM_Brw[wXGrid_Seq]:aheaders[wM_Grid_Col_Order[wXGrid_Seq]],Chr(25),""))  // Retira a Seta para Baixo da coluna anterior
   oM_Brw[wXGrid_Seq]:aHeaders[wM_Grid_Col_Order[wXGrid_Seq]] := AllTrim(StrTran(oM_Brw[wXGrid_Seq]:aheaders[wM_Grid_Col_Order[wXGrid_Seq]],"^",""))      // Retira a Seta para Cima da coluna anterior
   oM_Brw[wXGrid_Seq]:aHeaders[wM_Grid_Col_Order[wXGrid_Seq]] := AllTrim(StrTran(oM_Brw[wXGrid_Seq]:aheaders[wM_Grid_Col_Order[wXGrid_Seq]],"v",""))      // Retira a Seta para Baixo da coluna anterior

   wM_Grid_Col_Order[wXGrid_Seq] := wCol_Grid                                                         // Nœmero da Coluna do Grid que esta ClassIficada
   wM_Case_Col_Order[wXGrid_Seq] := wCol_Case                                                         // Nœmero da Coluna do Grid que esta ClassIficada
   oM_Brw[wXGrid_Seq]:aHeaders[wCol_Grid] := wwSeta + " " + oM_Brw[wXGrid_Seq]:aHeaders[wCol_Grid]    // coloca a seta na coluna atual

   __wKeySeek := Space(00)
   oM_Brw_Say[wXGrid_Seq]:Refresh()

   oM_Brw[wXGrid_Seq]:GoTop()
   oM_Brw[wXGrid_Seq]:Refresh()
   fCaseAtrib  (wXGrid_Seq)
   fCaseRefresh(wXGrid_Seq)
   cursorarrow()

Return(nil)
*Fim da Function c_Grid_Sort_Matrix()

Function fReCarrega(wGrid)
*************************************************************************************
* Funcao cCase (wM_Case)  para montar o c_Get                                       *
* wGrid - Sequência do Grid correspondente                                          *
*************************************************************************************
Local wM_Pesquisa,wKeyDbf,wKeySql,wOrderDbf,wOrderSql,wMChave,wM_Cursor,wTabela,wxLen
Local wxM_Cursor,wLenGrd,wLenKey,wUnique,wMCamposAux,wx,wy,wz,wWork,wMXTabela,wPos_Fnc

   cursorwait()
   wx    := 00
   wxLen := Len(wM_Grid_Cursor)
   For wx:= 01 To wxLen
      If wM_Grid_Cursor[wx,01] = wGrid
         wM_Cursor := wM_Grid_Cursor[wx,02]
         wTabela   := wM_Grid_Cursor[wx,03]
         wMChave   := wM_Grid_Cursor[wx,04]
         wUnique   := wM_Grid_Cursor[wx,05]
         wPos_Fnc  := wM_Grid_Cursor[wx,06]
         Exit
      EndIf
   Next

   If wUnique
      wMCamposAux :={}
      wMXTabela   :={}
      aAdd(wMXTabela,wTabela)
      wz    := 00
      wxLen := Len(wM_Case[wGrid,wCS_Coluna])
      For wz:= 01 To wxLen
         If wM_Case[wGrid,wCS_Origem,cNC(wM_Case[wGrid,wCS_Coluna][wz],wGrid,,"fReCarrega")]
            If cEmpty(wM_Case[wGrid,wCS_TabNome,wz])
               wWork := wTabela                       + "." + wM_Case[wGrid,wCS_Coluna][wz]
            Else
               wWork := wM_Case[wGrid,wCS_TabNome,wz] + "." + wM_Case[wGrid,wCS_Coluna][wz]
               If cScan(wMXTabela,wM_Case[wGrid,wCS_TabNome,wz]) = 0
                  aAdd(wMXTabela,wM_Case[wGrid,wCS_TabNome,wz])
               EndIf
            EndIf
      
            If wM_Case[wGrid,wCS_TypeVar,cNC(wM_Case[wGrid,wCS_Coluna][wz],wGrid,,"fReCarrega")]="D"
               aAdd( wMCamposAux , "DATE_ForMAT(" + wWork + ",'%d/%m/%Y')" )
            Else
               aAdd( wMCamposAux , wWork )
            EndIf
         Else
            aAdd( wMCamposAux , "'A'" )      // coluna fixa para nao perder a sequencia do select
         EndIf
      Next

      wx      := 00
      wLenGrd := Len(wM_Grid[wGrid])
      wLenKey := Len(wMChave)
      wKeySql := Space(00)
      For wx  := 01 To wLenGrd
         If wM_Grid[wGrid,wx,01] = Nil
            wy    := 00
            For wy:= 01 To wLenKey
               wKeySql := wKeySql + iIf(cEmpty(wKeySql),""," And ") + wMChave[wy] + "=" + Campo(wM_Cursor[wx,wy],ValType(wM_Cursor[wx,wy]))
            Next   
            wxM_Cursor := fConsulta( wMXTabela ,, wKeySql ,,, wMCamposAux ,,,,)
            wKeySql    := Space(00)
            If Len(wxM_Cursor) > 0
               c_Grid_Carrega_Matrix( 03 , wGrid , wxM_Cursor[1] , wPos_Fnc ,,, wx )
            EndIf
         EndIf
      Next      
   Else
      wM_Pesquisa := c_Gera_Key(wGrid,1,wCS_Key_Tp)
      wKeyDbf     := wM_Pesquisa[1]
      wKeySql     := wM_Pesquisa[2]
      wOrderDbf   := wM_Pesquisa[3]
      wOrderSql   := wM_Pesquisa[4]
      c_Grid_Cria_Matrix( wGrid , wM_Tab_Nome[wGrid] , wM_Case[wGrid,wCS_TabNome] , wM_Case[wGrid,wCS_Coluna] , wKeyDbf , wKeySql , wOrderDbf , wOrderSql ,wM_Tab_PosFnc[wGrid,1] , wM_Tab_PosFnc[wGrid,2] , wM_Tab_PosFnc[wGrid,3] , wM_Tab_PosFnc[wGrid,4] ,,)
   EndIf 

   oM_Brw[wGrid]:GoTop()
   oM_Brw[wGrid]:Refresh()
   cursorarrow()
Return .T.
*Fim da Function fReCarrega(wGrid)

Function __fCase_Get(wGrid)
*************************************************************************************
* Funcao cCase (wM_Case)  para montar o c_Get                                       *
* wGrid - Sequência do Grid correspondente                                          *
*************************************************************************************
Local wx := 00 , wPrimeiro:= .t. , wy := 00 , wXObj_Ref , wObj_Desloc , wxLen , wObj, wSeq

   wSeq      := wGrid*1000
   wx        := 00 
   wy        := 00
   wPrimeiro := .t.
   wxLen     := Len(wM_Case[wGrid,wCS_Coluna])
   For wx := 01 to wxLen
      If wM_Case[wGrid,wCS_Formato,wx] > 00
         If cEmpty(wM_Case[wGrid,wCS_ObjDesloc,wx])
            For wy := wx-1 To 01 Step -1
               If AllTrim(Upper(wM_Case[wGrid,wCS_ObjRef,wy])) == AllTrim(Upper(wM_Case[wGrid,wCS_ObjRef,wx]))
                  wObj_Desloc := wM_Case[wGrid,wCS_ObjGet,wy]
                  Exit
               EndIf
            Next
         Else
            wObj_Desloc := wM_Case[wGrid,wCS_ObjDesloc,wx]
            If cEmpty(wObj_Desloc)
               cCancel("__fCase_Get() -1- Objeto de Deslocamento não Informado na Variável: " + wM_Case[wGrid,wCS_Coluna,wx] + " (Grid: "+Str(wGrid)+")" )
            EndIf
            wObj_Desloc := &wObj_Desloc
         EndIf
         wXObj_Ref := wM_Case[wGrid,wCS_ObjRef,wx]
         If cEmpty(wXObj_Ref)
            cCancel("__fCase_Get() -2- Objeto de Referência não Informado na Variável: " + wM_Case[wGrid,wCS_Coluna,wx] + " (Grid: "+Str(wGrid)+")" )
         EndIf
         wXObj_Ref := &wXObj_Ref
         wObj := c_Get(wGrid                            ;    // wGrid
                      ,wx                               ;    //,wGetwx
                      ,wM_Case[wGrid,wCS_Coluna,wx]     ;    //,wColuna
                      ,wXObj_Ref                        ;    //,wObj_Ref
                      ,wObj_Desloc                      ;    //,wObj_Desloc
                      ,wM_Case[wGrid,wCS_LinDesloc,wx]  ;    //,wDesloc_Lin
                      ,wM_Case[wGrid,wCS_ColDesloc,wx]  ;    //,wDesloc_Col
                      ,wM_Case[wGrid,wCS_QtdLin,wx]     ;    //,wQtdLin
                      ,wM_Case[wGrid,wCS_Tamanho,wx]    ;    //,wTamanho
                      ,wM_Case[wGrid,wCS_Cabeca,wx]     ;    //,wCabeca
                      ,wCS_Conteudo                     ;    //,wParConteudo
                      ,wCS_ObjGet                       ;    //,wParObjGet
                      ,wCS_ObjCab                       ;    //,wParObjCab
                      ,wM_Case[wGrid,wCS_Requerido,wx]  ;    //,wRequerido
                      ,wM_Case[wGrid,wCS_Picture,wx]    ;    //,wPicture
                      ,wM_Case[wGrid,wCS_AlinDireita,wx];    //,wRight
                      ,wM_Case[wGrid,wCS_TpWhen,wx]     ;    //,wTpWhen
                      ,wM_Case[wGrid,wCS_When,wx]       ;    //,wWhen
                      ,wM_Case[wGrid,wCS_TpValid,wx]    ;    //,wTpValid
                      ,wM_Case[wGrid,wCS_Valid,wx]      ;    //,wValid
                      ,wM_Case[wGrid,wCS_Formato,wx]    ;    //,wGet_Tipo
                      ,wM_Case[wGrid,wCS_AuxFunction,wx];    //,wComboAction
                      ,wM_Case[wGrid,wCS_HScroll,wx]    ;    //,wHScroll
                      ,wM_Case[wGrid,wCS_Frame,wx]      ;    //,wFrame
                      ,wM_Case[wGrid,wCS_PassWord,wx]   ;    //,wPassWord
                      ,wM_Case[wGrid,wCS_Change,wx]     ;    //,wChange
                      ,wM_Case[wGrid,wCS_Border,wx]     ;    //,wBorder
                      ,wM_Case[wGrid,wCS_Expande,wx]    ;    //,wExpande
                      ,wM_Case[wGrid,wCS_Acesso,wx]     ;    //,wAcesso
                      ,wM_Case[wGrid,wCS_Vertical,wx])       //,wVertical)
      Else
         wObj := nil
      EndIf
      __fSuper_AddObj(wM_Case[wGrid,wCS_ObjNome,wx],"GET",(wSeq+wx),wObj,wM_Case[wGrid,wCS_ObjCab,wx],wM_Case[wGrid,wCS_AuxFunction,wx],wM_Case[wGrid,wCS_Requerido,wx],wM_Case[wGrid,wCS_Coluna,wx],wGrid)
   Next

Return .t.
*fim da Function __fCase_Get(wGrid)

Function fCaseButton(wButton_Press)
*******************************************************************************
*                funcao p/ definicao dos button da funcao                     *
*******************************************************************************
Local wKeyDbf,wKeySql,wOrderDbf,wVarCombo,wResposta,wResp,wTipoTab,wVar,wFolder_Antigo,wFim,wGrid_Ant,wLimpa
Local wx,wy,wz,wxy,wXYZLin,wwLin,wPos,wFinal,wXYZ,wM_Pesquisa,wOrderSql,wMatriz,wGrd_Lst,wWork,wXKeySql,wDefVar
Local wCampos,wGrid_Pos,wXTabela,wXCampos,wMacro,wFocus,wMat_Rel,wGrid, wValor,wXResposta,wUltimo
Local wxLen,wxLenTab,wxLenCtr,wxLenGrd,wxLenFld,wxLenY,wxLenX,wxLenA,wxLenB

   If Len(wM_Case)=0
      Return .F.
   EndIf
   
   __wKeySeek  :=Space(00)
   oM_Brw_Say[wM_Grid_Seq[wG_Atual]]:Refresh()
   
   wFim      := 00
   wGrid_Ant := 00
   wXYZ      := 00
   wGrid     := 00 
   wGrid_Pos := 01
   wFocus    := .T.
   wUltimo   := .F.

   wxLen    := Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
   wxLenTab := Len(wM_Tab_Nome)
   wxLenCtr := Len(wM_Control)

   If wButton_Press = 1                 // Botao de INCLUSAO
      wM_Opcao[Len(oM_Dlg)] := "inclui"
      fCaseDefVar(m->wM_Grid_Seq[wG_Atual])
      fCaseRefresh(m->wM_Grid_Seq[wG_Atual])
      cFolder_Enable()
      For wx := 01 To wxLen
         If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] < 10
            Loop
         EndIf
         If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 01 .Or. ;  // É Liberado S… na Inclusão  (Recebe Focus inicial)
            wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 05 .Or. ;  // É Liberado na Inclusão e na Alteração (Em ambos os casos recebe Focus inicial)
            wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 07 .Or. ;  // É Liberado na Inclusão e na Alteração (só na Inclusão recebe Focus inicial)
            wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 09         // É Liberado (Recebe Focus inicial)
            wMacro := c_When(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx],wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_When,wx])
            wMacro := &wMacro
            If wMacro
               wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:Click()
               wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:SetFocus()
               Exit
            EndIf
         EndIf
      Next
   ElseIf wButton_Press = 2             // Botao de ALTERACAO
      wM_Opcao[Len(oM_Dlg)] := "altera"
      cFolder_Enable()

      For wx:= 01 to wxLen
         wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_AntConteudo,wx][2] := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_AntConteudo,wx][1]
         wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_AntConteudo,wx][1] := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Conteudo,wx]

         If wFocus
            If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] < 10
               Loop
            EndIf
            If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 03 .Or. ;  // É Liberado S… na Alteração (Recebe Focus inicial)
               wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 05 .Or. ;  // É Liberado na Inclusão e na Alteração (Em ambos os casos recebe Focus inicial)
               wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 08 .Or. ;  // É Liberado na Inclusão e na Alteração (só na Alteração recebe Focus inicial)
               wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx] = 09         // É Liberado (Recebe Focus inicial)
               wMacro := c_When(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpWhen,wx],wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_When,wx])
               wMacro := &wMacro
               If wMacro
                  If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] >= 60 .Or. wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] <= 49
                     wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:Click()
                     wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:SetFocus()
                  EndIf
                  wFocus := .F.
               EndIf
            EndIf
         EndIf   
      Next

      wx    := 00
      For wx:= 01 to wxLen
         If ((wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] >= 20 .And. wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] <= 29) .Or. ;
             (wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] >= 40 .And. wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx] <= 48)).And.;
            ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Conteudo,wx]) = "C"
            wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Conteudo,wx]:= wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Conteudo,wx] + Space(252)
         EndIf
      Next
      fCaseRefresh(m->wM_Grid_Seq[wG_Atual])

   ElseIf wButton_Press = 3             // Botao de EXCLUSAO

      If wTab_Setup[m->wM_Grid_Seq[wG_Atual],02] = 02 .Or. wTab_Setup[m->wM_Grid_Seq[wG_Atual],02] = 03
         For wx := wM_Grid_Seq[wG_Atual]+01 To wxLenTab
            fCaseDefVar(wx)
         Next
      EndIf

      wx := 00
      If wTab_Setup[m->wM_Grid_Seq[wG_Atual],02] = 02              // VerIfica se tem filhos para Excluir

         For wx := m->wM_Grid_Seq[wG_Atual]+01 To wxLenTab
            If wTab_Setup[wx,02] > 00
               wM_Pesquisa := c_Gera_Key(wx,1,wCS_Key_Tp)          // Monta Grid
               wKeyDbf     := wM_Pesquisa[1]
               wKeySql     := wM_Pesquisa[2]
               wOrderDbf   := wM_Pesquisa[3]
               wOrderSql   := wM_Pesquisa[4]
               
               wResp := fConsulta2(wM_Tab_Nome[wx],{},wKeySql,wOrderSql)
               If Len(wResp)>0
                  cwMsg(1 , "Este Grid contém itens Relacionados (Filhos)."+chr(13)+chr(10)+"Você deverá exclui-los primeiro." , "Atenção" )
                  oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus()
                  Return .f.
               EndIf
            EndIf   
         Next   
      ElseIf wTab_Setup[m->wM_Grid_Seq[wG_Atual],02] = 03          // Exclui Grids posteriores

         wx := 00
         For wx := wxLenTab To m->wM_Grid_Seq[wG_Atual] step -1
            If cEmpty(wM_Tab_Nome[wx])
               Loop
            EndIf
            If wTab_Setup[wx,02] > 00
               If m->wM_Grid_Seq[wG_Atual] <> wx
                  wM_Pesquisa := c_Gera_Key(wx,1,wCS_Key_Tp)       // Monta Grid
                  wKeyDbf     := wM_Pesquisa[1]
                  wKeySql     := wM_Pesquisa[2]
                  wOrderDbf   := wM_Pesquisa[3]
                  wOrderSql   := wM_Pesquisa[4]
                  fDelete( wM_Tab_Nome[wx] , wKeyDbf , wKeySql , wOrderDbf)
               EndIf
            EndIf
         Next
      EndIf

      wM_Pesquisa := c_Gera_Key(m->wM_Grid_Seq[wG_Atual],2,wCS_Key_Exc_Tp)   // Trabalha no Item do Grid
      wKeyDbf     := wM_Pesquisa[1]
      wKeySql     := wM_Pesquisa[2]
      wOrderDbf   := wM_Pesquisa[3]
      wOrderSql   := wM_Pesquisa[4]

      fDelete( wM_Tab_Nome[m->wM_Grid_Seq[wG_Atual]] , wKeyDbf , wKeySql , wOrderDbf)

      *--------------------------Ajusta a matrix do Grid para EXCLUSAO-----------------------*
      If wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] = 1 .and. Len(wM_Grid[m->wM_Grid_Seq[wG_Atual]]) = 1  // Se Tem mais que um (01) item na matrix Ajusta
         wxLenGrd := Len(wM_Grid[m->wM_Grid_Seq[wG_Atual],1])
         For wx := 01 To wxLenGrd
            If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TypeVar,wx]="N"
               wM_Grid[m->wM_Grid_Seq[wG_Atual],wM_BrwLin[m->wM_Grid_Seq[wG_Atual]],wx ] := 00
            Else
               wDefVar := cDefVar(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_DefVar,wx],wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TypeVar,wx])
               wM_Grid[m->wM_Grid_Seq[wG_Atual],wM_BrwLin[m->wM_Grid_Seq[wG_Atual]],wx ] := wDefVar
            EndIf
         Next
         wUltimo := .T.
      Else                            // Se s« tem um (01) item reaproveita
         aDel(wM_Grid[m->wM_Grid_Seq[wG_Atual]],wM_BrwLin[m->wM_Grid_Seq[wG_Atual]])  // Exclui o item da matriz
         aSize(wM_Grid[m->wM_Grid_Seq[wG_Atual]], Len(wM_Grid[m->wM_Grid_Seq[wG_Atual]]) - 1 )
         wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] :=  01 //iIf( wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] > 1, wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] -1,1)
      EndIf
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoTop()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:nRowPos := wM_BrwLin[m->wM_Grid_Seq[wG_Atual]]
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()

      fCaseDefVar (m->wM_Grid_Seq[wG_Atual])
      fCaseAtrib  (m->wM_Grid_Seq[wG_Atual])
      fCaseRefresh(m->wM_Grid_Seq[wG_Atual])

      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus()
      *--------------------------------------------------------------------------------------*

      If m->wM_Grid_Seq[wG_Atual] > 1
         wGrid_Ant := m->wM_Grid_Seq[wG_Atual]-1
         If wTab_Setup[wGrid_Ant,02] = 02 .And. wUltimo
            wM_Opcao[Len(oM_Dlg)] := "consul"
            cFolder_Enable()
            wy := 00 ; wx := 00
            For wx := 01 To wxLenCtr

               If wM_Control[wx,2] == wGrid_Ant
                  wM_Control[wx,3]:SetOption(wM_Control[wx,3]:nOption-1)
                  *--------------------------Ajusta a matrix do Grid para EXCLUSAO-----------------------*
                  If wM_BrwLin[wGrid_Ant] = 1 .And. Len(wM_Grid[wGrid_Ant]) = 1  // Se Tem mais que um (01) item na matrix Ajusta
                     wxLenGrd := Len(wM_Grid[wGrid_Ant,1])
                     For wx=1 to wxLenGrd
                        wDefVar := cDefVar(wM_Case[wGrid_Ant,wCS_DefVar,wx],wM_Case[wGrid_Ant,wCS_TypeVar,wx],wGrid_Ant)
                        wM_Grid[wGrid_Ant,wM_BrwLin[wGrid_Ant],wx ] := wDefVar
                     Next
                  Else                            // Se s« tem um (01) item reaproveita
                     aDel(wM_Grid[wGrid_Ant],wM_BrwLin[wGrid_Ant])  // Exclui o item da matriz
                     aSize(wM_Grid[wGrid_Ant], Len(wM_Grid[wGrid_Ant]) - 1 )
                     wM_BrwLin[wGrid_Ant] :=  01
                  EndIf
                  oM_Brw[wGrid_Ant]:GoTop()
                  oM_Brw[wGrid_Ant]:nRowPos := wM_BrwLin[wGrid_Ant]
                  oM_Brw[wGrid_Ant]:Refresh()
                  fCaseDefVar (wGrid_Ant)
                  fCaseAtrib  (wGrid_Ant)
                  fCaseRefresh(wGrid_Ant)
                  oM_Brw[wGrid_Ant]:SetFocus()
                  Exit
               EndIf
            Next
         EndIf
      EndIf

      cFolder_Enable()

   ElseIf wButton_Press = 4             // Botao de GRAVACAO

      If .Not.fCaseConsistencia(m->wM_Grid_Seq[wG_Atual])
         Return .f.
      EndIf

      wTipoTab := wTab_Setup[m->wM_Grid_Seq[wG_Atual],01]
      wGrd_Lst := wTab_Setup[m->wM_Grid_Seq[wG_Atual],03]
      wMat_Rel := cStrToMatriz(AllTrim(Upper(wGrd_Lst)),"#","N")

      aAdd ( wMat_Rel , m->wM_Grid_Seq[wG_Atual] )
      aSort( wMat_Rel ,,,{|x,y| x < y })   // ordena a coluna em ordem CRESCENTE  (wCS_GridSeq)
      wxLenY   := Len(wMat_Rel)

      If wM_Opcao[Len(oM_Dlg)] = "inclui"
         If wTipoTab = 1
            wCampos  := {}
            wXCampos := {}

            For wy := 01 To wxLenY
               wGrid := wMat_Rel[wy]
               wx    := 00
               wxLenX:= Len(wM_Case[wGrid,wCS_Coluna])
               For wx:= 01 To wxLenX
                  If wM_Case[wGrid,wCS_Origem,wx]
                     If .Not.(Upper(Trim(wM_Case[wGrid,wCS_TabNome,wx])) == Upper(Trim(wM_Tab_Nome[wGrid])))
                        Loop
                     EndIf
                     If cScan( wXCampos , wM_Case[wGrid,wCS_Coluna,wx] ) = 0
                        aAdd( wCampos  , wM_Case[wGrid,wCS_Coluna,wx] )
                        aAdd( wXCampos , wM_Case[wGrid,wCS_Coluna,wx] )

                        If wM_Case[wGrid,wCS_Formato,wx] >= 30 .And. wM_Case[wGrid,wCS_Formato,wx] <= 39
                           wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
                           wMatriz := &wMatriz
                           If ValType(wMatriz)<>"A"
                              Loop
                           EndIf
                           If ValType(wM_Case[wGrid,wCS_Conteudo,wx])<>"C"
                              cCancel("Conteudo da Coluna : " + wM_Case[wGrid,wCS_Coluna,wx] + " não pode ser dIferente de CARACTER" , "Atenção" )
                           EndIf
                           wxLenA := Len(wMatriz)
                           For wxy := 01 to wxLenA
                              If wMatriz[wxy] == wM_Case[wGrid,wCS_Conteudo,wx]
                                 wVarCombo := wM_Case[wGrid,wCS_Conteudo,wx]
                                 wPos      := At("-",wVarCombo)
                                 wPos      := iIf(cEmpty(wPos),At("#",wVarCombo),wPos)
                                 If wPos>0
                                    wResposta := SubStr(wVarCombo,1,wPos-1)
                                 Else
                                    wResposta := wVarCombo
                                 EndIf
                                 Exit
                              Else
                                 wResposta := wM_Case[wGrid,wCS_Conteudo,wx]
                              EndIf
                           Next
                           wResposta := iIf(wM_Case[wGrid,wCS_Typevar,wx]="N",Val(wResposta),AllTrim(wResposta))
                           aAdd(wCampos , fAnaliza_Campo(wResposta,wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 50 .And. wM_Case[wGrid,wCS_Formato,wx] <= 59
                           wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
                           wMatriz := &wMatriz
                           If ValType(wMatriz)<>"A"
                              Loop
                           EndIf
                           wVarCombo := wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]]
                           wPos      := At("-",wVarCombo)
                           wPos      := iIf(cEmpty(wPos),At("#",wVarCombo),wPos)
                           wResposta := AllTrim(SubStr(wVarCombo,1,wPos-1))
                           wResposta := iIf(wM_Case[wGrid,wCS_Typevar,wx]="N",Val(wResposta),wResposta)
                           aAdd(wCampos , fAnaliza_Campo(wResposta,wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 60 .And. wM_Case[wGrid,wCS_Formato,wx] <= 69
                           If wM_Case[wGrid,wCS_Conteudo,wx] = .T.
                              aAdd(wCampos , "S" )
                           Else
                              aAdd(wCampos , "N" )
                           EndIf
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] = 49
                           wResposta := wM_Case[wGrid,wCS_Conteudo,wx,2]
                           wResposta := StrTran(wResposta,"\","$|#/#|@")
                           wResposta := StrTran(wResposta,"'",'@|#"#|$')
                           aAdd(wCampos , fAnaliza_Campo(wResposta,.F.,.F.,.F.) )
                        Else
                           aAdd(wCampos , fAnaliza_Campo(wM_Case[wGrid,wCS_Conteudo,wx],wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        EndIf
                     EndIf   
                  EndIf
               Next
            Next
            wM_Pesquisa := c_Gera_Key(m->wM_Grid_Seq[wG_Atual],2,wCS_Key_Tp)
            wKeyDbf     := wM_Pesquisa[1]
            wKeySql     := wM_Pesquisa[2]
            wOrderDbf   := wM_Pesquisa[3]
            wOrderSql   := wM_Pesquisa[4]

            fInsert2( wM_Tab_Nome[m->wM_Grid_Seq[wG_Atual]],wCampos)
            *--------------------------Ajusta a matrix do Grid para INCLUSAO-----------------------*

            fCaseMtAtrib(wM_Grid_Seq[wG_Atual])
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoTop()
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoBottom()

         ElseIf wTipoTab = 2

            *--------------------------Ajusta a matrix do Grid para INCLUSAO-----------------------*
            fCaseMtAtrib(wM_Grid_Seq[wG_Atual])
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoTop()
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoBottom()
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()

            * ----------- Rotina que faz a Troca da Pasta Atual p/ a de Referência ------------ *
            wM_Opcao[Len(oM_Dlg)] := "consul"
            cFolder_Enable()
            wFolder_Antigo := wFLd_Num_Obj
            wxLenA := Len(oM_Fld)
            For wy := 01 to wxLenA
               If cEmpty(oM_Fld[wy])
                  Exit
               EndIf
               If wy = wFolder_Antigo
                  wxLenB := Len(wM_Folder[wy,wFld_Leg_Stru])
                  For wx := 1 to wxLenB
                     If oM_Fld[wy]:aPrompts[ oM_Fld[wy]:nOption ] == wM_Folder[wy,wFld_Leg_Stru][wx]
                        oM_Fld[wy]:SetOption(oM_Fld[wy]:nOption+1)
                        Exit
                     EndIf
                  Next
               ElseIf wy > wFolder_Antigo
                  For wx := 1 to Len(wM_Folder[wy,wFld_Leg_Stru])
                     oM_Fld[wy]:SetOption(1)
                  Next
               EndIf
            Next
         EndIf

      ElseIf wM_Opcao[Len(oM_Dlg)] = "altera"

         If wTipoTab < 4
            wCampos  := {}
            wXCampos := {}

            For wy := 01 To wxLenY
               wGrid := wMat_Rel[wy]
               wxLenX:= Len(wM_Case[wGrid,wCS_Coluna])
               For wx:= 01 To wxLenX
                  If wM_Case[wGrid,wCS_Origem,wx]
                     If .Not.(Upper(Trim(wM_Case[wGrid,wCS_TabNome,wx])) == Upper(Trim(wM_Tab_Nome[wGrid]))) .Or. wM_Case[wGrid,wCS_TpWhen,wx]=1 .Or. wM_Case[wGrid,wCS_TpWhen,wx]=2
                        Loop
                     EndIf
                     If cScan( wXCampos , wM_Case[wGrid,wCS_Coluna,wx] ) = 0
                        aAdd( wCampos  , wM_Case[wGrid,wCS_Coluna,wx] )
                        aAdd( wXCampos , wM_Case[wGrid,wCS_Coluna,wx] )

                        If wM_Case[wGrid,wCS_Formato,wx] >= 30 .And. wM_Case[wGrid,wCS_Formato,wx] <= 39
                           wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
                           wMatriz := &wMatriz
                        // wMatriz := wM_Case[wGrid,wCS_ObjGet,wx]:aItems

                           If ValType(wMatriz)<>"A"
                              Loop
                           EndIf
                           If ValType(wM_Case[wGrid,wCS_Conteudo,wx])<>"C"
                              cCancel("Conteudo Inicial da Coluna : " + wM_Case[wGrid,wCS_Coluna,wx] + " não pode ser dIferente de CARACTER" , "Atenção" )
                           EndIf
                           wxLenA := Len(wMatriz)
                           For wxy:= 01 to wxLenA
                              If wMatriz[wxy] == wM_Case[wGrid,wCS_Conteudo,wx]
                                 wVarCombo := wM_Case[wGrid,wCS_Conteudo,wx]
                                 wPos      := At("#",wVarCombo)
                                 wPos      := iIf(cEmpty(wPos),At("-",wVarCombo),wPos)
                                 If wPos>0
                                    wResposta := SubStr(wVarCombo,1,wPos-1)
                                 Else
                                    wResposta := wVarCombo
                                 EndIf
                                 Exit
                              Else
                                 wResposta := wM_Case[wGrid,wCS_Conteudo,wx]
                              EndIf
                           Next
                           wResposta := iIf(wM_Case[wGrid,wCS_Typevar,wx]="N",Val(wResposta),AllTrim(wResposta))
                           aAdd(wCampos , fAnaliza_Campo(wResposta,wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 50 .And. wM_Case[wGrid,wCS_Formato,wx] <= 59
                           wMatriz := wM_Case[wGrid,wCS_AuxFunction,wx]
                           wMatriz := &wMatriz
                           If ValType(wMatriz)<>"A"
                              Loop
                           EndIf
                           wVarCombo := wMatriz[wM_Case[wGrid,wCS_Conteudo,wx]]
                           wPos      := At("#",wVarCombo)
                           wPos      := iIf(cEmpty(wPos),At("-",wVarCombo),wPos)
                           wResposta := AllTrim(SubStr(wVarCombo,1,wPos-1))
                           wResposta := iIf(wM_Case[wGrid,wCS_Typevar,wx]="N",Val(wResposta),wResposta)
                           aAdd(wCampos , fAnaliza_Campo(wResposta,wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] >= 60 .And. wM_Case[wGrid,wCS_Formato,wx] <= 69
                           If wM_Case[wGrid,wCS_Conteudo,wx] = .T.
                              aAdd(wCampos , "S" )
                           Else
                              aAdd(wCampos , "N" )
                           EndIf
                        ElseIf wM_Case[wGrid,wCS_Formato,wx] = 49
                           wResposta := wM_Case[wGrid,wCS_Conteudo,wx,2]
                           wResposta := StrTran(wResposta,"\","$|#/#|@")
                           wResposta := StrTran(wResposta,"'",'@|#"#|$')
                           aAdd(wCampos , fAnaliza_Campo(wResposta,.F.,.F.,.F.) )
                        Else
                           aAdd(wCampos , fAnaliza_Campo(wM_Case[wGrid,wCS_Conteudo,wx],wM_Case[wGrid,wCS_Maiuscula,wx],wM_Case[wGrid,wCS_Acento,wx],wM_Case[wGrid,wCS_PassWord,wx]) )
                        EndIf
                     EndIf   
                  EndIf
               Next
            Next
            wM_Pesquisa := c_Gera_Key(m->wM_Grid_Seq[wG_Atual],2,wCS_Key_Tp)
            wKeyDbf     := wM_Pesquisa[1]
            wKeySql     := wM_Pesquisa[2]
            wOrderDbf   := wM_Pesquisa[3]
            fUpdate2(wM_Tab_Nome[m->wM_Grid_Seq[wG_Atual]],wKeySql,wCampos)

            fCaseMtAtrib(wM_Grid_Seq[wG_Atual])
         EndIf
      EndIf
      wM_Opcao[Len(oM_Dlg)]:="consul"
      cFolder_Enable()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Click()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus()

   ElseIf wButton_Press = 5             // Botao de CANCELAMENTO

      If wM_Opcao[Len(oM_Dlg)] = "inclui"
         If Len(oM_Brw)>0
            oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Gotop()
         EndIf
         
         If wM_BrwLin[m->wM_Grid_Seq[wG_Atual]] = 1 .and. Len(wM_Grid[m->wM_Grid_Seq[wG_Atual]]) = 1  // Se Tem mais que um (01) item na matrix Ajusta
            wUltimo := .T.
         EndIf

         wLimpa := .F.
         For wxy := 01 to wxLen
            If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Requerido,wxy]
               If cEmpty(wM_Grid[m->wM_Grid_Seq[wG_Atual],00001,wxy]) 
                  wLimpa := .T.
               Else
                  wLimpa := .F.
               EndIf
               Exit
            EndIf
         Next

         If m->wM_Grid_Seq[wG_Atual] > 1
            wGrid_Ant := m->wM_Grid_Seq[wG_Atual]-1
            If wTab_Setup[wGrid_Ant,02] = 02 .And. wUltimo .And. wLimpa
               wM_Opcao[Len(oM_Dlg)] := "consul"
               cFolder_Enable()
               wy := 00 ; wx := 00
               For wx := 01 To wxLenCtr
   
                  If wM_Control[wx,2] == wGrid_Ant
                     wM_Control[wx,3]:SetOption(wM_Control[wx,3]:nOption-1)
                     *--------------------------Ajusta a matrix do Grid para EXCLUSAO-----------------------*
                     If wM_BrwLin[wGrid_Ant] = 1 .And. Len(wM_Grid[wGrid_Ant]) = 1  // Se Tem mais que um (01) item na matrix Ajusta
                        wxLenGrd := Len(wM_Grid[wGrid_Ant,1])
                        For wx=1 to wxLenGrd
                           wDefVar := cDefVar(wM_Case[wGrid_Ant,wCS_DefVar,wx],wM_Case[wGrid_Ant,wCS_TypeVar,wx],wGrid_Ant)
                           wM_Grid[wGrid_Ant,wM_BrwLin[wGrid_Ant],wx ] := wDefVar
                        Next
                     Else                            // Se s« tem um (01) item reaproveita
                        aDel(wM_Grid[wGrid_Ant],wM_BrwLin[wGrid_Ant])  // Exclui o item da matriz
                        aSize(wM_Grid[wGrid_Ant], Len(wM_Grid[wGrid_Ant]) - 1 )
                        wM_BrwLin[wGrid_Ant] :=  01
                     EndIf
                     oM_Brw[wGrid_Ant]:GoTop()
                     oM_Brw[wGrid_Ant]:nRowPos := wM_BrwLin[wGrid_Ant]
                     oM_Brw[wGrid_Ant]:Refresh()
                     fCaseDefVar (wGrid_Ant)
                     fCaseAtrib  (wGrid_Ant)
                     fCaseRefresh(wGrid_Ant)
                     oM_Brw[wGrid_Ant]:SetFocus()
                     Exit
                  EndIf
               Next
               Return .T.
            EndIf
         EndIf
      EndIf

      wM_Opcao[Len(oM_Dlg)]:="consul"  
      For wx := 01 To wxLen   
         wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_AntConteudo,wx][1] := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_AntConteudo,wx][2]
      Next
      fCaseAtrib(m->wM_Grid_Seq[wG_Atual])
      fCaseRefresh(m->wM_Grid_Seq[wG_Atual])
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Click()
      cFolder_Enable()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus()
   ElseIf wButton_Press = 6             // Botao de FILTRO
      If Len(wM_Case)>0
         fCaseFilter()
      EndIf
   EndIf

Return .t.
*fim da Function fCaseButton
                          
Function fCaseWhenButton(wButton_Press)
********************************************************************************
*                        funcao para WHEN dos Botoes                           *
********************************************************************************
Local wy:=00 , wx:=00 , wcEmpty := .T. , wxy := 00 , wxLen

   wcEmpty := .F.
   If Len(wM_Grid)>0
      If ValType(oM_Brw[m->wM_Grid_Seq[wG_Atual]])="O"
         wxLen := Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
         For wxy = 01 to wxLen
            If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Requerido,wxy]
               If cEmpty(wM_Grid[m->wM_Grid_Seq[wG_Atual],00001,wxy]) 
                  wcEmpty := .F.
               Else
                  wcEmpty := .T.
               EndIf
               Exit
            EndIf
         Next
      EndIf
   EndIf

   If wButton_Press = 1                                 //   Se For o Botao de Inclusao
      If wM_Opcao[Len(oM_Dlg)]="consul"
         Return .t.
      EndIf   
   ElseIf wButton_Press = 2                             //   Se For o Botao de Alteracao
      If wM_Opcao[Len(oM_Dlg)]="consul" .And. wcEmpty
         Return .t.
      EndIf
   ElseIf wButton_Press = 3                             //   Se For o Botao de Exclusao
      If wM_Opcao[Len(oM_Dlg)]="consul" .And. wcEmpty
         Return .t.
      EndIf
   ElseIf wButton_Press = 4                             //   Se For o Botao de Grava×'o
      If wM_Opcao[Len(oM_Dlg)]="inclui" .or. wM_Opcao[Len(oM_Dlg)]="altera"       //     E SE For opcao de Inclusao 'ou' opcao de Alteracao
         Return .t.
      EndIf
   ElseIf wButton_Press = 5                             //   Se For o Botao de Cancelamento
      If wM_Opcao[Len(oM_Dlg)]="inclui" .or. wM_Opcao[Len(oM_Dlg)]="altera"       //     E SE For opcao de Inclusao 'ou' opcao de Alteracao
         Return .t.
      EndIf
   ElseIf wButton_Press = 6                             //   Se For o Botao de Pesquisa/Filtro
      If wM_Opcao[Len(oM_Dlg)]="consul"
         Return .t.
      EndIf
   EndIf

Return .f.                
*fim da Function fCaseWhenButton()

Function fCaseConsistencia(wGrid)
*******************************************************************************
*                funcao p/ executar as consistencias antes da gravacao        *
*******************************************************************************
Local wMacro,wx,wMacroWhen,wVar,wConteudo := "" , wxLen,wCabeca

   wxLen := Len(wM_Case[wGrid,wCS_Coluna])
   For wx = 01 to wxLen
       If wM_Case[wGrid,wCS_Formato,wx] < 10
          Loop
       EndIf

       If wM_Case[wGrid,wCS_Requerido,wx] = .t.      // 09 - Campo Obrigatorio (REQUERIDO)
          wCabeca := wM_Case[wGrid,wCS_Cabeca,wx]
          wCabeca := AllTrim(iif(cEmpty(wCabeca),wM_Case[wGrid,wCS_Descricao,wx],wCabeca))
          If wM_Case[wGrid,wCS_Formato,wx] = 49
             wConteudo := wM_Case[wGrid,wCS_Conteudo,wx][1]
          Else
             wConteudo := wM_Case[wGrid,wCS_Conteudo,wx]
          EndIf

          If ValType(wConteudo) = "C"
             ValType(wM_Case[wGrid,wCS_Picture,wx])
             If .Not.cEmpty(wM_Case[wGrid,wCS_Picture,wx])
                If At( "." , wM_Case[wGrid,wCS_Picture,wx] ) > 0
                   wConteudo := StrTran(wConteudo,".","")
                EndIf
                If At( "-" , wM_Case[wGrid,wCS_Picture,wx] ) > 0
                   wConteudo := StrTran(wConteudo,"-","")
                EndIf
                If At( "/" , wM_Case[wGrid,wCS_Picture,wx] ) > 0
                   wConteudo := StrTran(wConteudo,"/","")
                EndIf
             EndIf   
             If Len(AllTrim(wConteudo)) = 0
                cwMsg(1 , wCabeca + " não Informada(o)" ,"Atenção" )
                wM_Case[wGrid,wCS_ObjGet,wx]:SetFocus()
                Return .f.
             EndIf
          Else
             If cEmpty(wConteudo)
                cwMsg(1 , wCabeca + " não Informada(o)" ,"Atenção" )
                wM_Case[wGrid,wCS_ObjGet,wx]:SetFocus()
                Return .f.
             EndIf
          EndIf
       EndIf

       wMacroWhen := c_When(wM_Case[wGrid,wCS_TpWhen,wx],wM_Case[wGrid,wCS_When,wx])
       wMacroWhen := iIf(ValType(wMacroWhen)="C",iIf(Len(Trim(wMacroWhen))=0,.T.,wMacroWhen) , wMacroWhen )
       wMacroWhen := iIf(ValType(wMacroWhen)="L",iIf(wMacroWhen,".T.",".F."),wMacroWhen )
       wMacroWhen := &wMacroWhen

       If wMacroWhen
          wMacro := c_Valid(wM_Case[wGrid,wCS_TpValid,wx],wM_Case[wGrid,wCS_Valid,wx],wM_Case[wGrid,wCS_Coluna,wx])
          wMacro := iIf(ValType(wMacro)="C",iIf(Len(Trim(wMacro))=0,.T.,wMacro) , wMacro )
          wMacro := iIf(ValType(wMacro)="L",iIf(wMacro,".T.",".F."),wMacro )
          wMacro := &wMacro
          If wMacro = .f.
             wM_Case[wGrid,wCS_ObjGet,wx]:SetFocus()
             Return .f.
          EndIf
       EndIf
   Next

Return .t.
*fim da Function fCaseConsistencia()

Function c_Get(wGrid,wGetwx,wColuna,wObj_Ref,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wQtdLin,wTamanho,wCabeca,wParConteudo,wParObjGet,wParObjCab,wRequerido,wPicture,wRight,wTpWhen,wWhen,wTpValid,wValid,wGet_Tipo,wComboAction,wHScroll,wFrame,wPassWord,wChange,wBorder,wExpande,wAcesso,wVertical)
****************************************************************************************
* Funcao para montar o get no objeto atual                                              *
*PARAMETROS: wObj_Ref    => Nome do objeto de referencia                                *
*            wObj_Desloc => Nome do objeto de referencia para deslocamento              *
*            wDesloc_Lin => Numnero de linhas  para deslocamento em relacao ao wObj_Ref *
*            wDesloc_Col => Numnero de Colunas para deslocamento em relacao ao wObj_Ref *
*            wTamanho    => Tamanho do get                                              *
*            wCabeca     => Titulo do get                                               *
*            wVar_Nome   => Nome da variavel do get                                     *
*            wOGet_Nome  => Nome do Objeto GET                                          *
*            wOSay_Cabeca=> Nome do Objeto Say do cabeÎalho
*            wPicture    => Picture do Get                                              *
*            wRight      => Ajusta a (Direita .t.) ou a (Esquerda .f.)                  *
*            wWhen       => Funcao Logica when para o get                               *
*            wValid      => Funcao Logica Valid para o get                              *
*            wGet_Tipo   => Tipo de Get (0-não Gera Get # 1-Normal # 2-ComboBox # 3-ComboDB # 4-Memo # 5-CheckBox # 6-Radio (Option-Button) # 7- # 8- # 9- # 10-Relacionamento com Get # 11-Relacionamento Sem Get # 12-Function # 13-Relacionamento com Get Memo
*            wComboAction=> (se Tipo For ComboBox=>Matrix) (se Tipo For ComboDB=>Funcao Action)
*            wComboLinhas=> Quantidade de linhas no ComboBox
****************************************************************************************
Local wnTop,wnLeft,wnWidth,wnHeight,wTLin,wTCol,wvar,wx,oGet,wMComboAction,wComboLinhas
Local wXTamanho,wBytes := 00,wXBytes := 00,wObjNome,oBtnCombo,wXValid,wXWhen,wxLenCombo
Local wInicio_Lin,wInicio_Col,wPos := 00,wy := 00,wXComboAction,wMatriz,wXVar_Nome,wBlock,wAjuste , wRestricao
Local wData,wWorkDia,nMonth,nYear,cCYear,dDate,wDtExtenso,wVar_Nome,wOGet_Nome,wOSay_Cabeca
Local aMonths := {},wXChange,wComboImagem,wReadOnly,wwGrid,wwGetwx,wFont
Local oGet1,oGet2,oGet3,oGet4,oGet5,oGet6,oGet7,wPrimeiro
Local oDlgTree,wcid1_Ini,wcid1_Fim,wcid2_Ini,wcid2_Fim,wcid3_Cod,w1,w2,w3,w4,wResp1,wResp2,wResp3,wResp4,oTree1,oTree2,oTree3,oxTree,oLbx,oItem
__MVPRIVATE("wXOSay_Cabeca")

   wwGrid       := StrZero(wGrid)
   wwGetwx      := StrZero(wGetwx,3,0)

   wVar_Nome    := "wM_Case["+wwGrid+","+Str(wParConteudo)+","+wwGetwx+"]"
   wOGet_Nome   := "wM_Case["+wwGrid+","+Str(wParObjGet  )+","+wwGetwx+"]"
   wOSay_Cabeca := "wM_Case["+wwGrid+","+Str(wParObjCab  )+","+wwGetwx+"]"

   If ValType(wGet_Tipo)<>"N"
      cCancel("c_Get() -1- Formato Inválido no Objeto "+ wColuna + " (Grid: " + Str(wGrid ) + " ). Deve ser NUMÉRICO" )
   EndIf

   If wGet_Tipo = 88 // Tree
      wResp1 := fConsulta2("sam_cid10n1",{"cid10n1_cod","cid10n1_nome"})
      wResp2 := fConsulta2("sam_cid10n2",{"cid10n2_cod","cid10n2_nome"})
      wResp3 := fConsulta2("sam_cid10n3",{"cid10n3_cod","cid10n3_nome"})
    //wResp4 := fConsulta2("sam_cid10n4",{"cid10n4_cod","cid10n4_nome"})

      oxTree:= TreeBegin(,)
      For w1 := 01 To Len(wResp1)
         oTree1 := _TreeItem(wResp1[w1,1]+" - "+wResp1[w1,2],,,,,.F.,)

         wcid1_Ini := SubStr(wResp1[w1,1],1,3)
         wcid1_Fim := SubStr(wResp1[w1,1],4,3)
         TreeBegin(,)
         For w2 := 01 To Len(wResp2)
            If (wResp2[w2,1] >= wcid1_Ini .and. wResp2[w2,1] <= wcid1_Fim)
               oTree2 := _TreeItem(wResp2[w2,1]+" - "+wResp2[w2,2],,,,,.F.,)

               wcid2_Ini := SubStr(wResp2[w2,1],1,3)
               wcid2_Fim := SubStr(wResp2[w2,1],4,3)
               TreeBegin(,)
               For w3 := 01 To Len(wResp3)
                  If (wResp3[w3,1] >= wcid2_Ini .and. wResp3[w3,1] <= wcid2_Fim)
                     oTree3 := _TreeItem(wResp3[w3,1]+" - "+wResp3[w3,2],,,,,.F.,)
                  EndIf
               Next
               TreeEnd()
            EndIf
         Next
         TreeEnd()
      Next
      TreeEnd()

      oLbx := TWBrowse():New(wDesloc_Lin,wDesloc_Col,192,168,{|| {"CID	" } },{1700},,wObj_Ref,,,,,,,,,,,,.F.,,.F.,,.F.,,,)

      oItem := oxTree:oFirst

      oLbx:cAlias := "ARRAY"
      oLbx:lMChange = .f.
      oLbx:bLine = { || oItem:GetLabel() }
      oLbx:aColSizes = { || oItem:ColSizes() }
      oLbx:bGoTop = { || oItem := oxTree:oFirst }
      oLbx:bGoBottom = { || oItem := oxTree:GetLast() }
      oLbx:bSkip = { | n | oItem := oItem:Skip(@n ),oLbx:Cargo := oItem,n }
      oLbx:bLogicLen = { || oLbx:nLen := oxTree:nCount() }

      oLbx:bLDblClick = { || If(oItem:oTree != nil,(oItem:Toggle(),oLbx:Refresh() ),) }
      oLbx:Cargo = oItem

      oLbx:bKeyChar = { | nKey | If(nKey == 13 .and. oItem:oTree != nil,(oItem:Toggle(),oLbx:Refresh() ),) }
    //if oLbx:oHScroll != nil
    ////   oLbx:oHScroll:VSetRange(0,0)
    // oLbx:oHScroll:VSetRange()
    //// oLbx:oHScroll = nil
    //endif
      if oLbx:oHScroll != nil
         oLbx:oHScroll:SetRange( 1, Len( oLbx:GetColSizes() ) )
      endif
      oxTree:Draw()

      Return .T.
   EndIf

   wTLin := 18.0
   wTCol := 03.5 
   wXTamanho := wTamanho * wTCol


   If wGrid>0
      wObjNome := wM_Case[wGrid,wCS_ObjNome,cNC(wColuna,wGrid,,"c_Get")]
   EndIf

   wXWhen   := c_When(wTpWhen,wWhen)
   wXValid  := c_Valid(wTpValid,wValid,wColuna)
   wXChange := iIf(cEmpty(wChange),".T.",AllTrim(wChange))

   If wGet_Tipo <> 90
      wDesloc_Lin := wDesloc_Lin * wTLin
   Else
      wDesloc_Lin := wDesloc_Lin * (05)
   EndIf
   wDesloc_Col := wDesloc_Col * wTCol

   wnTop := 0 ; wnTop := 0 ; wnLeft := 0 ; wnWidth := 0 ; wnHeight := 0
   If cEmpty(wObj_Desloc)
      wInicio_Lin := 0
      wInicio_Col := 0
   Else
      If wObj_Desloc:classname = "TRADMENU"
         wInicio_Lin := 0
         wInicio_Col := 0
      Else
         wnTop := wObj_Desloc:nTop
         wnLeft := wObj_Desloc:nLeft
         wnWidth := wObj_Desloc:nwidth
         wnHeight := wObj_Desloc:nHeight

         If wObj_Desloc:classname = "TWBROWSE"
            wInicio_Lin := (8) + wnTop + wnHeight
            wInicio_Col := 0
         ElseIf wObj_Desloc:classname = "TMULTIGET"
            If wDesloc_Lin<>0
               wInicio_Lin := (8) + wnTop + wnHeight
               wInicio_Col := 0
            Else
               wInicio_Lin := wnTop
               wInicio_Col := wnLeft + wnWidth
            EndIf
         ElseIf wObj_Desloc:classname = "TSAY"
            wInicio_Lin := (8) + wnTop
            wInicio_Col := wnLeft
         Else
            wInicio_Lin := wnTop
            wInicio_Col := wnLeft + wnWidth
         EndIf
         If wDesloc_Lin = 0
            wDesloc_Col := wDesloc_Col + wInicio_Col
         EndIf
      EndIf
   EndIf

   If wDesloc_Lin > 0
      wDesloc_Lin := wDesloc_Lin + (0.3)
   EndIf
   wDesloc_Lin := wDesloc_Lin + wInicio_Lin

   wRequerido := iIf(ValType(wRequerido)<>"L",.F.,wRequerido)
   wFrame := iIf(ValType(wFrame) <>"L",.F.,wFrame )
   wPassWord := iIf(ValType(wPassWord) <>"L",.F.,wPassWord )

   If cEmpty(wQtdLin)
      If wGet_Tipo >= 20 .And. wGet_Tipo <= 29
         wQtdLin := (10)
      ElseIf wGet_Tipo >= 40 .And. wGet_Tipo <= 49
         wQtdLin := (01)
      ElseIf wGet_Tipo >= 50 .And. wGet_Tipo <= 59
         wQtdLin := (11)
      ElseIf wGet_Tipo >= 60 .And. wGet_Tipo <= 69
         wQtdLin := (08)
      EndIf
   EndIf

   wXVar_Nome := wVar_Nome
   wXOSay_Cabeca := wOSay_Cabeca
   wBlock := "{|u| If( PCount()==0, "+ wXVar_Nome+","+wXVar_Nome+" :=u )}"
//   wXWhen := "{||(msgyesno("+str(wGrid)+","+Campo(wColuna,"C")+").and."+wXWhen +")}"
   wXWhen := "{||("+wXWhen +")}"
   wXValid := "{||("+wXValid+")}"
   wXChange := "{||("+wXChange+")}"

   If wGet_Tipo >= 00 .And. wGet_Tipo <= 09
   ElseIf wGet_Tipo >= 10 .And. wGet_Tipo <= 19
   ElseIf wGet_Tipo >= 20 .And. wGet_Tipo <= 29

      If wFrame
         wAjuste := 00
         If wGet_Tipo=23
            wAjuste := 7.5
         EndIf
         &wOSay_Cabeca := c_Box(2,wObj_Ref,,wDesloc_Lin,wDesloc_Col,wQtdLin,wXTamanho+wAjuste,wCabeca,wRequerido,wGet_Tipo)
      EndIf

      wPicture := Trim(wPicture)
      oGet := TGet():New(wDesloc_Lin,wDesloc_Col,&(wBlock),wObj_Ref,wXTamanho,wQtdLin ,      ,&(wXValid),,,,.F.,,.T.    ,{wObjNome,wColuna},.F.,&(wXWhen),.F.,wRight,,.F.,wPassWord,.F.,,.F.,,,,)
					  //METHOD New( nRow      , nCol      , bSetGet , oWnd   , nWidth  , nHeight, cPict, bValid   ,,,,   ,, lPixel,cMsg            , lUpdate, bWhen, lCenter, lRight, bChanged,lReadOnly, lPassword, lNoBorder, nHelpId,lSpinner, bUp, bDown, bMin, bMax ) CONSTRUCTOR

      oGet:cPicture     := wPicture
      oGet:oGet:Picture := wPicture

      If wGet_Tipo = 23
         wComboAction := iIf(cEmpty(wComboAction),".T.",wComboAction)
         wComboImagem := cIMG_Arquivo("BTN_COMBOB")
         wComboAction := "{|Self|(cCombo_BTN(Self),"+wComboAction+")}"
         If wTpWhen = 11
            wWhen  := c_When(,wWhen)
            wXWhen := "{||("+wWhen +")}"
         EndIf

         oBtnCombo := TBTNBMP():New(wDesloc_Lin,oGet:nLeft+oGet:nWidth+1,(08),wQtdLin,,,wComboImagem,,&(wComboAction),wObj_Ref,,&(wXWhen),.F.,.F.,,,,,!.F.,)
         oBtnCombo:lCancel := .T.
         aAdd(oM_BtnCombo,{oBtnCombo,wGrid,wColuna,.F.} )
      EndIf

   ElseIf wGet_Tipo >= 30 .And. wGet_Tipo <= 39
      If wGet_Tipo <> 33
         If .Not.cEmpty(wComboAction)
            wXComboAction := wComboAction
            wXComboAction := &wXComboAction
         Else
            cCancel("c_Get() -2- não a um Domínio para o Campo " + wColuna + " (ComboBox) " )
         EndIf
         
         If ValType(wXComboAction)<>"A"
            cCancel("c_Get() -3- não a um Domínio para o Campo " + wColuna + " (ComboBox) " )
         EndIf
         
         wComboLinhas := 6 * 13
         wxLenCombo := Len(wXComboAction)
         If wxLenCombo < 6
            If wxLenCombo = 2
               wComboLinhas := wxLenCombo * 15
            Else
               wComboLinhas := wxLenCombo * 13
            EndIf
         EndIf
         
         If cEmpty(wXTamanho)
            For wx := 01 To Len(wXComboAction)
               wXBytes := Len(Trim(wXComboAction[wx]))
               If wBytes < wXBytes
                  wBytes := wXBytes
               EndIf
            Next
            wXTamanho := (wBytes+5) * wTCol
         EndIf

         If wFrame
            &wOSay_Cabeca := c_Box(2,wObj_Ref,,wDesloc_Lin,wDesloc_Col,11,wXTamanho,wCabeca,wRequerido,wGet_Tipo)
         EndIf

         oGet:= TComboBox():New(wDesloc_Lin,wDesloc_Col,&(wBlock),wXComboAction,wXTamanho,wComboLinhas,wObj_Ref,,&(wXChange),&(wXValid),,,.T.,,,.F.,&(wXWhen),.F.,,,,,)
      Else
         If cEmpty(wXTamanho)
            For wx := 01 To Len(wXComboAction)
               wXBytes := Len(Trim(wXComboAction[wx]))
               If wBytes < wXBytes
                  wBytes := wXBytes
               EndIf
            Next
            wXTamanho := (wBytes+5) * wTCol
         EndIf
   
         If wFrame
            &wOSay_Cabeca := c_Box(2,wObj_Ref,,wDesloc_Lin,wDesloc_Col,11,wXTamanho,wCabeca,wRequerido,wGet_Tipo)
         EndIf
         oGet:= TComboBox():New(wDesloc_Lin,wDesloc_Col,&(wBlock),{""},wXTamanho,1,wObj_Ref,,&(wXChange),&(wXValid),,,.T.,,,.F.,&(wXWhen),.F.,,,2,,)
         oGet:oGet:bChange := {|nKey,nFlags,Self| c_Get_CMB_Edit(nKey,nFlags,Self,oGet,wComboAction)}
      EndIf

   ElseIf wGet_Tipo >= 40 .And. wGet_Tipo <= 49

      wQtdLin := wQtdLin * (8.00)

      If wGet_Tipo = 49
         wXTamanho := wXTamanho - 10
         wReadOnly := .T.
         wBlock    := "{|u| If( PCount()==0, "+ wXVar_Nome+"[1],"+wXVar_Nome+"[1] :=u )}"
         wFont     := oFont
      Else
         wReadOnly := .F.
         wBlock    := "{|u| If( PCount()==0, "+ wXVar_Nome+","+wXVar_Nome+" :=u )}"
         If wBorder
            wFont  := oFontMemo
         Else
            wFont  := oFont
         EndIf
      EndIf

      oGet := TMultiGet():New(wDesloc_Lin,wDesloc_Col,&(wBlock),wObj_Ref,wXTamanho,wQtdLin,wFont,wHScroll,        ,        ,       ,.T.   ,    ,.F.    ,     ,.F.    ,.F.   ,wReadOnly,      ,        ,.F.    ,          ) 
                        //New(nRow       ,nCol       ,bSetGet  ,oWnd    ,nWidth   ,nHeight,oFont,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR

      If wGet_Tipo = 49
         wComboImagem := cIMG_Arquivo("LUPA16")
         oBtnCombo := TBTNBMP():New(oGet:nTop,oGet:nLeft+oGet:nWidth+1,10,10,,,wComboImagem,,,wObj_Ref,,,.F.,.F.,,,,,.T.,)
         oBtnCombo:lCancel := .T.
         oBtnCombo:bWhen   := {|| iif(wM_Opcao[Len(wM_Opcao)]<>"consul",&(wWhen),.T.).And..Not.__wOpenRichText }
         oBtnCombo:bAction := {||fCase_Get_RichText(wGrid,wGetwx,wHScroll,wXValid,.F.) }
      Else
         oGet:bWhen  := &(wXWhen)
         oGet:bValid := &(wXValid)
      EndIf

   ElseIf wGet_Tipo >= 50 .And. wGet_Tipo <= 59

      If cEmpty(wQtdLin)
         wQtdLin := 11
      EndIf

      If .Not.cEmpty(wComboAction)
         wXComboAction := wComboAction
         wXComboAction := &wXComboAction
      Else
         cCancel("c_Get() -4- não a um Domínio para o Campo " + wColuna + " (Option-Button) " )
      EndIf

      If ValType(wXComboAction)<>"A"
         cCancel("c_Get() -5- não a um Domínio para o Campo " + wColuna + " (Option-Button) " )
      EndIf

      wMComboAction := {}
      wxLenCombo := Len(wXComboAction)
      For wx := 01 to wxLenCombo
         wPos := At("-",wXComboAction[wx])
         aAdd(wMComboAction,HB_AnsiToOem(SubStr(wXComboAction[wx],wPos+1)) )

         wXBytes := Len(Trim(wMComboAction[wx]))
         If wBytes < wXBytes
            wBytes := wXBytes
         EndIf
      Next

      If cEmpty(wXTamanho)
         wXTamanho := (wBytes+1) * wTCol
      EndIf

      If wFrame
         &wOSay_Cabeca := c_Box(2,wObj_Ref,,wDesloc_Lin+1.25,wDesloc_Col+3,wQtdLin,wXTamanho+2,wCabeca,.F.,wGet_Tipo,Len(wMComboAction))
      EndIf
      wVertical := cNvl(wVertical,.T.)

      oGet := TRadMenu():New(wDesloc_Lin,wDesloc_Col,wMComboAction,&(wBlock),wObj_Ref,,&(wXValid),,,,.F.,&(wXWhen),wXTamanho,wQtdLin,,,.F.,.T.,wVertical)

   ElseIf wGet_Tipo >= 60 .And. wGet_Tipo <= 69
      If cEmpty(wQtdLin)
         wQtdLin := 08
      EndIf

      oGet := TCheckBox():New(wDesloc_Lin,wDesloc_Col,HB_AnsiToOem(wCabeca),&(wBlock),wObj_Ref,wXTamanho,wQtdLin,,&(wXValid),,,,,.F.,.T.,,.F.,&(wXWhen) )

   ElseIf wGet_Tipo = 90
      wQtdLin := wQtdLin * 3
      oGet := TImage():New(wDesloc_Lin,wDesloc_Col,wXTamanho,wQtdLin ,         ,         ,wBorder   ,wObj_Ref,          ,          , wHScroll,wExpande ,        ,,.F. ,,.T. ,,.F. )
      //               New( nTop      , nLeft     , nWidth  , nHeight, cResName, cBmpFile, lNoBorder,oWnd    , bLClicked, bRClicked, lScroll , lStretch, oCursor,cMsg, lUpdate, bWhen, lPixel, bValid, lDesign ) CONSTRUCTOR
      //oGet :Progress(.f.)

   ElseIf wGet_Tipo = 95
     oGet:=tWebCamPhoto():New(,)

   ElseIf wGet_Tipo = 99
      For nMonth := 1 to 12
         aAdd(aMonths,cMes(cTToD("01/" + padl(nMonth,2) + "/98","DD/MM/YY")))
      Next
   
      dDate      := cDate()
      wDtExtenso := dDateToString(dDate)
      cCYear     := Str(year(dDate),4)
      nYear      := Year(dDate)
      nMonth     := Month(dDate)
      wData      := dDate
      wWorkDia   := cTToD("01/" + padl(nMonth,2 ) + "/" + Right(cCYear,2),"DD/MM/YY" )
      while Dow(wWorkDia ) > 1
        wWorkDia --
      EndDo

      If wFrame
         &wOSay_Cabeca := c_Box(2,wObj_Ref,,wDesloc_Lin,wDesloc_Col,,115,"Calendário "+wCabeca,.F.,wGet_Tipo)
      EndIf

      wComboAction := iIf(cEmpty(wComboAction),".T.",wComboAction)
      oGet1 := TComboBox():New(wDesloc_Lin,wDesloc_Col+10,{ | u | If(PCount()==0,nMonth,nMonth:= u ) },aMonths,40,150,wObj_Ref,,{|Self|fMoveCalendar(wObj_Ref,1,nMonth),&(wComboAction)},,,,.T.,,,.F.,,.F.,,,,,)
      aAdd( oM_Say , oGet1 )

      oGet2 := TBtnBmp():New(oGet1:nTop,oGet1:nLeft+oGet1:nWidth+13,10,10,,,,,{|Self|(fMoveCalendar(wObj_Ref,3,)),&(wComboAction)},wObj_Ref,,,.F.,.F.,"-",,,,.T.,)
      aAdd( oM_Button , oGet2 )
      aAdd( oM_BtnAcs , "0"   )
      oGet3 := TBtnBmp():New(oGet1:nTop,oGet1:nLeft+oGet1:nWidth+56,10,10,,,,,{|Self|(fMoveCalendar(wObj_Ref,4,)),&(wComboAction)},wObj_Ref,,,.F.,.F.,"+",,,,.T.,)
      aAdd( oM_Button , oGet3 )
      aAdd( oM_BtnAcs , "0"   )

      oGet4 := TGet():New(oGet1:nTop ,oGet2:nLeft+oGet2:nWidth+1,{ | u | If(PCount()==0,nYear,nYear:= u ) },wObj_Ref,31 ,10 ,,{|Self|(fMoveCalendar(wObj_Ref,5,,nYear)),&(wComboAction)},,,,.F.,,.T.,,.F.,,.F.,.T. ,,.F.,.F.,.F.,,.F.,,,,)
      oGet4:Cargo := "YEAR"
      aAdd( oM_Say , oGet4 )

      oGet5 := TSay():New(oGet1:nTop+15,oGet1:nLeft+10+((35-Len(wDtExtenso))/4.8),{|| wDtExtenso},wObj_Ref,,,.F.,.F.,.F.,.T.,255,,100,10,.F.,.F.,.F.,.F.,.F. )
      oGet5:Cargo := "DATE"
      aAdd( oM_Say , oGet5 )

      oGet6 := TSay():New(oGet1:nTop+26,oGet1:nLeft+04,{|| "Dom"} ,wObj_Ref,,,.F.,.F.,.F.,.T.,255,,10,10,.F.,.F.,.F.,.F.,.F. )
      aAdd( oM_Say , oGet6 )
      oGet6 := TSay():New(oGet1:nTop+26,oGet1:nLeft+19,{|| "Seg    Ter    Qua    Qui     Sex    Sab"},wObj_Ref,,,.F.,.F.,.F.,.T.,8388608,,90,,.F.,.F.,.F.,.F.,.F. )
      aAdd( oM_Say , oGet6 )

      For wx := 02 To 7
        For wy := 01 To 7
          oGet7 := TBtnBmp():New(oGet1:nTop+((wx*10)+15),oGet1:nLeft+((wy*15)-11),11,11,,,,,{|Self|(wObj_Ref:Cargo := Self:Cargo,fMoveDay(wObj_Ref),&(wComboAction) )},wObj_Ref,,,.F.,.F.,Str(Day(wWorkDia ),2 ),,,,.F.,)
          aAdd( oM_Button , oGet7 )
          aAdd( oM_BtnAcs , "0"   )
          oGet7:Cargo := wWorkDia
          oGet7:Enable()

          If wWorkDia == cDate()
             oGet7:nClrText := 16711680
          ElseIf wWorkDia == dDate
             oGet7:nClrText := 32768
          ElseIf Month(wWorkDia ) == nMonth
             If wy=1
                oGet7:nClrText := 255
             Else
                oGet7:nClrText := 0
             EndIf
          Else
             If wy=1
                oGet7:nClrText := 255
             Else
                oGet7:nClrText := 8421504
             EndIf
             oGet7:Disable()
          EndIf

          If oGet7:Cargo == dDate
             oGet7:lPressed := .T.
             oGet7:cToolTip := "Selecionado"
          ElseIf oGet7:Cargo == cDate()
             oGet7:cToolTip := "Hoje"
          Else
             oGet7:cToolTip := DToC(oGet7:Cargo)
          EndIf
          wWorkDia++
        Next
      Next
      wObj_Ref:Cargo := dDate
   EndIf

   If ValType(oGet)="O"
      &wOGet_Nome := oGet
   EndIf

   If .Not.wFrame
      If (wGet_Tipo >= 20 .And. wGet_Tipo <= 29) .Or. (wGet_Tipo >= 30 .And. wGet_Tipo <= 39) .Or. (wGet_Tipo >= 40 .And. wGet_Tipo <= 49)
         c_Get_Cabeca(wColuna,wCabeca,wRequerido,wObj_Ref,oGet,wOSay_Cabeca )
      EndIf
   EndIf

Return oGet
*fim da Function c_Get()

function c_Get_Cabeca(wColuna,wCabecalho,wBold,wObj_Ref,wObjDesloc,wObjCab)
*******************************************************************************
*               funcao para montar a funcao c_Say do Get                       *
*******************************************************************************
Local wBoldFont , wPixel_Width , wPixel_Height := 07 , wXObj_Ref
__MVPRIVATE("wXCabecalho")

   wBold := iIf(ValType(wBold)<>"L",.F.,wBold)
   If wBold
      wBoldFont := "oFontBold"
   Else
      wBoldFont := "oFont" 
   EndIf

   wXCabecalho := iIf(cEmpty(wCabecalho),Space(00),AllTrim(wCabecalho))

   If ValType(wObjCab)="O"
      wPixel_Width  := c_Pixel_Len(wXCabecalho,wBold)

      wObjCab:nWidth := wPixel_Width*2
      wObjCab:SetText(wXCabecalho)
      wObjCab:SetFont( &wBoldFont )
      wObjCab:Refresh()

   Else
      wPixel_Width   := c_Pixel_Len(wXCabecalho,wBold)                                                                                                                                                                                         //  \/ lDrag
//    wPixel_Width   := wPixel_Width  * 2
      
      If cEmpty(wObj_Ref) .And. ValType(wObj_Ref)<>"O"
         wXObj_Ref := oM_Dlg[Len(oM_Dlg)]
      ElseIf ValType(wObj_Ref)<>"O"
         wXObj_Ref := wObj_Ref
         wXObj_Ref := &wXObj_Ref
      ElseIf ValType(wObj_Ref)="O"
         wXObj_Ref := wObj_Ref
      EndIf
      &wXOSay_Cabeca := TSay():New( wObjDesloc:nTop-7.5 , wObjDesloc:nLeft , {|| wXCabecalho }, wXObj_Ref ,, &wBoldFont, .F., .F., .F., .T.,,, wPixel_Width , wPixel_Height , .F., .F., .F., .F., .F. )   //mostra o conteudo do texto na tela
   EndIf

Return .t.
*fim da Function c_Get_Cabeca()

Function c_Pixel_Len(wTexto,wBold)
*******************************************************************************
*                 funcao para calular o Pixel de um texto                     *
*******************************************************************************
Local wpix := 0 , wx := 0 , wVar

   For wx = 01 To Len(wTexto)       // calcula o comprimento do pixel
       wVar := SubStr(wTexto,wx,1)

      If     wvar $ "iIjl!.ºí"
         wpix := wpix + 1
      ElseIf wvar $ "trf= "
         wpix := wpix + 2
      ElseIf wvar $ "yzxqaLbcdZenopFghsTuJkv0123456789çãê ˆ%óáéú>" + CHR(63)
         wpix := wpix + 3
      ElseIf wvar $ "ODPYENCBAGQHRSUVKXÓÉ"
         wpix := wpix + 4
      ElseIf wvar $ "mw"
         wpix := wpix + 5
      ElseIf wvar $ "WM"
         wpix := wpix + 6
      Else
         wpix := wpix + 3
      EndIf
   Next                   
   wPix := (wPix+(len(wtexto)/2))

   If ValType(wBold)="L"
      If wBold
         wPix := wPix * 1.20  
      EndIf
   EndIf

Return wPix
*fim da Function c_Pixel_Len()

Function c_Get_Valid(wOpcao,wColuna1,wChave)
*********************************************************************************
*                  funcao para Valids padr„es do Get                            *
* Opcao 10- VerIfica se C½digo já Cadastrado                                    *
*       13- Valid para Gets que contenham C½digo e não sejam Cadastrado         *
*       16- Abre Pesquisa                                                       *
*       19- Valid Composto                                                      *
*       20- Valid de Campo Nœmerico ( menor ou igual a zero )                   *
*       23- Valid de Campo Nœmerico ( menor que zero )                          *
*       30- Valid para preencher Campo Data com o cDATE()                       *
*       40- Valid para Campos C.G.C/C.P.F                                       *
*       50- Valid para Dia                                                      *
*       60- Valid para Mês                                                      *
*********************************************************************************
Local wx:=0,wy:=0,wPos:=0,wxx:=0,wResp,wCol_Sql,wAtrib_Lst,wTabela1,wTabela2,wPreDefVar,wRequerido
Local wWhere,wConteudo,wColuna2,wColuna3,wMatriz,wNum_Coluna,wHora,wPosDefVar,wVar1,wVar2,wDefVar
Local wM_Pesquisa,wKeyDbf,wKeySql,wOrderDbf,wOrderSql,wXCabeca,wxGrid,wH_Vl1,wH_Vl2,wCabeca,wMacro
Local wCol_Campo,wFormato,wAuxFunction,wTypeVar,wPreCabeca,wPosColuna,wPreColuna,wM_TpMatriz,wwxx
Local wxLenX,wxLen,wxLenRel,wAtribCol,wPicture

   If cEmpty(wColuna1)
      fColuna_Atual(,.F.)
   EndIf

   wCol_Sql := Space(00)
   wAtrib_Lst := Space(00)

   If cEmpty(wColuna1)
      cCancel("Coluna não Informada na propriedade Valid")
   EndIf
   wXCabeca := Space(00)
   wWhere   := Space(00)
   
   wxGrid   := m->wM_Grid_Seq[wG_Atual]
   wNum_Coluna := cNC(wColuna1,wxGrid,.f.,"c_Get_Valid")
   If cEmpty(wNum_Coluna)
      wxGrid      := Len(wM_Case)
      wNum_Coluna := cNC(wColuna1,wxGrid,.f.,"c_Get_Valid")
   EndIf
   wPreColuna := 00
   wPosColuna := 00 

   If wxGrid = 0 .Or. wNum_Coluna = 0
      Return .T.
   EndIf

   wTabela1  := cNvl(wM_Case[wxGrid,wCS_TabNome,wNum_Coluna],"")
   wTabela1  := AllTrim(wTabela1)
   If wM_Case[wxGrid][wCS_Formato,wNum_Coluna] = 49
      wConteudo := wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna][1]
   Else
      wConteudo := wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna]
   EndIf
   wTypeVar  := wM_Case[wxGrid][wCS_TypeVar ,wNum_Coluna]
   If upper(wM_Case[wxGrid][wCS_ObjGet  ,wNum_Coluna]:ClassName) = "TGET"
      wPicture  := wM_Case[wxGrid][wCS_ObjGet  ,wNum_Coluna]:cPicture
   EndIf

   If wNum_Coluna>1
      wx := 00
      For wx := wNum_Coluna-1 To 01 Step -1
         If wM_Case[wxGrid][wCS_TypeVar,wx] = wTypeVar
            wPreColuna := cNC(wM_Case[wxGrid,wCS_Coluna,wx],wxGrid,,"c_Get_Valid")
            wPreDefVar := cDefVar(wM_Case[wxGrid][wCS_DefVar,wx],wM_Case[wxGrid][wCS_TypeVar,wx],wxGrid)
            wPreCabeca := wM_Case[wxGrid][wCS_Cabeca,wx]
            wPreCabeca := iIf(cEmpty(wPreCabeca),wM_Case[wxGrid][wCS_Descricao,wx],wPreCabeca)
            Exit
         EndIf
      Next
   EndIf
   wxLenX := Len(wM_Case[wxGrid][wCS_Coluna])
   If wNum_Coluna<wxLenX
      wx := 00
      For wx := wNum_Coluna+01 To wxLenX
         If wM_Case[wxGrid][wCS_TypeVar,wx] = wTypeVar
            wPosColuna := cNC(wM_Case[wxGrid][wCS_Coluna,wx],wxGrid,,"c_Get_Valid")
            wPosDefVar := cDefVar(wM_Case[wxGrid][wCS_DefVar,wx],wM_Case[wxGrid][wCS_TypeVar,wx],wxGrid)
            Exit
         EndIf
      Next
      wx := 00
      For wx := wNum_Coluna+01 To wxLenX
         If wM_Case[wxGrid][wCS_TpValid,wx][1] >= 10 .And. wM_Case[wxGrid][wCS_TpValid,wx][1] <= 19
            wAtribCol := wx
            Exit
         EndIf
      Next
      wAtribCol := iIf(cEmpty(wAtribCol),wxLenX+1,wAtribCol)
   EndIf
   wCol_Campo   := wM_Case[wxGrid][wCS_Coluna     ,wNum_Coluna]
   wFormato     := wM_Case[wxGrid][wCS_Formato    ,wNum_Coluna]
   wCabeca      := wM_Case[wxGrid][wCS_Cabeca     ,wNum_Coluna]
   wCabeca      := iIf(cEmpty(wCabeca),wM_Case[wxGrid][wCS_Descricao,wNum_Coluna],wCabeca)
   wAuxFunction := wM_Case[wxGrid][wCS_AuxFunction,wNum_Coluna]
   wRequerido   := wM_Case[wxGrid][wCS_Requerido  ,wNum_Coluna]
   wDefVar      := cDefVar(wM_Case[wxGrid][wCS_DefVar,wNum_Coluna],wTypeVar,wxGrid)

   If wOpcao = 10
      wPos := 00
      If cEmpty(wTabela2) .And. cEmpty(wColuna2)
         wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wNum_Coluna]))
         If .Not.cEmpty(wAtrib_Lst)
            wPos := At(".",wAtrib_Lst)
            wTabela2 := SubStr(wAtrib_Lst,1,wPos-1)
            wColuna2 := AllTrim(SubStr(wAtrib_Lst,wPos+1))
         Else
            wTabela2 := AllTrim(wTabela1)
            wColuna2 := AllTrim(wColuna1)
         EndIf
      EndIf

      If cEmpty(wConteudo,wPicture)
         wAtrib_Lst := Space(00)
         wPos := 00 ; wx := 00
         For wx := wNum_Coluna To wxLenX
            If wx = wAtribCol
               Exit
            EndIf
            wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx]))
            If wAtrib_Lst = Lower(wTabela2)
               wM_Case[wxGrid,wCS_Conteudo,wx] := cDefVar(,wM_Case[wxGrid,wCS_TypeVar,wx],wxGrid)
            EndIf
         Next
         fCaseRefresh(wxGrid)

         If wFormato= 23           // Get Browse
            c_Get_Jump(wCol_Campo,wxGrid)
         EndIf
         Return .T.
      EndIf

      wx := 00 ; wCol_Sql := Space(00)
      For wx := wNum_Coluna To wxLenX
         If wx = wAtribCol
            Exit
         EndIf
         If Upper(AllTrim(wM_Case[wxGrid][wCS_TabNome,wx])) == Upper(wTabela1)
            wCol_Sql := wCol_Sql + iIf(.Not.cEmpty(wCol_Sql),",","") + wTabela1 + "." + wM_Case[wxGrid][wCS_Coluna,wx]
         EndIf
      Next

      wWhere := wTabela1+"."+wColuna1 + "=" + Campo(wConteudo,wTypeVar)
      wResp  := fConsulta2(wTabela1,{wCol_Sql},wWhere)

      If Len(wResp) = 0                                                  // Se não Encontrou
         cwMsg(1 , wCabeca + " não Cadastrado(a)","Atenção")
         Return .f.
      Else
         wx := 00 ; wxx:= 01
         For wx := wNum_Coluna To wxLenX
           If wx = wAtribCol
             Exit
           EndIf
           If wM_Case[wxGrid][wCS_TabNome,wx] = wTabela1
               wM_Case[wxGrid][wCS_Conteudo,wx] := wResp[01,wxx]
               wxx := wxx + 01
               If ValType(wM_Case[wxGrid][wCS_ObjGet,wx])="O"
                  wM_Case[wxGrid][wCS_ObjGet,wx]:Refresh()
               EndIf
            EndIf
         Next
      EndIf
   EndIf

   If wOpcao = 19
      wPos := 00
      If cEmpty(wTabela2) .And. cEmpty(wColuna2)
         wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wNum_Coluna]))
         If .Not.cEmpty(wAtrib_Lst)
            wPos := At(".",wAtrib_Lst)
            wTabela2 := SubStr(wAtrib_Lst,1,wPos-1)
            wColuna2 := AllTrim(SubStr(wAtrib_Lst,wPos+1))
         Else
            wTabela2 := AllTrim(wTabela1)
            wColuna2 := AllTrim(wColuna1)
         EndIf
      EndIf

      If cEmpty(wConteudo,wPicture)
         wAtrib_Lst := Space(00)
         wPos := 00 ; wx := 00
         For wx := wNum_Coluna To wxLenX
            If wx = wAtribCol
               Exit
            EndIf
            wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx]))
            If wAtrib_Lst = Lower(wTabela2)
               wM_Case[wxGrid,wCS_Conteudo,wx] := cDefVar(,wM_Case[wxGrid,wCS_TypeVar,wx],wxGrid)
            EndIf
         Next
         fCaseRefresh(wxGrid)
         If wFormato= 23
            c_Get_Jump(wCol_Campo,wxGrid)
         EndIf
         Return .T.
      EndIf

      wAtrib_Lst := Space(00)
      wx := 00 ; wCol_Sql := Space(00)
      For wx := wNum_Coluna To wxLenX
         If wx = wAtribCol
            Exit
         EndIf
         wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx]))
         If wAtrib_Lst = Lower(AllTrim(wTabela2))
            wCol_Sql := wCol_Sql + iIf(.Not.cEmpty(wCol_Sql),",","") + wAtrib_Lst
         EndIf
      Next

      wWhere := wTabela2+"."+wColuna2 + "=" + Campo(wConteudo,wTypeVar)
      wResp := fConsulta2(wTabela2,{wCol_Sql},wWhere)

      If wOpcao = 10
         If Len(wResp) = 0
            cwMsg(1,wCabeca + " não Cadastrado(a)","Atenção")
            Return .f.
         EndIf
      EndIf

      wAtrib_Lst := Space(00)
      If Len(wResp)>0
         wx := 00 ; wxx:= 01
         For wx := wNum_Coluna To wxLenX
            If wx = wAtribCol
               Exit
            EndIf
            wAtrib_Lst := Lower(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx]))
            If wAtrib_Lst = Lower(AllTrim(wTabela2))
               wM_Case[wxGrid][wCS_Conteudo,wx] := wResp[01,wxx]
               wxx := wxx + 01
               If ValType(wM_Case[wxGrid][wCS_ObjGet,wx])="O"
                  wM_Case[wxGrid][wCS_ObjGet,wx]:Refresh()
               EndIf
            EndIf
         Next
      EndIf
   EndIf

   If wOpcao = 20
      If wTypeVar = "N"
         If wConteudo <= 00
            cwMsg(1,wCabeca + " não pode conter este valor","Atenção")
            Return .f.
         EndIf
      EndIf
   EndIf

   If wOpcao = 23
      If wTypeVar = "N"
         If wConteudo < 00
            cwMsg(1,wCabeca + " não pode ser negativo","Atenção")
            Return .f.
         EndIf
      EndIf
   EndIf

   If wOpcao = 30
      If cEmpty(wConteudo)
         wM_Case[wxGrid][wCS_COnteudo,wNum_Coluna]:= cDate()
         wM_Case[wxGrid][wCS_ObjGet ,wNum_Coluna]:Refresh()
      EndIf
   EndIf

   If wOpcao = 40 .Or. wOpcao = 42
      If .Not.cEmpty(wConteudo)
         If .Not. cDvCGC(wConteudo)
            cwMsg(1,"C.G.C da Empresa Inválido","Atenção")
            Return .f.
         EndIf
      EndIf
   EndIf

   If wOpcao = 45 .Or. wOpcao = 47
      If .Not.cEmpty(wConteudo)
         If .Not. cDvCPF(wConteudo)
            cwMsg(1,"C.P.F da Pessoa Inválido","Atenção")
            Return .f.
         EndIf
      EndIf
   EndIf

   If wOpcao = 50
      If wConteudo < 0 .Or. wConteudo > 31
         cwMsg(1,"Dia Inválido. Tem de ser de 01 a 31.","Atenção")
         Return .f.
      EndIf
   EndIf

   If wOpcao = 60
      If wConteudo < 0 .Or. wConteudo > 12
         cwMsg(1,"Mês Inválido. Tem de ser de 01 a 12.","Atenção")
         Return .f.
      EndIf
   EndIf

   If wOpcao = 70 .Or. wOpcao = 90 .Or. wOpcao = 91
      wH_Vl1 := SubStr(wConteudo,1,2)
      wH_Vl2 := SubStr(wConteudo,4,2)

      If Len(AllTrim(wConteudo)) = 1
//       wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := "00:00"   // cicero 07/05/2010
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := "  :  "
      ElseIf cEmpty(wH_Vl1)
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := "00:" + wH_Vl2
      ElseIf cEmpty(wH_Vl2)
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := wH_Vl1 + ":00"
      ElseIf Len(AllTrim(wH_Vl1))=1
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := "0" + AllTrim(wH_Vl1) + ":" + AllTrim(wH_Vl2)
      ElseIf Len(AllTrim(wH_Vl2))=1
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := AllTrim(wH_Vl1) + ":" + AllTrim(wH_Vl2) + "0"
      EndIf
      wM_Case[wxGrid][wCS_ObjGet,wNum_Coluna]:Refresh()

      wHora := Val(wH_Vl1)
      If wHora > 23
         cwMsg(1,"Hora Inválido.","Atenção")
         Return .F.
      EndIf

      wHora := Val(wH_Vl2)
      If wHora > 59
         cwMsg(1,"Minuto Inválido.","Atenção")
         Return .F.
      EndIf
   EndIf

   If wOpcao = 80
      If cEmpty(wConteudo)
         wM_Case[wxGrid][wCS_Conteudo,wPosColuna] := wConteudo
      EndIf
      If cEmpty(wM_Case[wxGrid][wCS_Conteudo,wPosColuna])
         wM_Case[wxGrid][wCS_Conteudo,wPosColuna] := wConteudo
      EndIf
      wM_Case[wxGrid][wCS_ObjGet,wPosColuna]:Refresh()
   EndIf

   If wOpcao = 90
      wVar2 := Val(StrTran(wM_Case[wxGrid][wCS_Conteudo,wPosColuna],":","."))
      If cEmpty(wVar2)
         wM_Case[wxGrid][wCS_Conteudo,wPosColuna] := wConteudo
         wM_Case[wxGrid][wCS_ObjGet  ,wPosColuna]:Refresh()
      EndIf
   EndIf

   If wOpcao = 82 .Or. wOpcao = 91
      If cEmpty(wConteudo)
         wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna] := wM_Case[wxGrid][wCS_Conteudo,wPreColuna]
         wM_Case[wxGrid][wCS_ObjGet ,wNum_Coluna]:refresh()
         Return .T.
      EndIf

      If wOpcao = 91
         wVar1 := Val(StrTran(wConteudo,":","."))
         wVar2 := Val(StrTran(wM_Case[wxGrid][wCS_Conteudo,wPreColuna],":","."))

         If wVar1 < wVar2
            cwMsg(1,"Hora Final não pode ser menor que a Hora Inicial","Atenção")
            wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna]:= wM_Case[wxGrid][wCS_Conteudo,wPreColuna]
            wM_Case[wxGrid][wCS_ObjGet ,wNum_Coluna]:Refresh()
            Return .F.
         EndIf
      Else
         If wConteudo < wM_Case[wxGrid][wCS_Conteudo,wPreColuna]
            cwMsg(1,"Conteúdo Final não pode ser menor que o Conteúdo Inicial","Atenção")
            wM_Case[wxGrid][wCS_Conteudo,wNum_Coluna]:= wM_Case[wxGrid][wCS_Conteudo,wPreColuna]
            wM_Case[wxGrid][wCS_ObjGet ,wNum_Coluna]:Refresh()
            Return .F.
         EndIf
      EndIf
   EndIf

   If wOpcao = 11
      If cEmpty(wConteudo,wPicture)
         cwMsg(1,wCabeca + " não Informado(a)","Atenção")
         Return .F.
      EndIf
   EndIf

   If wOpcao = 13
      If cEmpty(wConteudo,wPicture) .And. wFormato<>23
         cwMsg(1,wCabeca + " não Informado(a)","Atenção")
         Return .f.
      EndIf

      If wFormato= 23
         If cEmpty(wConteudo,wPicture)
            If wRequerido
               cCombo_BTN(,wColuna1)
               wMacro := wAuxFunction
               wMacro := &wMacro
               Return .F.
            Else
               Return .T.
            EndIf
         EndIf

         wxLenRel := Len(wM_Relacionamento)
         For wx := 01 to wxLenRel
            If (Upper(wM_Relacionamento[wx,01])==Upper(wTabela1) .And. Upper(wM_Relacionamento[wx,03])==Upper(wColuna1) ) .Or. (Upper(wM_Relacionamento[wx,01])==Upper(wTabela1) .And. Upper(wM_Relacionamento[wx,04])==Upper(wColuna1) ) .Or. (Upper(wM_Relacionamento[wx,02])==Upper(wTabela1) .And. Upper(wM_Relacionamento[wx,03])==Upper(wColuna1) ) .Or. (Upper(wM_Relacionamento[wx,02])==Upper(wTabela1) .And. Upper(wM_Relacionamento[wx,04])==Upper(wColuna1) )
               If .Not.Upper(wTabela1) == Upper(wM_Relacionamento[wx,01])
                  wTabela2 := wM_Relacionamento[wx,01]
                  wColuna2 := wM_Relacionamento[wx,03]
               ElseIf .Not.Upper(wTabela1) == Upper(wM_Relacionamento[wx,02])
                  wTabela2 := wM_Relacionamento[wx,02]
                  wColuna2 := wM_Relacionamento[wx,04]
               EndIf
               If .Not.cEmpty(wTabela2) .And. .Not.cEmpty(wColuna2)
                  Exit
               EndIf
            EndIf
         Next

         wPos := 00
         If cEmpty(wTabela2) .And. cEmpty(wColuna2)
            wAtrib_Lst := AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wNum_Coluna])
            If .Not.cEmpty(wAtrib_Lst)
               wPos := At(".",wAtrib_Lst)
               wTabela2 := SubStr(wAtrib_Lst,1,wPos-1)
               wColuna2 := SubStr(wAtrib_Lst,wPos+1)
            Else
               wTabela2 := wTabela1
               wColuna2 := wColuna1
            EndIf
         EndIf

         wx := 00
         wCol_Sql := Space(00)
         wAtrib_Lst := Space(00)
         For wx := wNum_Coluna To wxLenX
            If wx = wAtribCol
               Exit
            EndIf
            wAtrib_Lst := AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx])
            If Upper(wAtrib_Lst) = Upper(wTabela2)
               wCol_Sql := wCol_Sql + iIf(.Not.cEmpty(wCol_Sql),",","") + wAtrib_Lst
            EndIf
         Next

         wWhere := wTabela2+"."+wColuna2 + "=" + Campo(wConteudo,wTypeVar)
         wResp := fConsulta2(wTabela2,{wCol_Sql},wWhere)
         If Len(wResp) = 0
            cwMsg(1,wCabeca + " não Cadastrado(a)","Atenção")
            Return .f.
         Else
            wx := 00 ; wxx:= 01
            For wx := 01 To wxLenX
               If wx = wAtribCol
                  Exit
               EndIf
               If Upper(AllTrim(wM_Case[wxGrid][wCS_Atrib_Lst,wx])) = Upper(AllTrim(wTabela2))
                  wM_Case[wxGrid][wCS_Conteudo,wx] := wResp[01,wxx]
                  wxx := wxx + 01
                  If ValType(wM_Case[wxGrid][wCS_ObjGet,wx])="O"
                     wM_Case[wxGrid][wCS_ObjGet,wx]:Refresh()
                  EndIf
               EndIf
            Next
         EndIf
      EndIf
   EndIf

   If wOpcao = 16
      If cEmpty(wConteudo,wPicture)
         If wRequerido
            cCombo_BTN(,wColuna1)
            wMacro := wAuxFunction
            wMacro := &wMacro
            Return .F.
         Else
            Return .T.
         EndIf
      EndIf
   EndIf

   If wChave
      If cEmpty(wConteudo,wPicture)
         If wFormato= 23
            cCombo_BTN(,wColuna1)
            wMacro := wAuxFunction
            wMacro := &wMacro
         Else
            cwMsg(1,wCabeca + " não Informado.","Atenção")
         EndIf
         Return .F.
      EndIf

      For wx = 01 To wxLenX
         If wM_Case[wxGrid][wCS_Key_Tp,wx] = 1 .Or. wM_Case[wxGrid][wCS_Key_Tp,wx] = 3
            wColuna3 := wM_Case[wxGrid][wCS_Coluna,wx]
            wXCabeca := wXCabeca + iIf(cEmpty(wXCabeca),""," mais ") + iIf(cEmpty(wM_Case[wxGrid][wCS_Cabeca,wx]),wM_Case[wxGrid][wCS_Descricao,wx],wM_Case[wxGrid][wCS_Cabeca,wx])
         EndIf
      Next

      If wColuna1 == wColuna3
         wM_Pesquisa := c_Gera_Key(wxGrid,2,wCS_Key_Tp)
         wKeyDbf   := wM_Pesquisa[1]
         wKeySql   := wM_Pesquisa[2]
         wOrderDbf := wM_Pesquisa[3]
         wOrderSql := wM_Pesquisa[4]
         wResp := fConsulta2(wM_Tab_Nome[wxGrid],{},wKeySql,wOrderSql)
         If Len(wResp)>0
            cwMsg(1,wXCabeca + " já Cadastrado(a)","Atenção")
            Return .f.
         EndIf
      EndIf
   EndIf

   If .Not.cEmpty(wFormato)
      If wFormato=23
         c_Get_Jump(wCol_Campo,wxGrid)
      EndIf
   EndIf

Return .t.
*fim da Function c_Get_Valid()

Function c_Valid(wTipo_Valid,wValid,wColuna)
***********************************************************************************
*                 função de concatenar o Tipo de Valid com o Pos_Fnc              *
***********************************************************************************
Local wXValid,wZValid,wValid_Geral,wXchave

  wColuna := iIf(cEmpty(wColuna),"",wColuna)
  
  If .Not.cEmpty(wTipo_Valid)
     wXchave := iIf(wTipo_Valid[2],'.T.','.F.')
     wZValid := "c_Get_Valid(" +StrZero(wTipo_Valid[1],2,0)+ "," +Campo(wColuna)+ "," +wXchave+ ")"
  Else
     wZValid := ".T."
  EndIf

  wValid  := iIf(ValType(wValid)="U",.T.,wValid)
  wXValid := iIf(ValType(wValid )="C" ,iIf(Len(Trim(wValid))=0,.T.,AllTrim(wValid)) , wValid )
  wXValid := iIf(ValType(wXValid)="L",iIf(wXValid,".T.",".F."),wXValid )

  wValid_Geral := wZValid + " .And. " + wXValid
  
Return wValid_Geral
*fim da Function c_Valid()

Function c_When(wTipo_When,wWhen)
***********************************************************************************
* wCS_TpWhen = 01 => * é Liberado S… na Inclusão  (Recebe Focus inicial)
* wCS_TpWhen = 02 => * é Liberado S… na Inclusão  (não Recebe Focus inicial)
* wCS_TpWhen = 03 => * é Liberado S… na Alteração (Recebe Focus inicial)
* wCS_TpWhen = 04 => * é Liberado S… na Alteração (não Recebe Focus inicial)
* wCS_TpWhen = 05 => * é Liberado na Inclusão e na Alteração (Em ambos os casos recebe Focus inicial)
* wCS_TpWhen = 06 => * é Liberado na Inclusão e na Alteração (Em ambos os casos não recebe Focus inicial)
* wCS_TpWhen = 07 => * é Liberado na Inclusão e na Alteração (só na Inclusão recebe Focus inicial)
* wCS_TpWhen = 08 => * é Liberado na Inclusão e na Alteração (só na Alteração recebe Focus inicial)
* wCS_TpWhen = 09 => * é Liberado (Recebe Focus inicial)
* wCS_TpWhen = 10 => * é Liberado (não Recebe Focus inicial)
* wCS_TpWhen = 11 => * não ' Liberado
* wCS_TpWhen = 12 => * Somente na Opção de Consulta
***********************************************************************************
Local wXWhen,wZWhen,wWhen_Geral

  If ValType(wTipo_When)="N"
     If  wTipo_When=00
         wZWhen := '.T.'
     ElseIf wTipo_When=01 .Or. wTipo_When=02
         wZWhen := 'wM_Opcao[Len(oM_Dlg)]="inclui"'
     ElseIf wTipo_When=03 .Or. wTipo_When=04
         wZWhen := 'wM_Opcao[Len(oM_Dlg)]="altera"'
     ElseIf wTipo_When=05 .Or. wTipo_When=06 .Or. wTipo_When=07 .Or. wTipo_When=08
         wZWhen := 'wM_Opcao[Len(oM_Dlg)]="inclui".Or.wM_Opcao[Len(oM_Dlg)]="altera"'
     ElseIf wTipo_When=09 .Or. wTipo_When=10
         wZWhen := '.T.'
     ElseIf wTipo_When=11
         wZWhen := '.F.'
     ElseIf wTipo_When=12
         wZWhen := 'wM_Opcao[Len(oM_Dlg)]="consul"'
     EndIf
  Else   
     wZWhen := '.T.'
  EndIf
  
  wWhen  := iIf(ValType(wWhen )="U",.T.,wWhen)
  wXWhen := iIf(ValType(wWhen )="C" ,iIf(Len(Trim(wWhen))=0,.T.,AllTrim(wWhen)) , wWhen )
  wXWhen := iIf(ValType(wXWhen)="L",iIf(wXWhen,".T.",".F."),wXWhen )

  wWhen_Geral := "(" + wZWhen + ") .And. (" + wXWhen + ")"
  
Return wWhen_Geral
*fim da Function c_When()

Function cNC(wXColuna,wCase,wMsg,wFunction)
*******************************************************************************
*                         
*******************************************************************************
Local wPos := 00 , wx := 00 , wwMsg

   wFunction := cNvl(wFunction,"")

   If cEmpty(wXColuna)
      cCancel("cNC() - 1 - Coluna não Informada na Função: "+ wFunction)
   EndIf

   wXColuna := AllTrim(Upper(wXColuna))
   If cEmpty(wCase)
      For wx := 01 To 02
         If wx=1
            wCase := m->wM_Grid_Seq[wG_Atual]
         Else
            wCase := Len(wM_Case)
         EndIf

         wPos := cScan(wM_Case[wCase,wCS_Coluna],wXColuna)
         If .Not.cEmpty(wPos)
            Exit
         EndIf
      Next
   Else
      wPos := cScan(wM_Case[wCase,wCS_Coluna],wXColuna)
   EndIf

   If wPos = 0
      If ValType(wMsg)="L"
         wwMsg := iIf(cEmpty(wMsg),.T.,wMsg)
      Else
         wwMsg := .T.
      EndIf
      If wwMsg
         cCancel("cNC() - 2 - Coluna "+Campo(wXColuna)+" não existe esta cadastrado na Case (nº "+Str(wCase) +" ). Function: " + wFunction)
      EndIf
   EndIf

Return wPos
*fim da Function cNC(wXColuna,wCase)

Function c_Button(wTipo,wObj_Ref,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wQtd_Lin,wQtd_Col,wTexto,wImagem,wToolTip,wOpcao,wWhen,wValid,wCancel,wAcesso)
*****************************************************************************************
* Funcao para montar o get no objeto atual                                              *
*PARAMETROS: wObj_Ref    => Nome do objeto de referencia                                *
*            wObj_Desloc => Nome do objeto de referencia para deslocamento              *
*            wDesloc_Lin => Numnero de linhas  para deslocamento em relacao ao wObj_Ref *
*            wDesloc_Col => Numnero de Colunas para deslocamento em relacao ao wObj_Ref *
*            wM_Tamanho  => Matrix contendo tamanho do botao (altura e largura) Pixel   *
*            wTipo       => Tipo de Botao (1-TBtnBMP 2-TButton )                        *
*            wImagem    =>                                                             *
*            wWhen       => Funcao Logica when para o botao                             *
*            wAction     => Funcao Logica para Acao do botao                            *
****************************************************************************************
Local wObj_Button, wTLin, wTCol, wXWhen, wXAction, wnTop, wnLeft, wnWidth, wnHeight, wG_When
Local wAltura , wLargura , wComboImagem1 , wComboImagem2 , wNulo, wG_Valid

   wNulo    := .F.

   If Upper(AllTrim(oM_Dlg[Len(oM_Dlg)]:ClassName)) = "TDIALOG"
      wTLin    := 08.0    // Tamanho da Linha
      wTCol    := 04.0    // Tamanho da Coluna
   Else
      wTLin    := 16.0    // Tamanho da Linha
      wTCol    := 08.0    // Tamanho da Coluna
   EndIf

   wWhen    := iIf(cEmpty(wWhen),.T.,wWhen)
   wWhen    := iIf(ValType(wWhen )="C" ,iIf(Len(Trim(wWhen))=0,.T.,wWhen) , wWhen )
   wWhen    := iIf(ValType(wWhen)="L",iIf(wWhen,".T.",".F."),wWhen )
   
   wValid   := iIf(cEmpty(wValid),.T.,wValid)
   wValid   := iIf(ValType(wValid)="C",iIf(Len(Trim(wValid))=0,.T.,wValid) , wValid )
   wValid   := iIf(ValType(wValid)="L",iIf(wValid,".T.",".F."),wValid )

   wOpcao   := cNvl( wOpcao , 0 )

   If wOpcao>00
      wXWhen   := "fCaseWhenButton(" + StrZero(wOpcao,2,0) + ")"
      wXAction := "fCaseButton(" + StrZero(wOpcao,2,0) + ")"

      wG_When  := wXWhen + " .And. " + wWhen
      If wOpcao=03
         wG_Valid := wValid + " .And. " + wXAction
         wG_Valid := "iIf(cwMsg(02,'Confirme a Exclusão do Item'+CHR(63),'Atenção'),(" +AllTrim(wG_Valid) + "),oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus())"
      Else
         wG_Valid := "(" + wXAction + " ),( " + wValid + ")"
      EndIf   
   Else
      wG_When  := wWhen
      wG_Valid := wValid
   EndIf
   wG_When     := AllTrim(wG_When)
   wG_Valid    := AllTrim(wG_Valid)
   
   If cEmpty(wTipo)
      wDesloc_Lin := wDesloc_Lin * wTLin 
      wDesloc_Col := wDesloc_Col * wTCol
      wAltura     := wQtd_Lin    * wTLin
      wLargura    := wQtd_Col    * wTCol

      If ValType(wObj_Desloc) = "O"
         wnTop    := wObj_Desloc:nTop
         wnLeft   := wObj_Desloc:nLeft
         wnWidth  := wObj_Desloc:nwidth
         wnHeight := wObj_Desloc:nHeight
      
         If wObj_Desloc:ClassName = "TFOLDER"
            wDesloc_Col := wDesloc_Col + (04.00)
            wDesloc_Lin := wDesloc_Lin + (01.25)
         Else
            wDesloc_Col := wDesloc_Col + wnWidth + wnLeft
            wDesloc_Lin := wDesloc_Lin + wnTop
         EndIf
      EndIf
      
      If     ValType(wToolTip) = "N"
         wToolTip := Str(wToolTip)
      ElseIf ValType(wToolTip) = "D"
         wToolTip := DtoC(wToolTip)
      ElseIf ValType(wToolTip) = "L"
         wToolTip := iIf(wToolTip,".T.",".F.")
      ElseIf ValType(wToolTip) = "C"
         wToolTip := AllTrim(wToolTip)
      EndIf

      wG_When  := "{||("+ wG_When  + ")}"

      If cEmpty(wImagem) // Tbutton
         wNulo := .T.
      Else
         If wImagem = "NULO"
            wNulo := .T.
         Else
            wNulo := .F.
         EndIf
      EndIf

      If wNulo // Tbutton
         wG_Valid := "{||("+ wG_Valid + ")}"
         wObj_Button := TButton():New( wDesloc_Lin, wDesloc_Col, wTexto , wObj_Ref , &(wG_Valid) , wLargura, wAltura ,,,.F.,.T.,.F.,,.F., &(wG_When) ,, .T.)
         wObj_Button:cToolTip := wToolTip
      Else               //  TBTNBMP
         wG_Valid := "{|Self|("+ wG_Valid + ")}"
         If ValType(wImagem) = "A"
            wComboImagem1 := cIMG_Arquivo(wImagem[1])
            wComboImagem2 := cIMG_Arquivo(wImagem[2])
            wObj_Button := TBTNBMP():New( wDesloc_Lin, wDesloc_Col, wLargura, wAltura,,,wComboImagem1,wComboImagem2 ,{|Self| &(wG_Valid) }, wObj_Ref,, &(wG_When) ,.F.,.F., wTexto,,,,!.F., )
            wObj_Button:cToolTip := wToolTip
         ElseIf ValType(wImagem) = "C"
            wComboImagem1 := cIMG_Arquivo(wImagem)
            wObj_Button := TBTNBMP():New( wDesloc_Lin, wDesloc_Col, wLargura,  wAltura,,,wComboImagem1,, &(wG_Valid) , wObj_Ref,, &(wG_When) ,.F.,.F., wTexto,,,,.T. ,)
            wObj_Button:cToolTip := wToolTip
         Else
             cCancel("Não foi Informado o Arquivo de Imagem enquanto gerava o Botão","Atenção")
         EndIf
         If Len(oM_Button)=4
            wObj_Button:lCancel := .T.  //wCancel
         EndIf   
      EndIf

      aAdd( oM_Button , wObj_Button )
      aAdd( oM_BtnAcs , iIf(cEmpty(wAcesso),"0",wAcesso) )
   Else
      wG_Valid := "{|This|("+ wG_Valid + ")}"
      wComboImagem1 := cIMG_Arquivo(wImagem)
      wObj_Button := TBtnBmp():NewBar(,,wComboImagem1,,, &(wG_Valid) ,.F., oM_BtnBar[Len(oM_BtnBar)] , .F.,, wToolTip , .F.,,,,,,,,,, )
   EndIf

Return wObj_Button
*fim da Function c_Button()

Function c_TreeView(wObj_Ref,wLinha,wColuna,wAltura,wLargura,wbChange,wrClick,wDuploClick,wbKeyDown,wMFunction)
*****************************************************************************************
*                       Funcao para montar o Folder atual                               *
*****************************************************************************************
Private oTree

   wLinha   := (cNvl(wLinha  ,0)*08)
   wColuna  := (cNvl(wColuna ,0)*08)
   wAltura  := (cNvl(wAltura ,0)*08)
   wLargura := (cNvl(wLargura,0)*08)

   oTree := TTreeView():New( wLinha,wColuna,oM_Dlg[1],        ,        , .T.  , .F.   , wLargura,wAltura,    )
                 //     New( nTop  , nLeft ,oWnd     ,nClrFore,nClrBack,lPixel,lDesign, nWidth  ,nHeight,cMsg)

// If .Not.cEmpty(wbChange)
//    oTree:bChanged  := {|| &(wbChange) }
// EndIf
// If .Not.cEmpty(wrClick)
//    oTree:bRClicked := {|nRow,nCol| &(wrClick) }
// EndIf
// If .Not.cEmpty(wDuploClick)
//    oTree:bLDblClick := {|| &(wDuploClick) }
// EndIf
// If .Not.cEmpty(wbKeyDown)
//    oTree:bkeydown  := {|nKey,nFlags| &(wbKeyDown) }
// EndIf
   
   aAdd( oM_Tree , oTree )

   wMFunction := iif(cEmpty(wMFunction),{},wMFunction)
   wMFunction := {}

   aAdd(wMFunction , {1,"FRM_teste" ,"FRM_teste"                ,""                 ,})
   aAdd(wMFunction , {2,"BTN_inclui","FRM_teste.BTN_inclui"     ,"FRM_teste"        ,})
   aAdd(wMFunction , {2,"BTN_altera","FRM_teste.BTN_inclui"     ,"FRM_teste"        ,})
   aAdd(wMFunction , {2,"FLD_cad"   ,"FRM_teste.FLD_cad"        ,"FRM_teste"        ,})
   aAdd(wMFunction , {2,"FLD_aux"   ,"FRM_teste.FLD_aux"        ,"FRM_teste"        ,})
   aAdd(wMFunction , {3,"FLT_aaa"   ,"FRM_teste.FLD_cad.FLT_aaa","FRM_teste.FLD_cad",})
   aAdd(wMFunction , {3,"FLT_bbb"   ,"FRM_teste.FLD_cad.FLT_aaa","FRM_teste.FLD_cad",})
   aAdd(wMFunction , {3,"FLT_01"    ,"FRM_teste.FLD_aux.FLT_01" ,"FRM_teste.FLD_aux",})
   aAdd(wMFunction , {3,"FLT_02"    ,"FRM_teste.FLD_aux.FLT_02" ,"FRM_teste.FLD_aux",})
  
   c_TreeView_Add(oTree,wMFunction)

Return oTree
*fim da Function c_TreeView()

Function c_TreeView_Add(oTree,wMTree)
*****************************************************************************************
*                        Funcao para montar a arvore estruturada                        *
* wMTree: 01 - Indice da Arvore                                                         *
*         02 - Nome de Apresentação                                                     *
*         03 - Codigo relacionado                                                       *
*         04 - Codigo Pai relacionado (do nivel 2 em diante)                            *
*****************************************************************************************
Local wx,wxLen,wIndice,oItem

   wIndice := 1

   wxLen := Len(wMTree)
   aSort(wMTree,,,{|x,y| x[1] < y[1] })

   For wx := 01 To wxLen
      If wMTree[wx,1] = wIndice
         oItem := oTree:Add(wMTree[wx,2],0)
         oItem:Cargo := {wIndice,wMTree[wx,3],""}
      //   c_TreeView_Add(oItem,wMTree,wIndice,wMTree[wx,3],wxLen)
      ElseIf wMTree[wx,1] > wIndice
         Exit
      EndIf
   Next

Return .T.
*fim da Function c_TreeView_Add(wMTree)

Function c_TreeView_Add_Aux(oItemPai,wMTree,wIndice,wMenuPai,wxLen)
*****************************************************************************************
*                         Funcao Auxiliar para montagem da Tree                         *
*****************************************************************************************
Local wx,oItem

   wIndice := wIndice+1

   For wx := 01 To wxLen
      If wMTree[wx,1] = wIndice .And. wMTree[wx,4] = wMenuPai
         oItem := oItemPai:Add(wMTree[wx,2],wIndice-1)
         oItem:Cargo := {wIndice,wMTree[wx,3],wMenuPai}
         c_TreeView_Add_Aux(oItem,wMTree,wIndice,wMTree[wx,3])
      ElseIf wMTree[wx,1] > wIndice
         Exit
      EndIf
   Next

Return .T.
*fim da Function c_TreeView_Add_Aux(wMTree)
 
Function c_Folder(wObj_Ref,wObj_Desloc,wFld_Seq,wLegenda,wMedidas)
*****************************************************************************************
*                       Funcao para montar o Folder atual                               *
*****************************************************************************************
Local wObj_Button, wTLin, wTCol, wXWhen, wXAction, wnTop, wnLeft, wnWidth, wnHeight, wx:=00
Local wDesloc_Lin := 00 , wDesloc_Col := 00 , wAltura := 00 , wLargura := 00 , oFld

   If Upper(AllTrim(oM_Dlg[Len(oM_Dlg)]:ClassName)) = "TDIALOG"
      wTLin := 08.0    // Tamanho da Linha
      wTCol := 04.0    // Tamanho da Coluna
   Else
      wTLin := 16.0    // Tamanho da Linha
      wTCol := 08.0    // Tamanho da Coluna
   EndIf

   wDesloc_Lin := wMedidas[01] * wTLin 
   wDesloc_Col := wMedidas[02] * wTCol
   wAltura     := wMedidas[03] * wTLin
   wLargura    := wMedidas[04] * wTCol

   If ValType(wObj_Desloc) = "O"
      wnTop       := wObj_Desloc:nTop
      wnLeft      := wObj_Desloc:nLeft
      wnWidth     := wObj_Desloc:nwidth
      wnHeight    := wObj_Desloc:nHeight
                
      wDesloc_Col := wDesloc_Col + wnLeft
   
      If wObj_Desloc:classname = "TBTNBMP"
         wDesloc_Lin := wDesloc_Lin + wnTop + wnHeight
      Else
         wDesloc_Lin := wDesloc_Lin + wnTop
      EndIf
   EndIf

   oFld := TFolder():New( wDesloc_Lin, wDesloc_Col, wM_Folder[Len(wM_Folder),wFld_Leg_Stru] , {}, wObj_Ref ,,,, .T., .F., wLargura, wAltura,, .T., oFont )
          // TFolder():New(   01,wColuna,wPastas  ,{}       ,oDataBase,       ,        ,        ,.T.   ,.F.    ,621   ,620     ,    ,.T.      ,oFont)
              // METHOD New( nTop, nLeft , aPrompts, aDialogs,oWnd     ,nOption,nClrFore,nClrBack,lPixel,lDesign,nWidth,nHeight ,cMsg,lAllWidth,oFont ) CONSTRUCTOR
   
   aAdd( oM_Fld       , oFld )
   aAdd( wM_Fld_Ant   , 0    )
   aAdd( wM_Fld_Atual , 1    )

   oM_Fld[Len(oM_Fld)]:bChange := { || fMudaFolder(wFld_Seq) }

Return oFld
*fim da Function c_Folder()

Function fMudaFolder(wNum_Obj_Folder)
********************************************************************************
* wNum_Obj_Folder  =  Numero do Objeto Folder                                  *
*                funcao para dar a×oes na mudan×a de folder                    *
********************************************************************************
Local wx,wy,wz,wFunction,wF,wXGrid_Seq,wKeyDbf,wKeySql,wOrderDbf,wOrderSql,wM_Pesquisa,wDefVar
Local wGrid_Seq,wClassName,wAtualiza,wWXExit,wWYExit,wxLen,wxLenFld,wFld_Anterior,wMatriz

EnableWindow(oM_Dlg[Len(oM_Dlg)]:hWnd,.F. )

__wKeySeek :=Space(00)
wXGrid_Seq := 00
wxLenFld := Len(oM_Fld)
For wx := wNum_Obj_Folder+1 to wxLenFld
   If .Not.cEmpty(oM_Fld[wx])
      oM_Fld      [wx]:SetOption(1)
      oM_Fld      [wx]:Refresh()
      wM_Fld_Ant  [wx] := 00
      wM_Fld_Atual[wx] := 01
   EndIf
Next

wy := 00
wx := 00
wxLen := Len(wM_Folder[wNum_Obj_Folder,wFld_Leg_Stru])
For wx:= 01 to wxLen
   If oM_Fld[wNum_Obj_Folder]:aPrompts[ oM_Fld[wNum_Obj_Folder]:nOption ] == wM_Folder[wNum_Obj_Folder,wFld_Leg_Stru][wx]
      If ValType(wM_Fld_Atual[wNum_Obj_Folder])<>"N"
         wFld_Anterior := 01
      Else
         wFld_Anterior := wM_Fld_Atual[wNum_Obj_Folder]
      EndIf
      wM_Fld_Ant [wNum_Obj_Folder] := wFld_Anterior
      wM_Fld_Atual[wNum_Obj_Folder] := oM_Fld[wNum_Obj_Folder]:nOption

      If .Not.cEmpty(wM_Folder[wNum_Obj_Folder,wFld_PosFnc][wx])
         wFunction := wM_Folder[wNum_Obj_Folder,wFld_PosFnc][wx]
      EndIf
   EndIf
Next

wGrid_Seq := wM_Grid_Seq[wG_Atual]
wMatriz   := oM_Fld[wNum_Obj_Folder]:aDialogs[oM_Fld[wNum_Obj_Folder]:nOption]:aControls

For wx := 01 To Len(wMatriz)
   wClassName := Upper(wMatriz[wx]:classname())
   cursorwait()

   If wClassName = "TWBROWSE"
      For wz := 01 To Len(wM_Control)
         If Valtype(wM_Control[wz,1])<>"O"
            Loop
         EndIf
         If wM_Control[wz,1]:hWnd = wMatriz[wx]:hWnd
            If wM_Control[wz][2] <> wM_Grid_Seq[wG_Atual]
               fGrid_Ant(wM_Grid_Seq[wG_Atual])
               wM_Grid_Seq[wG_Anterior] := wM_Grid_Seq[wG_Atual]
            EndIf
            wM_Grid_Seq[wG_Atual] := wM_Control[wz][2]
            wM_Control[wz][3]     := oM_Fld[wNum_Obj_Folder]
            Exit
         EndIf
      Next
      Exit
   Else
      If wClassName = "TFOLDER"
         fMudaFolder_Aux(wMatriz[wx])
      EndIf
   EndIf
Next

//wAtualiza := 00
//wx := 00 ; wy := 00
//wWXExit := .F.
//wWYExit := .F.
//For wy := wNum_Obj_Folder to wxLenFld
//
//   For wx := 01 To Len(oM_Fld[wy]:aDialogs[oM_Fld[wy]:nOption]:aControls )
//      wClassName := Upper(oM_Fld[wy]:aDialogs[oM_Fld[wy]:nOption]:aControls[wx]:classname())
//      cursorwait()
//
//      If wClassName = "TFOLDER"
//         wAtualiza := 1
//      EndIf
//      If wClassName = "TWBROWSE"
//         wAtualiza := 2
//         For wz := 01 To Len(wM_Control)
//            If Valtype(wM_Control[wz,1])<>"O"
//               Loop
//            EndIf
//            If wM_Control[wz,1]:hWnd = oM_Fld[wy]:aDialogs[ oM_Fld[wy]:nOption ]:aControls[wx]:hWnd
//               If wM_Control[wz][2] <> wM_Grid_Seq[wG_Atual]
//                  fGrid_Ant(wM_Grid_Seq[wG_Atual])
//                  wM_Grid_Seq[wG_Anterior] := wM_Grid_Seq[wG_Atual]
//               EndIf
//               wM_Grid_Seq[wG_Atual] := wM_Control[wz][2]
//               wM_Control[wz][3] := oM_Fld[wy]
//               wWXExit := .T.
//               wWYExit := .T.
//               Exit
//            EndIf
//         Next
//      EndIf
//      If wWXExit
//         Exit
//      EndIf
//   Next
//   If wWYExit
//      Exit
//   EndIf
//   If wAtualiza = 0
//      Exit
//   EndIf
//Next

If wGrid_Seq <> wM_Grid_Seq[wG_Atual]
   wXGrid_Seq := wGrid_Seq
EndIf
If ValType(wM_Fld_Atual[wNum_Obj_Folder] )<>"N"
    wM_Fld_Atual[wNum_Obj_Folder] := 01
EndIf
If ValType(wM_Fld_Ant[wNum_Obj_Folder] )<>"N"
   wM_Fld_Ant[wNum_Obj_Folder] := 00
EndIf

If wM_Fld_Atual[wNum_Obj_Folder] > wM_Fld_Ant[wNum_Obj_Folder]
   If .Not.cEmpty(wFunction)
      wF := &wFunction
   Else
      If Len(wM_Case)=0
         Return EnableWindow(oM_Dlg[Len(oM_Dlg)]:hWnd,.T. )
      EndIf
      If wXGrid_Seq > 0
         If wM_Opcao[Len(oM_Dlg)] = "consul"
            fCaseDefvar(m->wM_Grid_Seq[wG_Atual])
            wM_Pesquisa := c_Gera_Key(m->wM_Grid_Seq[wG_Atual],1,wCS_Key_Tp)
            wKeyDbf   := wM_Pesquisa[1]
            wKeySql   := wM_Pesquisa[2]
            wOrderDbf := wM_Pesquisa[3]
            wOrderSql := wM_Pesquisa[4]
            c_Grid_Cria_Matrix(m->wM_Grid_Seq[wG_Atual],wM_Tab_Nome[m->wM_Grid_Seq[wG_Atual]],wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TabNome],wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna],wKeyDbf,wKeySql,wOrderDbf,wOrderSql,wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],1],wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],2],wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],3],wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],4],,wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],5])
            If .Not.cEmpty(wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],6])
               wF := wM_Tab_PosFnc[m->wM_Grid_Seq[wG_Atual],6]
               wF := &wF
            EndIf
         EndIf
      EndIf
   EndIf

   If wXGrid_Seq > 0
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoBottom()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:GoTop()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Click()
      fCaseAtrib(m->wM_Grid_Seq[wG_Atual])
      fCaseRefresh(m->wM_Grid_Seq[wG_Atual])
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()
      oM_Brw[m->wM_Grid_Seq[wG_Atual]]:SetFocus()
      oM_Brw_Say[wM_Grid_Seq[wG_Atual]]:Refresh()
   EndIf
Else
   wy := 00
   wxLen := 00
   For wy := wM_Grid_Seq[wG_Atual]+1 To Len(wM_Tab_Nome)
      If AllTrim(wM_Tab_Nome[wy]) = "X"
         Loop
      EndIf
      wx := 00
      wxLen := Len(wM_Case[wy,wCS_Coluna])
      For wx := 01 To wxLen
         wDefVar := cDefVar(wM_Case[wy,wCS_DefVar,wx],wM_Case[wy,wCS_TypeVar,wx],wy)
         If wM_Case[wy,wCS_Formato,wx] = 49
            wM_Case[wy,wCS_Conteudo,wx] := {wDefVar,wDefVar}
         Else
            wM_Case[wy,wCS_Conteudo,wx] := wDefVar
         EndIf
         CursorWait()
      Next
   Next
EndIf

If Len(oM_Brw_Say)>0
   If Valtype(oM_Brw_Say[wM_Grid_Seq[wG_Atual]])="O"
      oM_Brw_Say[wM_Grid_Seq[wG_Atual]]:Refresh()
   EndIf
EndIf

cFolder_Enable()

wFLd_Num_Obj := fBusca_FLd_Num_Obj()
oM_Fld[wFLd_Num_Obj]:aEvalWhen()
oM_Dlg[Len(oM_Dlg)]:aEvalWhen()
CursorArrow()         

Return EnableWindow(oM_Dlg[Len(oM_Dlg)]:hWnd,.T. )
* fim da Function fMudaFolder()

Function fMudaFolder_Aux(oFld)
*************************************************************************************************
*                                                                                               *
*************************************************************************************************
Local wx,wz,wClassName,wMatriz
   
   wMatriz := oFld:aDialogs[oFld:nOption]:aControls
   
   For wx := 01 To Len(wMatriz)
      wClassName := Upper(wMatriz[wx]:classname())

      If wClassName = "TWBROWSE"
         For wz := 01 To Len(wM_Control)
            If Valtype(wM_Control[wz,1])<>"O"
               Loop
            EndIf
            If wM_Control[wz,1]:hWnd = wMatriz[wx]:hWnd
               If wM_Control[wz][2] <> wM_Grid_Seq[wG_Atual]
                  fGrid_Ant(wM_Grid_Seq[wG_Atual])
                  wM_Grid_Seq[wG_Anterior] := wM_Grid_Seq[wG_Atual]
               EndIf
               wM_Grid_Seq[wG_Atual] := wM_Control[wz][2]
               wM_Control[wz][3]     := oFld
               Exit
            EndIf
         Next
         Exit
      Else
         If wClassName = "TFOLDER"
            fMudaFolder_Aux(wMatriz[wx])
         EndIf
      EndIf
   Next

Return .T.
* fim da Function fMudaFolder()

Function fBusca_FLd_Num_Obj()
*************************************************************************************************
*                                                                                               *
*************************************************************************************************
Local wx := 00 , wy := 00, wRetorno := 01, wPasta := 01 ,wxLen1,wxLen2

wxLen1 := Len(oM_Fld)
For wx = 01 to Len(oM_Fld)
   If cEmpty(oM_Fld[wx])
      Exit
   EndIf
   wxLen2 := Len(wM_Folder[wx,wFld_Leg_Stru]) 
   For wy := 01 to wxLen2
      If oM_Fld[wx]:aPrompts[ oM_Fld[wx]:nOption ] == wM_Folder[wx,wFld_Leg_Stru][wy]
         wRetorno := wx
      EndIf
   Next
Next

Return wRetorno
*Fim da Function fBusca_FLd_Num_Obj()

Function fCaseFilter(wOpcao)
********************************************************************************
*                   funcao para o Filtro Automatico do Programa                *
* Opcao => 1 - FRM geral                                                       *
* Opcao => 2 - Gerador de Relatorio                                            *
********************************************************************************
Local wx,wPrimeiro,wObjDesloc,wxLen,wLenDlg,wGetwx,wPesquisa,wwGrid,wColAnt,wObj,wQtdObj,wxTamanho,wxQtdLin,wxGrid,wTabela
Local wColuna,wCabeca,wQtdLin,wTamanho,wFormato,wPicture,wAlinDireita,wValid,wAuxFunction,wHScroll,wDlgLin,wBtnLin,wMacro
Local wDlgWidth,wWhen,wnTop,wnLeft,wnWidth,wnHeight,wInicio_Lin,wInicio_Col,wDesloc_Lin,wDesloc_Col,wFator,wResp,wAux_Cab,wReturn


wOpcao := iIf(ValType(wOpcao)="U","1",wOpcao) // 

wxGrid := wM_Grid_Seq[wG_Atual]
If cEmpty(wxGrid)
   wGrid := 01
Else
   wGrid := wxGrid
EndIf

wPesquisa := .F.
For wx := 01 to Len(wM_Case[wGrid,wCS_Coluna])
   If .Not.cEmpty(wM_Case[wGrid,wCS_Filtro,wx])
      wPesquisa := .T.
      Exit
   EndIf
Next

If wPesquisa

   wDlgWidth := 100*DLG_CHARPIX_W
   wDlgLin   := 80
   wQtdObj   := 00
   wTamanho  := 00
   wBtnLin   := 01
   
   For wx := 01 to Len(wM_Case[wGrid,wCS_Coluna])
      If .Not.wM_Case[wGrid,wCS_Origem,wx] .Or. wM_Case[wGrid,wCS_Filtro,wx]<=0
         Loop
      EndIf

      wTamanho := wM_Case[wGrid,wCS_Tamanho,wx]
      wFator   := (wTamanho*3.5) + 100
      wQtdObj  := wQtdObj + wFator
      If     wM_Case[wGrid,wCS_Filtro,wx] >= 30 .And. wM_Case[wGrid,wCS_Filtro,wx] <= 39
         wQtdObj := wQtdObj + wFator + 10
      EndIf

      If wQtdObj >= wDlgWidth
         wQtdObj := 00
         wDlgLin := wDlgLin + 72.50
         wBtnLin := wBtnLin + 01
      EndIf
   Next

   If wBtnLin = 1
      wBtnLin  := 01.10
   EndIf
   
   wDlgLin     := wDlgLin + 40
   wAux_Cab    := Space(00)
   
   If wOpcao = "1"      // FRM geral
      wAux_Cab := wc_Prog[Len(wc_Prog)]
   Else                 // Gerador Relatorios
      wAux_Cab := "Gerador de Relatórios"
   EndIf
      
   wResp       := __fCase_Form(fObj_Load("FRM_cCase_Filter"),{},"FRM_cCase_Filter",2," "+wAux_Cab,wDlgLin,wDlgWidth)
   wLenDlg     := Len(oM_Dlg)
   wDlgWidth   := oM_Dlg[wLenDlg]:nWidth

   wBtnLin := wBtnLin * 4.80

   If wOpcao = "1"      // FRM geral
      c_Button(,oM_Dlg[wLenDlg],,wBtnLin,32.5,01.50,10,"Confirma",,,0,,"(cwMsg(3,'Pesquisando...','Aguarde',{||c_Pesquisa()}),oM_Dlg[Len(oM_Dlg)]:End())" ,)
   Else                 // Gerador Relatorios
      c_Button(,oM_Dlg[wLenDlg],,wBtnLin,32.5,01.50,10,"Impressão",,,0,,"(cwMsg(3,'Pesquisando...','Aguarde',{||c_Pesquisa(,,,.F.)}),oM_Dlg[Len(oM_Dlg)]:End())" ,)
   EndIf

   c_Button(,oM_Dlg[wLenDlg],oM_Button[Len(oM_Button)],00     ,10.0,01.50,10,"Cancela" ,,,0,,"oM_Dlg[Len(oM_Dlg)]:End()"                  ,)

   cwInicial()

   wPrimeiro   := .T.
   wDesloc_Lin := 01
   wDesloc_Col := 03
   wwGrid      := Str(wGrid)
   wColAnt     := 00
   wQtdObj     := 00
   wFator      := 00
   wx          := 00
   For wx := 01 to Len(wM_Case[wGrid,wCS_Coluna])

      If .Not.wM_Case[wGrid,wCS_Origem,wx] .Or. wM_Case[wGrid,wCS_Filtro,wx]<=0
         Loop
      EndIf

      wColuna      := wM_Case[wGrid,wCS_Coluna     ,wx]
      wCabeca      := wM_Case[wGrid,wCS_Cabeca     ,wx]
      wCabeca      := iif(cEmpty(wCabeca),wM_Case[wGrid,wCS_Descricao,wx],wCabeca)
      wQtdLin      := wM_Case[wGrid,wCS_QtdLin     ,wx]
      wTamanho     := wM_Case[wGrid,wCS_Tamanho    ,wx]
      wFormato     := wM_Case[wGrid,wCS_Formato    ,wx]
      wPicture     := wM_Case[wGrid,wCS_Picture    ,wx]
      wAlinDireita := wM_Case[wGrid,wCS_AlinDireita,wx]
      wAuxFunction := wM_Case[wGrid,wCS_AuxFunction,wx]
      wHScroll     := wM_Case[wGrid,wCS_HScroll    ,wx]
      wTabela      := wM_Case[wGrid,wCS_TabNome    ,wx]

     If wPrimeiro
         wObjDesloc := oM_Dlg[wLenDlg]
         wColAnt    := wx
      Else
         If wM_Case[wGrid,wCS_Formato,wColAnt] = 23
            wDesloc_Col := 06
         Else
            wDesloc_Col := 05
         EndIf
         wColAnt    := wx
      EndIf

      wGetwx := Str(wx)
      If wM_Case[wGrid,wCS_Formato,wx] < 10 .And. wM_Case[wGrid,wCS_Filtro,wx] <> 10
         wFormato := 20
      EndIf

      wFator  := (wTamanho*3.5) + 100
      wQtdObj := wQtdObj + wFator
      If     wM_Case[wGrid,wCS_Filtro,wx] >= 30 .And. wM_Case[wGrid,wCS_Filtro,wx] <= 39
         wQtdObj := wQtdObj + wFator + 10
      EndIf

      If wQtdObj >= wDlgWidth
         wDesloc_Lin := 02
         wDesloc_Col := 03
         wQtdObj     := 00
      Else
         If wPrimeiro
            wDesloc_Lin := 01
         Else
            wDesloc_Lin := 00
         EndIf
      EndIf

      If     wM_Case[wGrid,wCS_Filtro,wx] = 10
         wFormato := 00
      ElseIf wM_Case[wGrid,wCS_Filtro,wx] >= 20 .And. wM_Case[wGrid,wCS_Filtro,wx] <= 29
         c_Get(wGrid,wx, wColuna, oM_Dlg[wLenDlg], wObjDesloc, wDesloc_Lin, wDesloc_Col, wQtdLin, wTamanho, wCabeca , wCS_F1Conteudo,wCS_F1ObjGet,wCS_F1ObjCab ,.F., wPicture, wAlinDireita ,0,.T.,0,.T., wFormato, wAuxFunction, wHScroll , .T.)
         wObjDesloc := wM_Case[wGrid,wCS_F1ObjGet,wx]
      ElseIf wM_Case[wGrid,wCS_Filtro,wx] >= 30 .And. wM_Case[wGrid,wCS_Filtro,wx] <= 39
         c_Box(1,oM_Dlg[wLenDlg], wObjDesloc, wDesloc_Lin, wDesloc_Col, wQtdLin, (wTamanho*2)+7, wCabeca,.F.,wFormato)

         c_Get(wGrid,wx, wColuna, oM_Dlg[wLenDlg], wObjDesloc, wDesloc_Lin, wDesloc_Col+2.5, wQtdLin, wTamanho,, wCS_F1Conteudo,wCS_F1ObjGet,wCS_F1ObjCab ,.F., wPicture, wAlinDireita ,0,.T.,0,"c_Filter_Valid(1," + wGetwx + ")" , wFormato, wAuxFunction, wHScroll )
         wObjDesloc := wM_Case[wGrid,wCS_F1ObjGet,wx]
         c_Say(oM_Dlg[wLenDlg],wObjDesloc,0,(-1*wTamanho)-2.5,"De" )

         wWhen  := ".Not.cEmpty("+"wM_Case["+wwGrid+",wCS_F1Conteudo,"+wGetwx+"])"

         c_Get(wGrid,wx, wColuna, oM_Dlg[wLenDlg], wObjDesloc, 0, 04,, wTamanho,,wCS_F2Conteudo,wCS_F2ObjGet,wCS_F2ObjCab, .F. , wPicture , wAlinDireita , 0 , wWhen , 0 , "c_Filter_Valid(2," + wGetwx + ")" , wFormato,wM_Case[wGrid,wCS_AuxFunction,wx],wM_Case[wGrid,wCS_HScroll,wx] )
         wObjDesloc := wM_Case[wGrid,wCS_F2ObjGet,wx]
         c_Say(oM_Dlg[wLenDlg],wObjDesloc,0,(-1*wTamanho)-3,"Até")

         If wM_Case[wGrid,wCS_Filtro,wx] = 31
            wM_Case[wGrid,wCS_F1Conteudo,wx]:= cDate()
            wM_Case[wGrid,wCS_F2Conteudo,wx]:= cDate()
         Else
            wM_Case[wGrid,wCS_F1Conteudo,wx]:= cDefVar(,wM_Case[wGrid,wCS_TypeVar,wx])
            wM_Case[wGrid,wCS_F2Conteudo,wx]:= cDefVar(,wM_Case[wGrid,wCS_TypeVar,wx])
         EndIf
         wM_Case[wGrid,wCS_F1ObjGet,wx]:Refresh()
         wM_Case[wGrid,wCS_F2ObjGet,wx]:Refresh()
      EndIf

      If wFormato > 10
         wPrimeiro  := .F.
      EndIf
   Next
   
   If Len(wM_Tab_Nome)=0
      aAdd( wM_Tab_Nome, wTabela )
   EndIf

   wM_Dlg[wLenDlg,01] := Len(wM_Case)
   wM_Dlg[wLenDlg,02] := Len(wM_Control)
   wM_Dlg[wLenDlg,03] := Len(wM_Grid_Cursor)
   wM_Dlg[wLenDlg,04] := Len(wM_Folder)
   wM_Dlg[wLenDlg,05] := 2
   wM_Dlg[wLenDlg,06] := wResp[1]
   wM_Dlg[wLenDlg,07] := Len(oM_Button)
   wM_Dlg[wLenDlg,08] := Len(oM_Say)
   wM_Dlg[wLenDlg,09] := Len(oM_BtnCombo)
   wM_Dlg[wLenDlg,10] := ""
   wM_Dlg[wLenDlg,11] := wc_FRM_Act

   If wM_Dlg[wLenDlg,6] = "D"   // Dialog
      oM_Dlg[wLenDlg]:Activate( oM_Dlg[wLenDlg]:bLClicked, oM_Dlg[wLenDlg]:bMoved , oM_Dlg[wLenDlg]:bPainted, .T. , wMacro ,,, oM_Dlg[wLenDlg]:bRClicked,, )
   EndIf
   If wLenDlg>1
      aDel (oM_Dlg  , wLenDlg)   // Exclui o œltimo Dialog
      aSize(oM_Dlg  , wLenDlg - 1 )
      aSize(wM_Opcao, wLenDlg - 1 )
      aSize(wM_Dlg  , wLenDlg - 1 )
      cFolder_Enable()
   Else
      wReturn := fWork(,3,1)
      cwFinal()
      Return wReturn
   EndIf
EndIf
Return .f.
*fim da Function fCaseFilter()

Function c_Filter_Valid(wopcao,wColuna)
********************************************************************************
*              funcao para o Valid automatico dos GETS do Filtro               *
********************************************************************************
Local wCabeca, wDefVar

   wDefVar := cDefVar(,wM_Case[wGrid,wCS_TypeVar,wColuna])

   If wopcao = 1
      If cEmpty(wM_Case[wGrid,wCS_F1Conteudo,wColuna])
         wM_Case[wGrid,wCS_F2Conteudo,wColuna]:= wDefVar
         wM_Case[wGrid,wCS_F2ObjGet  ,wColuna]:Refresh()
      Else
         wM_Case[wGrid,wCS_F2Conteudo,wColuna]:= wM_Case[wGrid,wCS_F1Conteudo,wColuna]
         wM_Case[wGrid,wCS_F2ObjGet  ,wColuna]:Refresh()
      EndIf
      Return .T.
   Else   
      If cEmpty(wM_Case[wGrid,wCS_F2Conteudo,wColuna])
         wM_Case[wGrid,wCS_F2Conteudo,wColuna]:= wM_Case[wGrid,wCS_F1Conteudo,wColuna]
         wM_Case[wGrid,wCS_F2ObjGet  ,wColuna]:Refresh()
         Return .T.
      EndIf
      wCabeca := wM_Case[wGrid,wCS_Cabeca,wColuna]
      wCabeca := iif(cEmpty(wCabeca),wM_Case[wGrid,wCS_Descricao,wColuna],wCabeca)

      If wM_Case[wGrid,wCS_F2Conteudo,wColuna] < wM_Case[wGrid,wCS_F1Conteudo,wColuna]
         cwMsg(1 , wCabeca + " Final não pode ser menor que " + wCabeca + " Inicial","Atenção")
         wM_Case[wGrid,wCS_F2Conteudo,wColuna]:= wDefVar
         wM_Case[wGrid,wCS_F2ObjGet  ,wColuna]:Refresh()
         Return .F.
      EndIf
   EndIf

Return .t.
*fim da Function c_Filter_Valid(wColuna)

Function c_Pesquisa(wGrid,wKeySql,wKeyDbf,wCriaMatrix)
********************************************************************************
*                          Executa a Pesquisa nos Grids                        *
********************************************************************************
Local wCampos := {},wTabCampos := {},wM_OrderBy := {},wx:=00 , wxx:= 00,wPos:=00,wAtualiza,wM_Pesquisa
Local w1Conteudo,w2Conteudo,wConteudo,wOrderBy := Space(00),wxLen,wTab_Filter,wM_Cursor
Local wM_RTab := {}, wM_RCampos := {}

   wCriaMatrix := iif(Valtype(wCriaMatrix)="L",wCriaMatrix,.T.)
   wAtualiza := .F.

   If cEmpty(wGrid)
      wGrid := m->wM_Grid_Seq[wG_Atual]
      wKeyDbf := wKeySql := Space(00)

      wxLen := Len(wM_Case[wGrid,wCS_Coluna])
      For wx := 01 To wxLen
         If ValType(wM_Case[wGrid,wCS_F1Conteudo,wx])="C"
            w1Conteudo := AllTrim(wM_Case[wGrid,wCS_F1Conteudo,wx])
         Else
            w1Conteudo := wM_Case[wGrid,wCS_F1Conteudo,wx]
         EndIf

         If wM_Case[wGrid,wCS_Filtro,wx] = 10 .Or. wM_Case[wGrid,wCS_Filtro,wx] = 20 .Or. wM_Case[wGrid,wCS_Filtro,wx] = 21 .Or. wM_Case[wGrid,wCS_Filtro,wx] = 22 .Or. wM_Case[wGrid,wCS_Filtro,wx] = 23
            If .Not.cEmpty(w1Conteudo)
               If wM_Case[wGrid,wCS_Formato,wx] < 30 .Or. wM_Case[wGrid,wCS_Formato,wx] > 39
                  If wM_Case[wGrid,wCS_Filtro,wx] = 21
                     wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " Like " + Campo(w1Conteudo+"%",wM_Case[wGrid,wCS_TypeVar,wx])
                  ElseIf wM_Case[wGrid,wCS_Filtro,wx] = 22
                     wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " Like " + Campo("%"+w1Conteudo+"%",wM_Case[wGrid,wCS_TypeVar,wx])
                  ElseIf wM_Case[wGrid,wCS_Filtro,wx] = 23
                     wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " Like " + Campo("%"+w1Conteudo,wM_Case[wGrid,wCS_TypeVar,wx])
                  Else
                     wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " = " + Campo(w1Conteudo,wM_Case[wGrid,wCS_TypeVar,wx])
                  EndIf
               Else
                  wPos := At("-",w1Conteudo)-1
                  If wPos>0
                     wConteudo := SubStr(w1Conteudo,1,wPos)
                  Else
                     wConteudo := w1Conteudo
                  EndIf
                  wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " = " + Campo(wConteudo,wM_Case[wGrid,wCS_TypeVar,wx])
               EndIf
            EndIf
         ElseIf wM_Case[wGrid,wCS_Filtro,wx] >= 30 .And. wM_Case[wGrid,wCS_Filtro,wx] <= 39
            If ValType(wM_Case[wGrid,wCS_F2Conteudo,wx])="C"
               w2Conteudo := AllTrim(wM_Case[wGrid,wCS_F2Conteudo,wx])
            Else
               w2Conteudo := wM_Case[wGrid,wCS_F2Conteudo,wx]
            EndIf
            If .Not.cEmpty(w1Conteudo)
               wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " >= " + Campo(w1Conteudo,wM_Case[wGrid,wCS_TypeVar,wx])
            EndIf
            If .Not.cEmpty(w2Conteudo)
               wKeySql := wKeySql + iIf(Len(wKeySql)>0," .And. ","") + wM_Case[wGrid,wCS_Coluna,wx] + " <= " + Campo(w2Conteudo,wM_Case[wGrid,wCS_TypeVar,wx])
            EndIf
         EndIf
         If .Not.cEmpty(w1Conteudo)
            wAtualiza := .T.
         EndIf
      Next
   Else
      wAtualiza := .T.
   EndIf

   If Len(wM_Tab_Filter)>0
      If ValType(wM_Tab_Filter[wGrid])<>"C"
         wM_Tab_Filter[wGrid] := ""
      EndIf
      wTab_Filter := AllTrim(wM_Tab_Filter[wGrid])
   Else
      wTab_Filter := Space(00)
   EndIf

   wTab_Filter := StrTran(wTab_Filter,'"',"'")
   If .Not.cEmpty(wKeySql)
      wKeySql := '"' + wKeySql + iIf(Len(Trim(wKeySql))>0.And.Len(wTab_Filter)>0," .And. ","") + wTab_Filter + '"'
   Else
      wM_Pesquisa := c_Gera_Key(wGrid,1,wCS_Key_Tp)
      wKeySql := wM_Pesquisa[2]
   EndIf

   wx := 00
   wxLen := Len(wM_Case[wGrid,wCS_Coluna])
   For wx = 01 to wxLen
      aAdd(wCampos ,wM_Case[wGrid,wCS_Coluna,wx] )
      aAdd(wTabCampos,wM_Case[wGrid,wCS_TabNome,wx] )
      If .Not.cEmpty(wM_Case[wGrid,wCS_GridOrder,wx])
         aAdd(wM_OrderBy,{ wM_Case[wGrid,wCS_Coluna][wx],wM_Case[wGrid,wCS_GridOrder][wx],wM_Case[wGrid,wCS_GridOrderTp][wx] })
      EndIf
   Next

   wxLen := Len(wM_OrderBy)
   If wxLen>0
      aSort(wM_OrderBy,,,{|x,y| x[2] < y[2] })
      wx := 00
      For wx:= 01 to wxLen
         wOrderBy := wOrderBy + iIf(Len(wOrderBy)<>0,",","") + wM_OrderBy[wx,01]+" "+wM_OrderBy[wx,03]
      Next
   EndIf

   If wCriaMatrix
      If wAtualiza
         c_Grid_Cria_Matrix(wGrid,wM_Tab_Nome[wGrid],wTabCampos,wCampos,wKeyDbf,wKeySql,,wOrderBy,.T.)
         oM_Brw[wGrid]:GoTop()
         oM_Brw[wGrid]:Refresh()
         fCaseAtrib (wGrid)
         fCaseRefresh(wGrid)
         cFolder_Enable()
         oM_Fld[fBusca_FLd_Num_Obj()]:aEvalWhen()
         oM_Dlg[Len(oM_Dlg)]:aEvalWhen()
      EndIf
   Else
      For wxx:=1 to Len(wM_Case[wGrid,wCS_TabNome])
          If .not. cEmpty(wM_Case[wGrid,wCS_TabNome,wxx])
             aAdd(wM_RCampos , Trim(wM_Case[wGrid,wCS_TabNome,wxx]) + "."+ wM_Case[wGrid,wCS_Coluna,wxx] )
          Else
             aAdd(wM_RCampos ,wM_Case[wGrid,wCS_Coluna,wxx] )
          EndIf
          If cScan( wM_RTab , wM_Case[wGrid,wCS_TabNome,wxx]) = 0
             aAdd(wM_RTab,wM_Case[wGrid,wCS_TabNome,wxx])
          EndIf                                                                                       
      Next

      wM_RelCursor := fConsulta2(wM_RTab,wM_RCampos,wKeySql,wOrderBy)
      If wc_user="C"
         clog_sql("G3- " + wc_sql)
      EndIf
      Return .t.

   EndIf
Return .t.
*fim da Function c_Pesquisa(wGrid,wKeySql,wKeyDbf)

Function fGridConsistencia(wGrid)
*******************************************************************************
*        funcao p/ executar as consistencias dos Grids antes da gravacao      *
*******************************************************************************
Local wwxx := 00 , wx := 00

   For wwxx := 01 To Len(wM_Grid[wGrid])
      For wx = 01 to Len(wM_Case[wGrid,wCS_Coluna])
          If wM_Case[wGrid,wCS_Requerido,wx] = .T.      // 09 - Campo Obrigatorio (REQUERIDO)
             If cEmpty(wM_Grid[wGrid,wwxx,wx])
                Return .f.
             EndIf
          EndIf
      Next
   Next

Return .t.
*fim da Function fGridConsistencia(wGrid)

Function cFolder_Enable()
********************************************************************************
*                funcao para Enibir e Desinibir os FOLDERS                     *
********************************************************************************
Local wx,wy,wxy,wz,wk,wWhen,wPrimeiro,wGridX,wExit,wEnable,wxLen1,wxLen2,wxLen3,wxLen4,wxLen5
Local wRestricao := .t. , aControls , n

   If Len(oM_Fld)>0 .And. Len(oM_Dlg)>0
      wxLen1 := Len(oM_Fld)
      For wy := 01 to wxLen1
         cursorwait()
         If cEmpty(oM_Fld[wy])
            Exit
         EndIf
         aSize(oM_Fld[wy]:aEnable , 0)

         wx := 00; wz := 00; wk := 00; wxy := 00
         wPrimeiro := .T. 
         wWhen     := .F.
         wEnable   := .T.
         wGridX    := 00

         wxLen2 := Len(wM_Folder[wy,wFld_Leg_Stru])
         For wx := 01 to wxLen2
            cursorwait()
            If wM_Folder[wy,wFld_Acesso,wx] = "1" .Or. wM_Folder[wy,wFld_Acesso,wx] = "2"    //(0-Mostra habilitado) (1-Mostra desabilitado)  (2-Nao mostra) 
               wRestricao := .F.
            Else
               wRestricao := .T.
            EndIf

            If wM_Opcao[Len(oM_Dlg)] = "consul"
               wExit := .F.
               If wPrimeiro
                  wz     := 00
                  wxLen3 := Len(oM_Fld[wy]:aDialogs[wx]:aControls)
                  For wz := 01 To wxLen3
                     cursorwait()
                     If Upper( oM_Fld[wy]:aDialogs[wx]:aControls[wz]:ClassName()) = "TWBROWSE"
                        wk := 00
                        wxLen4 := Len(wM_Control)
                        For wk := 01 To wxLen4
                           If ValType(wM_Control[wk,1])<>"O"
                              Loop
                           EndIf
                           If oM_Fld[wy]:aDialogs[wx]:aControls[wz]:hWnd = wM_Control[wk,1]:hWnd
                              wGridX := wM_Control[wk,2]
                              If Len(wM_Grid)>0
                                 wxy    := 00
                                 wxLen5 := Len(wM_Case[wGridX,wCS_Coluna])
                                 For wxy = 01 to wxLen5
                                    cursorwait()
                                    If wM_Case[wGridX,wCS_Requerido,wxy]
                                       If cEmpty(wM_Grid[wGridX,00001,wxy]) 
                                          wEnable := .F.
                                       Else
                                          wEnable := .T.
                                       EndIf
                                       Exit
                                    EndIf
                                 Next
                                 wExit := .T.
                                 Exit
                              EndIf
                           EndIf
                           cursorwait()
                        Next
                     Else
                        wEnable := .T.
                     EndIf
                     If wExit
                        Exit
                     EndIf
                  Next
                  wPrimeiro:= .F.
               EndIf
               
               If wPrimeiro     
                  wPrimeiro := .F.     
                  wEnable   := .T.
               EndIf               

               If cEmpty(wM_Folder[wy,wFld_PreFnc,wx])
                  wWhen := iIf(wEnable,".T.",".F.") // + " .And. " + iIf(cEmpty(wM_Obj_FLT[wy,wx,02]),".T.",AllTrim(wM_Obj_FLT[wy,wx,02]))
               Else
                  wWhen := AllTrim(wM_Folder[wy,wFld_PreFnc,wx])
               EndIf
               wWhen := &wWhen
               wWhen := iIf(wRestricao=.f.,.f.,wWhen)

               aAdd( oM_Fld[wy]:aEnable , wWhen )

            ElseIf wM_Opcao[Len(oM_Dlg)] <> "consul"
               If oM_Fld[wy]:aPrompts[ oM_Fld[wy]:nOption ] == wM_Folder[wy,wFld_Leg_Stru][wx]
                  wWhen := ".T. .And. " + iIf(cEmpty(wM_Folder[wy,wFld_PreFnc,wx]),".T.",wM_Folder[wy,wFld_PreFnc,wx])
                  wWhen := &wWhen
                  wWhen := iIf(wRestricao=.F.,.F.,wWhen)
                  aAdd( oM_Fld[wy]:aEnable , wWhen )
               Else
                  wWhen := iIf(cEmpty(wM_Folder[wy,wFld_PreFnc,wx]),".F.",wM_Folder[wy,wFld_PreFnc,wx])
                  wWhen := &wWhen
                  wWhen := iIf(wRestricao=.F.,.F.,wWhen)
                  aAdd( oM_Fld[wy]:aEnable , wWhen )
               EndIf
            EndIf
            cursorwait()
         Next
         
         oM_Fld[wy]:Refresh()
         oM_Fld[wy]:aDialogs[ oM_Fld[wy]:nOption ]:aEvalWhen()

         cursorwait()
      Next
   EndIf   
   CursorArrow()
Return .f.
* fim da Function cFolder_Enable()

Function c_Radio(wSeq,wObj_Ref,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wTamanho,wOGet_Nome,wWhen,wValid,wComboAction,wDefault )
*****************************************************************************************
* Funcao para montar o RADIO Fora da M_CASE                                             *
*PARAMETROS: wObj_Ref    => Nome do objeto de referencia                                *
*            wObj_Desloc => Nome do objeto de referencia para deslocamento              *
*            wDesloc_Lin => Numnero de linhas  para deslocamento em relacao ao wObj_Ref *
*            wDesloc_Col => Numnero de Colunas para deslocamento em relacao ao wObj_Ref *
*            wTamanho    => Tamanho do get                                              *
*            wVar_Nome   => Nome da variavel do get                                     *
*            wOGet_Nome  => Nome do Objeto GET                                          *
*            wWhen       => Funcao Logica when para o get                               *
*            wValid      => Funcao Logica Valid para o get                              *
*            wComboAction=> Matriz referente aos Itens da Matriz
*            wdefault     => Opção inicial default do RADIO
****************************************************************************************
//Local wnTop , wnLeft , wnWidth , wnHeight , wTLin , wTCol , wvar , wpix , wx , wPos := 00 , wInicio
//Local wXTamanho , wBytes := 00 , wXBytes := 00 , wXWhen,wInicio_Lin,wInicio_Col , wMComboAction
//Local wXValid,wXVar_Nome,wVar_Nome
//
//wTLin       := 18.0    // Tamanho da Linha
//wTCol       := 05.5    // Tamanho da Coluna
//wTCol       := 03.5    // Tamanho da Coluna
//
//wWhen       := iIf(ValType(wWhen )="U",.T.,wWhen)
//wXWhen      := iIf(ValType(wWhen )="C" ,iIf(Len(Trim(wWhen))=0,.T.,wWhen) , wWhen )
//wXWhen      := iIf(ValType(wXWhen)="L",iIf(wXWhen,".T.",".F."),wXWhen )
//
//wValid      := iIf(ValType(wValid) ="U",.T.,wValid)
//wXValid     := iIf(ValType(wValid )="C" ,iIf(Len(Trim(wValid))=0,.T.,wValid) , wValid )
//wXValid     := iIf(ValType(wXValid)="L",iIf(wXValid,".T.",".F."),wXValid )
//
//wDesloc_Lin := wDesloc_Lin  * wTLin
//wDesloc_Col := wDesloc_Col  * wTCol
//
//wnTop := 0 ; wnTop := 0 ; wnLeft := 0 ; wnWidth := 0 ; wnHeight := 0
//If cEmpty(wObj_Desloc)
//   wInicio_Lin :=  0      
//   wInicio_Col :=  0      
//Else                      
//   wnTop    := wObj_Desloc:nTop
//   wnLeft   := wObj_Desloc:nLeft
//   wnWidth  := wObj_Desloc:nwidth
//   wnHeight := wObj_Desloc:nHeight
//                          
//   If     wObj_Desloc:classname = "TWBROWSE"
//      wInicio_Lin := 8 + wnTop  + wnHeight 
//      wInicio_Col :=     0
//   ElseIf wObj_Desloc:classname = "TSAY"
//      wInicio_Lin := 8 + wnTop 
//      wInicio_Col :=     wnLeft
//   Else                   
//      wInicio_Lin := wnTop
//      wInicio_Col := wnLeft + wnWidth
//   EndIf                  
//   If wDesloc_Lin = 0     
//      wDesloc_Col := wDesloc_Col + wInicio_Col
//   EndIf                  
//EndIf                     
//
//If wDesloc_Lin > 0        
//   wDesloc_Lin := wDesloc_Lin + 0.3
//EndIf
//
//wDesloc_Lin   := wDesloc_Lin + wInicio_Lin
//wMComboAction := {}
//
//For wx := 1 to Len(wComboAction)
//    wPos := At("#",wComboAction[wx])
//    wMComboAction[wx] := SubStr(wComboAction[wx],wPos+1)
//    If wx = 1
//       wInicio := SubStr(wComboAction[wx],1,wPos-1)
//    EndIf
//    wXBytes := Len(Trim(wMComboAction[wx]))
//    If wBytes < wXBytes
//       wBytes := wXBytes
//    EndIf
//Next
//If cEmpty(wXTamanho)
//   wXTamanho := (wBytes+1) * wTCol
//EndIf
//
////wM_Var[wSeq,1] := wInicio
////wM_Var[wSeq,2] := wDefault
////wM_Var[wSeq,3] := TRadMenu():New( wDesloc_Lin, wDesloc_Col, wMComboAction, { |u| If( PCount()==0, wM_Var[1,2], wM_Var[1,2]:=u )} , wObj_Ref,,{||( &wXValid )},,,, .F., {|| &wXWhen } , wXTamanho, 12,, .F., .F., .T. )
////&wOGet_Nome:= TRadMenu():New( wDesloc_Lin, wDesloc_Col, wMComboAction, { |u| If( PCount()==0, &wXVar_Nome, &wXVar_Nome:=u )} , wObj_Ref,,{||( &wXValid )},,,, .F., {|| &wXWhen } , wXTamanho, 12,, .F., .F., .T. )

Return .t. 
*fim da Function c_Radio()

Function c_Get_Jump(wColuna,wGrid)
********************************************************************************
*                funcao para Pular para o proximo Objeto valido                *
********************************************************************************
Local wx := 00 , wNumCol := 00 , wNum_Obj := 00 , wObjeto , wxLen

   wNumCol := cNC(wColuna,wGrid,"c_Get_Jump")
   wObjeto := wM_Case[wGrid][wCS_ObjRef,wNumCol]
   If ValType(wObjeto)<>"O"
      wObjeto := &wObjeto
   EndIf

   wxLen := Len(wM_Case[wGrid][wCS_Coluna])
   For wx:= wNumCol+01 To wxLen
      If wM_Case[wGrid][wCS_Formato,wx]>09
         If ValType(wM_Case[wGrid][wCS_ObjGet,wx])="O"
            If wM_Case[wGrid][wCS_Formato,wx] < 50 .Or. wM_Case[wGrid][wCS_Formato,wx] > 59
               If wM_Case[wGrid][wCS_ObjGet,wx]:lActive
                  wNum_Obj := wM_Case[wGrid][wCS_ObjGet,wx]:hWnd
                  Exit
               EndIf
            EndIf
         EndIf
      EndIf   
   Next

   If cEmpty(wNum_Obj)
      wNum_Obj := NextDlgTab( wObjeto:hWnd , wM_Case[wGrid][wCS_ObjGet,wNumCol]:hWnd )
   EndIf

   If GetKeyState(09) .Or. GetKeyState(13) .Or. GetKeyState(40)
      SetFocus( wNum_Obj )
   EndIf   

Return .t.
* fim da Function c_Get_Jump()

Function c_Gera_Key(wGrid,wOpcao,wColuna)
********************************************************************************
*                    Função para Gerar Chave de Pesquisa                       *
********************************************************************************
Local wx:=0,wKeyDbf,wG_KeyDbf,wKeySql,wG_KeySql,wM_ChaveDbf,wM_ChaveSql,wPos_Tabela:=0,wTColuna:=Space(00)
Local wXGrid,wIni,wFim,wN_Coluna:=0,wMelhor_NTX:=0,wxMIndice,wMX_Pesquisa[4],wM_OrderBy,wMatriz,wCont,wM_xColuna
Local wPos:=0,wConteudo,wPosX,wX_Key_Col,wy,wTam,wDec,wz,wXOrder:=00,wOrderBy,wM_Melhor_NTX,wwxx:=00,wxyz
Local wxLen1,wxLen2,wxLen3,wxLen4,wTab_Filter,wColSql

If Len(wM_Case)=0
   Return {"","",0,""}
EndIf

wKeyDbf     := Space(00)
wG_KeyDbf   := Space(00)
wKeySql     := Space(00)
wG_KeySql   := Space(00)
wOrderBy    := Space(00)
wM_ChaveDbf := {}
wM_ChaveSql := {}
wxMIndice   := {}
wM_OrderBy  := {}
wxLen1      := Len(wM_Case[wGrid][wCS_Coluna])

For wx:= 01 To wxLen1
   If wColuna = wCS_Key_Exc_Tp
      wX_Key_Col := ""
   Else
      wX_Key_Col := wM_Case[wGrid][wCS_Key_Col][wx]
   EndIf
   
   If cEmpty(wM_Case[wGrid][wCS_TabNome][wx])
   	wColSql := wM_Tab_Nome[wGrid]+"."+AllTrim(wM_Case[wGrid][wCS_Coluna][wx])
   Else
   	wColSql := AllTrim(wM_Case[wGrid][wCS_TabNome][wx])+"."+AllTrim(wM_Case[wGrid][wCS_Coluna][wx])
   EndIf

   If wOpcao = 1      // Chave do Grid
      If .Not.cEmpty(wM_Case[wGrid][wColuna][wx]) .And. wM_Case[wGrid][wColuna][wx]<>3
         If .Not.cEmpty(wX_Key_Col)
            wPos := At( "#" , wX_Key_Col)
            If wPos>0
               wPosX := At( "@" , wX_Key_Col)
               If wPosX>0
                  aAdd( wM_ChaveDbf , { SubStr(wX_Key_Col,1,wPos-1) , .T. , SubStr(wX_Key_Col,wPos+1) })
               Else
                  wMatriz := cStrToMatriz(wX_Key_Col,"#")
                  For wwxx := 01 To Len(wMatriz)
                     aAdd( wM_ChaveDbf , { wMatriz[wwxx] , .T. ,})
                     If wwxx > 1
                        aAdd( wM_ChaveSql , { wColSql , wM_Case[wGrid][wColuna][wx] })
                     EndIf   
                  Next
               EndIf
            Else
               aAdd( wM_ChaveDbf , {wX_Key_Col , .T. , })
            EndIf   
         Else
            aAdd( wM_ChaveDbf , {wM_Case[wGrid][wCS_Coluna] [wx] , .F. , })
         EndIf   
         aAdd( wM_ChaveSql , { wColSql , wM_Case[wGrid][wColuna][wx] })
      EndIf
      wXOrder := iIf(cEmpty(wM_Case[wGrid][wCS_GridOrder][wx]),0,wM_Case[wGrid][wCS_GridOrder][wx])
      If wXOrder>0
         aAdd( wM_OrderBy, {wM_Case[wGrid][wCS_Coluna][wx] , wM_Case[wGrid][wCS_GridOrder][wx] , wM_Case[wGrid][wCS_GridOrderTp][wx]} )
      EndIf
   Else               // Chave do Item
      If .Not.cEmpty(wM_Case[wGrid][wColuna][wx]) .And. wM_Case[wGrid][wColuna][wx]<>2
         If .Not.cEmpty(wX_Key_Col) .And. wM_Case[wGrid][wColuna][wx]<>05 .And. wM_Case[wGrid][wColuna][wx]<>06
            wPos := AT( "#" , wX_Key_Col)
            If wPos>0
               aAdd( wM_ChaveDbf , { SubStr(wX_Key_Col,1,wPos-1) , .T. , SubStr(wX_Key_Col,wPos+1) })
            Else
               aAdd( wM_ChaveDbf , {wX_Key_Col , .T. , })
            EndIf   
         Else
            aAdd( wM_ChaveDbf , {wM_Case[wGrid][wCS_Coluna] [wx] , .F. , })
         EndIf
         aAdd( wM_ChaveSql , { wColSql , wM_Case[wGrid][wColuna][wx] })
      EndIf
   EndIf
   If wM_Case[wGrid][wColuna][wx]>0
      aAdd( wxMIndice   , { wM_Case[wGrid][wCS_Coluna][wx] , wM_Case[wGrid][wCS_Conteudo][wx] , wM_Case[wGrid][wCS_Conteudo][wx] , wM_Case[wGrid][wCS_Coluna][wx] })
   EndIf   
Next

wXgrid     := wGrid
wy         := 00
wCont      := 00
wM_xColuna := {}
wxLen2     := Len(wM_ChaveDbf)

For wy := 01 To wxLen2
   wxLen3 := Len(wM_Tab_Nome)
   For wz := 01 To wxLen3
      If cEmpty(wM_Tab_Nome[wz])
         Loop
      EndIf
      If wM_ChaveDbf[wy,02] = .T.
         wN_Coluna := cNC(wM_ChaveDbf[wy,01],wz,.F.,"c_Gera_Key")
         wGrid     := wz
         If wGrid >= wXGrid
            Exit
         EndIf
      Else
         wGrid     := wXGrid
         wN_Coluna := cNC(wM_ChaveDbf[wy,01],wGrid,.F.,"c_Gera_Key")
      EndIf
      If wN_Coluna = 0
         Loop
      EndIf

      If     wM_Case[wGrid][wCS_TypeVar,wN_Coluna] = "N"
         wTam   := Len(wM_Case[wGrid][wCS_Picture,wN_Coluna])
         wDec   := At( "." , wM_Case[wGrid][wCS_Picture,wN_Coluna] )
         If wDec<>0
            wDec:= wTam - wDec
         EndIf
         If ValType(wM_Case[wGrid][wCS_Conteudo,wN_Coluna])<>"N"
            wM_Case[wGrid][wCS_Conteudo,wN_Coluna] := 0
         EndIf
         wKeyDbf := Str(wM_Case[wGrid][wCS_Conteudo,wN_Coluna],wTam,wDec)
      ElseIf wM_Case[wGrid][wCS_TypeVar,wN_Coluna] = "C"
         wKeyDbf := wM_Case[wGrid][wCS_Conteudo,wN_Coluna]
      ElseIf wM_Case[wGrid][wCS_TypeVar,wN_Coluna] = "D"
         wKeyDbf := DtoS(wM_Case[wGrid][wCS_Conteudo,wN_Coluna])
      EndIf
      If .Not.cEmpty(wM_Case[wGrid][wCS_Conteudo,wN_Coluna])
         wKeySql  := Space(00)
         wTColuna := Space(00)

         wConteudo := wM_Case[wGrid][wCS_Conteudo,wN_Coluna]
         If wM_Case[wGrid][wCS_Formato,wN_Coluna] >= 30 .And. wM_Case[wGrid][wCS_Formato,wN_Coluna] <= 39  // COMBOBOX
            wPosX  := At("-",wConteudo)-1
            If wPosX>0
               wConteudo := SubStr(wConteudo,1,wPosX)
            EndIf
         EndIf
         If cEmpty(wM_ChaveDbf[wy,03])
            If     wM_ChaveSql[wy,02]=4
               wKeySql := wM_ChaveSql[wy,01] + " Like " + Campo( "%"+iIf(ValType(wConteudo)="C",AllTrim(wConteudo),wConteudo)+"%" ,wM_Case[wGrid][wCS_TypeVar,wN_Coluna]) 
            ElseIf wM_ChaveSql[wy,02]=5
               wKeySql := wM_ChaveSql[wy,01] + " Not Like " + Campo( "%"+iIf(ValType(wConteudo)="C",AllTrim(wConteudo),wConteudo)+"%" ,wM_Case[wGrid][wCS_TypeVar,wN_Coluna]) 
            ElseIf wM_ChaveSql[wy,02]=6
               wKeySql := wM_ChaveSql[wy,01] + " Like " + Campo( iIf(ValType(wConteudo)="C",AllTrim(wConteudo),wConteudo)+"%" ,wM_Case[wGrid][wCS_TypeVar,wN_Coluna]) 
            ElseIf wM_ChaveSql[wy,02]=7
               wKeySql := "(" + wM_ChaveSql[wy,01] + " > " + Campo( wConteudo , "N" ) + " And " + wM_ChaveSql[wy,01] + " < " + Campo( wConteudo+1 , "N" ) + ")"
            ElseIf wM_ChaveSql[wy,02]=8
               wKeySql := "(" + wM_ChaveSql[wy,01] + " >= " + Campo( wConteudo , "N" ) + " And " + wM_ChaveSql[wy,01] + " < " + Campo( wConteudo+1 , "N" ) + ")"
            ElseIf wM_ChaveSql[wy,02]=9
               wKeySql := "("+wM_ChaveSql[wy,01]+" Like " + Campo(wConteudo+".%") + " And " + wM_ChaveSql[wy,01]+" = "+Campo(wConteudo) + ")"
            Else
                wKeySql := wM_ChaveSql[wy,01] + "=" + Campo(iIf(ValType(wConteudo)="C",AllTrim(wConteudo),wConteudo),wM_Case[wGrid][wCS_TypeVar,wN_Coluna])
            EndIf
         Else
            wPos := At( "@" , wM_ChaveDbf[wy,03] )
            wIni := SubStr(wM_ChaveDbf[wy,03],1,wPos-1)
            wFim := SubStr(wM_ChaveDbf[wy,03],wPos+1)
            wIni := iIf(cEmpty(wIni),"",&wIni)
            wFim := iIf(cEmpty(wFim),"",&wFim)
            wConteudo := wIni + wConteudo + wFim
            If     wM_ChaveSql[wy,02]=4
               wKeySql := wM_ChaveSql[wy,01] + " Like " + Campo("%"+AllTrim(wConteudo)+"%")
            ElseIf wM_ChaveSql[wy,02]=5
               wKeySql := wM_ChaveSql[wy,01] + " Not Like " + Campo("%"+AllTrim(wConteudo)+"%")
            ElseIf wM_ChaveSql[wy,02]=6
               wKeySql := wM_ChaveSql[wy,01] + " Like " + Campo(AllTrim(wConteudo)+"%")
            ElseIf wM_ChaveSql[wy,02]=7
               wKeySql := "(" + wM_ChaveSql[wy,01] + " > " + Campo( wConteudo , "N" ) + " And " + wM_ChaveSql[wy,01] + " < " + Campo( wConteudo+1 , "N" ) + ")"
            ElseIf wM_ChaveSql[wy,02]=8
               wKeySql := "(" + wM_ChaveSql[wy,01] + " >= " + Campo( wConteudo , "N" ) + " And " + wM_ChaveSql[wy,01] + " < " + Campo( wConteudo+1 , "N" ) + ")"
            ElseIf wM_ChaveSql[wy,02]=9   // CICERO
               wKeySql := "(" + wM_ChaveSql[wy,01] + " Like " + Campo(wConteudo+".%") + " And " + wM_ChaveSql[wy,01] + " = " + Campo(wConteudo) + ")"
            Else
               wKeySql := wM_ChaveSql[wy,01] + "=" + Campo(wConteudo)
            EndIf
         EndIf  
         wTColuna := Upper(wM_ChaveSql[wy,01])
      EndIf   
      wPos := cScan( wxMIndice , wM_ChaveSql[wy,01] , 01 )
      If wPos>0
         wxMIndice[wPos,2] := wM_Case[wGrid][wCS_Conteudo,wN_Coluna]
      EndIf
   Next
   If .Not.cEmpty(wKeyDbf)
      wG_KeyDbf := wG_KeyDbf + wKeyDbf
   EndIf
   If cScan( wM_xColuna , wTColuna ) = 0
      aAdd( wM_xColuna , wTColuna )
      wG_KeySql := wG_KeySql + iIf(.Not.cEmpty(wG_KeySql).And..Not.cEmpty(wKeySql)," .And. ","") + wKeySql
   EndIf
Next

wG_KeyDbf := "'" + wG_KeyDbf + "'"
If ValType(wM_Tab_Filter[wXgrid])<>"C"
   wM_Tab_Filter[wXgrid] := ""
EndIf   

wTab_Filter := AllTrim(wM_Tab_Filter[wXgrid])
wTab_Filter := StrTran(wTab_Filter,'"',"'")
wG_KeySql   := '"' + wG_KeySql + iIf(Len(Trim(wG_KeySql))>0.And.Len(wTab_Filter)>0," .And. ","") + wTab_Filter + '"'

wPos_Tabela := cScan( wM_Tabelas , wM_Tab_Nome[wXgrid] , 01 )
If  wPos_Tabela <> 0
   If wM_Tabelas[wPos_Tabela,2]="D"
      wM_Melhor_NTX := C_Melhor_Ntx(wM_Tab_Nome[wXgrid],wxMIndice)
      wMelhor_NTX   := wM_Melhor_NTX[1]
   EndIf   
EndIf
If Len(wM_OrderBy)<>0
   aSort( wM_OrderBy ,,,{|x,y| x[2] < y[2] })   // ordena as colunas em ordem CRESCENTE
EndIf   
wx := 00
wxLen4 := Len(wM_OrderBy)
For wx := 01 to wxLen4
    wOrderBy := wOrderBy + iIf(Len(wOrderBy)<>0,",","") + wM_OrderBy[wx,01] +" "+ wM_OrderBy[wx,03] // Coluna
Next

wMX_Pesquisa[1] := wG_KeyDbf
wMX_Pesquisa[2] := wG_KeySql
wMX_Pesquisa[3] := wMelhor_NTX
wMX_Pesquisa[4] := wOrderBy

Return wMX_Pesquisa
*fim Function c_Gera_Key()

Function cN_Fld(wFld,wDialog,wWhen)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wReturn , wx:=0

If ValType(wWhen)<>"L"
   If cEmpty(wDialog)
      wReturn := oM_Fld[wFld]
   Else
      If wDialog <= Len(oM_Fld[wFld]:aDialogs)
         wReturn := oM_Fld[wFld]:aDialogs[wDialog]
      EndIf
   EndIf
   Return wReturn
Else   
   If ValType(wWhen)="L"
      If cEmpty(wFld) .Or. cEmpty(wDialog)
         cCancel("Faltam parâmetros na função cN_FLD() quando usado para a claüsula WHEN !")
      EndIf
      If wDialog > Len(oM_Fld[wFld]:aDialogs)
         return .f.
      EndIf
      If oM_Fld[wFld]:aPrompts[ oM_Fld[wFld]:nOption ] == wM_Folder[wFld,wFld_Leg_Stru][wDialog]
         Return wWhen
      Else
         Return .Not.wWhen
      EndIf   
   EndIf
EndIf

Return Nil
*fim da Function cN_Fld(wFld,wDialog)

Function fObj_Load(wObjeto,wPropriedade)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wResp , wReturn , wKeySql

If .Not.cEmpty(wPropriedade)
   wPropriedade := Upper(AllTrim(wPropriedade))
   wKeySql := "Obj_Nome = " + Campo(wObjeto) + " .And. Prp_Nome = " + Campo(wPropriedade)
   wResp   := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr"},wKeySql)
   If Len(wResp)<>0
      If .Not.cEmpty(wResp[01,01])
         wReturn := AllTrim(wResp[01,01])
      Else
         wReturn := Space(00)
      EndIf   
   EndIf
Else
   wKeySql := "Obj_Nome = " + Campo(wObjeto)
   wResp   := fConsulta2("cCase_Obj_Prp",{"Prp_Nome","Obj_Prp_Vlr"},wKeySql)
   If Len(wResp)<>0
      wReturn := wResp
   Else
      wReturn := {}
   EndIf
EndIf

Return( wReturn )
*fim da Function fObj_Load(wObjeto,wPropriedade)

Function fObj_LoadAll(wObjeto)
*******************************************************************************
*  Função que Busca e Carrega os Objetos ( Pai e Filhos diretos e Indiretos ) *
*******************************************************************************
Local wResp, wReturn, wKey, wx:=00 , wObjNome := Space(00) , wWhere

   *---------------------------------Variaveis cCase -----------------------------*                          
// Private oM_Dlg := {}
// Private oM_Fld[20]
// Public  oM_Brw [20]             // Matrix para o objeto Browser
// Public  oM_Brw := {}            // Matrix para o objeto Browser
// Public  oM_Brw_Say[20]          // Matrix para o objeto SAY de pesquisa no browse
// Public  wM_BrwLin := {}           // Numero da linha atual no folder (x)
// Public  wM_Grid[20,0,0]         // Matrix multidimensional para os dados do Browse                         
// Public  wM_Grid_Order[20,0]     // Ordem de ClassIficacao da Coluna (x) (.t. Ascendente)  (.f. Descendente)
// Public  wM_Grid_Col_Order[20]   // Numero da Coluna do Grid que esta ClassIficada                          
// Public  wM_Grid_Seq[03]         // Matrix com InFormações referentes ao Grid                               
// Public  __wKeySeek                // Contem as teclas pressionadas no grid que sera pesquisado na coluna     
// Public  __wKeyAcento := 00        // contém a œltima tecla de acento pressionada   
// Public  wM_Case    := {} 
// Private wM_Folder[20,07,00]     // Matrix multidimensional para os dados do Folder                         
// Private wTab_Setup [20]         // Configurações Gerais da Tabela para Gravar - irÿ acabar
// Private wM_Tab_Nome [20]        // contém a Tabela que será usada             - irÿ acabar                             
// Private wM_Tab_Filter[20]       // Filtro da Tabela                           - irÿ acabar                             
// Private wM_Work[10]             // Variaveis de WORK
// Private wM_Dominio    := {}     // Matrix multidimensional para o dominio
// Private oM_Button[00]           // Objetos do Botão                                                        
// Private wc_Case_Seq   := 00                                                                                    

   fObj_Execute(AllTrim(wObjeto))

Return( .T. )
*fim da Function fObj_LoadAll(wObjeto)

Function fObj_Execute(wObjeto)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wPos , wResp , wWhere , wTipo_Objeto

wTipo_Objeto := "FRM"

If .Not.cEmpty(wObjeto)
   wPos := cScan( wM_Objeto , wObjeto ,01 )             // VerIfica na Matriz de Objetos se este já está atribuido
   If wPos = 0 
      If .not. cEmpty(wTipo_Objeto)
         wWhere := "Obj_Nome = " + Campo(Trim(wObjeto),"C")
         wResp  := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Tp"},wWhere,"Obj_Seq")  
         If Len(wResp) = 0 
            cCancel("Objeto " + wObjeto + " não cadastrado")
         EndIf
         wTipo_Objeto := wResp[1,2]
      EndIf
      aAdd(wM_Objeto,{wObjeto,wTipo_Objeto,Space(00),Space(00),0    })
      wPos := Len(wM_Objeto)
   EndIf
   wM_Objeto[wPos,3] := dtoc(cDate()) + " " +cTime()   // Data e Hora da ultima utilizacao                    cCase_Obj.Obj_Util_Dt
   wM_Objeto[wPos,4] := wc_User                        // Usuario da ultima utilizacao                        cCase_Obj.Obj_Util_Usr
   wM_Objeto[wPos,5] := wM_Objeto[wPos,5] + 1          // Quantidade de vezes que o objeto foi utilizado      cCase_Obj.Obj_Util_Qtd
EndIf

cCaseMatrix(wObjeto)

Return( .T. )
*fim da Function fObj_Execute(wObjeto)

Function cwInicial(wObj_Nome)
******************************************************************************
*          funcao para Limpar as variaveis ao iniciar os programas           *
******************************************************************************
Local wx , wLenDlg , wxLen

//   cCaseLog("EXEC",wc_FRM_Act,"cInicial()#"+wc_Prog[Len(wc_Prog)])      // ciceroX

   CursorWait()
   wLenDlg := Len(oM_Dlg)
   aAdd( wM_Opcao , "consul" )
   If wLenDlg>1
      fGrid_Ant( wM_Grid_Seq[wG_Atual] ,wLenDlg-1, )
      fGrid_Ant( wM_Grid_Seq[wG_Atual] ,, .T. )
      wM_Grid_Seq[wG_Anterior] := m->wM_Grid_Seq[wG_Atual]

      wxLen := Len(oM_BtnCombo)
      For wx:= 01 To wxLen
         oM_BtnCombo[wx][1]:Disable()
      Next
   Else
      aAdd( wM_Grid_Ant , {} )
      wWhenMenuItem  := .F.
      aAdd( m->wM_Grid_Seq , 01 )
      aAdd( m->wM_Grid_Seq , 01 )
      aAdd( m->wM_Grid_Seq , 00 )
   EndIf
   *-------------------------------------------------------------------------------*                          
   cursorarrow()
Return .T.
*fim da Function cwInicial()

Function cwFinal(wObj_Nome)
******************************************************************************
*          funcao para Limpar as variaveis ao fechar os programas            *
******************************************************************************
Local wPath, aFile , wx , wData , wSql ,wxLen , wy , wz

//cCaseLog("EXEC",wc_FRM_Act,"cFinal()#"+wc_Prog[Len(wc_Prog)])      // ciceroX

*------------Atualiza estatistica de utilizacao de objetos----------------------------*
wxLen := Len(wM_objeto)
For wx:= 01 to wxLen
//  fUpDate( "cCase_Obj" ,, "Obj_Nome = " + Campo(wM_Objeto[wx,1]) ,,{ "Obj_Util_Dt",wM_Objeto[wx,3] , "Obj_Util_Usr",wM_Objeto[wx,4] , "Obj_Util_Qtd" ,"Obj_Util_Qtd + " + campo(wM_Objeto[wx,5],"N") })
/// wData := SubStr(wM_Objeto[wx,3],7,4) + SubStr(wM_Objeto[wx,3],4,2) + SubStr(wM_Objeto[wx,3],1,2) + " " + SubStr(wM_Objeto[wx,3],12,8) 
/// wSql  := "Update cCase_Obj Set "    
/// wSql  := wSql + " Obj_Util_Dt  = DATE_ForMAT('" + wData + "','%Y%m%d %H%i%S') ,"        // Data e Hora da ultima utilizacao                    cCase_Obj.Obj_Util_Dt
/// wSql  := wSql + " Obj_Util_Usr = " + Campo(wM_Objeto[wx,4]) + ","                 // Usuario da ultima utilizacao                        cCase_Obj.Obj_Util_Usr
/// wSql  := wSql + " Obj_Util_Qtd = Obj_Util_Qtd + " + Campo(wM_Objeto[wx,5],"N")    // Quantidade de vezes que o objeto foi utilizado      cCase_Obj.Obj_Util_Qtd
/// wSql  := wSql + " Where Obj_Nome = " + Campo(wM_Objeto[wx,1])
/// cSql_Execute("cCase_Obj", wSql)
    wM_Objeto[wx,5] := 0  // Zera a quantidade de vezes que o objeto foi utilizado 
Next
*-------------------------------------------------------------------------------------*

//oM_Dlg[1]:aControls:={}
//oM_Dlg[1]:End()
//oM_Dlg[1]:= nil

For wx := 1 To Len(wM_Case)
   wy :=0
   For wy := 01 To Len(wM_Case[wx,wCS_ObjGet])
      If ValType(wM_Case[wx,wCS_ObjGet,wy])="O"

         If wM_Case[wx,wCS_Formato,wy]= 95
            wM_Case[wx,wCS_ObjGet,wy]:End()
            wM_Case[wx,wCS_ObjGet,wy]:=nil
            Loop
         EndIf

         If Upper(wM_Case[wx,wCS_ObjGet,wy]:classname) = "TRADMENU"
            For wz := 01 To Len(wM_Case[wx,wCS_ObjGet,wy]:aItems)
               wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:End()
               wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:=nil
            Next
         Else
            wM_Case[wx,wCS_ObjGet,wy]:bValid := nil
            wM_Case[wx,wCS_ObjGet,wy]:End() 
            wM_Case[wx,wCS_ObjGet,wy]:Destroy() 
            wM_Case[wx,wCS_ObjGet,wy]:= nil 
         EndIf
      EndIf
      If ValType(wM_Case[wx,wCS_ObjCab,wy])="O"
         wM_Case[wx,wCS_ObjCab,wy]:End()
         wM_Case[wx,wCS_ObjCab,wy]:Destroy()
         wM_Case[wx,wCS_ObjCab,wy]:= nil
      EndIf
   Next

   If ValType(oM_Brw[wx])="O"
      oM_Brw[wx]:End() 
      oM_Brw[wx]:Destroy() 
      oM_Brw[wx]:= nil 
      oM_Brw_Say[wx]:End()
      oM_Brw_Say[wx]:Destroy()
      oM_Brw_Say[wx]:= nil
   EndIf
Next

For wx := 1 To Len(oM_Button)
   oM_Button[wx]:End() 
   oM_Button[wx]:Destroy() 
   oM_Button[wx]:= nil 
Next

For wx := 1 To Len(oM_BtnCombo)
   oM_BtnCombo[wx,1]:End()
   oM_BtnCombo[wx,1]:Destroy()
   oM_BtnCombo[wx,1]:= nil 
Next

For wx := 1 To Len(oM_Say)
   If oM_Say[wx]:classname <> "TSAY"
      oM_Say[wx]:bValid := nil
   EndIf
   oM_Say[wx]:End() 
   oM_Say[wx]:= nil 
Next

For wx := 1 To Len(oM_Fld)
   oM_Fld[wx]:Destroy()
   oM_Fld[wx]:= nil 
Next

oM_Dlg            := {}
oM_Say            := {}
oM_BtnCombo       := {}
oM_Button         := {}       // Objetos do Botão
oM_BtnAcs         := {}       // Objetos do Botão
oM_Fld            := {}
oM_Brw            := {}       // Matrix para o objeto Browser
oM_Brw_Say        := {}       // Matrix para o objeto SAY de pesquisa no browse

wM_Opcao          := {}
wM_Dlg            := {}
wM_BrwLin         := {}       // Numero da linha atual no folder (x)
wM_Grid           := {}       // Matrix multidimensional para os dados do Browse                         
wM_Grid_Order     := {}       // Ordem de ClassIficacao da Coluna (x) (.t. Ascendente)  (.f. Descendente)
wM_Grid_Col_Order := {}       // Numero da Coluna do Grid que esta ClassIficada                          
wM_Case_Col_Order := {}       // Numero da Coluna do Grid que esta ClassIficada                          
wM_Case           := {}       //
wM_Folder         := {}       //
wTab_Setup        := {}       // Configurações Gerais da Tabela para Gravar - irÿ acabar
wM_Tab_Nome       := {}       // contém a Tabela que será usada             - irÿ acabar                             
wM_Tab_Filter     := {}       // Filtro da Tabela                           - irÿ acabar                             
wM_Tab_PosFnc     := {}
wM_Fld_Atual      := {}
wM_Fld_Ant        := {}
wMBrwSTRCampos    := {}
wMBrwCabeca       := {}
wMBrwColSize      := {}
wMBrwColAlinha    := {}
wMBrwCampos       := {}
wMFunc_Atrib      := {}
wMFunc_Refresh    := {}
wMFunc_DbClick    := {}
wMFunc_Change     := {}
wMFunc_ClrGTxt    := {}
wMFunc_ClrSTxt    := {}
wMGrid_Col        := {}
wMCase_Col        := {}
wM_Grid_Seq       := {}     // Matrix com InFormações referentes ao Grid                               
wM_Control        := {}
wM_Grid_Cursor    := {}
wM_Grid_Ant       := {}
wc_Prog           := {}
wc_FRM_Act        := "cCaseMenu"  // cicerox
__wKeySeek        := ""           // Contem as teclas pressionadas no grid que sera pesquisado na coluna     
__wKeyAcento      := 00           // contém a œltima tecla de acento pressionada   
wWhenMenuItem     := .T.
wFLd_Num_Obj      := 01
wc_Case_Seq       := 00
__wc_FRM          := 00

__wMCase_FRM      := {}
__wMCase_Obj      := {}

//__MVRELEASE() 
//RELEASE ALL

*---------------Elimina os DBF‹s temporarios criados pela TdbOdbcDirect------------------*
wPath := GetEnv("TEMP") + "\"
aFile := LFNDIRECTORY( wPath+"*.db"+CHR(63))
wxLen := Len(aFile)
For wx:= 01 to wxLen
   fErase(wPath + aFile[wx,F_NAME] )
Next
*----------------------------------------------------------------------------------------*

Return .T.
*fim da Function cwFinal()

Function cwReLogin()
*************************************************************************************************
*                                      Re-Login do Sistema                                      *
*************************************************************************************************

   Winexec("ccase.exe")

   cwFinal()
   oM_WinMain[1]:End()

Return nil
*fim da Function cwReLogin()

Function __fCase_Grid(wMatriz) //cObj_Grid(wMatriz)
*****************************************************************************************************
*                                                                                                   *
*****************************************************************************************************
Local wObjRef,wObjDesloc,wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wWhen,wbChange,wPrp_Nome,wGrid_Tp,wPos_Fnc,wObj
Local wDuploClick,wrClick,wGeraConteudo,wTipo_When,wTipo_Atualiza,wTipo_Exclusao,wTab_Nome,wTab_Filter,wGrid_Rel_Lst
Local wRowNum,wx,wAux_Function,wXFuncion,wChave,wCol_Nome,wSeparador,wxLen,wClrGTxt,wClrSTxt,wPos,wCliente

   wxLen := Len(wMatriz)
   For wx:= 01 To wxLen
      CursorWait()
      wMatriz[wx,01] := Upper(AllTrim(wMatriz[wx,01]))
      wPrp_Nome      := wMatriz[wx,01]
      If     wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef        := wMatriz[wx,02]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
         wObjDesloc     := wMatriz[wx,02]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wLinDesloc     := wMatriz[wx,02]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wColDesloc     := wMatriz[wx,02]
      ElseIf wPrp_Nome == "QTD_LINHAS"
         wQtdLin        := wMatriz[wx,02]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
         wQtdCol        := wMatriz[wx,02]
      ElseIf wPrp_Nome == "PRE_FNC"
         wWhen          := wMatriz[wx,02]
      ElseIf wPrp_Nome == "POS_FNC"
         wPos_Fnc       := wMatriz[wx,02]
      ElseIf wPrp_Nome == "BCHANGE"
         wbChange       := wMatriz[wx,02]
      ElseIf wPrp_Nome == "DUPLOCLICK"
         wDuploClick    := wMatriz[wx,02]
      ElseIf wPrp_Nome == "RCLICK"
         wrClick        := wMatriz[wx,02]
      ElseIf wPrp_Nome == "GERACONTEUDO"
         wGeraConteudo  := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TIPO_WHEN"
         wTipo_When     := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TIPO_ATUALIZACAO"
         wTipo_Atualiza := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TIPO_EXCLUSAO"
         wTipo_Exclusao := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TIPO_GRID"
         wGrid_Tp       := wMatriz[wx,02]
      ElseIf wPrp_Nome == "GRID_REL_LST"
         wGrid_Rel_Lst  := wMatriz[wx,02]                         
      ElseIf wPrp_Nome == "AUX_FUNCTION"
         wAux_Function  := wMatriz[wx,02]
      ElseIf wPrp_Nome == "CONTEUDO_INICIAL"
         wRowNum        := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TAB_NOME"
         wTab_Nome      := wMatriz[wx,02]
      ElseIf wPrp_Nome == "TAB_FILTER"
         wTab_Filter    := wMatriz[wx,02]
      ElseIf wPrp_Nome == "IDX_NOME"
         wChave         := wMatriz[wx,02]
      ElseIf wPrp_Nome == "COLORGRID"
         wClrGTxt       := wMatriz[wx,02]
      ElseIf wPrp_Nome == "COLORLINE"
         wClrSTxt       := wMatriz[wx,02]
      EndIf
   Next

   For wx:= 01 To wxLen
      wPrp_Nome := wMatriz[wx,01]
      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If     wPrp_Nome == "OBJETO_REFERENCIA"
               wObjRef        := wMatriz[wx,02]
            ElseIf wPrp_Nome == "OBJETO_DESLOC"
               wObjDesloc     := wMatriz[wx,02]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
               wLinDesloc     := wMatriz[wx,02]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
               wColDesloc     := wMatriz[wx,02]
            ElseIf wPrp_Nome == "QTD_LINHAS"
               wQtdLin        := wMatriz[wx,02]
            ElseIf wPrp_Nome == "QTD_COLUNAS"
               wQtdCol        := wMatriz[wx,02]
            ElseIf wPrp_Nome == "PRE_FNC"
               wWhen          := wMatriz[wx,02]
            ElseIf wPrp_Nome == "POS_FNC"
               wPos_Fnc       := wMatriz[wx,02]
            ElseIf wPrp_Nome == "BCHANGE"
               wbChange       := wMatriz[wx,02]
            ElseIf wPrp_Nome == "DUPLOCLICK"
               wDuploClick    := wMatriz[wx,02]
            ElseIf wPrp_Nome == "RCLICK"
               wrClick        := wMatriz[wx,02]
            ElseIf wPrp_Nome == "GERACONTEUDO"
               wGeraConteudo  := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TIPO_WHEN"
               wTipo_When     := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TIPO_ATUALIZACAO"
               wTipo_Atualiza := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TIPO_EXCLUSAO"
               wTipo_Exclusao := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TIPO_GRID"
               wGrid_Tp       := wMatriz[wx,02]
            ElseIf wPrp_Nome == "GRID_REL_LST"
               wGrid_Rel_Lst  := wMatriz[wx,02]
            ElseIf wPrp_Nome == "AUX_FUNCTION"
               wAux_Function  := wMatriz[wx,02]
            ElseIf wPrp_Nome == "CONTEUDO_INICIAL"
               wRowNum        := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TAB_NOME"
               wTab_Nome      := wMatriz[wx,02]
            ElseIf wPrp_Nome == "TAB_FILTER"
               wTab_Filter    := wMatriz[wx,02]
            ElseIf wPrp_Nome == "IDX_NOME"
               wChave         := wMatriz[wx,02]
            ElseIf wPrp_Nome == "COLORGRID"
               wClrGTxt       := wMatriz[wx,02]
            ElseIf wPrp_Nome == "COLORLINE"
               wClrSTxt       := wMatriz[wx,02]
            EndIf
         EndIf
      EndIf
   Next

   wTipo_When     := iIf(ValType(wTipo_When)    <>"C",00 ,Val(wTipo_When)           )
   wTipo_Atualiza := iIf(ValType(wTipo_Atualiza)<>"C",00 ,Val(wTipo_Atualiza)       )
   wTipo_Exclusao := iIf(ValType(wTipo_Exclusao)<>"C",00 ,Val(wTipo_Exclusao)       )
   wGrid_Rel_Lst  := iIf(ValType(wGrid_Rel_Lst) <>"C","" ,Trim(wGrid_Rel_Lst)       )
   wGrid_Tp       := iIf(cEmpty(wGrid_Tp)            ,00 ,Val(wGrid_Tp)             )
   wRowNum        := iIf(cEmpty(wRowNum)             ,"" ,Val(wRowNum)              )
   wGeraConteudo  := iIf(cEmpty(wGeraConteudo)       ,"N",Upper(Trim(wGeraConteudo)))
   wGeraConteudo  := iIf(wGeraConteudo="S"           ,.T.,.F.                       )
   wTab_Nome      := iIf(ValType(wTab_Nome)     <>"C","" ,AllTrim(wTab_Nome)        )
   wTab_Filter    := iIf(ValType(wTab_Filter)   <>"C","" ,AllTrim(wTab_Filter)      )
   wChave         := iIf(ValType(wChave)        <>"C","" ,Lower(AllTrim(wChave))    )
   wAux_Function  := iIf(ValType(wAux_Function) <>"C","" ,AllTrim(wAux_Function)    )
   wCol_Nome      := iIf(ValType(wCol_Nome)     <>"C","" ,Lower(AllTrim(wCol_Nome)) )
   wSeparador     := SubStr(wCol_Nome,Len(wCol_Nome))
   wCol_Nome      := SubStr(wCol_Nome,1,Len(wCol_Nome)-1)
   wClrGTxt       := iIf(ValType(wClrGTxt)    <>"C","" ,AllTrim(wClrGTxt)       )
   wClrSTxt       := iIf(ValType(wClrSTxt)    <>"C","" ,AllTrim(wClrSTxt)       )

   aAdd( wM_Tab_Nome   , wTab_Nome   )
   aAdd( wM_Tab_Filter , wTab_Filter )
   aAdd ( wTab_Setup , { wTipo_Atualiza , wTipo_Exclusao , wGrid_Rel_Lst } )
   wObj := __fCase_Grid_Monta(wObjRef , wObjDesloc , wLinDesloc , wColDesloc , wQtdLin , wQtdCol , wTipo_When , wWhen , wPos_Fnc , wGeraConteudo , wDuploClick , wrClick , wbChange , wGrid_Tp , "" , wRowNum , wChave , wCol_Nome , wSeparador , wAux_Function,wClrGTxt,wClrSTxt)  //  Funcao cCase (wM_Case)  para montar o c_Grid
   If wxLen>0
      __fSuper_AddObj(wMatriz[1,3],"GRD",wc_Case_Seq,wObj)
   EndIf

   wx:=00
   wxLen := Len(wM_Case[wc_Case_Seq,wCS_TabNome])
   For wx:= 01 To wxLen
      If cEmpty(wM_Case[wc_Case_Seq,wCS_TabNome,wx])
         wM_Case[wc_Case_Seq,wCS_TabNome,wx] := wTab_Nome
      EndIf
   Next
   cursorarrow()

Return .t.
*Fim da Function __fCase_Grid(wMatriz) //cObj_Grid(wMatriz)

Function __fCase_Button(wMatriz)
************************************************************************************************
*                       Função de busca para as Propriedades do Botão                          *
************************************************************************************************
Local wWhere,wObjRef,wObjDesloc,wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wPrompt,wImagem,wToolTip,wRestricao
Local wOpcButton,wPre_Fnc,wPos_Fnc,wObj_Nome,wx,wxx,wPrp_Nome,wCancel,wxLen,wCliente,wAcesso,wPos,wObj

   Store Space(00) To wObjRef,wObjDesloc,wPrompt,wImagem,wToolTip,wPre_Fnc,wPos_Fnc,wCancel,wAcesso
   Store "00"      To wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wOpcButton              

   wxLen := Len(wMatriz)
   For wx:= 01 To wxLen
      cursorwait()
      wPrp_Nome := Upper(AllTrim(wMatriz[wx,02]))
      If     wPrp_Nome == "OBJETO_REFERENCIA"
          wObjRef    := wMatriz[WX,03]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
          wObjDesloc := wMatriz[WX,03]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
          wLinDesloc := wMatriz[WX,03]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
          wColDesloc := wMatriz[WX,03]
      ElseIf wPrp_Nome == "QTD_LINHAS"
          wQtdLin    := wMatriz[WX,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
          wQtdCol    := wMatriz[WX,03]
      ElseIf wPrp_Nome == "PROMPT"
          wPrompt    := wMatriz[WX,03]
      ElseIf wPrp_Nome == "IMAGEM"
          wImagem    := wMatriz[WX,03]
      ElseIf wPrp_Nome == "TOOLTIP"
          wToolTip   := wMatriz[WX,03]
      ElseIf wPrp_Nome == "OPC_BUTTON"
          wOpcButton := wMatriz[WX,03]
      ElseIf wPrp_Nome == "PRE_FNC"
          wPre_Fnc   := wMatriz[WX,03]
      ElseIf wPrp_Nome == "POS_FNC"
          wPos_Fnc   := wMatriz[WX,03]
      ElseIf wPrp_Nome == "INDEPENDENTE"
          wCancel    := wMatriz[wX,03]
      ElseIf wPrp_Nome == "ACESSO"
          wAcesso    := wMatriz[wx,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If     wPrp_Nome == "OBJETO_REFERENCIA"
                wObjRef    := wMatriz[WX,03]
            ElseIf wPrp_Nome == "OBJETO_DESLOC"
                wObjDesloc := wMatriz[WX,03]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
                wLinDesloc := wMatriz[WX,03]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
                wColDesloc := wMatriz[WX,03]
            ElseIf wPrp_Nome == "QTD_LINHAS"
                wQtdLin    := wMatriz[WX,03]
            ElseIf wPrp_Nome == "QTD_COLUNAS"
                wQtdCol    := wMatriz[WX,03]
            ElseIf wPrp_Nome == "PROMPT"
                wPrompt    := wMatriz[WX,03]
            ElseIf wPrp_Nome == "IMAGEM"
                wImagem    := wMatriz[WX,03]
            ElseIf wPrp_Nome == "TOOLTIP"
                wToolTip   := wMatriz[WX,03]
            ElseIf wPrp_Nome == "OPC_BUTTON"
                wOpcButton := wMatriz[WX,03]
            ElseIf wPrp_Nome == "PRE_FNC"
                wPre_Fnc   := wMatriz[WX,03]
            ElseIf wPrp_Nome == "POS_FNC"
                wPos_Fnc   := wMatriz[WX,03]
            ElseIf wPrp_Nome == "INDEPENDENTE"
                wCancel    := wMatriz[wX,03]
            ElseIf wPrp_Nome == "ACESSO"
                wAcesso    := wMatriz[wx,03]
            EndIf
         EndIf
      EndIf

      If wx < wxLen
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf
      If wObj_Nome <> wMatriz[wx,01] .or. cEmpty(wObj_Nome)
         wObjRef := iIf(cEmpty(wObjRef),"",&wObjRef)
         If ValType(wObjRef)<>"O"
            cCancel("Objeto de Referência não Informado no Objeto: " +  wObj_Nome)
         EndIf
         wPrompt    := AllTrim(wPrompt)
         wObjDesloc := iIf(cEmpty(wObjDesloc),"",&wObjDesloc)
         wLinDesloc := Val(wLinDesloc)
         wColDesloc := Val(wColDesloc)
         wQtdLin    := Val(wQtdLin)
         wQtdCol    := Val(wQtdCol)
         wOpcButton := Val(wOpcButton)
         wImagem    := Upper(AllTrim(wImagem))
         wCancel    := iIf(cEmpty(wCancel),"N",wCancel)
         wCancel    := iIf(wCancel="N",.F.,.T.)
         *------------------------------- BUTTON - Verifica Restrições do Perfil do Usuário---------------------------*
         wAcesso    := iif(ValType(wAcesso)="U","0",wAcesso)
         wRestricao := fACS_ChkRestricao("BTN",wMatriz[wx,01])
         wRestricao := iif(cEmpty(wRestricao),wAcesso,wRestricao)
         wRestricao := iif(cEmpty(wRestricao),"0",wRestricao)
         *------------------------------------------------------------------------------------------------------------*

         wObj := c_Button(,wObjRef,wObjDesloc,wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wPrompt,wImagem,wToolTip,wOpcButton,wPre_Fnc,wPos_Fnc,wCancel,wRestricao)

         __fSuper_AddObj(wMatriz[wx,01],"BTN",wx,wObj)

         Store Space(00) To wObjRef,wObjDesloc,wPrompt,wImagem,wToolTip,wPre_Fnc,wPos_Fnc,wCancel,wAcesso
         Store "00"      To wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wOpcButton
      EndIf
   Next
   CursorArrow()
Return .T.
*fim da Function __fCase_Button(wMatriz)

Function __fCase_Folder(wMFLD,wMFLT)
********************************************************************************************************************************
*                                  Função de busca para as Propriedades do Frame                                               *
********************************************************************************************************************************
Local wObjRef,wObjDesloc,wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wy,wx,wResposta,wxLen,wyLen,wPrp_Nome
Local wPos,wCliente,wAcesso,wMatrizFLD,wMatrizFLT,wObj

   wyLen := Len(wMFLD)

   For wy := 01 To wyLen
      wMatrizFLD := wMFLD[wy]
      wMatrizFLT := wMFLT[wy]

      wx := 00; wxLen := Len(wMatrizFLD)

      If wxLen>0
         aAdd( wM_Folder, {} )
         wResposta := __fCase_Folder_FLT(wMatrizFLT)
         wM_Folder[Len(wM_Folder)] := aTranspose(wResposta)
      EndIf

      For wx:= 01 To wxLen
         cursorwait()
         wMatrizFLD[wx,02] := Upper(AllTrim(wMatrizFLD[wx,02]))
         wPrp_Nome         := wMatrizFLD[wx,02]
         If     wPrp_Nome == "OBJETO_REFERENCIA"
             wObjRef    := wMatrizFLD[wx,03]
         ElseIf wPrp_Nome == "OBJETO_DESLOC"
             wObjDesloc := wMatrizFLD[wx,03]
         ElseIf wPrp_Nome == "LINHA_INICIAL"
             wLinDesloc := wMatrizFLD[wx,03]
         ElseIf wPrp_Nome == "COLUNA_INICIAL"
             wColDesloc := wMatrizFLD[wx,03]
         ElseIf wPrp_Nome == "QTD_LINHAS"
             wQtdLin    := wMatrizFLD[wx,03]
         ElseIf wPrp_Nome == "QTD_COLUNAS"
             wQtdCol    := wMatrizFLD[wx,03]
         EndIf
      Next
   
      For wx:= 01 To wxLen
         wPrp_Nome := wMatrizFLD[wx,02]
         wPos := At(".",wPrp_Nome)
         If wPos>0
            wCliente := SubStr(wPrp_Nome,wPos+1)
            wCliente := Val(wCliente)
            If wCliente == wc_cli
               wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
               If     wPrp_Nome == "OBJETO_REFERENCIA"
                   wObjRef    := wMatrizFLD[wx,03]
               ElseIf wPrp_Nome == "OBJETO_DESLOC"
                   wObjDesloc := wMatrizFLD[wx,03]
               ElseIf wPrp_Nome == "LINHA_INICIAL"
                   wLinDesloc := wMatrizFLD[wx,03]
               ElseIf wPrp_Nome == "COLUNA_INICIAL"
                   wColDesloc := wMatrizFLD[wx,03]
               ElseIf wPrp_Nome == "QTD_LINHAS"
                   wQtdLin    := wMatrizFLD[wx,03]
               ElseIf wPrp_Nome == "QTD_COLUNAS"
                   wQtdCol    := wMatrizFLD[wx,03]
               EndIf
            EndIf
         EndIf
      Next
   
      If .Not.cEmpty(wObjRef)
         wObjRef := iIf(ValType(wObjRef)<>"C","",&wObjRef          )
      Else
         cCancel("Objeto de Referência não Informado no Folder: " + Str(wM_Folder[Len(wM_Folder)]) )
      EndIf
      If .Not.cEmpty(wObjDesloc)
         wObjDesloc := iIf(ValType(wObjDesloc)<>"C","",&wObjDesloc )
      EndIf
   
      wLinDesloc := iIf(ValType(wLinDesloc)<>"C",00,Val(wLinDesloc))
      wColDesloc := iIf(ValType(wColDesloc)<>"C",00,Val(wColDesloc))
      wQtdLin    := iIf(ValType(wQtdLin)   <>"C",00,Val(wQtdLin)   )
      wQtdCol    := iIf(ValType(wQtdCol)   <>"C",00,Val(wQtdCol)   )

      wObj := c_Folder( wObjRef , wObjDesloc , Len(wM_Folder) , wM_Folder[Len(wM_Folder),wFld_Leg_Stru] , {wLinDesloc,wColDesloc,wQtdLin,wQtdCol} )
      If wxLen>0
         __fSuper_AddObj(wMatrizFLD[1,1],"FLD",wx,wObj)
      EndIf
      CursorArrow()

      For wx := 01 To Len(wResposta)
         __fSuper_AddObj(wResposta[wx,6],"FLT",wResposta[wx,7],wObj:aDialogs[wx])
      Next
   Next

Return .T.
*fim da Function __fCase_Folder(wMatrizFLD,wMatrizFLT)

Function __fCase_Folder_FLT(wMatriz)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wResp, wReturn, wKey, wx:=00 ,wxx , wObj_Tp , wObj_Nome , wPrp_Nome, wRestricao,wAcesso
Local wPre_Fnc , wPos_Fnc , wCabecalho , wWhere , wPos := 00 , wM_Pasta ,  wxLen , wCliente

   Store Space(00) to wCabecalho , wPre_Fnc , wPos_Fnc , wPrp_Nome , wAcesso ,wRestricao
   wM_Pasta := {}
   wxLen    := Len(wMatriz)
   wx := 00
   For wx := 01 To wxLen
      wPrp_Nome := Upper(AllTrim(wMatriz[wx,02]))
      If     wPrp_Nome == "CABECALHO"
          wCabecalho := wMatriz[wx,03]
      ElseIf wPrp_Nome == "PRE_FNC"
          wPre_Fnc   := wMatriz[wx,03]
      ElseIf wPrp_Nome == "POS_FNC"
          wPos_Fnc   := wMatriz[wx,03]
      ElseIf wPrp_Nome == "ACESSO"
          wAcesso   := wMatriz[wx,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If     wPrp_Nome == "CABECALHO"
                wCabecalho := wMatriz[wx,03]
            ElseIf wPrp_Nome == "PRE_FNC"
                wPre_Fnc   := wMatriz[wx,03]
            ElseIf wPrp_Nome == "POS_FNC"
                wPos_Fnc   := wMatriz[wx,03]
            ElseIf wPrp_Nome == "ACESSO"
                wAcesso   := wMatriz[wx,03]
            EndIf
         EndIf
      EndIf

      If wx < wxLen
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf
      If wObj_Nome <> wMatriz[wx,01] .or. cEmpty(wObj_Nome)
         *------------------------------- FOLDER - Verifica Restrições do Perfil do Usuário---------------------------*
         wRestricao := fACS_ChkRestricao("FLT",wMatriz[wx,01])
         wRestricao := iif(cEmpty(wRestricao),wAcesso,wRestricao)
         wRestricao := iIf(cEmpty(wRestricao),"0",wRestricao)
         wRestricao := iIf(valtype(wRestricao)<>"C","0",wRestricao)
         *------------------------------------------------------------------------------------------------------------*
         aAdd( wM_Pasta , { Len(wM_Folder), AllTrim(wCabecalho) , AllTrim(wPre_Fnc) , AllTrim(wPos_Fnc) , wRestricao , wMatriz[wx,01], wMatriz[wx,04] })

         Store Space(00) to wCabecalho , wPre_Fnc , wPos_Fnc , wAcesso , wRestricao
      EndIf
   Next

Return wM_Pasta
*fim da Function __fCase_Folder_FLT(wMatriz)

Function cCaseMatrix(wObjeto)
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local wx,wObj_Seq,wSeq,wQtdPt,wy,wM_Nivel[5],wWhere,wObj_Fld,wNumEst
Local wMtzQtd,wMatrizSAY,wMatrizFME,wM_Aux_BTN,wMatrizDLG,wMatrizBTN,wMatrizTREE
Local wGETEstrutura,wGRDEstrutura,wFLDEstrutura,wFLTEstrutura,wFMEEstrutura
Local wbValid,wbInit,wz,wM_Del_Fld,wMM,wxLen,wLenDlg,wMatrizFLD,wMatrizFLT
Local wPos,wInicio,wMacro,wMatrizFGET,wNewSize,wMatrizGRD
Local wx_EndObjeto,wy_EndObjeto,wz_EndObjeto,wResp,wMatriz
Private wMatrizGET

   wc_FRM_Act   := wObjeto    // cicerox
   wx_EndObjeto := 0

   cursorwait()

   wObjeto := Upper(AllTrim(wObjeto))
   wPos := 00
      // wc_Sistema <> "ADM"       .Or.;      //"CCASE"     // CICERO2004
   If(Trim(wc_user) <> "C"      .And.;
      Trim(wc_user) <> "AILTON" .And.;
      Trim(wc_user) <> "CICERO" .And.;
      Trim(wc_user) <> "DENIS")
      wxLen := Len(wxM_Objeto)
      For wx:= 01 To wxLen
         If wxM_Objeto[wx][01] == wObjeto
            wPos := wx
            Exit
         EndIf
      Next
   EndIf

   If wPos > 0
      wMatrizDLG  := wxM_Objeto[wPos][02]
      wMatrizBTN  := wxM_Objeto[wPos][03]
      wM_Aux_BTN  := wxM_Objeto[wPos][04]
      wMatrizGET  := wxM_Objeto[wPos][05]
      wMatrizGRD  := wxM_Objeto[wPos][06]
      wMatrizFLD  := wxM_Objeto[wPos][07]
      wMatrizFLT  := wxM_Objeto[wPos][08]
      wObj_Fld    := wxM_Objeto[wPos][09]
      wMatrizFGET := wxM_Objeto[wPos][10]
      wMatrizSAY  := wxM_Objeto[wPos][11]
      wMatrizFME  := wxM_Objeto[wPos][12]
      wMatrizTREE := wxM_Objeto[wPos][13]
   Else
      wWhere := " (cCase_Obj.Obj_Nome Like " + Campo(wObjeto+".%") + " Or cCase_Obj.Obj_Nome = " + Campo(wObjeto) + ") "
      wResp := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr","cCase_Obj.Obj_Seq","cCase_Obj.Obj_Tp"},wWhere,"cCase_Obj.Obj_Nome,cCase_Obj.Obj_Seq,Prp_Nome")
      wx := 00
      wMatriz := {}
      wxLen := Len(wResp)
      For wx := 01 To wxLen
         wSeq := StrZero(wResp[wx,04],7,0)
         wQtdPt := 00
         wy := 00
         For wy := 01 To Len(wResp[wx,01])
            If SubStr(wResp[wx,01],wy,1)="."
              wQtdPt := wQtdPt + 01
            EndIf
         Next
         wObj_Seq := Space(00)
         If wQtdPt = 0
            wM_Nivel[1] := wSeq
            wObj_Seq := wM_Nivel[1] + ".0000000.0000000.0000000.0000000.0000000"
         ElseIf wQtdPt = 1
            wM_Nivel[2] := wSeq
            wObj_Seq := wM_Nivel[1] +"."+ wM_Nivel[2] + ".0000000.0000000.0000000.0000000"
         ElseIf wQtdPt = 2
            wM_Nivel[3] := wSeq
            wObj_Seq := wM_Nivel[1] +"."+ wM_Nivel[2] +"."+ wM_Nivel[3] + ".0000000.0000000.0000000"
         ElseIf wQtdPt = 3
            wM_Nivel[4] := wSeq
            wObj_Seq := wM_Nivel[1] +"."+ wM_Nivel[2] +"."+ wM_Nivel[3] +"."+ wM_Nivel[4] + ".0000000.0000000"
         ElseIf wQtdPt = 4
            wM_Nivel[5] := wSeq
            wObj_Seq := wM_Nivel[1] +"."+ wM_Nivel[2] +"."+ wM_Nivel[3] +"."+ wM_Nivel[4] +"."+ wM_Nivel[5] + ".0000000"
         Else
            wObj_Seq := wM_Nivel[1] +"."+ wM_Nivel[2] +"."+ wM_Nivel[3] +"."+ wM_Nivel[4] +"."+ wM_Nivel[5] + "."+wSeq
         EndIf
         wObj_Seq := wObj_Seq+"."+wResp[wx,02]
         aAdd(wMatriz,{ wResp[wx,01],wResp[wx,02],wResp[wx,03],wObj_Seq,wResp[wx,05] })
      Next

      aSort(wMatriz,,,{|x,y| x[4] < y[4]})

      Aadd(wxM_Objeto,{})
      wMatrizDLG  := {}
      wMatrizBTN  := {}
      wM_Aux_BTN  := {}
      wMatrizGET  := {}
      wMatrizGRD  := {}
      wMatrizFLD  := {}
      wMatrizFLT  := {}
      wObj_Fld    := {}
      wMatrizFGET := {}
      wMatrizSAY  := {}
      wMatrizFME  := {}
      wMatrizTREE := {}

      wGETEstrutura := Space(00)
      wGETEstrutura := Space(00)
      wGRDEstrutura := Space(00)
      wFLDEstrutura := Space(00)
      wFLTEstrutura := Space(00)
      wFMEEstrutura := Space(00)

      wxLen := Len(wMatriz)
      For wx:= 01 To wxLen
         cursorwait()
         wNumEst := 00
         If wMatriz[wx,05] = "FRM"
            aAdd(wMatrizDLG,{ wMatriz[wx,02],wMatriz[wx,03] })
            
         ElseIf wMatriz[wx,05] = "BTN"
            
            If At("FLT",Upper(SubStr(wMatriz[wx,01],01,At("BTN",Upper(wMatriz[wx,01])))))=0
               aAdd(wMatrizBTN,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
            Else
               aAdd(wM_Aux_BTN,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
            EndIf
            
         ElseIf wMatriz[wx,05] = "FLD"
            If .Not.(SubStr(wMatriz[wx,04],1,16) == wFLDEstrutura)
               aAdd(wMatrizFLD,{})
               aAdd(wObj_Fld ,wMatriz[wx,01] )
               wFLDEstrutura := SubStr(wMatriz[wx,04],1,16)
            EndIf
            aAdd(wMatrizFLD[Len(wMatrizFLD)],{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03],wMatriz[wx,04] })
            
         ElseIf wMatriz[wx,05] = "FLT"
            If .Not.(SubStr(wMatriz[wx,04],1,16) == wFLTEstrutura)
               aAdd(wMatrizFLT,{})
               wFLTEstrutura := SubStr(wMatriz[wx,04],1,16)
            EndIf
            aAdd(wMatrizFLT[Len(wMatrizFLT)],{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03],wMatriz[wx,04] })
            
         ElseIf wMatriz[wx,05] = "GRD"
            If At("FLT",wMatriz[wx,01])>0
               wNumEst := 32
            Else
               wNumEst := 08
            EndIf
            If .Not.(SubStr(wMatriz[wx,04],1,wNumEst) == wGRDEstrutura)
               aAdd(wMatrizGRD,{})
               wGRDEstrutura := SubStr(wMatriz[wx,04],1,wNumEst)
               
            EndIf
            aAdd(wMatrizGRD[Len(wMatrizGRD)],{ wMatriz[wx,02],wMatriz[wx,03],wMatriz[wx,01] })
            
         ElseIf wMatriz[wx,05] = "FME"
            aAdd(wMatrizFME,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })

         ElseIf wMatriz[wx,05] = "TRV"
            aAdd(wMatrizTREE,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
            
         ElseIf wMatriz[wx,05] = "GET"
            If At("GRD",Upper(SubStr(wMatriz[wx,01],01,At("GET",Upper(wMatriz[wx,01])))))=0
               aAdd(wMatrizFGET,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
               
            Else
               If At("FLT",wMatriz[wx,01])>0
                  wNumEst := 32
               Else
                  wNumEst := 16
               EndIf
               If .Not.(SubStr(wMatriz[wx,04],1,wNumEst) == wGETEstrutura)
                  aAdd(wMatrizGET,{})
                  wGETEstrutura := SubStr(wMatriz[wx,04],1,wNumEst)
               EndIf
               aAdd(wMatrizGET[Len(wMatrizGET)],{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
               
            EndIf
            
         ElseIf wMatriz[wx,05] = "SAY"
            aAdd(wMatrizSAY,{ wMatriz[wx,01],wMatriz[wx,02],wMatriz[wx,03] })
         EndIf
         
      Next
      wMM := {wObjeto,wMatrizDLG,wMatrizBTN,wM_Aux_BTN,wMatrizGET,wMatrizGRD,wMatrizFLD,wMatrizFLT,wObj_Fld,wMatrizFGET,wMatrizSAY,wMatrizFME,wMatrizTREE }
      wxM_Objeto[Len(wxM_Objeto)] := wMM
   EndIf

   wResp := __fCase_Form(wMatrizDLG,wMatrizBTN,wObjeto,1)

   wLenDlg := Len(oM_Dlg)

   cwInicial(wObjeto)

   __fCase_Folder(wMatrizFLD,wMatrizFLT)
   __fCase_Frame(wMatrizFME)
   __fCase_Tree(wMatrizTREE)

   wx := 00
   wxLen := Len(wMatrizGET)
   For wx:= 01 To wxLen
      cursorwait()
      wc_Case_Seq := Len(wM_Case)+1
      fCaseAdd(wMatrizGET[wx])
      __fCase_Grid(wMatrizGRD[wx])
      m->wM_Grid_Seq[wG_Atual] := wc_Case_Seq
      __fCase_Get(wc_Case_Seq)
   Next

   __fCase_GetFree(wMatrizFGET)
   __fCase_Button(wM_Aux_BTN)  //cxObj_Button(wM_Aux_BTN)
   __fCase_Say(wMatrizSAY)     //cxObj_Say(wMatrizSAY)

   wM_Dlg[wLenDlg,01] := Len(wM_Case)
   wM_Dlg[wLenDlg,02] := Len(wM_Control)
   wM_Dlg[wLenDlg,03] := Len(wM_Grid_Cursor)
   wM_Dlg[wLenDlg,04] := Len(wM_Folder)
   wM_Dlg[wLenDlg,05] := 1
   wM_Dlg[wLenDlg,06] := wResp[1]
   wM_Dlg[wLenDlg,07] := Len(oM_Button)
   wM_Dlg[wLenDlg,08] := Len(oM_Say)
   wM_Dlg[wLenDlg,09] := Len(oM_BtnCombo)
   wM_Dlg[wLenDlg,10] := wResp[3]
   wM_Dlg[wLenDlg,11] := wc_FRM_Act

   If wLenDlg=01
      m->wM_Grid_Seq[1] := 01
      m->wM_Grid_Seq[2] := 01
      m->wM_Grid_Seq[3] := 01
   Else
      If Len(wM_Dlg[1])>0
         If wM_Dlg[wLenDlg][1] > 0 .And. wM_Dlg[wLenDlg-1,1] < wM_Dlg[wLenDlg,1]
            m->wM_Grid_Seq[1] := wM_Dlg[wLenDlg-1][1]+1
         EndIf
      Else
         m->wM_Grid_Seq[1] := Len(oM_Brw)-1
         m->wM_Grid_Seq[1] := iif(cEmpty(m->wM_Grid_Seq[1]),1,m->wM_Grid_Seq[1])
      EndIf
   EndIf

   fCase_Form_Acesso()

   If wM_Dlg[wLenDlg,6] = "D"
      cFolder_Enable()
      
      oM_Dlg[wLenDlg]:Activate(oM_Dlg[wLenDlg]:bLClicked,oM_Dlg[wLenDlg]:bMoved,oM_Dlg[wLenDlg]:bPainted,wResp[2],oM_Dlg[wLenDlg]:bValid,,oM_Dlg[wLenDlg]:bInit,oM_Dlg[wLenDlg]:bRClicked,)

      If wLenDlg>1
         oM_Dlg[wLenDlg]:aControls:={}
         oM_Dlg[wLenDlg]:End()
         aDel(oM_Dlg,wLenDlg)
         aSize(oM_Dlg  ,wLenDlg - 1 )
         aSize(wM_Opcao,wLenDlg - 1 )
         wNewSize := wM_Dlg[wLenDlg-1][1]
         
         For wx_EndObjeto := wNewSize+1 To Len(wM_Case)
            wy_EndObjeto :=0
            For wy_EndObjeto := 01 To Len(wM_Case[wx_EndObjeto,wCS_ObjGet])
               
               If ValType(wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto])="O"
                  If wM_Case[wx_EndObjeto,wCS_Formato,wy_EndObjeto]= 95
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:End()
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:= nil
                     Loop
                  EndIf

                  If Upper(wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:classname) = "TRADMENU"
                     For wz_EndObjeto := 01 To Len(wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:aItems)
                        wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:aItems[wz_EndObjeto]:End()
                        wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:aItems[wz_EndObjeto]:=nil
                     Next
                  Else
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:bValid := nil
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:End()
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto]:Destroy()
                     wM_Case[wx_EndObjeto,wCS_ObjGet,wy_EndObjeto] := nil
                  EndIf
               EndIf
   
               If ValType(wM_Case[wx_EndObjeto,wCS_ObjCab,wy_EndObjeto])="O"
                  wM_Case[wx_EndObjeto,wCS_ObjCab,wy_EndObjeto]:End()
                  wM_Case[wx_EndObjeto,wCS_ObjCab,wy_EndObjeto]:Destroy()
                  wM_Case[wx_EndObjeto,wCS_ObjCab,wy_EndObjeto] := nil
               EndIf
            Next
   
            If ValType(oM_Brw[wx_EndObjeto])="O"
               oM_Brw[wx_EndObjeto]:End() 
               oM_Brw[wx_EndObjeto]:Destroy()
               oM_Brw[wx_EndObjeto]:= nil 
               oM_Brw_Say[wx_EndObjeto]:End()
               oM_Brw_Say[wx_EndObjeto]:Destroy()
               oM_Brw_Say[wx_EndObjeto]:= nil
            EndIf
         Next
   
         aSize(oM_Brw            ,wNewSize )
         aSize(oM_Brw_Say        ,wNewSize )
   
         aSize(wM_Case           ,wNewSize )
         aSize(wM_Grid           ,wNewSize )
         aSize(wM_BrwLin         ,wNewSize )
         aSize(wTab_Setup        ,wNewSize )
         aSize(wM_Tab_Nome       ,wNewSize )
         aSize(wM_Tab_Filter     ,wNewSize )
         aSize(wM_Grid_Order     ,wNewSize )
         aSize(wM_Grid_Col_Order ,wNewSize )
         aSize(wM_Case_Col_Order ,wNewSize )
         aSize(wM_Tab_PosFnc     ,wNewSize )
         aSize(wMBrwSTRCampos    ,wNewSize )
         aSize(wMBrwCabeca       ,wNewSize )
         aSize(wMBrwColSize      ,wNewSize )
         aSize(wMBrwColAlinha    ,wNewSize )
         aSize(wMBrwCampos       ,wNewSize )
         aSize(wMFunc_Atrib      ,wNewSize )
         aSize(wMFunc_Refresh    ,wNewSize )
         aSize(wMFunc_DbClick    ,wNewSize )
         aSize(wMFunc_Change     ,wNewSize )
         aSize(wMFunc_ClrGTxt    ,wNewSize )
         aSize(wMFunc_ClrSTxt    ,wNewSize )
         aSize(wMGrid_Col        ,wNewSize )
         aSize(wMCase_Col        ,wNewSize )

	      __wc_FRM := __wc_FRM-1
	      aSize( __wMCase_Obj , __wc_FRM )
			aSize( __wMCase_FRM , __wc_FRM )
   
         wc_Case_Seq := Len(oM_Brw)
   
         wNewSize := wM_Dlg[wLenDlg-1][2]
         aSize(wM_Control ,wNewSize )
         
         wNewSize := wM_Dlg[wLenDlg-1][3]
         aSize(wM_Grid_Cursor,wNewSize )
         
         wNewSize := wM_Dlg[wLenDlg-1][4]
         wx_EndObjeto := 0
         For wx_EndObjeto := wNewSize+1 To Len(oM_Fld)
            oM_Fld[wx_EndObjeto]:End()
            oM_Fld[wx_EndObjeto]:Destroy()
            oM_Fld[wx_EndObjeto]:= nil 
         Next
         aSize(wM_Folder   ,wNewSize )
         aSize(oM_Fld      ,wNewSize )
         aSize(wM_Fld_Atual,wNewSize )
         aSize(wM_Fld_Ant  ,wNewSize )
   
         wNewSize := wM_Dlg[wLenDlg-1][7]
         wx_EndObjeto := 0
         For wx_EndObjeto := wNewSize+1 To Len(oM_Button)
            oM_Button[wx_EndObjeto]:End()
            oM_Button[wx_EndObjeto]:Destroy()
            oM_Button[wx_EndObjeto]:= nil
         Next
         aSize(oM_Button  ,wNewSize )
         aSize(oM_BtnAcs  ,wNewSize )
   
         wNewSize := wM_Dlg[wLenDlg-1][8]
         wx_EndObjeto := 0
         For wx_EndObjeto := wNewSize+1 To Len(oM_Say)
            If oM_Say[wx_EndObjeto]:classname<>"TSAY"
               oM_Say[wx_EndObjeto]:bValid := nil
            EndIf
            oM_Say[wx_EndObjeto]:End() 
            oM_Say[wx_EndObjeto]:Destroy() 
            oM_Say[wx_EndObjeto]:=nil
         Next
         aSize(oM_Say ,wNewSize )
   
         wNewSize := wM_Dlg[wLenDlg-1][9]
         wx_EndObjeto := 0
         For wx_EndObjeto := wNewSize+1 To Len(oM_BtnCombo)
            oM_BtnCombo[wx_EndObjeto,1]:End() 
            oM_BtnCombo[wx_EndObjeto,1]:Destroy() 
            oM_BtnCombo[wx_EndObjeto,1]:=nil
         Next
         aSize(oM_BtnCombo ,wNewSize )
   
         m->wM_Grid_Seq[wG_Atual] := fGrid_Ant()
         aSize(wM_Grid_Ant,wLenDlg - 1 )
         aSize(wM_Dlg ,wLenDlg - 1 )
//         cCaseLog("EXEC",wc_FRM_Act,"cFinal()#"+wc_Prog[Len(wc_Prog)])      // ciceroX - Thiago

         //wc_Prog[1] := wM_Dlg[Len(wM_Dlg)][10]
         aSize(wc_Prog,wLenDlg - 1)
         wc_FRM_Act := wM_Dlg[Len(wM_Dlg)][11]

         If Len(oM_Brw)>0
            If Valtype(oM_Brw[m->wM_Grid_Seq[wG_Atual]])="O"
               oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Refresh()
               oM_Brw[m->wM_Grid_Seq[wG_Atual]]:Click()
            EndIf
         EndIf
         oM_Dlg[Len(oM_Dlg)]:aEvalWhen()
         cFolder_Enable()
      Else
         cwFinal(wObjeto)
      EndIf
   ElseIf wM_Dlg[wLenDlg,6] = "W"
      If wResp[2]
         WndCenter( oM_Dlg[wLenDlg]:hWnd )
      EndIf

      oM_Dlg[wLenDlg]:Activate( "NORMAL" ,,,,,,,,,,,,,,,,,,)
                   // Activate( cShow   , bLClicked, bRClicked, bMoved, bResized, bPainted, bKeyDown, bInit,bUp, bDown, bPgUp, bPgDn,bLeft, bRight, bPgLeft, bPgRight, bValid, bDropFiles,bLButtonUp )
   EndIf
   CursorArrow()

Return .T.
*fim da Function cCaseMatrix()

Function fCase_Get_RichText(wGrid,wGetwx,wHScroll,wValid,wCorNumero)
*****************************************************************************************************
*                                                                                                   *
*****************************************************************************************************
Local oWnd,oGet,wSysWidth,wSysHeight,wTop,wLeft,wBottom,wRight,wBlock,wOpcao,wReadOnly,wDlgValid

	wSysWidth  := GetSysMetrics( 0 )
	wSysHeight := GetSysMetrics( 1 )
	wTop       := wSysWidth*0.10
	wLeft      := wSysWidth*0.10
	wBottom    := wSysHeight-(wSysHeight*0.10)
	wRight     := wSysWidth -(wSysWidth *0.10)
   wBlock     := "{|u| If( PCount()==0, __wVarRichText,__wVarRichText :=u )}"

   If wM_Opcao[Len(wM_Opcao)] = "consul"
      wReadOnly := .T.
   Else
      wReadOnly := .F.
   EndIf

   wOpcao     := wM_Opcao[Len(wM_Opcao)]
   wDlgValid  := oM_Dlg[Len(oM_Dlg)]:bValid
   wM_Opcao[Len(wM_Opcao)] := "richtext"
   oM_Dlg[Len(oM_Dlg)]:bValid := {||.F.}

   oWnd := TWindow():New(wTop,wLeft,wBottom,wRight,"Edição",      ,     ,      ,     ,       ,.F.     ,.F.     ,GetSysColor(18),GetSysColor(15),       ,"NONE" ,        ,.T.     ,.T. , .F. , .T.   )
						 //New(nTop,nLeft,nBottom,nRight,cTitle  ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore       ,nClrBack       ,oCursor,cBorder,lSysMenu,lCaption,lMin, lMax, lPixel) CONSTRUCTOR

   	__wVarRichText  := wM_Case[wGrid,wCS_Conteudo,wGetwx][2]
      __wOpenRichText := .T.

    	wRight  := oWnd:nWidth -(oWnd:nWidth *0.015)
	   wBottom := oWnd:nHeight-(oWnd:nHeight*0.050)

	   oGet := TRichEdit():New(1   ,1    ,&(wBlock),oWnd,wRight,wBottom,     , .T.  ,    ,wHScroll, wReadOnly,     ,&(wValid),        , .F.    , wCorNumero,         ,         , .T.   , .T.      , .F.       )
	                    // New(nTop,nLeft, bSetGet ,oWnd,nWidth,nHeight,oFont,lPixel,cMsg,lHScroll, lReadOnly,bWhen,bValid   ,bChanged, lDesign, lHighlight,cFileName, nRTFSize, lNoURL, lNoScroll, lNoBorder ) CLASS TRichEdit

   oWnd:bValid := {|| fCase_Get_RichText_End(wGrid,wGetwx,oGet,wOpcao,wDlgValid) }
   oWnd:Activate( "NORMAL" ,,,,,,,,,,,,,,,,,,)
     // Activate( cShow   , bLClicked, bRClicked, bMoved, bResized, bPainted, bKeyDown, bInit,bUp, bDown, bPgUp, bPgDn,bLeft, bRight, bPgLeft, bPgRight, bValid, bDropFiles,bLButtonUp )

Return .T.
*fim da Function fCase_Get_RichText()

Function fCase_Get_RichText_End(wGrid,wGetwx,oGet,wOpcao,wDlgValid)
*****************************************************************************************************
*                                                                                                   *
*****************************************************************************************************
Local wTexto
    
   wM_Case[wGrid,wCS_Conteudo,wGetwx][1] := oGet:GetText()
   wTexto := oGet:SaveAsRTF()
   wTexto := AllTrim(wTexto)
   wTexto := SubStr(wTexto,1,Len(wTexto)-1)
//   wTexto := StrTran(wTexto,"\","$|#/#|@")
//   wTexto := StrTran(wTexto,"'",'@|#"#|$')
   wM_Case[wGrid,wCS_Conteudo,wGetwx][2] := wTexto
   wM_Case[wGrid,wCS_ObjGet,wGetwx]:Refresh()
   __wVarRichText  := ""
   __wOpenRichText := .F.

   wM_Opcao[Len(wM_Opcao)] := wOpcao
   oM_Dlg[Len(oM_Dlg)]:bValid := wDlgValid
   cFolder_Enable()
   oM_Dlg[Len(oM_Dlg)]:aEvalWhen()

Return .T.
*fim da Function fCase_Get_RichText_End()

Function fCaseAdd(wMatriz)
*****************************************************************************************************
*                                                                                                   *
*****************************************************************************************************
Local wColuna,wCabeca,wTypeVar,wDefVar,wDeslocLin,wDeslocCol,wTamanho,wPicture,wAlinDireita
Local wRequerido,wConteudo,wGrid,wQtdLin,wQtdCol_Grid,wAtrib_Lst,wFunction,wObjRef,wTab_Nome
Local wKey_Exc_Tp,wFrame,wObjGet,wObjDesloc,wObjCab,wTp_When,wWhen,wValid,wGridSeq,wOrderBy
Local wFiltro,wUnique,wKey_Tp,wKey_Col,wCabCol_Grid,wFormato,wTp_Valid,wOrigem,wMaiuscula
Local wAcento,wXDefVar,wHScroll,wPassWord,wChange,wBorder,wAux_Function,wExpande,wAcesso,wVertical
Local wM_CaseAux[55,00],wResp:={},wx:=0,wObj_Nome,wWhere,wPrp_Nome,wPos,wxLen,wCliente,wDescricao,wOrderByTp

   wColuna := wCabeca := wDefVar  := wPicture   := wAcesso   := wAlinDireita  := wRequerido := wConteudo := wObjGet  := wObjDesloc := wAcento  := Space(00)
   wObjCab := wFrame  := wChange  := wBorder    := wVertical := wAux_Function := wDescricao := wPassWord := wTypeVar := wExpande   := wHScroll := Space(00)
   wUnique := wValid  := wWhen    := wMaiuscula := wKey_Col  := wCabCol_Grid  := wTab_Nome  := wFunction := wObjRef  := wAtrib_Lst := wOrigem  := wOrderByTp := Space(00)
   wDeslocLin := wDeslocCol := wTamanho := wGrid := wQtdLin  := wGridSeq := wOrderBy := wFiltro := wKey_Tp := wTp_When := wQtdCol_Grid := wKey_Exc_Tp := wTp_Valid := wFormato := "00"

   wxLen := Len(wMatriz)
   For wx:= 01 To wxLen
      cursorwait()
      wMatriz[wx,02] := Upper(AllTrim(wMatriz[wx,02]))
      wPrp_Nome      := wMatriz[wx,02]

      If wPrp_Nome     == "NOME_COLUNA"
         wColuna := wMatriz[wX,03]
      ElseIf wPrp_Nome == "CABECALHO"
         wCabeca := wMatriz[wX,03]
      ElseIf wPrp_Nome == "CABECALHO_GRID"
         wCabCol_Grid := wMatRIZ[WX,03]
      ElseIf wPrp_Nome == "TIPO_COLUNA"
         wTypeVar := wMatriz[WX,03]
      ElseIf wPrp_Nome == "CONTEUDO_INICIAL"
         wDefVar := wMatriz[wX,03]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wDeslocLin := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wDeslocCol := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "QTD_LINHAS"
         wQtdLin := wMatriz[wX,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
         wTamanho := wMatriz[WX,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS_GRID"
         wQtdCol_Grid := wMatRIZ[WX,03]
      ElseIf wPrp_Nome == "PICTURE"
         wPicture := wMatriz[WX,03]
      ElseIf wPrp_Nome == "ALINHA_HORIZONTAL"
         wAlinDireita := wMatRIZ[WX,03]
      ElseIf wPrp_Nome == "REQUERIDO"
         wRequerido := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "CONTEUDO"
         wConteudo := wMatriz[WX,03]
      ElseIf wPrp_Nome == "OBJETO_GET"
         wObjGet := wMatriz[wX,03]
      ElseIf wPrp_Nome == "PRE_FNC"
         wWhen := wMatriz[wx,03]
      ElseIf wPrp_Nome == "POS_FNC"
         wValid := wMatriz[wx,03]
      ElseIf wPrp_Nome == "CS_GRIDSEQ"
         wGridSeq := wMatriz[WX,03]
      ElseIf wPrp_Nome == "GRD_ORDER"
         wOrderBy := wMatriz[WX,03]
      ElseIf wPrp_Nome == "ORDER_BY_TP"
         wOrderByTp := wMatriz[WX,03]
      ElseIf wPrp_Nome == "TIPO_FILTRO"
         wFiltro := wMatriz[wX,03]
      ElseIf wPrp_Nome == "UNIQUE"
         wUnique := wMatriz[wX,03]
      ElseIf wPrp_Nome == "TIPO_CHAVE"
         wKey_Tp := wMatriz[wX,03]
      ElseIf wPrp_Nome == "COLUNA_REL"
         wKey_Col := wMatriz[WX,03]
      ElseIf wPrp_Nome == "AUX_FUNCTION"
         wAux_Function:= wMatRIZ[WX,03]
      ElseIf wPrp_Nome == "OBJETO_CABECALHO"
         wObjCab := wMatriz[wX,03]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
         wObjDesloc := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef := wMatriz[wX,03]
      ElseIf wPrp_Nome == "TIPO_WHEN"
         wTp_When := wMatriz[WX,03]
      ElseIf wPrp_Nome == "TAB_NOME"
         wTab_Nome := wMatriz[WX,03]
      ElseIf wPrp_Nome == "ATRIB_LST"
         wAtrib_Lst := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "KEY_EXCLUI_TP"
         wKey_Exc_Tp := wMatrIZ[WX,03]
      ElseIf wPrp_Nome == "TIPO_VALID"
         wTp_Valid := wMatriz[WX,03]
      ElseIf wPrp_Nome == "FORMATO_DADO"
         wFormato := wMatriz[WX,03]
      ElseIf wPrp_Nome == "ORIGEM_DADO"
         wOrigem := wMatriz[wX,03]
      ElseIf wPrp_Nome == "FUNCTION"
         wFunction := wMatriz[WX,03]
      ElseIf wPrp_Nome == "MAIUSCULA"
         wMaiuscula := wMatriZ[WX,03]
      ElseIf wPrp_Nome == "ACENTO"
         wAcento := wMatriz[wX,03]
      ElseIf wPrp_Nome == "HSCROLL"
         wHScroll := wMatriz[WX,03]
      ElseIf wPrp_Nome == "FRAME"
         wFrame := wMatriz[wx,03]
      ElseIf wPrp_Nome == "PASSWORD"
         wPassWord := wMatriz[WX,03]
      ElseIf wPrp_Nome == "BCHANGE"
         wChange := wMatriz[wX,03]
      ElseIf wPrp_Nome == "BORDER"
         wBorder := wMatriz[wX,03]
      ElseIf wPrp_Nome == "EXPANDE"
         wExpande := wMatriz[WX,03]
      ElseIf wPrp_Nome == "ACESSO"
         wAcesso := wMatriz[wX,03]
      ElseIf wPrp_Nome == "DESCRICAO"
         wDescricao := wMatriz[wX,03]
      ElseIf wPrp_Nome == "VERTICAL"
         wVertical  := wMatriz[wX,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)

         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If wPrp_Nome     == "NOME_COLUNA"
               wColuna := wMatriz[wX,03]
            ElseIf wPrp_Nome == "CABECALHO"
               wCabeca := wMatriz[wX,03]
            ElseIf wPrp_Nome == "CABECALHO_GRID"
               wCabCol_Grid := wMatRIZ[WX,03]
            ElseIf wPrp_Nome == "TIPO_COLUNA"
               wTypeVar := wMatriz[WX,03]
            ElseIf wPrp_Nome == "CONTEUDO_INICIAL"
               wDefVar := wMatriz[wX,03]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
               wDeslocLin := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
               wDeslocCol := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "QTD_LINHAS"
               wQtdLin := wMatriz[wX,03]
            ElseIf wPrp_Nome == "QTD_COLUNAS"
               wTamanho := wMatriz[WX,03]
            ElseIf wPrp_Nome == "QTD_COLUNAS_GRID"
               wQtdCol_Grid := wMatRIZ[WX,03]
            ElseIf wPrp_Nome == "PICTURE"
               wPicture := wMatriz[WX,03]
            ElseIf wPrp_Nome == "ALINHA_HORIZONTAL"
               wAlinDireita := wMatRIZ[WX,03]
            ElseIf wPrp_Nome == "REQUERIDO"
               wRequerido := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "CONTEUDO"
               wConteudo := wMatriz[WX,03]
            ElseIf wPrp_Nome == "OBJETO_GET"
               wObjGet := wMatriz[wX,03]
            ElseIf wPrp_Nome == "PRE_FNC"
               wWhen := wMatriz[wx,03]
            ElseIf wPrp_Nome == "POS_FNC"
               wValid := wMatriz[wx,03]
            ElseIf wPrp_Nome == "CS_GRIDSEQ"
               wGridSeq := wMatriz[WX,03]
            ElseIf wPrp_Nome == "GRD_ORDER"
               wOrderBy := wMatriz[WX,03]
		      ElseIf wPrp_Nome == "ORDER_BY_TP"
		         wOrderByTp := wMatriz[WX,03]
            ElseIf wPrp_Nome == "TIPO_FILTRO"
               wFiltro := wMatriz[wX,03]
            ElseIf wPrp_Nome == "UNIQUE"
               wUnique := wMatriz[wX,03]
            ElseIf wPrp_Nome == "TIPO_CHAVE"
               wKey_Tp := wMatriz[wX,03]
            ElseIf wPrp_Nome == "COLUNA_REL"
               wKey_Col := wMatriz[WX,03]
            ElseIf wPrp_Nome == "AUX_FUNCTION"
               wAux_Function:= wMatRIZ[WX,03]
            ElseIf wPrp_Nome == "OBJETO_CABECALHO"
               wObjCab := wMatriz[wX,03]
            ElseIf wPrp_Nome == "OBJETO_DESLOC"
               wObjDesloc := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
               wObjRef := wMatriz[wX,03]
            ElseIf wPrp_Nome == "TIPO_WHEN"
               wTp_When := wMatriz[WX,03]
            ElseIf wPrp_Nome == "TAB_NOME"
               wTab_Nome := wMatriz[WX,03]
            ElseIf wPrp_Nome == "ATRIB_LST"
               wAtrib_Lst := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "KEY_EXCLUI_TP"
               wKey_Exc_Tp := wMatrIZ[WX,03]
            ElseIf wPrp_Nome == "TIPO_VALID"
               wTp_Valid := wMatriz[WX,03]
            ElseIf wPrp_Nome == "FORMATO_DADO"
               wFormato := wMatriz[WX,03]
            ElseIf wPrp_Nome == "ORIGEM_DADO"
               wOrigem := wMatriz[wX,03]
            ElseIf wPrp_Nome == "FUNCTION"
               wFunction := wMatriz[WX,03]
            ElseIf wPrp_Nome == "MAIUSCULA"
               wMaiuscula := wMatriZ[WX,03]
            ElseIf wPrp_Nome == "ACENTO"
               wAcento := wMatriz[wX,03]
            ElseIf wPrp_Nome == "HSCROLL"
               wHScroll := wMatriz[WX,03]
            ElseIf wPrp_Nome == "FRAME"
               wFrame := wMatriz[wx,03]
            ElseIf wPrp_Nome == "PASSWORD"
               wPassWord := wMatriz[WX,03]
            ElseIf wPrp_Nome == "BCHANGE"
               wChange := wMatriz[wX,03]
            ElseIf wPrp_Nome == "BORDER"
               wBorder := wMatriz[wX,03]
            ElseIf wPrp_Nome == "EXPANDE"
               wExpande := wMatriz[WX,03]
            ElseIf wPrp_Nome == "ACESSO"
               wAcesso := wMatriz[wX,03]
            ElseIf wPrp_Nome == "VERTICAL"
               wVertical  := wMatriz[wX,03]
            EndIf
         EndIf
      EndIf

      If wx < wxLen
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf
      If wObj_Nome <> wMatriz[wx,01] .Or. cEmpty(wObj_Nome)
         If cEmpty(wc_Case_Seq)
            cCancel("Número do Grid de Referência não Informado do Coluna : " + wColuna)
         EndIf

         wPicture     := iIf(cEmpty(wPicture),replicate("X",252),wPicture)
         wRequerido   := iIf(wRequerido ="N".Or.cEmpty(wRequerido) ,.F.,.T. )
         wUnique      := iIf(wUnique ="N".Or.cEmpty(wUnique) ,.F.,.T. )
         wQtdCol_Grid := iIf(ValType(wQtdCol_Grid)="U" ,Val(wTamanho),Val(wQtdCol_Grid))
         wQtdCol_Grid := iIf(cEmpty(wQtdCol_Grid) ,Val(wTamanho),wQtdCol_Grid )
         wCabCol_Grid := iIf(cEmpty(wCabCol_Grid) ,wCabeca ,wCabCol_Grid )
         wOrigem      := iIf(wOrigem="N".Or.cEmpty(wOrigem) ,.F.,.T. )
         wMaiuscula   := iIf(cEmpty(wMaiuscula) ,"N",Upper(Trim(wMaiuscula)) )
         wMaiuscula   := iIf(wMaiuscula="S" ,.T.,.F. )
         wAcento      := iIf(cEmpty(wAcento) ,"N",Upper(Trim(wAcento)) )
         wAcento      := iIf(wAcento="S" ,.T.,.F. )
         wTp_Valid    := iIf(cEmpty(wTp_Valid) ,00,Val(wTp_Valid) )
         wTp_Valid    := iIf(Val(wKey_Tp)>0 ,{wTp_Valid,.T.},{wTp_Valid,.F.})
         wHScroll     := iIf(wHScroll="N".Or.cEmpty(wHScroll) ,.F.,.T. )
         wTypeVar     := iIf(cEmpty(wTypeVar) ,"",Upper(AllTrim(wTypeVar)) )
         wFrame       := iIf(wFrame="N".Or.cEmpty(wFrame) ,.F.,.T. )
         wPassWord    := iIf(wPassWord="N".Or.cEmpty(wPassWord) ,.F.,.T. )
         wBorder      := iIf(wBorder="N".Or.cEmpty(wBorder) ,.F.,.T. )
         wExpande     := iIf(wExpande="N".Or.cEmpty(wExpande) ,.F.,.T. )
         wVertical    := iIf(wVertical="S".Or.cEmpty(wVertical) ,.T.,.F. )
         wChange      := AllTrim(wChange)
         wFormato     := Val(wFormato)

         If cEmpty(wDefVar)
            If wTypeVar="C"
               wDefVar:= "Space(252)"
            ElseIf wTypeVar="N"
               wDefVar:= "00"
            ElseIf wTypeVar="D"
               wDefVar:= 'CtoD("  /  /    ")'
            EndIf
         Else
            wDefVar := AllTrim(wDefVar)
         EndIf
         If wTypeVar = "N"
         	wAlinDireita := .T.
         Else
	         wAlinDireita := iIf(wAlinDireita="E".Or.cEmpty(wAlinDireita),.F.,.T. )
         EndIf
         If cEmpty(wConteudo)
            If wTypeVar="C"
               wConteudo := ""
            ElseIf wTypeVar="N"
               wConteudo := 00
            ElseIf wTypeVar="D"
               wConteudo := CtoD("  /  /    ")
            EndIf
         Else
            wConteudo := &wConteudo
         EndIf

         If wFormato=49
            wConteudo  := {wConteudo,wConteudo}
         Else
            wConteudo  := wConteudo
         EndIf

         Aadd(wM_CaseAux[wCS_Conteudo   ] , wConteudo )
         Aadd(wM_CaseAux[wCS_AntConteudo] , {wConteudo,,} )
         Aadd(wM_CaseAux[wCS_Coluna     ] , Trim(Upper(wColuna)))
         Aadd(wM_CaseAux[wCS_Cabeca     ] , AllTrim(wCabeca) )
         Aadd(wM_CaseAux[wCS_TypeVar    ] , wTypeVar )
         Aadd(wM_CaseAux[wCS_DefVar     ] , wDefVar )
         Aadd(wM_CaseAux[wCS_LinDesloc  ] , Val(wDeslocLin) )
         Aadd(wM_CaseAux[wCS_ColDesloc  ] , Val(wDeslocCol) )
         Aadd(wM_CaseAux[wCS_Tamanho    ] , Val(wTamanho) )
         Aadd(wM_CaseAux[wCS_Picture    ] , wPicture )
         Aadd(wM_CaseAux[wCS_AlinDireita] , wAlinDireita )
         Aadd(wM_CaseAux[wCS_Requerido  ] , wRequerido )
         Aadd(wM_CaseAux[wCS_ObjGet     ] , wObjGet )
         Aadd(wM_CaseAux[wCS_When       ] , wWhen )
         Aadd(wM_CaseAux[wCS_Valid      ] , wValid )
         Aadd(wM_CaseAux[wCS_GridSeq    ] , Val(wGridSeq) )
         Aadd(wM_CaseAux[wCS_GridOrder  ] , Val(wOrderBy) )
         Aadd(wM_CaseAux[wCS_Formato    ] , wFormato )
         Aadd(wM_CaseAux[wCS_Filtro     ] , Val(wFiltro) )
         Aadd(wM_CaseAux[wCS_Unique     ] , wUnique )
         Aadd(wM_CaseAux[wCS_Key_Tp     ] , Val(wKey_Tp) )
         Aadd(wM_CaseAux[wCS_Key_Col    ] , wKey_Col )
         Aadd(wM_CaseAux[wCS_Function   ] , wFunction )
         Aadd(wM_CaseAux[wCS_ObjCab     ] , wObjCab )
         Aadd(wM_CaseAux[wCS_ObjDesloc  ] , wObjDesloc )
         Aadd(wM_CaseAux[wCS_TpWhen     ] , Val(wTp_When) )
         Aadd(wM_CaseAux[wCS_ObjRef     ] , wObjRef )
         Aadd(wM_CaseAux[wCS_QtdLin     ] , Val(wQtdLin) )
         Aadd(wM_CaseAux[wCS_ObjNome    ] , wMatriz[wx,01] )
         Aadd(wM_CaseAux[wCS_TabNome    ] , AllTrim(wTab_Nome) )
         Aadd(wM_CaseAux[wCS_QtdCol_Grid] , wQtdCol_Grid )
         Aadd(wM_CaseAux[wCS_CabCol_Grid] , Trim(wCabCol_Grid) )
         Aadd(wM_CaseAux[wCS_Atrib_Lst  ] , AllTrim(wAtrib_Lst) )
         Aadd(wM_CaseAux[wCS_Key_Exc_Tp ] , Val(wKey_Exc_Tp) )
         Aadd(wM_CaseAux[wCS_TpValid    ] , wTp_Valid )
         Aadd(wM_CaseAux[wCS_Origem     ] , wOrigem )
         Aadd(wM_CaseAux[wCS_AuxFunction] , wAux_Function )
         Aadd(wM_CaseAux[wCS_Maiuscula  ] , wMaiuscula )
         Aadd(wM_CaseAux[wCS_Acento     ] , wAcento )
         Aadd(wM_CaseAux[wCS_HScroll    ] , wHScroll )
         Aadd(wM_CaseAux[wCS_F1Conteudo ] , cDefVar(,wTypeVar) )
         Aadd(wM_CaseAux[wCS_F1ObjGet   ] ,)
         Aadd(wM_CaseAux[wCS_F1ObjCab   ] ,)
         Aadd(wM_CaseAux[wCS_F2Conteudo ] , cDefVar(,wTypeVar) )
         Aadd(wM_CaseAux[wCS_F2ObjGet   ] ,)
         Aadd(wM_CaseAux[wCS_F2ObjCab   ] ,)
         Aadd(wM_CaseAux[wCS_Frame      ] , wFrame )
         Aadd(wM_CaseAux[wCS_PassWord   ] , wPassWord )
         Aadd(wM_CaseAux[wCS_Change     ] , wChange )
         Aadd(wM_CaseAux[wCS_Border     ] , wBorder )
         Aadd(wM_CaseAux[wCS_Expande    ] , wExpande )
         Aadd(wM_CaseAux[wCS_Acesso     ] , wAcesso )
         Aadd(wM_CaseAux[wCS_Descricao  ] , wDescricao ) 
         Aadd(wM_CaseAux[wCS_Vertical   ] , wVertical ) 
         Aadd(wM_CaseAux[wCS_GridOrderTp] , AllTrim(wOrderByTp) )

         wColuna := wCabeca := wDefVar  := wPicture   := wAcesso   := wAlinDireita  := wRequerido := wConteudo := wObjGet  := wObjDesloc := wAcento  := Space(00)
         wObjCab := wFrame  := wChange  := wBorder    := wVertical := wAux_Function := wDescricao := wPassWord := wTypeVar := wExpande   := wHScroll := Space(00)
         wUnique := wValid  := wWhen    := wMaiuscula := wKey_Col  := wCabCol_Grid  := wTab_Nome  := wFunction := wObjRef  := wAtrib_Lst := wOrigem  := wOrderByTp := Space(00)
         wDeslocLin := wDeslocCol := wTamanho := wGrid := wQtdLin  := wGridSeq := wOrderBy := wFiltro := wKey_Tp := wTp_When := wQtdCol_Grid := wKey_Exc_Tp := wTp_Valid := wFormato := "00"
      EndIf
   Next
   Aadd(wM_Case,wM_CaseAux )
   cursorarrow()
Return .t.
*Fim da Function fCaseAdd(wObjeto)

Function __fCase_Form(wMatrizDLG,wMatrizBTN,wObjNomeFRM,wOpcao,wPCab,wPAlt,wPLarg)
************************************************************************************************
*                       Função de busca para as Propriedades do Frame                          *
************************************************************************************************
Local wx,wWhere,wResp,wxLen,wPos_Fnc,wMatriz,woDlg,wTpForm,wPos,wQuestion,wClrTexto,wClrFundo
Local wCabecalho,wLinDesloc,wColDesloc,wQtdLin,wQtdCol,wPrompt,wCenter,wAux_Fnc,wPrp_Nome,wCliente

   wxLen := Len(wMatrizDLG)
   For wx:= 01 To wxLen
      cursorwait()
      wMatrizDLG[wx,01] := Upper(AllTrim(wMatrizDLG[wx,01]))
      wPrp_Nome         := wMatrizDLG[wx,01]
      If     wPrp_Nome == "CABECALHO"
          wCabecalho := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
          wLinDesloc := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
          wColDesloc := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "QTD_LINHAS"
          wQtdLin    := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
          wQtdCol    := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "PROMPT"
          wPrompt    := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "TIPO_FORM"
          wTpForm    := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "POS_FNC"
          wPos_Fnc   := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "AUX_FUNCTION"
          wAux_Fnc   := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "CENTERED"
          wCenter    := wMatrizDLG[WX,02]
      ElseIf wPrp_Nome == "QUESTION_EXIT"
          wQuestion  := wMatrizDLG[WX,02]
      EndIf
   Next

   For wx:= 01 To wxLen
      wPrp_Nome := wMatrizDLG[wx,01]
      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If     wPrp_Nome == "CABECALHO"
                wCabecalho := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
                wLinDesloc := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
                wColDesloc := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "QTD_LINHAS"
                wQtdLin    := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "QTD_COLUNAS"
                wQtdCol    := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "PROMPT"
                wPrompt    := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "TIPO_FORM"
                wTpForm    := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "POS_FNC"
                wPos_Fnc   := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "AUX_FUNCTION"
                wAux_Fnc   := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "CENTERED"
                wCenter    := wMatrizDLG[WX,02]
            ElseIf wPrp_Nome == "QUESTION_EXIT"
                wQuestion  := wMatrizDLG[WX,02]
            EndIf
         EndIf
      EndIf
   Next

   wCabecalho := iIf(ValType(wCabecalho)<>"C","" ,AllTrim(wCabecalho))+cNvl(wPCab,"")
   wLinDesloc := iIf(ValType(wLinDesloc)<>"C",00 ,Val(wLinDesloc))
   wColDesloc := iIf(ValType(wColDesloc)<>"C",00 ,Val(wColDesloc))
   wQtdLin    := iIf(ValType(wQtdLin)   <>"C",00 ,Val(wQtdLin   ))+cNvl(wPAlt ,0)
   wQtdCol    := iIf(ValType(wQtdCol)   <>"C",00 ,Val(wQtdCol   ))+cNvl(wPLarg,0)
   wTpForm    := iIf(cEmpty(wTpForm)         ,"D",Upper(AllTrim(wTpForm)))
   wPos_Fnc   := iIf(cEmpty(wPos_Fnc)        ,".T.",AllTrim(wPos_Fnc))
   wAux_Fnc   := iIf(cEmpty(wAux_Fnc)        ,".T.",AllTrim(wAux_Fnc))
   wCenter    := iIf(ValType(wCenter)   <>"C","S",AllTrim(wCenter))
   wCenter    := iIf(wCenter="S"             ,.T.,.F.)
   wQuestion  := iIf(ValType(wQuestion) <>"C","N",AllTrim(wQuestion))
   wQuestion  := iIf(wQuestion="S"           ,.T.,.F.)

   If     wTpForm = "D"
      woDlg := TDIALOG():New( wLinDesloc , wColDesloc , wQtdLin , wQtdCol , wCabecalho ,,, .F.,,,,,,iif(wOpcao=1,.F.,.T.),, oFont,,, )
   ElseIf wTpForm = "W"
    	wClrFundo := cColorText("WINDOWS")
    	wClrTexto := cColorText("PRETO")

    	woDlg := TWindow():New(wLinDesloc,wColDesloc,wQtdLin ,wQtdCol,wCabecalho ,      ,     ,      ,     ,       ,.F.     ,.F.     ,wClrTexto,wClrFundo,       ,"NONE" ,        ,        ,.T. ,.F.  , .F.   )
					        //New(nTop      ,nLeft     ,nBottom ,nRight ,cTitle     ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore ,nClrBack ,oCursor,cBorder,lSysMenu,lCaption,lMin, lMax, lPixel) CONSTRUCTOR
   EndIf

   //wc_Prog[1] := wCabecalho
   aAdd(wc_Prog,wCabecalho)

   __fSuper_AddFRM(wObjNomeFRM)

   If wOpcao=1
      __fSuper_AddObj(wObjNomeFRM,"FRM",__wc_FRM,woDlg)
   EndIf

   aAdd( oM_Dlg  , woDlg )
   aAdd( wM_Dlg  , {} )
   wM_Dlg[Len(wM_Dlg)] := {1,2,3,4,5,wTpForm,7,8,9,10,11}

   __fCase_Button(wMatrizBTN)

   If wQuestion
      wPos_Fnc := "{|Self|iIf(msgyesno("+Campo("Deseja sair do programa"+CHR(63))+"),(" + wPos_Fnc + "),.F.)}"
   EndIf

   If .Not.cEmpty(wAux_Fnc)
      woDlg:bInit := {|Self| &(wAux_Fnc)  }
   EndIf

   If wTpForm = "D"
      If .Not.cEmpty(wPos_Fnc)
         woDlg:bValid := {|Self| &(wPos_Fnc) }
      EndIf
   Else
      If .Not.cEmpty(wPos_Fnc)
         woDlg:bValid := {|Self| &(wPos_Fnc),cwFinal(wObjNomeFRM) }
      Else
         woDlg:bValid := {|Self| cwFinal(wObjNomeFRM) }
      EndIf
   EndIf

   cursorarrow()

Return {wTpForm,wCenter,wc_Prog[Len(wc_Prog)]}
*fim da Function __fCase_Form(wObjeto)

Function c_Get_Picture(wColuna,wPicture,wCase)
************************************************************************************************
*                            Função para Trocar a Picture                                      *
************************************************************************************************
Local wNumCol,wx

   wPicture := cNvl(wPicture,"")
   If cEmpty(wCase)
      For wx := 01 To 02
         If wx = 1
            wCase := wM_Grid_Seq[wG_Atual]
         Else
            wCase := Len(wM_Case)
         EndIf
         wNumCol := cNC(wColuna,wCase,.F.,"c_Get_Picture")
         If .Not.cEmpty(wNumCol)
            Exit
         EndIf
      Next
   Else
      wNumCol := cNC(wColuna,wCase,.F.,"c_Get_Picture")
   EndIf

   If .Not.cEmpty(wNumCol)
      wM_Case[wCase,wCS_ObjGet,wNumCol]:cPicture     := wPicture
      wM_Case[wCase,wCS_ObjGet,wNumCol]:oGet:Picture := wPicture
      wM_Case[wCase,wCS_ObjGet,wNumCol]:Refresh()
   EndIf

Return .T.
*Fim da Function c_Get_Picture()

Function fObj_UpdateAll(wTabela,wColuna,wCharOri,wCharNovo,wWhere)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wResp, wReturn, wKey, wx:=00  ,wObj_Tp , wKeyX , wConteudo

   wKey := wColuna + " Like " + Campo( "%"+wCharOri+"%","C") 
   wKey := wKey + " And " + wWhere
   wResp := fConsulta2(wTabela,{wColuna},wKey)

   For wx := 01 To Len(wResp)
       wKeyX     := wColuna + " = " + Campo(wResp[wx,01],"C")
       wConteudo := Strtran( wResp[wx,01] , wCharOri , wCharNovo)
       wConteudo := AllTrim(wConteudo)
       fUpDate2(wTabela,wKeyX,{wColuna,wConteudo},.F.)
   Next
Return( .T. )
*fim da Function fObj_UpdateAll()

Function xfObj_UpdateAll()
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wResp, wReturn, wKeySql, wx:=00  ,wObj_Tp , wKeySqlX , wConteudo, wMM, wObj_Nome, wTexto

   wKeySql := " Obj_Nome Like " + Campo("%.COL_%")
   wKeySql := wKeySql + " And Obj_Tp = " + Campo("COL")
   wResp   := fConsulta2("cCase_Obj",{"Distinct Obj_Nome"},wKeySql,"Obj_Nome")

   For wx := 01 To Len(wResp)
      wTexto := Space(00)

      wObj_Nome := wResp[wx,01]
      wKeySqlX  := " Obj_Nome = " + Campo(wObj_Nome,"C")

      wObj_Nome := Upper(AllTrim(wObj_Nome))

      wConteudo := Strtran( wObj_Nome , "COL_" , "" )
      wConteudo := Upper(AllTrim(wConteudo))
      fUpDate2("cCase_Obj",wKeySqlX,{"Obj_Nome",wConteudo})
   Next

Return( .T. )
*fim da Function xfObj_UpdateAll()

Function c_Var_Atrib(wVar_Nome,wConteudo)
*******************************************************************************
*                                                                             *
*******************************************************************************
wConteudo := &wConteudo
wConteudo := iIf(cEmpty(wConteudo),"",wConteudo)

&wVar_Nome := wConteudo

Return( .T. )
*fim da Function c_Var_Atrib(wVar_Nome,wConteudo)

Function __fCase_GetFree(wMatriz)
*****************************************************************************************************
*                                                                                                   *
*****************************************************************************************************
   If Len(wMatriz)>0
      wc_Case_Seq := Len(wM_Case)+1
      fCaseAdd(wMatriz)
      __fCase_Get(wc_Case_Seq)
      fCaseDefVar(wc_Case_Seq)
      fCaseRefresh(wc_Case_Seq)
      aAdd( wM_BrwLin , 01 )
      aAdd( wM_Grid , {} )
      aAdd( wM_Tab_Nome   , "X" )
      aAdd( wM_Tab_Filter , "" )
      aAdd( wM_Tab_PosFnc , {.F.,"",.F.,0,"",""})
      aAdd ( wTab_Setup , { .F. , "0" , 0 } )
      aAdd( wMBrwSTRCampos , Space(00) )
      aAdd( wMBrwCampos    , {} )
      aAdd( wMBrwCabeca    , {} )
      aAdd( wMBrwColSize   , {} )
      aAdd( wMBrwColAlinha , {} )
      aAdd( wMGrid_Col     , 0  )
      aAdd( wMCase_Col     , 0  )
      aAdd( wMFunc_DbClick , ".T." )
      aAdd( wMFunc_rClick  , ".T." )
      aAdd( wMFunc_Change  , ".T." )
      aAdd( wMFunc_ClrGTxt , "cColor('Preto')" )
      aAdd( wMFunc_ClrSTxt , "cColor('Branco')" )
      aAdd( wMFunc_Atrib      , "" )
      aAdd( wMFunc_Refresh    , "" )
      aAdd( wM_Grid_Col_Order , 01             )
      aAdd( wM_Case_Col_Order , 01             )
      aAdd( wM_Grid_Order     , {}             )
      aAdd( wM_Control , { , Len(wM_Control)+1 , })
      aAdd( oM_Brw     , )
      aAdd( oM_Brw_Say , )
   EndIf

Return .t.
* fim da Function __fCase_GetFree(wMatriz)

Function cCombo_BTN(wSelf,wColuna,wGrid,wAdiciona)
*****************************************************************************************************
*                          Localiza qual botão de Pesquisa foi clicado                              *
*****************************************************************************************************
Local wx,oBtnCombo,wPos

   If ValType(wColuna)="U"
      For wx := 01 To Len(oM_BtnCombo)
         If wSelf:hWnd = oM_BtnCombo[wx][1]:hWnd
            oM_BtnCombo[wx][4] := .T.
            Exit
         EndIf
      Next
   Else
      If cEmpty(wGrid)
         wGrid := wM_Grid_Seq[wG_Atual]
      EndIf

      wAdiciona := iif(valtype(wAdiciona)<>"L",.F.,wAdiciona)
      If wAdiciona
         oBtnCombo := cO(wColuna,wGrid)
         wPos := 00
         For wx := 01 To Len(oM_BtnCombo)
            If oM_BtnCombo[wx][2] = wGrid .And. Upper(oM_BtnCombo[wx][3]) = Upper(wColuna)
               wPos := wx
            EndIf
         Next
         If wPos = 0
            aAdd(oM_BtnCombo,{oBtnCombo,wGrid,wColuna,.F. })
         EndIf
      EndIf

      For wx := 01 To Len(oM_BtnCombo)
         If oM_BtnCombo[wx][2] = wGrid .And. Upper(oM_BtnCombo[wx][3]) = Upper(wColuna)
            oM_BtnCombo[wx][4] := .T.
            Exit
         EndIf
      Next
   EndIf

Return .t.
* fim da Function cCombo_BTN(wSelf,wColuna,wGrid)

Function cCombo_Atrib(wGrid,wGrid_Combo)
*****************************************************************************************************
*                          Localiza qual botão de Pesquisa foi clicado                              *
*****************************************************************************************************
Local wx:=00,wy:=00,wz:=00,wMatriz,wNum_Coluna := 0,wLastDlg,wM_TpMatriz
Local wxLen,wxLen1,wxLen2,wxLen3,wOpcao,wxopcao,wDefVar,wPos,wSys_Col
Local wxGrid,wyGrid,wxColuna,wyColuna,wProximo,wPrimeiro,wUltimo,wSys_Grid

wLastDlg    := Len(oM_Dlg)-1
wOpcao      := wM_Dlg[wLastDlg,5]
wM_TpMatriz := {}

If wOpcao=1
   For wx := 01 To Len(oM_BtnCombo)
      If oM_BtnCombo[wx][4] = .T.
         wSys_Col  := oM_BtnCombo[wx][3]
         wSys_Grid := oM_BtnCombo[wx][2]
      EndIf
   Next

   If .Not.cEmpty(wSys_Grid) .And. .Not.cEmpty(wSys_Col)
      wPos := cNC(wSys_Col,wSys_Grid,.F.,"cCombo_Atrib")
   EndIf

   wxGrid := 00
   wyGrid := 00
   wxColuna := Space(00)
   wyColuna := Space(00)
   wProximo := 00

   wx := 00
   For wx := 01 To Len(oM_BtnCombo)
      If oM_BtnCombo[wx][4] = .T.
         wxGrid   := oM_BtnCombo[wx][2]
         wxColuna := oM_BtnCombo[wx][3]
         wProximo := wx
      EndIf
      If .Not.cEmpty(wProximo) .And. oM_BtnCombo[wx][2] = wGrid
         If wx > wProximo
            wyGrid   := oM_BtnCombo[wx][2]
            wyColuna := oM_BtnCombo[wx][3]
            Exit
         EndIf
      EndIf
   Next

   wxLen3    := Len(wM_Case[wSys_Grid,wCS_Coluna])
   wPrimeiro := 01
   wUltimo   := wxLen3

   If .Not.cEmpty(wxColuna)
      wPrimeiro := cNC(wxColuna,wxGrid,,"cCombo_Atrib")
   EndIf

   If .Not.cEmpty(wyColuna)
      wUltimo := cNC(wyColuna,wyGrid,,"cCombo_Atrib")
      wUltimo := wUltimo - 1
   EndIf

   wx := 00
   wxLen1:= Len(wM_Case[wGrid_Combo,wCS_Coluna])
   For wx:= 01 To wxLen1
      cursorwait()
      If .Not.cEmpty(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])
         wMatriz := cStrToMatriz(AllTrim(Upper(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])),"#")
      Else
         wMatriz := {}
      EndIf
      wxLen2:= Len(wMatriz)
      For wy:= 01 To wxLen2
         For wz := 01 To wxLen3
            If wz < wPrimeiro
               Loop
            ElseIf wz > wUltimo
               Exit
            EndIf
            If wM_Case[wSys_Grid][wCS_Coluna ,wz]==wMatriz[wy]
               If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="C"
                  wDefVar := cDefVar(wM_Case[wGrid_Combo,wCS_DefVar,wx],"C",wGrid_Combo)
                  If ValType(wDefVar)="U"
                     wDefVar := Space(00)
                  EndIf
                  If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="U"
                     wM_Case[wGrid_Combo,wCS_Conteudo,wx] := Space(00)
                  EndIf
                  If wM_Case[wGrid_Combo,wCS_TypeVar,wx]<>"C"
                     cCancel('Erro na Coluna '+wM_Case[wGrid_Combo,wCS_Coluna,wx]+' (Propriedade TIPO DE COLUNA).')
                  EndIf   
                  wM_Case[wSys_Grid][wCS_Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx] + Space(Len(wDefVar)-Len(wM_Case[wGrid_Combo,wCS_Conteudo,wx]))
               Else
                  wM_Case[wSys_Grid][wCS_Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx]
               EndIf
               If ValType(wM_Case[wSys_Grid][wCS_ObjGet,wz])="O"
                  wM_Case[wSys_Grid][wCS_ObjGet,wz]:Refresh()
                  If wM_Case[wSys_Grid][wCS_Formato,wz] = 23
                     wNum_Coluna := wz
                  EndIf
               EndIf
               Exit
            EndIf
         Next
      Next
   Next

   oM_Dlg[Len(oM_Dlg)]:End()
   If wNum_Coluna>0
      wM_Case[wSys_Grid][wCS_ObjGet,wNum_Coluna]:SetFocus()
   EndIf
Else

   wx := 00
   wxLen1:= Len(wM_Case[wGrid_Combo,wCS_Coluna])
   For wx:= 01 To wxLen1
      cursorwait()
      If .Not.cEmpty(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])
         wMatriz := cStrToMatriz(AllTrim(Upper(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])),"#")
      Else
         wMatriz := {}
      EndIf
      wxLen2:= Len(wMatriz)
      For wy:= 01 To wxLen2
          wxLen3 := Len(wM_Case[wGrid][wCS_Coluna])
          For wz := 01 To wxLen3
             If wM_Case[wGrid][wCS_Filtro,wz]<>20
                Loop
             EndIf
             If wM_Case[wGrid][wCS_Coluna,wz]==wMatriz[wy]
                If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="C"
                   wDefVar := cDefVar(wM_Case[wGrid_Combo,wCS_DefVar,wx],"C",wGrid_Combo)
                   If ValType(wDefVar)="U"
                      wDefVar := Space(00)
                   EndIf
                   If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="U"
                      wM_Case[wGrid_Combo,wCS_Conteudo,wx] := Space(00)
                   EndIf
                   wM_Case[wGrid][wCS_F1Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx] + Space(Len(wDefVar)-Len(wM_Case[wGrid_Combo,wCS_Conteudo,wx]))
                Else
                   wM_Case[wGrid][wCS_F1Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx]
                EndIf
                If ValType(wM_Case[wGrid][wCS_F1ObjGet,wz])="O"
                   wM_Case[wGrid][wCS_F1ObjGet,wz]:Refresh()
                   If wM_Case[wGrid][wCS_Formato,wz] = 23
                      wNum_Coluna := wz
                   EndIf
                EndIf
                Exit
             EndIf
             If .Not.cEmpty(wM_Case[wGrid][wCS_F1Conteudo,wz])
                Exit
             EndIf
          Next
      Next
   Next

   oM_Dlg[Len(oM_Dlg)]:End()
   If wNum_Coluna>0
      wM_Case[wGrid][wCS_F1ObjGet,wNum_Coluna]:SetFocus()
   EndIf
EndIf

wx := 00
For wx := 01 To Len(oM_BtnCombo)
   oM_BtnCombo[wx][1]:Enable()
   oM_BtnCombo[wx][4] := .F.
Next
cursorarrow()

Return .T.
* Fim da Function cCombo_Atrib()

//Function cCombo_Atrib(wGrid,wGrid_Combo)
//*****************************************************************************************************
//*                          Localiza qual botão de Pesquisa foi clicado                              *
//*****************************************************************************************************
//Local wx:=00,wy:=00,wz:=00,wMatriz,wNum_Coluna := 0,wLastDlg,wM_TpMatriz
//Local wxLen,wxLen1,wxLen2,wxLen3,wOpcao,wxopcao,wDefVar,wPos,wSys_Col,wObjSetFocus
//Local wxGrid,wyGrid,wxColuna,wyColuna,wProximo,wPrimeiro,wUltimo,wSys_Grid
//
//wLastDlg    := Len(oM_Dlg)-1
//wOpcao      := wM_Dlg[wLastDlg,5]
//wM_TpMatriz := {}
//
//If wOpcao=1
//   For wx := 01 To Len(oM_BtnCombo)
//      If oM_BtnCombo[wx][4] = .T.
//         wSys_Col  := oM_BtnCombo[wx][3]
//         wSys_Grid := oM_BtnCombo[wx][2]
//      EndIf
//   Next
//
//   If .Not.cEmpty(wSys_Grid) .And. .Not.cEmpty(wSys_Col)
//      wPos := cNC(wSys_Col,wSys_Grid,.F.,"cCombo_Atrib")
//   EndIf
//
//   wxGrid := 00
//   wyGrid := 00
//   wxColuna := Space(00)
//   wyColuna := Space(00)
//   wProximo := 00
//
//   wx := 00
//   For wx := 01 To Len(oM_BtnCombo)
//      If oM_BtnCombo[wx][4] = .T.
//         wxGrid   := oM_BtnCombo[wx][2]
//         wxColuna := oM_BtnCombo[wx][3]
//         wProximo := wx
//      EndIf
//      If .Not.cEmpty(wProximo) .And. oM_BtnCombo[wx][2] = wGrid
//         If wx > wProximo
//            wyGrid   := oM_BtnCombo[wx][2]
//            wyColuna := oM_BtnCombo[wx][3]
//            Exit
//         EndIf
//      EndIf
//   Next
//
//   wxLen3    := Len(wM_Case[wSys_Grid,wCS_Coluna])
//   wPrimeiro := 01
//   wUltimo   := wxLen3
//   If .Not.cEmpty(wxColuna)
//      wPrimeiro := cNC(wxColuna,wxGrid,,"cCombo_Atrib")
//   EndIf
//
//   If .Not.cEmpty(wyColuna)
//      wUltimo := cNC(wyColuna,wyGrid,,"cCombo_Atrib")
//      wUltimo := wUltimo - 1
//   EndIf
//
//   wx := 00
//   wxLen1:= Len(wM_Case[wGrid_Combo,wCS_Coluna])
//   For wx:= 01 To wxLen1
//      cursorwait()
//      If .Not.cEmpty(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])
//         wMatriz := cStrToMatriz(AllTrim(Upper(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])),"#")
//      Else
//         wMatriz := {}
//      EndIf
//      wxLen2:= Len(wMatriz)
//      For wy:= 01 To wxLen2
//         For wz := 01 To wxLen3
//            If wz < wPrimeiro
//               Loop
//         // ElseIf wz > wUltimo  // Precisa ser testado em todos os sistemas
//         //    Exit
//            EndIf
//
//            If wM_Case[wSys_Grid][wCS_Coluna ,wz]==wMatriz[wy]
//               If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="C"
//                  wDefVar := cDefVar(wM_Case[wGrid_Combo,wCS_DefVar,wx],"C",wGrid_Combo)
//                  If ValType(wDefVar)="U"
//                     wDefVar := Space(00)
//                  EndIf
//                  If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="U"
//                     wM_Case[wGrid_Combo,wCS_Conteudo,wx] := Space(00)
//                  EndIf
//                  If wM_Case[wGrid_Combo,wCS_TypeVar,wx]<>"C"
//                     cCancel('Erro na Coluna '+wM_Case[wGrid_Combo,wCS_Coluna,wx]+' (Propriedade TIPO DE COLUNA).')
//                  EndIf   
//                  wM_Case[wSys_Grid][wCS_Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx] + Space(Len(wDefVar)-Len(wM_Case[wGrid_Combo,wCS_Conteudo,wx]))
//               Else
//                  wM_Case[wSys_Grid][wCS_Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx]
//               EndIf
//               If ValType(wM_Case[wSys_Grid][wCS_ObjGet,wz])="O"
//                  wM_Case[wSys_Grid][wCS_ObjGet,wz]:Refresh()
//                  If wM_Case[wSys_Grid][wCS_Formato,wz] = 23
//                     wNum_Coluna := wz
//                  EndIf
//               EndIf
//               Exit
//            EndIf
//         Next
//      Next
//   Next
//
//   oM_Dlg[Len(oM_Dlg)]:End()
//   If wNum_Coluna>0
//      wObjSetFocus := wM_Case[wSys_Grid][wCS_ObjGet,wNum_Coluna]
//   EndIf
//Else
//
//   wx := 00
//   wxLen1:= Len(wM_Case[wGrid_Combo,wCS_Coluna])
//   For wx:= 01 To wxLen1
//      cursorwait()
//      If .Not.cEmpty(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])
//         wMatriz := cStrToMatriz(AllTrim(Upper(wM_Case[wGrid_Combo,wCS_Atrib_Lst,wx])),"#")
//      Else
//         wMatriz := {}
//      EndIf
//      wxLen2:= Len(wMatriz)
//      For wy:= 01 To wxLen2
//          wxLen3 := Len(wM_Case[wGrid][wCS_Coluna])
//          For wz := 01 To wxLen3
//             If wM_Case[wGrid][wCS_Filtro,wz]<>20
//                Loop
//             EndIf
//             If wM_Case[wGrid][wCS_Coluna,wz]==wMatriz[wy]
//                If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="C"
//                   wDefVar := cDefVar(wM_Case[wGrid_Combo,wCS_DefVar,wx],"C",wGrid_Combo)
//                   If ValType(wDefVar)="U"
//                      wDefVar := Space(00)
//                   EndIf
//                   If ValType(wM_Case[wGrid_Combo,wCS_Conteudo,wx])="U"
//                      wM_Case[wGrid_Combo,wCS_Conteudo,wx] := Space(00)
//                   EndIf
//                   wM_Case[wGrid][wCS_F1Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx] + Space(Len(wDefVar)-Len(wM_Case[wGrid_Combo,wCS_Conteudo,wx]))
//                Else
//                   wM_Case[wGrid][wCS_F1Conteudo,wz] := wM_Case[wGrid_Combo,wCS_Conteudo,wx]
//                EndIf
//                If ValType(wM_Case[wGrid][wCS_F1ObjGet,wz])="O"
//                   wM_Case[wGrid][wCS_F1ObjGet,wz]:Refresh()
//                   If wM_Case[wGrid][wCS_Formato,wz] = 23
//                      wNum_Coluna := wz
//                   EndIf
//                EndIf
//                Exit
//             EndIf
//             If .Not.cEmpty(wM_Case[wGrid][wCS_F1Conteudo,wz])
//                Exit
//             EndIf
//          Next
//      Next
//   Next
//
//   oM_Dlg[Len(oM_Dlg)]:End()
//   If wNum_Coluna>0
//      wObjSetFocus := wM_Case[wGrid][wCS_F1ObjGet,wNum_Coluna]
//   EndIf
//EndIf
//
//wx := 00
//For wx := 01 To Len(oM_BtnCombo)
//   oM_BtnCombo[wx][1]:Enable()
//   oM_BtnCombo[wx][4] := .F.
//Next
//cursorarrow()
//If ValType(wObjSetFocus)="O"
//	wObjSetFocus:SetFocus()
//EndIf
//
//Return .T.
//* Fim da Function cCombo_Atrib()

Function cAtrib_Image()
************************************************************************************************
*                       Função para gerar Arquivo RC com os BMPs                               *
************************************************************************************************
Local wNome,wPath,wObj_Nome,wArquivo,wWhere,wx,wPrp_Nome,wDescricao,wGera_RC,wLocal,wResp,wxLen,wObj_Prp_Vlr

  __wM_cCase_IMG := {}
  wWhere := " cCase_Obj.Obj_Tp = 'IMG' "
  wResp  := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Nome")

  Store Space(00) To wNome,wPath,wArquivo

  wxLen := Len(wResp)
  For wx:= 01 To wxLen
     wPrp_Nome    := Upper(AllTrim(wResp[wx,02]))
     wObj_Prp_Vlr := AllTrim(wResp[wx,03])
     If     wPrp_Nome == "NOME"
        wNome    := wObj_Prp_Vlr
     ElseIf wPrp_Nome == "PATH"
        wPath    := wObj_Prp_Vlr
     ElseIf wPrp_Nome == "ARQUIVO"
        wArquivo := wObj_Prp_Vlr
     EndIf

     If wx < wxLen
        wObj_Nome := wResp[wx+1,01]
     Else
        wObj_Nome := Space(00)
     EndIf   
  
     If wObj_Nome <> wResp[wx,01] .or. cEmpty(wObj_Nome)
        If cEmpty(wPath)
           wPath := __wc_Path_IMG
        Else
	        wPath := AllTrim(wPath)
	     EndIf
        aAdd( __wM_cCase_IMG , { Upper(wNome) , wPath+wArquivo , wPath , wArquivo})
        Store Space(00) To wNome,wPath,wArquivo
     EndIf
  Next

Return .T.
* Fim da Function cAtrib_Image()

Function cIMG_Arquivo(wNome)
************************************************************************************************
*                       Função para gerar Arquivo RC com os BMPs                               *
************************************************************************************************
Local wArquivo,wPos,wx

   wNome := Upper(AllTrim(wNome))
   wArquivo := ""
   For wx := 01 To Len(__wM_cCase_IMG)
      If __wM_cCase_IMG[wx,1] == wNome
         wArquivo := __wM_cCase_IMG[wx,2]
         Exit
      EndIf
   Next

Return wArquivo
* Fim da Function cIMG_Arquivo(wNome)

Function cCaseMenu(wObjeto)
***********************************************************************************
* Função para criar os Menus da cCase atrav's do objeto "MNU"                     *
***********************************************************************************
Local wActive,wAction,wy,wWhere,wResp,wSeparador,wNome,wSistema,wAcesso,wDescricao,wAux_Function,wpos,wPai,wCliente,wLen
Local wWhen,wComando,wz,wxx,wyy,wxy,wLocPos,wPrp_Nome,wMenu_Excecao,wExcecao,wSeqPai,wObj_Nome,oXXMenu,wXObjeto,wYObjeto

   __MVPRIVATE("wx_Menu")
   __MVPRIVATE("wM_Menu")
   wM_Menu        := {}
   wM_Menu_Global := {}

   wMenu_Excecao:={}

   fWork( .T. , 2 , 1)
   fWork( .F. , 2 , 1)

   *--------------------------------------------------------------------------------------------------*
   fACS_ChkRestricao()  // Monta Matrix de Restrições do Perfil do Usuário
   *--------------------------------------------------------------------------------------------------*
 
   *-----------------------------------Monta Matrix de Menu--------------------------------------*
   wWhere  := " cCase_Obj.Obj_Tp = 'MNU' "
   wResp   := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr","cCase_Obj.Obj_Seq","cCase_Obj.Obj_Dsc"},wWhere,"cCase_Obj.Obj_Nome,cCase_Obj_Prp.Prp_Nome")
 
   wWhen         := Space(00)
   wNome         := Space(00)
   wDescricao    := Space(00)
   wAux_Function := Space(00)                   
   wSeparador    := Space(00)                   
   wSistema      := Space(00)                   
   wAcesso       := wACS_Perfil_TP              

   For wx_Menu := 01 To Len(wResp)
      wPrp_Nome         := Upper(AllTrim(wResp[wx_Menu,02]))
      wResp[wx_Menu,03] := AllTrim(wResp[wx_Menu,03])
      If     wPrp_Nome == "NOME"
         wNome         := wResp[wx_Menu,03]
      ElseIf wPrp_Nome == "DESCRICAO"
         wDescricao    := wResp[wx_Menu,03]
      ElseIf wPrp_Nome == "AUX_FUNCTION"
         wAux_Function := wResp[wx_Menu,03]
      ElseIf wPrp_Nome == "SEPARADOR"
         wSeparador    := wResp[wx_Menu,03]
      ElseIf wPrp_Nome == "SISTEMA"
         wSistema      := wResp[wx_Menu,03]
      ElseIf wPrp_Nome == "ACESSO"
         wAcesso       := wResp[wx_Menu,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
		      If     wPrp_Nome == "NOME"
		         wNome         := wResp[wx_Menu,03]
		      ElseIf wPrp_Nome == "DESCRICAO"
		         wDescricao    := wResp[wx_Menu,03]
		      ElseIf wPrp_Nome == "AUX_FUNCTION"
		         wAux_Function := wResp[wx_Menu,03]
		      ElseIf wPrp_Nome == "SEPARADOR"
		         wSeparador    := wResp[wx_Menu,03]
		      ElseIf wPrp_Nome == "SISTEMA"
		         wSistema      := wResp[wx_Menu,03]
		      ElseIf wPrp_Nome == "ACESSO"
		         wAcesso       := wResp[wx_Menu,03]
	         EndIf
         EndIf
      EndIf
      
      If wx_Menu < Len(wResp)
         wObj_Nome := wResp[wx_Menu+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf
      
//    If wObj_Nome <> wResp[wx_Menu,01] .or. cEmpty(wObj_Nome)
      If (.not. wObj_Nome == wResp[wx_Menu,01]) .or. cEmpty(wObj_Nome)
         If .Not.cEmpty(wNome) .Or. .Not.cEmpty(wSeparador) 
            *wXObjeto := Trim(wResp[wx_Menu,01])
            *wXObjeto := StrTran( wXObjeto , wObjeto+"." , "" )

            wYObjeto := Trim(wResp[wx_Menu,01])
            wXObjeto := StrTran( wYObjeto , wObjeto+"." , "" )
            If Upper(wSistema) == wc_Sistema //Upper(wSistema) == Upper("GLB") .or. ;
                                             //Upper(wSistema) == Upper("ADM") .or. ;*/
               
               wExcecao := 0
               for wxx=1 to len(wMenu_Excecao)
                   If wXObjeto = wMenu_Excecao[wxx] 
                      wExcecao = 1
                      Exit
                   EndIf
               Next
               If wExcecao = 0
                  aAdd( m->wM_Menu , { wXObjeto , wNome , wAux_Function , wDescricao , wResp[wx_Menu-1,04], StrTran(wXObjeto,"&","")  , Space(00) , wSeparador , wAcesso , Upper(wYObjeto) })
               EndIf
            Else
               aadd(wMenu_Excecao,wXObjeto)
            EndIf
            aAdd( m->wM_Menu_Global , { wXObjeto , wNome , wAux_Function , wDescricao , wSeparador , wAcesso , wSistema, Trim(wResp[wx_Menu,01]), wResp[wx_Menu,04] , Trim(wResp[wx_Menu,05]) })
            wNome         := Space(00)
            wDescricao    := Space(00)
            wAux_Function := Space(00)
            wSeparador    := Space(00)
            wSistema      := Space(00)
            wAcesso       := wACS_Perfil_TP              

         EndIf
      EndIf
   Next
   *--------------------------------------------------------------------------------------------------*
 
   *------------------------------ MENU - Verifica Restrições do Perfil do Usuário--------------------*
   For wxx=1 to len(wM_ACS_Restricao)        
       If wM_ACS_Restricao[wxx,02] <> "MNU"
          Loop
       EndIf
 
       For wyy=Len(wM_Menu) to 1 step -1
           If wM_Menu[wyy,10]+"." = wM_ACS_Restricao[wxx,01]+"." // esta contido 

              If wM_Menu[wyy,09]="1" .Or. wM_Menu[wyy,09]="0"
	              wM_Menu[wyy,09] := wM_ACS_Restricao[wxx,03]  // (0-Mostra habilitado) (1-Mostra desabilitado)  (2-Nao mostra) 
	           EndIf
           EndIf
       Next
   Next
   *--------------------------------------------------------------------------------------------------*
   
   *----------------------ClassIfica a matrix do menu--------------------------------------------*
   wx_Menu := 00
   For wx_Menu := 01 To Len(wM_Menu)
      wPos := At(".",wM_Menu[wx_Menu,06])
      If wPos = 0 // NAO tem ponto
         wPai    := wM_Menu[wx_Menu,06]
         wSeqPai := AllTrim(Str(wM_Menu[wx_Menu,05]))
      Else
         Loop
      EndIf
 
      For wy=1 to len(wM_Menu)
         If wM_Menu[wy,06] = wPai 
            wM_Menu[wy,06] := StrTran(wM_Menu[wy,06],wPai+".",wSeqPai+"#")
            wM_Menu[wy,07] := wM_Menu[wy,07] + wSeqPai
         EndIf
      Next
   Next
 
   aSort( wM_Menu ,,,{|x,y| x[7] < y[7]})                     // ordena a coluna em ordem CRESCENTE 

   *--------------------------------------------------------------------------------------------------*

	wlen := Len(wM_Menu)   
   For wyy = 1 to wlen
       If wM_Menu[wyy,9] = "2" 
	       For wxx =  wyy+1 to wlen
             If At(wM_Menu[wyy,10]+".",wM_Menu[wxx,10])>0 // E menu filho
                wM_Menu[wxx,9] := "2"
             Else
             	 Exit
             EndIf
          Next
       ElseIf wM_Menu[wyy,9] = "3" 
       	wM_Menu[wyy,9] := "1"
       EndIf
       
       For wz = 1 To Len(wM_Menu_Global)
       	If wM_Menu_Global[wz,1] == wM_Menu[wyy,1]
       		wM_Menu_Global[wz,6] := wM_Menu[wyy,9]
       		Exit
       	EndIf
       Next
   Next
   *--------------------------------------------------------------------------------------------------*

   *---------------------------------------------------------------------------------------------*
   *-------------------------------Executa o MENU------------------------------------------------*
   oXXMenu := MenuBegin( .F. )                                      
   wx_Menu := 00
   For wx_Menu := 01 To Len(wM_Menu)
       If wM_Menu[wx_Menu,09] = "2"
			 Loop
		 EndIf

       If wM_Menu[wx_Menu,08]="S"  // Separador Horizontal
          MenuAddItem("|")
          Loop
       EndIf
 
       If cEmpty(wM_Menu[wx_Menu,03])
          wWhen   := "{||(wWhenMenuItem.And." + iIf(wM_Menu[wx_Menu,09]="1".and..not.cEmpty(wM_Menu[wx_Menu,03]),".f.",".t.")  + ")}"
          MenuAddItem( wM_Menu[wx_Menu,02] , wM_Menu[wx_Menu,04] , .F. , .T. ,          ,,,,,,, .F.,, {||&wWhen} , .F. )
          wWhen := Space(00)
       Else
          wAction := '{|oMenuItem|(' + wM_Menu[wx_Menu,03] + ')}'
          wWhen   := "{||(wWhenMenuItem.And." + iIf(wM_Menu[wx_Menu,09]="1".and..not.cEmpty(wM_Menu[wx_Menu,03]),".f.",".t.")  + ")}"
          MenuAddItem( wM_Menu[wx_Menu,02] , wM_Menu[wx_Menu,04] , .F. , .T., &wAction ,,,,,,, .F.,, &(wWhen) , .F. )
          wWhen   := Space(00)                                                                                    
       EndIf
 
       If cEmpty(wM_Menu[wx_Menu,03])  // se tem filhos
          cCaseMenuAux()
       EndIf
   Next
          
   //   MenuAddItem( "&Relatório",, .F.,,,,,,,,, .F.,,, .F. )
   //   MenuBegin( .F. )
   //      MenuAddItem( "&Impressão",, .F.,,,,,,,,, .F.,,, .F. )
   //         MenuBegin( .F. )
   //            For wz := 01 To Len(M->wMgrupos)          
   //               wWhen   := "{||(wWhenMenuItem) }"
   //               MenuAddItem(M->wMgrupos[wz],,,,,,,,,,,,,&(wWhen)  )    
   //               wWhen   := Space(00)
   //               MenuBegin( .F. )
   //               For wxy := 01 To Len(M->wMrel)     
   //                  If Upper(m->wMgrupos[wz]) = Upper(M->wMrel[wxy,1])
   //                     wComando := "cRel_Impressao('"+AllTrim(M->wMrel[wxy,3])+"')"
   //                     MenuAddItem((m->wMrel[wxy,3]+"-"+M->wMrel[wxy,2]),,,,{|oMenuitem| &wComando }) 
   //                  EndIf
   //               Next
   //               MenuEnd()
   //            Next
   //         MenuEnd()
   //      MenuAddItem( "&Confecção" ,, .F.,,{|oMenuItem|(fObj_LoadAll("FRM_Confeccao"))},,,,,,, .F.,,, .F. )
   //   MenuEnd()
      
   MenuEnd()
   *---------------------------------------------------------------------------------------------*
 
Return (oXXMenu)
* Fim da Function cCaseMenu(wObjeto)

Function cCaseMenuAux()
***********************************************************************************
*                     Funcao Auxiliar para a montagem de Menus                    *
***********************************************************************************
Local wMenuStru , wAction , wWhen ,  wLocPos , wActive

   MenuBegin( .F. )
   wWhen := Space(00)

   wMenuStru := wM_Menu[wx_Menu,01] + "."
   For wx_Menu=wx_Menu+1 to len(wM_Menu)

       If wM_Menu[wx_Menu,09] = "2"
			 Loop
		 EndIf

       If wM_Menu[wx_Menu,08]="S"  // Separador Vertical
          MenuAddItem()
          Loop
       EndIf

       If SubStr(wM_Menu[wx_Menu,01],1,Rat(".",wM_Menu[wx_Menu,01])) == wMenuStru 
          If cEmpty(wM_Menu[wx_Menu,03])
             wWhen   := "{||(wWhenMenuItem.And." + iIf(wM_Menu[wx_Menu,09]="1".and..not.cEmpty(wM_Menu[wx_Menu,03]),".f.",".t.")  + ")}"
             MenuAddItem( wM_Menu[wx_Menu,02] , wM_Menu[wx_Menu,04] , .F. ,   .T. ,          ,,,,,,, .F.,,&(wWhen) , .F. )
             wWhen := Space(00)
          Else
             wAction := '{|oMenuItem|(' + wM_Menu[wx_Menu,03] + ')}'
             wWhen   := "{||(wWhenMenuItem.And." + iIf(wM_Menu[wx_Menu,09]="1".and..not.cEmpty(wM_Menu[wx_Menu,03]),".f.",".t.")  + ")}"
             MenuAddItem( wM_Menu[wx_Menu,02] , wM_Menu[wx_Menu,04] , .F. ,.T. , &(wAction) ,,,,,,, .F.,, &(wWhen) , .F. )
          EndIf
          If cEmpty(wM_Menu[wx_Menu,03])  // se tem filhos
             cCaseMenuAux()
          EndIf
       Else       
          wx_Menu := wx_Menu - 01
          Exit
       EndIf
   Next
   MenuEnd()

Return nil
* Fim da Function cCaseMenuAux()

Function fKeyMenu(wKey)
************************************************************************************
*                       Funcao para Configurar teclas da cCase                     *
************************************************************************************
If wKey = 27
   If wM_Opcao[Len(oM_Dlg)] = "inclui" .Or. wM_Opcao[Len(oM_Dlg)] = "altera"
      oM_Button[wBt_Cancel]:Click()
   EndIf
ElseIf GetKeyState(17) .and. wKey = 83
   If wM_Opcao[Len(oM_Dlg)] = "inclui" .Or. wM_Opcao[Len(oM_Dlg)] = "altera"
      oM_Button[wBt_Grava]:Click()
   EndIf
ElseIf wKey == VK_F9
   WinExec("Calc.exe")
EndIf

Return .T.
* Fim da Function fKeyMenu(wKey)

Function fColuna_Atual( whWnd , wFocusAtual )
*****************************************************************************************
*                       Funcao para inFormar o nome da Coluna Atual                     *
*****************************************************************************************
Local wx:=0,wy:=0,wPos,wObjeto,wColuna,wM_Compara:={},wNum_Obj,wAux_Num_Obj,wAux_Coluna,wLocalCursor,wColAnt

   wColuna := Space(00)

   If wFocusAtual
      For wx := 01 To Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
         If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx])="O" .And. .Not.cEmpty(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_TpValid,wx][01])
            wColuna := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna,wx]  // Nova Coluna com Foco
            Exit
         EndIf
      Next

      For wx := 01 To Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
         If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx])="O"
            If whWnd == wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd
               wColuna := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna,wx]  // Nova Coluna com Foco
            EndIf
         EndIf
      Next
   EndIf
   
   If cEmpty(wColuna)
      wAux_Coluna  := Space(00)
      wNum_Obj     := 00
      wAux_Num_Obj := 00
      wLocalCursor := 00
    
      For wx := 01 to Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
         If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx]>00
            If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx])="O"
               aAdd( wM_Compara , { wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna,wx] ,wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd })
               wObjeto := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjRef,wx]
               wObjeto := &wObjeto
            EndIf
         EndIf
      Next
    
      For wx := 01 to Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
         If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wx]>00
            If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx])="O"
               If wObjeto:hCtlFocus = wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd
                  If ((wObjeto:nLastKey = 09 .And. GetKeyState(16)) .Or. wObjeto:nLastKey == VK_UP)
                     For wy := 01 To Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna])
                        If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wy]>00
                           If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy])="O"
                              If .Not.wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:lFocused .And. ;
                                  wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:lActive      .And. ;
                                  wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd = wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:hWnd
                                 wNum_Obj := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:hWnd
                                 Exit
                              EndIf
                           EndIf
                        EndIf
                     Next
                     If cEmpty(wNum_Obj)
                        wNum_Obj := NextDlgTab( wObjeto:hWnd , wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd )
                     EndIf
                  ElseIf (wObjeto:nLastKey = 09 .And. .Not.GetKeyState(16)) .Or. wObjeto:nLastKey = 13 .Or. wObjeto:nLastKey == VK_DOWN 
                     For wy := Len(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Coluna]) to 01 Step -1
                        If wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_Formato,wy]>00
                           If ValType(wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy])="O"
                              If .Not.wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:lFocused .And. ;
                                  wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:lActive      .And. ;
                                  wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd = wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:hWnd
                                 wNum_Obj := wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wy]:hWnd
                                 Exit
                              EndIf
                           EndIf
                        EndIf
                     Next
                     If cEmpty(wNum_Obj)
                        wNum_Obj := NextDlgTab( wObjeto:hWnd , wM_Case[m->wM_Grid_Seq[wG_Atual],wCS_ObjGet,wx]:hWnd , .t. )
                     EndIf
                  EndIf
    
                  wPos := cScan( wM_Compara , wNum_Obj , 02 )
                  If wPos>0
                     wColuna := wM_Compara[wPos,01]
                     Exit
                  EndIf
               Else
                  If (wObjeto:nLastKey = 09 .And. GetKeyState(16)) .Or. (GetKeyState(09) .And. GetKeyState(16)) .Or. wObjeto:nLastKey == VK_UP
                     wAux_Num_Obj := NextDlgTab( wObjeto:hWnd , wObjeto:hCtlFocus )
                     wPos := cScan( wM_Compara , wAux_Num_Obj , 02 )
                     If wPos>0
                        wAux_Coluna := wM_Compara[wPos,01]
                     EndIf
                  ElseIf ((wObjeto:nLastKey = 09 .And. .Not.GetKeyState(16)) .Or. (GetKeyState(13)) .Or. (wObjeto:nLastKey = 13)) .Or. wObjeto:nLastKey == VK_DOWN
                     wAux_Num_Obj := NextDlgTab( wObjeto:hWnd , wObjeto:hCtlFocus , .t. )
                     wPos := cScan( wM_Compara , wAux_Num_Obj , 02 )
                     If wPos>0
                        wAux_Coluna := wM_Compara[wPos,01]
                     EndIf
                  EndIf
               EndIf
            EndIf
         EndIf
      Next
    
      If cEmpty(wColuna)
         wColuna := wAux_Coluna
      EndIf
   EndIf

Return .T.
* Fim da Function fColuna_Atual()

Function cObj_Say(wObjeto)
********************************************************************************************************************************
*                                  Função de busca para as Propriedades do Frame                                                          *
********************************************************************************************************************************
Local wPrompt , wDeslocLin , wDeslocCol , wObjDesloc , wObjRef , wNegrito , wMatriz ,  wx:=0 , wPrp_Nome

   wMatriz := fObj_Load(wObjeto)
   For wx := 01 To Len(wMatriz)
      wPrp_Nome := Upper(AllTrim(wMatriz[wx,01]))
      If wPrp_Nome     == "PROMPT"
         wPrompt      := wMatriz[wx,02]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wDeslocLin   := wMatriz[wx,02]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wDeslocCol   := wMatriz[wx,02]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
         wObjDesloc   := wMatriz[wx,02]
      ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef      := wMatriz[wx,02]
      ElseIf wPrp_Nome == "NEGRITO"
         wNegrito     := wMatriz[wx,02]
      EndIf
   Next

   wPrompt    := iIf(cEmpty(wPrompt)   ,"" ,AllTrim(wPrompt))
   wDeslocLin := iIf(cEmpty(wDeslocLin),00 ,Val(wDeslocLin))
   wDeslocCol := iIf(cEmpty(wDeslocCol),00 ,Val(wDeslocCol))
   wObjRef    := iIf(cEmpty(wObjRef)   ,"" ,&wObjRef)
   wObjDesloc := iIf(cEmpty(wObjDesloc),"" ,&wObjDesloc)
   wNegrito   := iIf(ValType(wNegrito)<>"C","N",wNegrito)
   wNegrito   := iIf(wNegrito="S"          ,.T.,.F.)

   c_Say(wObjRef,wObjDesloc,wDeslocLin,wDeslocCol,wPrompt,wNegrito)

Return .T.
*fim da Function cObj_Say(wObjeto)

Function __fCase_Say(wMatriz)
********************************************************************************************************************************
*                                  Função de busca para as Propriedades do Frame                                                          *
********************************************************************************************************************************
Local wPrompt,wDeslocLin,wDeslocCol,wObjDesloc,wObjRef,wNegrito,wx:=0,wPrp_Nome,wObj_Nome,wPos,wCliente,wObj

   Store Space(00) To wPrompt,wDeslocLin,wDeslocCol,wObjRef,wObjDesloc,wNegrito,wObj_Nome

   For wx := 01 To Len(wMatriz)
      wPrp_Nome := Upper(AllTrim(wMatriz[wx,02]))
      If wPrp_Nome     == "PROMPT"
         wPrompt    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wDeslocLin := wMatriz[wx,03]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wDeslocCol := wMatriz[wx,03]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
         wObjDesloc := wMatriz[wx,03]
      ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "NEGRITO"
         wNegrito   := wMatriz[wx,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If wPrp_Nome     == "PROMPT"
               wPrompt    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
               wDeslocLin := wMatriz[wx,03]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
               wDeslocCol := wMatriz[wx,03]
            ElseIf wPrp_Nome == "OBJETO_DESLOC"
               wObjDesloc := wMatriz[wx,03]
            ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
               wObjRef    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "NEGRITO"
               wNegrito   := wMatriz[wx,03]
            EndIf
         EndIf
      EndIf

      If wx < Len(wMatriz)
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wMatriz[wx,01] .Or. cEmpty(wObj_Nome)
         wPrompt    := AllTrim(wPrompt)
         wDeslocLin := iIf(cEmpty(wDeslocLin),00 ,Val(wDeslocLin))
         wDeslocCol := iIf(cEmpty(wDeslocCol),00 ,Val(wDeslocCol))
         wObjRef    := iIf(cEmpty(wObjRef)   ,"" ,&wObjRef)
         wObjDesloc := iIf(cEmpty(wObjDesloc),"" ,&wObjDesloc)
         wNegrito   := iIf(ValType(wNegrito)<>"C","N",wNegrito)
         wNegrito   := iIf(wNegrito="S"          ,.T.,.F.)

         wObj := c_Say(wObjRef,wObjDesloc,wDeslocLin,wDeslocCol,wPrompt,wNegrito)

         __fSuper_AddObj(wMatriz[wx,01],"SAY",wx,wObj)

         Store Space(00) To wPrompt,wDeslocLin,wDeslocCol,wObjRef,wObjDesloc,wNegrito
      EndIf
   Next

Return .T.
*fim da Function __fCase_Say(wObjeto)

Function ffinal()
******************************************************************************
*              funcao para saida do sistema                                  *
******************************************************************************
//   If cwMsg(02,"Deseja Sair do Sistema","Atenção")
//      RELEASE ALL
//      m->oM_WinMain[1]:End()
//   Else
//      RELEASE ALL
//      Main()   
//
//   EndIf
//

   fWork( .T. , 2 , 1)
   fObj_LoadAll("FRM_cCase_Saida")
   fWork( .F. , 2 , 1)


Return .t.
*fim da Function ffinal()


Function fCursor_Tp( wStr_Formato , wTipo )
*******************************************************************************
*                     Função que verIficar o Tipo de Cursor                   *
*******************************************************************************
Local wx , wM_Str_Formato

   wM_Str_Formato := cStrToMatriz(AllTrim(Upper(wStr_Formato)),"#")

   For wx := 01 to Len(wM_Str_Formato)
      If     wM_Str_Formato[wx] = "NULO"
         If wTipo = 00 .Or. wTipo = 10
            Return .T.
         EndIf   
      ElseIf wM_Str_Formato[wx] = "SAY"
         If wTipo = 20
            Return .T.
         EndIf
      ElseIf wM_Str_Formato[wx] = "GET"
         If wTipo = 01 .Or. wTipo = 03 .Or. wTipo = 07 .Or. wTipo = 08 .Or. wTipo = 11 .Or. wTipo = 12
            Return .T.
         EndIf
      ElseIf wM_Str_Formato[wx] = "TCOMBOBOX"
         If wTipo = 02 .Or. wTipo = 16
            Return .T.
         EndIf
      ElseIf wM_Str_Formato[wx] = "MEMO"
         If wTipo = 04 .Or. wTipo = 13
            Return .T.
         EndIf
      ElseIf wM_Str_Formato[wx] = "RADIO"
         If wTipo = 05
            Return .T.
         EndIf
      ElseIf wM_Str_Formato[wx] = "CHECKBOX"
         If wTipo = 06
            Return .T.
         EndIf
      EndIf
   Next

   * 00 - Not Display
   * 10 - Say
   * 20 - Get Edit
   * 23 - Get Browse
   * 26 - Get Sequence
   * 30 - ComboBox
   * 33 - ComboBox Edit
   * 40 - Memo Edit
   * 43 - Memo Read
   * 50 - Option Button
   * 60 - Check Box

   * 01 - Coluna - Sim / não

   * Function
   
// For wx := 01 to Len(wM_Str_Formato)
//    If     wM_Str_Formato[wx] = "NULO"
//       If wTipo = 00
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "SAY"
//       If wTipo = 01
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "GET"
//       If wTipo = 02 .Or. wTipo = 03
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "TCOMBOBOX"
//       If wTipo = 04 .Or. wTipo = 05
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "MEMO"
//       If wTipo = 06 .Or. wTipo = 07
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "RADIO"
//       If wTipo = 08
//          Return .T.
//       EndIf   
//    ElseIf wM_Str_Formato[wx] = "CHECKBOX"
//       If wTipo = 09
//          Return .T.
//       EndIf   
//    EndIf
// Next   

Return( .T. )
*fim da Function fCursor_Tp()

Function fVld_Mid(wTexto,wDesloc,wChar)
********************************************************************************
* Funcao para atribuir uma parte (deslocamento) de um texto separado por "$%"   *
* wTexto = Texto a ser pesqauisado                                             *
* wDesloc= qual a coluna desjada                                               *
* Ex: fVld_Mid("CICERO;AILTON;THIAGO;DORA",3) => "THIAGO"                      *
********************************************************************************
Local wLen , wx := 00 , wpos

   If PCount() = 2
      wChar = "$%"
   EndIf
   wLen := Len(wChar)

   wTexto = wTexto + wChar
   For wx=1 to wDesloc-1
       wpos   := at(wChar,wTexto)
       wtexto := SubStr(wTexto,wpos + wLen )
   next

   wpos = at(wChar,wTexto)
   If wpos = 0
      wTexto := Space(00)
   Else
      wTexto := SubStr(wTexto,1,wpos-1)
   EndIf

Return wTexto
*fim Function fVld_Mid(wTexto,wDesloc)

Function FXVLD_MID(wTexto,wDesloc)
********************************************************************************
* Funcao para atribuir uma parte (deslocamento) de um texto separado por ";"   *
* wTexto = Texto a ser pesqauisado                                             *
* wDesloc= qual a coluna desjada                                               *
* Ex: FXVLD_MID("CICERO;AILTON;THIAGO;DORA",3) => "THIAGO"                      *
********************************************************************************
Local wx,wpos
   wTexto = wTexto + ";"
   For wx=1 to wDesloc-1
       wpos   := at(";",wTexto)
       wtexto := SubStr(wTexto,wpos+1)
   next

   wpos = at(";",wTexto)
   If wpos = 0
       ccancel("Parametros invalidos para esta funcao")
   Else
      wTexto := SubStr(wTexto,1,wpos-1)
   EndIf

Return wTexto
*fim Function FXVLD_MID(wTexto,wDesloc)

Function fGrd_Vlr_Anterior(wColAnt,wColAtual,wGrid,wReturn)
********************************************************************************
*          Funcao para buscar o valor Anterior da Variável Informada           *
********************************************************************************
Local wx := 00 , wN_Coluna := 00 , wConteudo , wPos , wResposta , wVarCombo

   If cEmpty(wColAnt)
      cCancel("fGrd_Vlr_Anterior() -1- Coluna não Informada")
   EndIf

   For wx := 01 To Len(oM_Brw)
      If ValType(oM_Brw[wx])="U"
         Exit
      EndIf
      wN_Coluna := cNC(wColAnt,wx,.F.,"fGrd_Vlr_Anterior")
      If wN_Coluna = 0
         Loop
      Else
         If wM_Case[wx,wCS_Formato,wN_Coluna]>=30 .And. wM_Case[wx,wCS_Formato,wN_Coluna]<=39
            wVarCombo := wM_Case[wx,wCS_Conteudo,wN_Coluna]
            wPos      := At( "-" , wVarCombo )
            wPos      := iIf(cEmpty(wPos),At("#",wVarCombo),wPos)
            wResposta := AllTrim(SubStr(wVarCombo,1,wPos-1))
            wResposta := iIf(wM_Case[wx,wCS_TypeVar,wN_Coluna]="N",Val(wResposta),wResposta)
            wConteudo := wResposta
         Else
            wConteudo := wM_Case[wx,wCS_Conteudo,wN_Coluna]
         EndIf   
         Exit
      EndIf
   Next

   If .Not.cEmpty(wColAtual)
      wM_Case[wGrid,wCS_Conteudo  ,cNC(wColAtual,wGrid,"fGrd_Vlr_Anterior")]:= wConteudo
      If wM_Case[wGrid,wCS_Formato,cNC(wColAtual,wGrid,"fGrd_Vlr_Anterior")] > 09
         wM_Case[wGrid,wCS_ObjGet ,cNC(wColAtual,wGrid,"fGrd_Vlr_Anterior")]:Refresh()
      EndIf                                            
   Else
      wReturn := wConteudo
   EndIf

Return wReturn
*fim Function fGrd_Vlr_Anterior()

Function fAnaliza_Campo(wConteudo,wMaiuscula,wAcento,wPassWord)
*****************************************************************************************************
*                     Funcao para analizar a inFormação Antes de Gravar                             *
*****************************************************************************************************

  If ValType(wConteudo) = "C" .Or. ValType(wConteudo) = "M"
     wMaiuscula := iif(ValType(wMaiuscula)<>"L",.F.,wMaiuscula)
     wAcento    := iif(ValType(wAcento)   <>"L",.F.,wAcento)
     wPassWord  := iif(ValType(wPassWord) <>"L",.F.,wPassWord)

     If wMaiuscula
        wConteudo := Upper(wConteudo)
     EndIf

     If wAcento
        wConteudo := fDefine_Acento(wConteudo)
     EndIf

     If wPassWord
        wConteudo := cCript(wConteudo)
     EndIf

     wConteudo := AllTrim(wConteudo)
  EndIf

Return wConteudo
*Fim da Function fAnaliza_Campo(wGrid,wConteudo)

Function fDefine_Acento(wConteudo,wMaiuscula)
*****************************************************************************************************
*                     Funcao para Definir se tem ou não acentuação                                  *
*****************************************************************************************************
Local wM_Caracter,wx,wy,wOld,wNew,wA,wE,wI,wO,wU,wC

   wConteudo  := AllTrim(wConteudo)
   wMaiuscula := iIf(ValType(wMaiuscula)<>"L",.F.,wMaiuscula)
   If wMaiuscula
      wConteudo := Upper(wConteudo)
   EndIf   

   wA := iIf(wMaiuscula,"A","a")
   wE := iIf(wMaiuscula,"E","e")
   wI := iIf(wMaiuscula,"I","i")
   wO := iIf(wMaiuscula,"O","o")
   wU := iIf(wMaiuscula,"U","u")
   wC := iIf(wMaiuscula,"C","c")
   
   wM_Caracter := {}
   aAdd( wM_Caracter, {wA,"Á","À","Ã","Â","á","à","ã","â"})
   aAdd( wM_Caracter, {wE,"É","Ê","é","ê"})
   aAdd( wM_Caracter, {wI,"Í","í"})
   aAdd( wM_Caracter, {wO,"Ó","Õ","Ô","ó","õ","ô"})
   aAdd( wM_Caracter, {wU,"Ú","Ü","ú","ü"})
   aAdd( wM_Caracter, {wC,"Ç","ç"})

   For wy := 01 To Len(wM_Caracter)
      wNew := wM_Caracter[wy,1]
      For wx := 02 To Len(wM_Caracter[wy])
         wOld := wM_Caracter[wy,wx]
         wConteudo := StrTran(wConteudo,wOld,wNew)
      Next
   Next

Return wConteudo
*Fim da Function fDefine_Acento(wConteudo)

Function __fCase_Menu()
********************************************************************************
*     Executa o Objeto MNU ( Pai/Filho) - Barra de MENU e Barra de Bot„es      *
********************************************************************************
Local wx , wPrp_Nome , wResp , wCabeca , wLinha , wColuna , wAltura , wLargura , wIcone , oIcon , oBtnBar
Local oCrsHand , oBmpCentro , oBmpFundo , oWinMain , wCentro , wFundo , wSeculo , wWhere , aFile, wObjeto
Local wPre_Fnc , wPos_Fnc , wSistema , wPos , wCliente, wAuxFunc
   
   If wc_sistema = "ADM"
      wObjeto := "MNU_CCASE"
//    wObjeto := "MNU_cCASE"
   Else
      wObjeto := "MNU_"+wc_sistema
   EndIf

   wWhere  := " cCase_Obj.Obj_Nome = " + Campo(Trim(wObjeto)) + " And cCase_Obj.Obj_Tp = 'MNU' "
   wResp   := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"Prp_Nome")

   For wx := 01 To Len(wResp)
      wPrp_Nome := Upper(AllTrim(wResp[wx,02]))

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
         EndIf
      EndIf

      If     wPrp_Nome == "CABECALHO"
         wCabeca  := wResp[wx,03]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wLinha   := wResp[wx,03]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wColuna  := wResp[wx,03]
      ElseIf wPrp_Nome == "QTD_LINHAS"
         wAltura  := wResp[wx,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
         wLargura := wResp[wx,03]
      ElseIf wPrp_Nome == "ICONE"
         wIcone   := wResp[wx,03]
      ElseIf wPrp_Nome == "IMAGEM_FUNDO"
         wFundo   := wResp[wx,03]
         If wc_SQL_tp  = "S" //  ciceroSQL -> QG
            //wFundo   := "Screen_GBJ"    
         EndIf
      ElseIf wPrp_Nome == "IMAGEM_CENTRO"
         wCentro  := wResp[wx,03]
      ElseIf wPrp_Nome == "SECULO"
         wSeculo  := wResp[wx,03]
      ElseIf wPrp_Nome == "PRE_FNC"
         wPre_Fnc := wResp[wx,03]
      ElseIf wPrp_Nome == "POS_FNC"
         wPos_Fnc := wResp[wx,03]
      ElseIf wPrp_Nome == "AUX_FUNCTION"
         wAuxFunc := wResp[wx,03]
      EndIf
   Next

   wCabeca  := iIf(cEmpty(wCabeca) ,""   ,AllTrim(wCabeca) )
   wLinha   := iIf(cEmpty(wLinha)  ,00   ,Val(wLinha)      )
   wColuna  := iIf(cEmpty(wColuna) ,00   ,Val(wColuna)     )
   wAltura  := iIf(cEmpty(wAltura) ,00   ,Val(wAltura)     )
   wLargura := iIf(cEmpty(wLargura),00   ,Val(wLargura)    )
   wIcone   := iIf(cEmpty(wIcone)  ,""   ,AllTrim(wIcone)  )
   wFundo   := iIf(cEmpty(wFundo)  ,""   ,AllTrim(wFundo)  )
   wCentro  := iIf(cEmpty(wCentro) ,""   ,AllTrim(wCentro) )
   wSeculo  := iIf(cEmpty(wSeculo) ,2000 ,Val(wSeculo)     )
   wPre_Fnc := iIf(cEmpty(wPre_Fnc),".T.",AllTrim(wPre_Fnc))
   wPos_Fnc := iIf(cEmpty(wPos_Fnc),".T.",AllTrim(wPos_Fnc))
	wAuxFunc := iIf(cEmpty(wAuxFunc),".T.",AllTrim(wAuxFunc))
   wc_Epoca := wSeculo

   //fCase_Font(wObjeto,"OBJ")
   cAtrib_Image()

   If .Not.cEmpty(wIcone)
      wIcone := cIMG_Arquivo(wIcone)
      If .Not.cEmpty(wIcone)
         oIcon := TIcon():New( ,,,wIcone, )
      EndIf
   EndIf

   fCria_Imp_Grupos()

   aAdd( oM_WinMain ,)

   wAuxFunc := &(wAuxFunc)
   
   oWinMain := TMdIframe():New( wLinha, wColuna, wAltura, wLargura, wCabeca ,, cCaseMenu(wObjeto),, oIcon,,,,,,,, )
   oWinMain:Cargo := wCabeca
   oM_WinMain[1] := oWinMain

   __oClpMaster := TClipBoard():New(Upper("TEXT"),oM_WinMain[1])
   __oRichTmp   := TRichEdit():New(0,0,{|u|If(PCount()==0,__wTmpRichText,__wTmpRichText:=u)},,0,0,,.T.,,.F.,.F.,,,,.F.,,,,.T.,.T.,.F.)
	__oIconMsn1  := TIcon():New( ,,,"image\kmessenger.ico", )
	__oIconWF    := TIcon():New( ,,,"image\workflow.ico", )

   Set3DLook( Upper("ON") == "ON" )
// Else
//    //If wc_Sistema <> "CCASE"
//    //   oWinMain := TMdiChild():New(wLinha, wColuna, wAltura, wLargura, wCabeca,, cCaseMenu(wObjeto) ,, oIcon, .F.,,,,, .F., .F.,,,.F.,.F.,.F.,.F., )
//    //Else
//      oWinMain := TMdiChild():New(wLinha, wColuna, wAltura, wLargura, wCabeca,, cCaseMenu(wObjeto) ,, oIcon, .F.,,,,, .F., .F.,,,.T.,.T.,.T.,.T., )
//    //EndIf
// EndIf

   If .Not.cEmpty(wFundo)
      wFundo := cIMG_Arquivo(wFundo)
      If .Not.cEmpty(wFundo)
         aFile := LFNDIRECTORY(wFundo)
         If Len(aFile)>0
            oBmpFundo  := TImage():Define(,wFundo,)
         EndIf
      EndIf   
   EndIf

   If .Not.cEmpty(wCentro)
      wCentro := cIMG_Arquivo(wCentro)
      If .Not.cEmpty(wCentro)
         aFile := LFNDIRECTORY(wCentro)
         If Len(aFile)>0
            oBmpCentro := TImage():Define(,wCentro,)
         EndIf
      EndIf
   EndIf

   cObj_Barra(wObjeto)
   oWinMain:oMsgBar := TMsgBar():New( oM_WinMain[1],wc_Sistema,.T.      ,.T.   ,.T.  ,.T. ,        ,        ,     ,!.T.  ,.T. ,  .T. , .T.     )
                              // New( oWnd         ,cPrompt   ,lCentered,lClock,lDate,lKbd,nClrFore,nClrBack,oFont,lInset,lMsg, lUser,lWorkFlow) CONSTRUCTOR

   If ValType(oBmpFundo)="O" .And. ValType(oBmpCentro)="O"
      oM_WinMain[1]:bPainted := {|hDC,cPS| cBmpAjusta(hDC,oM_WinMain[1],oBmpFundo,oBmpCentro)}
   EndIf

   oM_WinMain[1]:bInit  := {|Self| &(wPre_Fnc) , __cCase_Clock() , __kMsg_Clock() , __kWF_Clock()}

   oM_WinMain[1]:bValid := {|Self| fCase_Final(Self) }   // cicerox

   oWinMain:Activate( "MAXIMIZED", oM_WinMain[1]:bLClicked, oM_WinMain[1]:bRClicked, oM_WinMain[1]:bMoved, oM_WinMain[1]:bResized, oM_WinMain[1]:bPainted , oM_WinMain[1]:bKeyDown, oM_WinMain[1]:bInit ,,,,,,,,,,, oM_WinMain[1]:bLButtonUp )

Return (NIL)
*fim da Function __fCase_Menu()

Function cObj_Barra(wObjeto)
********************************************************************************
*     Executa o Objeto MNU ( Pai/Filho) - Barra de MENU e Barra de Bot„es      *
********************************************************************************
Local wx , wPrp_Nome , wResp , wPosicao , wMouse , wQtdLin , wQtdCol , oBtnBar , oCrsHand , wPos := 00 , wObj_Nome , wWhere , wSql

   Store Space(00) To wPosicao,wMouse
   Store "00"      To wQtdLin,wQtdCol

   wWhere  := " cCase_Obj.Obj_Nome Like " + Campo(Trim(wObjeto+"%"))
   wWhere  := wWhere + " And cCase_Obj.Obj_Tp = 'BAR' " 
   wResp   := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Seq")

   For wx := 01 To Len(wResp)
      wPrp_Nome := Upper(AllTrim(wResp[wx,02]))
      If wPrp_Nome     = "QTD_LINHAS"
         wQtdLin    := wResp[wx,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
         wQtdCol    := wResp[wx,03]
      ElseIf wPrp_Nome == "POSICAO"
         wPosicao   := wResp[wx,03]
      ElseIf wPrp_Nome == "MOUSE_CURSOR"
         wMouse     := wResp[wx,03]
      EndIf

      If wx < Len(wResp)
         wObj_Nome := wResp[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wResp[wx,01] .or. cEmpty(wObj_Nome)
         wQtdLin    := Val(wQtdLin)
         wQtdCol    := Val(wQtdCol)
         wMouse     := Upper(AllTrim(wMouse))
         wPosicao   := Upper(AllTrim(wPosicao))
         If     wPosicao = "B"
            wPosicao := "BOTTOM"
         ElseIf wPosicao = "R"
            wPosicao := "RIGHT"
         ElseIf wPosicao = "L"
            wPosicao := "LEFT"
         ElseIf wPosicao = "C"
            wPosicao := "CENTER"
         ElseIf wPosicao = "T" .Or. cEmpty(wPosicao)
            wPosicao := "TOP"
         EndIf

         If .Not.cEmpty(wMouse)
            oCrsHand := TCursor():New( , wMouse )
         EndIf

         oBtnBar := TBar():New( oM_WinMain[1] , wQtdLin, wQtdCol, .T. , wPosicao , oCrsHand )
         aAdd( oM_BtnBar , oBtnBar )

         wSql :=        "     cCase_Obj.Obj_Nome Like " + Campo(Trim(wObjeto) + ".%")
         wSql := wSql + " And cCase_Obj.Obj_Nome Not Like " + Campo(Trim(wObjeto) + ".%.%")
         wSql := wSql + " And cCase_Obj.Obj_Tp = 'BTN' " 

         __fCase_Button(fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Seq"))

         Store Space(00) To wPosicao,wMouse
         Store "00"      To wQtdLin,wQtdCol
      EndIf
   Next

Return (NIL)
*fim da Function cObj_Barra(wObjeto)

Function cBmpAjusta( hDC, oWnd, oBmpFundo, oBmpCentro )
******************************************************************************
*                        funcao para EXPANCAO DO BMP                         *
******************************************************************************
Local nWidth , nHeight , nRow:=0 , nCol:=0 , nBmpWidth ,  nBmpHeight

   If ValType(oBmpFundo)="O"
      nWidth     := oWnd:nWidth() 
      nHeight    := oWnd:nHeight()
      nBmpWidth  := oBmpFundo:nWidth()
      nBmpHeight := oBmpFundo:nHeight()

      While nRow < nHeight
         nCol = 0
         While nCol < nWidth
            PalBmpDraw( hDC, nRow, nCol, oBmpFundo:hBitmap )
            nCol += nBmpWidth
         End
         nRow += nBmpHeight
      End
   EndIf

   If ValType(oBmpCentro)="O"
      PalBmpDraw( hDC, (oWnd:nHeight()/2) - (oBmpCentro:nHeight()/2) - 50 , (oWnd:nWidth()/2)-(oBmpCentro:nWidth()/2), oBmpCentro:hBitmap )
   EndIf   

Return nil
*fim da Function cBmpAjusta()

Function fESC(nKey)
******************************************************************************
*                        funcao para EXPANCAO DO BMP                         *
******************************************************************************
Local wx

   If nKey == VK_ESCAPE
      oM_WinMain[1]:End()
      Return 0
   EndIf

Return nil
*fim da Function fESC(nKey)

Function cBarra()
******************************************************************************
*               funcao para Gravar para Invertida na Procedure               *
******************************************************************************
Return "\"
*fim da Function cBarra()

Function cMais()
******************************************************************************
*               funcao para Gravar para Invertida na Procedure               *
******************************************************************************
Return "+"
*fim da Function cMais()

Function cV(wColuna,wGrid,wConteudo)
******************************************************************************
*                  funcao para Localizar o Valor da Coluna                   *
******************************************************************************
Local wValor,wColunaGrid

If cEmpty(wGrid)
   wGrid := m->wM_Grid_Seq[wG_Atual]
EndIf
wColunaGrid := cNC(wColuna,wGrid,,"cV")
If ValType(wConteudo)="U"
   If wM_Case[wGrid,wCS_Formato,wColunaGrid] = 49
      wValor := wM_Case[wGrid,wCS_Conteudo,wColunaGrid][2]
   Else
      wValor := wM_Case[wGrid,wCS_Conteudo,wColunaGrid]
   EndIf
Else
   If wM_Case[wGrid,wCS_Formato,wColunaGrid] = 30 .or.;
      wM_Case[wGrid,wCS_Formato,wColunaGrid] = 36 .or.;
      wM_Case[wGrid,wCS_Formato,wColunaGrid] = 39
      wM_Case[wGrid,wCS_Conteudo,wColunaGrid] := fAtrib_Combo(wConteudo,wM_Case[wGrid,wCS_ObjGet,wColunaGrid])
   ElseIf wM_Case[wGrid,wCS_Formato,wColunaGrid] = 49
      wM_Case[wGrid,wCS_Conteudo,wColunaGrid] := {wConteudo,wConteudo}
   Else
      wM_Case[wGrid,wCS_Conteudo,wColunaGrid] := wConteudo
   EndIf

   If ValType(wM_Case[wGrid,wCS_ObjGet,wColunaGrid])="O"
      wM_Case[wGrid,wCS_ObjGet,wColunaGrid]:Refresh()
   EndIf
   Return .T.
EndIf

Return wValor
*fim da Function cV(wColuna,wGrid)

Function cVF(wColuna,wCase,wConteudo)
******************************************************************************
*                  funcao para Localizar o Valor da Coluna                   *
******************************************************************************
Local wValor,wColunaCase

If cEmpty(wCase)
   wCase := Len(wM_Case)
EndIf
wColunaCase := cNC(wColuna,wCase,,"cVF")

If ValType(wConteudo)="U"
   If wM_Case[wCase,wCS_Formato,wColunaCase] = 49
      wValor := wM_Case[wCase,wCS_Conteudo,wColunaCase][2]
   Else
      wValor := wM_Case[wCase,wCS_Conteudo,wColunaCase]
   EndIf
Else
   If wM_Case[wCase,wCS_Formato,wColunaCase] = 30 .or.;
      wM_Case[wCase,wCS_Formato,wColunaCase] = 36 .or.;
      wM_Case[wCase,wCS_Formato,wColunaCase] = 39
      wM_Case[wCase,wCS_Conteudo,wColunaCase] := fAtrib_Combo(wConteudo,wM_Case[wCase,wCS_ObjGet,wColunaCase])
   ElseIf wM_Case[wCase,wCS_Formato,wColunaCase] = 49
      wM_Case[wCase,wCS_Conteudo,wColunaCase] := {wConteudo,wConteudo}
   Else
      wM_Case[wCase,wCS_Conteudo,wColunaCase] := wConteudo
   EndIf

   If ValType(wM_Case[wCase,wCS_ObjGet,wColunaCase])="O"
      wM_Case[wCase,wCS_ObjGet,wColunaCase]:Refresh()
   EndIf
   Return .T.
EndIf

Return wValor
*fim da Function cVF(wColuna,wCase,wConteudo)

Function cO(wColuna,wGrid)
******************************************************************************
*                 funcao para Localizar o Objeto da Coluna                   *
******************************************************************************
If cEmpty(wGrid)
   wGrid := m->wM_Grid_Seq[wG_Atual]
EndIf
Return wM_Case[wGrid,wCS_ObjGet,cNC(wColuna,wGrid,,"cO")]
*fim da Function cO(wColuna,wGrid)

Function cOF(wColuna,wCase)
******************************************************************************
*                 funcao para Localizar o Objeto da Coluna                   *
******************************************************************************
If cEmpty(wCase)
   wCase := Len(wM_Case)
EndIf

Return wM_Case[wCase,wCS_ObjGet,cNC(wColuna,wCase,,"cOF")]
*fim da Function cOF(wColuna,wCase)

Function cDefVar(wDefVar,wTypeVar,wGrid)
******************************************************************************
*                 funcao para Localizar o Objeto da Coluna                   *
******************************************************************************
Local wXDefVar

   If cEmpty(wGrid)
      wGrid := m->wM_Grid_Seq[wG_Atual]
   EndIf

   If cEmpty(wTypeVar)
      wTypeVar := "C"
   EndIf

   If .Not.cEmpty(wDefVar)
      wXDefVar := wDefVar
      wXDefVar := &wDefVar
   Else   
      If     wTypeVar = "N"
         wXDefVar := 00
      ElseIf wTypeVar = "D"
         wXDefVar := cTod("  /  /    ")
      ElseIf wTypeVar = "C"
         wXDefVar := Space(252)
      EndIf
   EndIf

Return wXDefVar
*fim da Function cDefVar(wDefVar,wGrid)

Function fPopup( nRow, nCol, oObj )
*******************************************************************************
*                                                                             *
*******************************************************************************
Local oPopup

   MENU oPopup POPUP
        MENUITEM "&Novo Objeto"

        MENU
             MENUITEM "&FRD - Folder"  ACTION (MsgInfo(1))
             MENUITEM "&GRD - GRID"    ACTION (MsgInfo(2))
             MENUITEM "&GET - Cursor"  ACTION (MsgInfo(3))
        ENDMENU

        SEPARATOR
        MENUITEM "&Propriedades" ACTION (MsgInfo(4))
        SEPARATOR
        MENUITEM "&Exit"         ACTION oPopup:End()
   ENDMENU

   ACTIVATE POPUP oPopup AT nRow, nCol OF oObj

Return .t.
* fim da Function fPopup()

Function fObj_Prp_Vlr(wObjeto,wPrp_Nome)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wXKeySql , wResp , wRetorno

   wPrp_Nome := Upper(AllTrim(wPrp_Nome))
   wXKeySql := "Obj_Nome = " + Campo(wObjeto) + " And Upper(Prp_Nome) = " + Campo(wPrp_Nome)
   If Upper(AllTrim(wPrp_Nome)) <> "PROCEDURE"
      wResp := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr"} ,wXKeySql)
   Else
      wResp := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Memo"},wXKeySql)
   EndIf

   wRetorno := Space(00)
   If .Not.cEmpty(wResp)
      wRetorno := AllTrim(wResp[01,01])
   EndIf

Return wRetorno
* fim da Function fObj_Prp_Vlr(wObjeto,wPrp_Nome)

CLASS TFormC FROM TForm
   CLASSDATA lRegistered AS LOGICAL
ENDCLASS

Function fWork( wInsert , wLinha , wColuna )
*****************************************************************************************************************************
*                                                                                                                           *
*****************************************************************************************************************************
Local wx   

   If ValType(wInsert)="U"
      If .Not.cEmpty(wLinha) .And. .Not.cEmpty(wColuna)
         If wLinha <= Len(wM_Work)
           If wColuna <= Len(wM_Work[wLinha])
              Return wM_Work[wLinha,wColuna]
           EndIf
         EndIf
      Else
         Return 0
      EndIf
   EndIf

   If .Not.cEmpty(wLinha)
      If wLinha > Len(wM_Work)
         For wx := Len(wM_Work) To wLinha
            aAdd( wM_Work , {} )
         Next
      EndIf
      
      If .Not.cEmpty(wColuna)
         If wColuna > Len(wM_Work[wLinha])
            For wx := Len(wM_Work[wLinha]) To wColuna
               aAdd( wM_Work[wLinha] , )
            Next
         EndIf
      Else
         aAdd( wM_Work[wLinha] , )
         wColuna := 01
      EndIf

      wM_Work[wLinha,wColuna] := wInsert
   Else
      aAdd( wM_Work ,{ wInsert })
      wLinha  := Len(wM_Work)
      wColuna := 01
   EndIf

Return wM_Work[wLinha,wColuna]
* fim da Function fWork( wInsert )

Function fCase_Show()
*****************************************************************************************
*                                                                                       *
*****************************************************************************************
Local wx := 0 ,wPos , wBold := .F. , wVar , wnHeight := 00 , wLista_Req , wMatriz , wDefault
Local wComboLinhas :=00 , wAnt_Pixel := 00 , wAtual_Pixel := 00 , wTipo_Dado := 00, oc_cli
Local wOCMB_Prp,wVPrp_Get_Dft,wVPrp_Dsc,wOObj_Prp_Vlr,wCab_Prp_Vlr,wCab_CMB_Prp,wOmemo,wCab_memo

   wLista_Req := cV("Prp_Obj_Lst_Req",2)
   If ValType(wLista_Req)<>"C"
      wLista_Req := Space(00)
   EndIf

   If At( SubStr(cV("Obj_Tp",1),1,3) , wLista_Req ) > 0
      wBold := .T.
   EndIf
   
   wOCMB_Prp     := cO("CMB_Prp",2)
   wVPrp_Get_Dft := cV("Prp_Get_Dft",2)
   wVPrp_Dsc     := cV("Prp_Dsc",2)
   wOObj_Prp_Vlr := cO("Obj_Prp_Vlr",2)
   wOmemo        := cO("memo",2)
   oc_cli        := cO("wc_cli",2)

   wCab_Prp_Vlr  := wM_Case[2,wCS_ObjCab,cNC("Obj_Prp_Vlr",2)]
   wCab_CMB_Prp  := wM_Case[2,wCS_ObjCab,cNC("CMB_Prp",2)]
   wCab_memo     := wM_Case[2,wCS_ObjCab,cNC("memo",2)]

   c_Get_Cabeca("CMB_Prp",Space(250),.F.,cN_Fld(1,2),wOmemo       ,wCab_memo)
   c_Get_Cabeca("CMB_Prp",Space(250),.F.,cN_Fld(1,2),wOCMB_Prp    ,wCab_CMB_Prp)
   c_Get_Cabeca("CMB_Prp",Space(250),.F.,cN_Fld(1,2),wOObj_Prp_Vlr,wCab_Prp_Vlr)

   If ValType(cV("Prp_Get_Tp",2))="C"
      wTipo_Dado := Val(cV("Prp_Get_Tp",2))
   EndIf

   If cV("Prp_wc_cli",2)="S" .And. (wTipo_Dado = 20 .Or. wTipo_Dado = 30)
      oc_cli:Show()
   Else
      oc_cli:Hide()
   EndIf
   oc_cli:Refresh()

   If wTipo_Dado = 20

      wOObj_Prp_Vlr:Show()

      wVar := AllTrim(cV("Prp_Get_Pct",2))

      wOObj_Prp_Vlr:cPicture     := wVar
      wOObj_Prp_Vlr:oGet:Picture := wVar
      If cEmpty(wVar) .Or. AllTrim(wVar) = "@!" .Or. AllTrim(wVar) = "@x"
         wOObj_Prp_Vlr:nWidth := 735 //Round(wM_Case[02,wCS_Tamanho,cNC("Obj_Prp_Vlr",02)]*3.50,0)*2
      Else
         wOObj_Prp_Vlr:nWidth := Len(wVar)*11
      EndIf

      wOObj_Prp_Vlr:Refresh()

      wOCMB_Prp:Hide()
      wOCMB_Prp:Refresh()
      wOmemo:Hide()   
      wOmemo:Refresh()

      c_Get_Cabeca("Obj_Prp_Vlr",wVPrp_Dsc,wBold,cN_Fld(1,2),wOObj_Prp_Vlr,wCab_Prp_Vlr)

   ElseIf wTipo_Dado = 30

      wOCMB_Prp:Show()
      wOCMB_Prp:Refresh()
   
      wMatriz := cV("Prp_Cmb_Lst",2)
      If cEmpty( wMatriz )
         cCancel( 'Propriedade "Combo Lista" (Domínio) não Informada para este Objeto (ComboBox)' )
      EndIf
      wMatriz := "cDominio('" + AllTrim(wMatriz) + "')"
      wMatriz := &wMatriz

      wOCMB_Prp:Reset()
      wOCMB_Prp:aItems := {}
      wOCMB_Prp:nAt    := 00

      If .Not.cEmpty(wVPrp_Get_Dft)
         wDefault :=  Trim(wVPrp_Get_Dft)
      Else
         wDefault := Space(11)
      EndIf   

      For wx := 01 To Len(wMatriz)
         wOCMB_Prp:Add( wMatriz[wx] , wx )
         wPos := at("-",wMatriz[wx])-1
         If SubStr(wMatriz[wx],1,wPos) = SubStr(wM_Grid[02,wM_BrwLin[02],cNC("Obj_Prp_Vlr",02)],1,wPos)  // Se o Conteudo do Grid For Igual ao que tem na Matriz correspondente
            cV("CMB_Prp",2,wMatriz[wx])                                                                  // Atribui o valor da Matriz correspondente
         Else
            If cEmpty(wM_Case[02,wCS_Conteudo,cNC("CMB_Prp",02)])
               If SubStr(wMatriz[wx],1,wPos) = wDefault
                  cV("CMB_Prp",2,wMatriz[wx])
               EndIf   
            EndIf   
         EndIf
         wAtual_Pixel := c_Pixel_Len(wMatriz[wx])
         If wAnt_Pixel < wAtual_Pixel
            wAnt_Pixel := wAtual_Pixel
         EndIf   
      Next

      wComboLinhas := 6 * 26
      If Len(wMatriz) < 6
         wComboLinhas := Len(wMatriz) * 26
      EndIf

      wOCMB_Prp:SetSize( (wAnt_Pixel+10)*2, wComboLinhas , .T. )
      wOCMB_Prp:Refresh()

      c_Get_Cabeca("CMB_Prp",wVPrp_Dsc,wBold,cN_Fld(1,2),wOCMB_Prp,wCab_CMB_Prp)

      wOObj_Prp_Vlr:Hide()
      wOObj_Prp_Vlr:Refresh()
      wOmemo:Hide()   
      wOmemo:Refresh()

   ElseIf (wTipo_Dado >= 40 .And. wTipo_Dado <= 49)

      wOmemo:Show()
      wOmemo:Refresh()

      wOObj_Prp_Vlr:Hide()
      wOObj_Prp_Vlr:Refresh()
      wOCMB_Prp:Hide()
      wOCMB_Prp:Refresh()

      c_Get_Cabeca("Obj_Prp_Vlr",wVPrp_Dsc,wBold,cN_Fld(1,2),wOmemo,wCab_memo)
   EndIf

Return .t.
* fin da Function fCase_Show()

Function fCase_Grid_Obj_Prp()
*****************************************************************************************
*                                                                                       *
*****************************************************************************************
Local wObj_Nome,wWhere,wResp,wx,wPos,wPrp_Nome,wcliente,wRespP

   wObj_Nome := cV("Obj_Nome",1)

   wWhere := " Obj_Nome = " + Campo(wObj_Nome,"C")
   wResp  := fConsulta2({"cCase_Obj_Prp"},{"Prp_Nome","Obj_Prp_Vlr"},wWhere)

   For wx := 01 To Len(wResp)
      wPrp_Nome := AllTrim(wResp[wx,1])
      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente  := StrZero(Val(SubStr(wPrp_Nome,wPos+1)),4,0)

         wWhere := " Prp_Nome = " + Campo(SubStr(wPrp_Nome,1,wPos-1),"C")
         wRespP := fConsulta2({"cCase_Prp"},{"Prp_Dsc","Prp_Get_Dft","Prp_Get_Tp","Prp_Get_Pct","Prp_Cmb_Lst","Prp_Grp","Prp_Seq"},wWhere)
         If Len(wRespP)>0
            aAdd( wM_Grid[2] , {wPrp_Nome           ,;      // 01
                                wRespP[1,1]         ,;      // 02
                                wRespP[1,2]         ,;      // 03
                                wRespP[1,3]         ,;      // 04
                                wRespP[1,4]         ,;      // 05
                                ""                  ,;      // 06
                                ""                  ,;      // 07
                                wRespP[1,5]         ,;      // 08
                                AllTrim(wResp[wx,2]),;      // 09
                                wObj_Nome           ,;      // 10
                                ""                  ,;      // 11
                                ""                  ,;      // 12
                                ""                  ,;      // 13
                                wRespP[1,6]         ,;      // 14
                                wRespP[1,7]         ,;      // 15
                                ""                  ,;      // 16
                                "S"                 ,;      // 17
                                wCliente            })      // 18
         EndIf
      EndIf
   Next

Return .t.
* fin da Function fCase_Grid_Obj_Prp()

Function fControlGrid( wObjeto )
*****************************************************************************************
*                                                                                       *
*****************************************************************************************
Local wx , wPos , wy

   If ValType(wObjeto)="O"
      For wx := 01 To Len( wM_Control )
         If Upper(wM_Control[wx][1]:classname()) = "TWBROWSE"
            If wM_Control[wx][1]:hWnd = wObjeto:hWnd
               If Len(oM_Dlg) = 01
                  wM_Grid_Seq[wG_Atual] := wM_Control[wx][2]
               EndIf
               Exit
            EndIf
         EndIf
      Next
   EndIf   

Return .t.
* fin da Function fControlGrid()

Function __fCase_Frame(wMatriz)
********************************************************************************************************************************
*                                  Função de busca para as Propriedades do Frame                                               *
********************************************************************************************************************************
Local wCabeca,wDeslocLin,wDeslocCol,wQtdLin,wQtdCol,wObjDesloc,wObjRef,wNegrito,wx,wPrp_Nome,wObj_Nome,wPos,wCliente,wObj

   Store Space(00) To wObjRef,wObjDesloc,wCabeca,wNegrito,wObj_Nome,wPrp_Nome
   Store "00"      To wDeslocLin,wDeslocCol,wQtdLin,wQtdCol

   For wx := 01 To Len(wMatriz)
      wPrp_Nome := AllTrim(wMatriz[wx,02])
      If wPrp_Nome     == "CABECALHO"
         wCabeca    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "LINHA_INICIAL"
         wDeslocLin := wMatriz[wx,03]
      ElseIf wPrp_Nome == "COLUNA_INICIAL"
         wDeslocCol := wMatriz[wx,03]
      ElseIf wPrp_Nome == "QTD_LINHAS"
         wQtdLin    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "QTD_COLUNAS"
         wQtdCol    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "OBJETO_DESLOC"
         wObjDesloc := wMatriz[wx,03]
      ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "NEGRITO"
         wNegrito   := wMatriz[wx,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If wPrp_Nome     == "CABECALHO"
               wCabeca    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "LINHA_INICIAL"
               wDeslocLin := wMatriz[wx,03]
            ElseIf wPrp_Nome == "COLUNA_INICIAL"
               wDeslocCol := wMatriz[wx,03]
            ElseIf wPrp_Nome == "QTD_LINHAS"
               wQtdLin    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "QTD_COLUNAS"
               wQtdCol    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "OBJETO_DESLOC"
               wObjDesloc := wMatriz[wx,03]
            ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
               wObjRef    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "NEGRITO"
               wNegrito   := wMatriz[wx,03]
            EndIf
         EndIf
      EndIf

      If wx < Len(wMatriz)
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wMatriz[wx,01] .Or. cEmpty(wObj_Nome)

         wCabeca    := AllTrim(wCabeca)
         wDeslocLin := iIf(cEmpty(wDeslocLin)    ,00 ,Val(wDeslocLin))
         wDeslocCol := iIf(cEmpty(wDeslocCol)    ,00 ,Val(wDeslocCol))
         wQtdLin    := iIf(cEmpty(wQtdLin)       ,00 ,Val(wQtdLin))
         wQtdCol    := iIf(cEmpty(wQtdCol)       ,00 ,Val(wQtdCol))
         wObjRef    := iIf(cEmpty(wObjRef)       ,"" ,&wObjRef)
         wObjDesloc := iIf(cEmpty(wObjDesloc)    ,"" ,&wObjDesloc)
         wNegrito   := iIf(ValType(wNegrito)<>"C","N",wNegrito)
         wNegrito   := iIf(wNegrito="S"          ,.T.,.F.)

         wObj := c_Box(3,wObjRef,wObjDesloc,wDeslocLin,wDeslocCol,wQtdLin,wQtdCol,wCabeca)

         __fSuper_AddObj(wMatriz[wx,01],"FME",wx,wObj)

         Store Space(00) To wObjRef,wObjDesloc,wCabeca,wNegrito
         Store "00"      To wDeslocLin,wDeslocCol,wQtdLin,wQtdCol
      EndIf
   Next

Return .T.
*fim da Function __fCase_Frame(wMatriz)

Function __fCase_Tree(wMatriz)
********************************************************************************************************************************
*                                      Função de busca para as Propriedades da Tree                                            *
********************************************************************************************************************************
Local wObjRef,wPrp_Nome,wbChange,wDuploClick,wPos_Fnc,wrClick,wMFunction,wLinha,wColuna,wAltura,wLargura,wPos,wCliente,wObj_Nome,wx,wObj

   Store Space(00) To wObjRef,wPrp_Nome,wbChange,wDuploClick,wPos_Fnc,wrClick,wMFunction
   Store "00"      To wLinha,wColuna,wAltura,wLargura

   For wx := 01 To Len(wMatriz)
      wPrp_Nome := Upper(AllTrim(wMatriz[wx,02]))
      If     wPrp_Nome == "LINHA"
         wLinha      := wMatriz[wx,03]
      ElseIf wPrp_Nome == "COLUNA"
         wColuna     := wMatriz[wx,03]
      ElseIf wPrp_Nome == "ALTURA"
         wAltura     := wMatriz[wx,03]
      ElseIf wPrp_Nome == "LARGURA"
         wLargura    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "BCHANGE"
         wbChange    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "DUPLOCLICK"
         wDuploClick := wMatriz[wx,03]
      ElseIf wPrp_Nome == "POS_FNC"
         wPos_Fnc    := wMatriz[wx,03]
      ElseIf wPrp_Nome == "RCLICK"
         wrClick     := wMatriz[wx,03]
      ElseIf wPrp_Nome == "AUX_FUNCTION"
         wMFunction  := wMatriz[wx,03]
      ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
         wObjRef     := wMatriz[wx,03]
      EndIf

      wPos := At(".",wPrp_Nome)
      If wPos>0
         wCliente := SubStr(wPrp_Nome,wPos+1)
         wCliente := Val(wCliente)
         If wCliente == wc_cli
            wPrp_Nome := SubStr(wPrp_Nome,1,wPos-1)
            If     wPrp_Nome == "LINHA"
               wLinha      := wMatriz[wx,03]
            ElseIf wPrp_Nome == "COLUNA"
               wColuna     := wMatriz[wx,03]
            ElseIf wPrp_Nome == "ALTURA"
               wAltura     := wMatriz[wx,03]
            ElseIf wPrp_Nome == "LARGURA"
               wLargura    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "BCHANGE"
               wbChange    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "DUPLOCLICK"
               wDuploClick := wMatriz[wx,03]
            ElseIf wPrp_Nome == "POS_FNC"
               wPos_Fnc    := wMatriz[wx,03]
            ElseIf wPrp_Nome == "RCLICK"
               wrClick     := wMatriz[wx,03]
            ElseIf wPrp_Nome == "AUX_FUNCTION"
               wMFunction  := wMatriz[wx,03]
            ElseIf wPrp_Nome == "OBJETO_REFERENCIA"
               wObjRef     := wMatriz[wx,03]
            EndIf
         EndIf
      EndIf

      If wx < Len(wMatriz)
         wObj_Nome := wMatriz[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wMatriz[wx,01] .Or. cEmpty(wObj_Nome)
         wLinha      := iIf(cEmpty(wLinha     ),00 ,Val(wLinha)  )
         wColuna     := iIf(cEmpty(wColuna    ),00 ,Val(wColuna) )
         wAltura     := iIf(cEmpty(wAltura    ),00 ,Val(wAltura) )
         wLargura    := iIf(cEmpty(wLargura   ),00 ,Val(wLargura))
         wObjRef     := iIf(cEmpty(wObjRef    ),"" ,&wObjRef     )
         wbChange    := iIf(cEmpty(wbChange   ),"" ,wbChange     )
         wDuploClick := iIf(cEmpty(wDuploClick),"" ,wDuploClick  )
         wPos_Fnc    := iIf(cEmpty(wPos_Fnc   ),"" ,wPos_Fnc     )
         wrClick     := iIf(cEmpty(wrClick    ),"" ,wrClick      )
         wMFunction  := iIf(cEmpty(wMFunction ),"" ,wMFunction   )

         wObj := c_TreeView(wObjRef,wLinha,wColuna,wAltura,wLargura,wbChange,wrClick,wDuploClick,wPos_Fnc,wMFunction)

         __fSuper_AddObj(wMatriz[wx,01],"TRV",wx,wObj)

         Store Space(00) To wObjRef,wPrp_Nome,wbChange,wDuploClick,wPos_Fnc,wrClick,wMFunction
         Store "00"      To wLinha,wColuna,wAltura,wLargura
      EndIf
   Next

Return .T.
*fim da Function __fCase_Tree(wMatriz)

Function c_Box(wTipo,wObjRef,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wTotLin,wTotCol,wSay,wNegrito,wFormato,wRadio)
*******************************************************************************
*                       funcao para montar box na tela                        *
*******************************************************************************
Local wnTop,wnLeft,wnWidth,wnHeight,wTLin,wTCol,wInicio_Lin,wInicio_Col,wBoldFont,wObj

   wNegrito := iIf(ValType(wNegrito)<>"L",.F.,wNegrito )
   wFormato := iIf(ValType(wFormato)<>"N",00 ,wFormato )
   wRadio := iIf(ValType(wRadio) <>"N",02 ,wRadio )

   If wTipo = 1 .or. wTipo = 3

      wTLin := 18.00 
      If .Not.cEmpty(wFormato)
         If wFormato=90
            wTLin := 05.00 
         EndIf
      EndIf
      wTCol := 03.50

      wDesloc_Lin := wDesloc_Lin * wTLin
      wDesloc_Col := wDesloc_Col * wTCol

      If wTipo = 1
         wTotLin := wTotLin * wTLin
      ElseIf wTipo = 3
         wTotLin := wTotLin * 08.25
      EndIf
      wTotCol := wTotCol * wTCol

      wnTop := 0 ; wnTop := 0 ; wnLeft := 0 ; wnWidth := 0 ; wnHeight := 0
      If cEmpty(wObj_Desloc)
         wInicio_Lin := 0
         wInicio_Col := 0
      Else
         If wObj_Desloc:classname = "TRADMENU"
            wInicio_Lin := 0
            wInicio_Col := 0
         Else
            wnTop := wObj_Desloc:nTop
            wnLeft := wObj_Desloc:nLeft
            wnWidth := wObj_Desloc:nwidth
            wnHeight := wObj_Desloc:nHeight

            If wObj_Desloc:classname = "TWBROWSE"
               wInicio_Lin := 8 + wnTop + wnHeight
               wInicio_Col := 0
            ElseIf wObj_Desloc:classname = "TMULTIGET"
               If wDesloc_Lin<>0
                  wInicio_Lin := 8 + wnTop + wnHeight
                  wInicio_Col := 0
               Else
                  wInicio_Lin := wnTop
                  wInicio_Col := wnLeft + wnWidth
               EndIf
            ElseIf wObj_Desloc:classname = "TSAY"
               wInicio_Lin := 8 + wnTop
               wInicio_Col := wnLeft
            Else
               wInicio_Lin := wnTop
               wInicio_Col := wnLeft + wnWidth
            EndIf
            If wDesloc_Lin = 0
               wDesloc_Col := wDesloc_Col + wInicio_Col
            EndIf
         EndIf
      EndIf
      wDesloc_Lin := wDesloc_Lin + wInicio_Lin
   EndIf

   If cEmpty(wTotLin)
      If wFormato >= 20 .And. wFormato <= 29
         wTotLin := 10
      ElseIf wFormato >= 40 .And. wFormato <= 49
         wTotLin := 01
      ElseIf wFormato >= 50 .And. wFormato <= 59
         wTotLin := 11
      ElseIf wFormato >= 60 .And. wFormato <= 69
         wTotLin := 08
      ElseIf wFormato = 99
         wTotLin := 110
      EndIf
   EndIf

   If wFormato >= 50 .And. wFormato <= 59
      wTotLin := wTotLin * ((wRadio+(.27)) - (0.07*wRadio) )
   EndIf

   If wFormato<>99
      If wFormato>0
         wDesloc_Lin := wDesloc_Lin - 09
         wDesloc_Col := wDesloc_Col - 03
         wTotCol := wDesloc_Col + wTotCol + 05
         wTotLin := wDesloc_Lin + wTotLin + 12
      Else
         wTotCol := wDesloc_Col + wTotCol
         wTotLin := wDesloc_Lin + wTotLin
      EndIf
   Else
      wDesloc_Lin := wDesloc_Lin - 11
      wDesloc_Col := wDesloc_Col + 02
      wTotCol := wDesloc_Col + wTotCol + 6
      wTotLin := wDesloc_Lin + wTotLin
   EndIf

   If wNegrito
      wBoldFont := "oFontBold"
   Else
      wBoldFont := "oFont"
   EndIf

   wObj := TGroup():New(wDesloc_Lin,wDesloc_Col,wTotLin,wTotCol,wSay,wObjRef,,,.T.,,&wBoldFont,.T.)
   aAdd( oM_Say , wObj )

Return wObj
*fim da Function c_Box(wObjRef,wObj_Desloc,wDesloc_Lin,wDesloc_Col,wTotLin,wTotCol,wSay)

Function fGrid_Ant( wGrid_Seq , wNumDlg , wNew )
*******************************************************************************
*                                                                             *
*******************************************************************************
local wColGrd,wReturn

   If Len(oM_Dlg)=0
     cCancel("Não há FORM para o Grid")
   EndIf

   wNew := iIf(ValType(wNew)<>"L",.F.,wNew)

   If Len(wM_Grid_Ant)=0 .And. wNew=.F.
      aAdd( wM_Grid_Ant   , {} )
      aAdd( wM_Grid_Ant[1], 01 )
   EndIf

   If wNew
      aAdd( wM_Grid_Ant , {} )
   EndIf

   If cEmpty(wNumDlg)
      wNumDlg := Len(oM_Dlg)
   EndIf

   If cEmpty(wGrid_Seq)
      wColGrd := Len(wM_Grid_Ant[wNumDlg])
      wReturn := wM_Grid_Ant[wNumDlg,wColGrd]
   Else
      aAdd( wM_Grid_Ant[wNumDlg] , wGrid_Seq )
      wReturn := .T.
   EndIf   

Return wReturn
*fim da Function fGrid_Ant()

Function cwMsg(wOpcao , wMsg , wTitle , wFnc , wTime )
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wxFnc , wReturn

   wOpcao := iIf(ValType(wOpcao)<>"N",1,wOpcao)

   If wOpcao = 1
      wReturn := MsgInfo(wMsg,wTitle)
   EndIf

   If wOpcao = 2
      wReturn := MsgYesNo(wMsg,wTitle)
   EndIf

   If wOpcao = 3
      If ValType(wFnc) = "C"
         wxFnc := "{|Self|(" + wFnc + ")}"
         wReturn := MsgRun( wMsg , wTitle, &wxFnc )
      Else
         wReturn := MsgRun( wMsg , wTitle, wFnc )
      EndIf
   EndIf

   If wOpcao = 4
      wReturn := MsgStop( wMsg , wTitle )
   EndIf

Return wReturn
*fim da Function cwMsg(wOpcao , wMsg , wTitle , wFnc , wTime )

Function cCase_Inicio()
*******************************************************************************
*                                                                             *
*******************************************************************************

*   fWork( .T. , 2 , 1)
*   fObj_LoadAll("FRM_Acesso")
*   fWork( .F. , 2 , 1)

Return Nil
*fim da cCase_Inicio()

Function fCria_Imp_Grupos()
******************************************************************************
*             funcao para criar os grupos do gerador de relatorio            *
******************************************************************************
Local wGrupo,wx,wxLen,wrl1Dsc,wResp,wtexto

  m->wMgrupos := {}
  m->wMrel    := {}
  wGrupo      := Space(00)

  wResp := fConsulta2("DRL01",{"rl1grupo","rl1dsc","rl1codrel","rl1sistema"},,"rl1grupo,rl1codrel")

  wxLen := Len(wResp)
  For wx := 01 To wxLen

      If At( Upper(wc_Sistema) , Upper(AllTrim(wResp[wx,4])) )=0
         Loop
      EndIf

      If wx > 1
         wGrupo := wResp[wx-1,01]
      EndIf

      If wGrupo <> wResp[wx,01] .Or. cEmpty(wGrupo)
         wtexto := SubStr(wResp[wx,1],1,1)+Lower(SubStr(wResp[wx,1],2,Len(wResp[wx,1])))
         aAdd(M->wMgrupos,wtexto)
      EndIf

      wrl1Dsc := AllTrim(wResp[wx,2])
      aAdd(M->wMrel,{wResp[wx,1],SubStr(wrl1Dsc,1,1)+Lower(SubStr(wrl1Dsc,2,Len(wrl1Dsc))),wResp[wx,3]})
   Next

Return .t.
*fim da Function fCria_Imp_Grupos()

Function cAcesso(wOpcao,wUsuario,wLocal)
*******************************************************************************
*      funcao para verIficar se o usuario tem ou nao acesso ao programa       *
*******************************************************************************
Local wResp , w1Tp_Acesso , w1Acesso , w2Tp_Acesso , w2Acesso , wReturn , wTipo
Local wWhere, wAcesso , wM_Acesso , wxLen , wx

   wWhere := " usr_cod = " + Campo(wUsuario)
   wResp := fConsulta2({"acs_usuario","acs_usuario_senha"},{"usr_cod","usr_senha","usr_senha_dt_vld"},wWhere,"perfil_mov_obj_nome")

   *For wx:= 01 To Len(wResp)
   *    aadd(wM_ACS_Restricao,{AllTrim(Upper(wResp[wx,01])),wResp[wx,02],wResp[wx,03],wResp[wx,04],wResp[wx,05],wResp[wx,06],wResp[wx,07]})    
   *Next

   wReturn  := .T.
   wLocal   := Upper(AllTrim(wLocal))
   wUsuario := Upper(AllTrim(wUsuario))
   If Len(wM_User) = 0
      wWhere := " usr_codigo = " + Campo(wUsuario)
      wResp := fConsulta2("usr_usuarios",{"usr_acesso_tp","usr_acessos","usr_imp_acs_tp","usr_imp_acessos"},wWhere,"usr_codigo")
      If Len(wResp)>0
         w1Tp_Acesso := AllTrim(wResp[1,1])
         w1Acesso    := AllTrim(wResp[1,2])
         w2Tp_Acesso := AllTrim(wResp[1,3])
         w2Acesso    := AllTrim(wResp[1,4])
      Else
         w1Tp_Acesso := "N"
         w1Acesso    := Space(00)
         w2Tp_Acesso := "N"
         w2Acesso    := Space(00)
      EndIf
      aAdd( wM_User , w1Tp_Acesso )
      aAdd( wM_User , w1Acesso    )
      aAdd( wM_User , w2Tp_Acesso )
      aAdd( wM_User , w2Acesso    )
   EndIf
 
   If wOpcao = 1
      wTipo   := wM_User[1]
      wAcesso := wM_User[2]
   ElseIf wOpcao = 2
      wTipo   := wM_User[3]
      wAcesso := wM_User[4]
   EndIf

   wM_Acesso := cStrToMatriz(wAcesso,"#")

   If wTipo = "T"         //   Acessa TODOS exceto os relacionados
      wReturn := .T.
      If cScan( wM_Acesso , wLocal ) > 0
         Return .F.
      EndIf
   ElseIf wTipo = "N"     //   Nao acessa NENHUM exceto os relacionados
      wReturn := .F.
      If cScan( wM_Acesso , wLocal ) > 0
         Return .T.
      EndIf
   EndIf

Return wReturn
*fim da Function cAcesso()

Function cAcessoX(wOpcao,wUsuario,wLocal)
*******************************************************************************
*      funcao para verIficar se o usuario tem ou nao acesso ao programa       *
*******************************************************************************
Local wResp , w1Tp_Acesso , w1Acesso , w2Tp_Acesso , w2Acesso , wReturn , wTipo
Local wWhere, wAcesso , wM_Acesso , wxLen , wx

   If cEmpty(wLocal)
      Return .T.
   EndIf
   wReturn  := .T.
   wLocal   := Upper(AllTrim(wLocal))
   wUsuario := Upper(AllTrim(wUsuario))
   If Len(wM_User) = 0
      wWhere := " usr_codigo = " + Campo(wUsuario)
      wResp := fConsulta2("usr_usuarios",{"usr_acesso_tp","usr_acessos","usr_imp_acs_tp","usr_imp_acessos"},wWhere,"usr_codigo")
      If Len(wResp)>0
         w1Tp_Acesso := AllTrim(wResp[1,1])
         w1Acesso    := AllTrim(wResp[1,2])
         w2Tp_Acesso := AllTrim(wResp[1,3])
         w2Acesso    := AllTrim(wResp[1,4])
      Else
         w1Tp_Acesso := "N"
         w1Acesso    := Space(00)
         w2Tp_Acesso := "N"
         w2Acesso    := Space(00)
      EndIf
      aAdd( wM_User , w1Tp_Acesso )
      aAdd( wM_User , w1Acesso    )
      aAdd( wM_User , w2Tp_Acesso )
      aAdd( wM_User , w2Acesso    )
   EndIf
 
   If wOpcao = 1
      wTipo   := wM_User[1]
      wAcesso := wM_User[2]
   ElseIf wOpcao = 2
      wTipo   := wM_User[3]
      wAcesso := wM_User[4]
   EndIf

   wM_Acesso := cStrToMatriz(wAcesso,"#")

   If wTipo = "T"         //   Acessa TODOS exceto os relacionados
      wReturn := .T.
      If cScan( wM_Acesso , wLocal ) > 0
         Return .F.
      EndIf
   ElseIf wTipo = "N"     //   Nao acessa NENHUM exceto os relacionados
      wReturn := .F.
      If cScan( wM_Acesso , wLocal ) > 0
         Return .T.
      EndIf
   EndIf

Return wReturn
*fim da Function cAcessoX()

Function fMoveCalendar(oDlg,nMode,nVar,wYear,wData)
*******************************************************************************
*                           Movimentacao do Calendario                        *
*******************************************************************************
Local n,wWorkDia,wDtExtenso,wxLen,wx,wDia,wMes,wAno,wy,wz
Local wInicio := 0
Local wFinal  := 0
Local nDate   := 0
Local nSkip   := 0
Local wxData  := 0
Local wxAno   := 0

   wData := iIf(ValType(wData)<>"D",oDlg:Cargo,wData)
   wxLen := Len(oDlg:aControls)
   
   wx := 0
   For wx := 01 TO wxLen
      If oDlg:aControls[wx]:ClassName() == "TBTNBMP"
         If .Not.cEmpty(oDlg:aControls[wx]:Cargo)
            If cEmpty(wInicio)
               wInicio := wx
            EndIf
            wFinal := wx
            oDlg:aControls[wx]:lPressed := .F.
         EndIf
      EndIf
      If ValType(oDlg:aControls[wx]:Cargo ) == "C"
        If oDlg:aControls[wx]:Cargo == "DATE"
           wxData := wx
        EndIf
        If oDlg:aControls[wx]:Cargo == "YEAR"
           wxAno := wx
        EndIf
      EndIf
   next

   wDia := Day  (wData)
   wMes := Month(wData)
   wAno := Year (wData)

   do case
      case nMode == 1
         wMes := nVar
      case nMode == 3
         wAno --
      case nMode == 4
         wAno ++
      case nMode == 5
         wAno := wYear
   endcase

   If ValType(nMode)="U"
      For wy := 01 To Len(oM_Say)
         For wz := 1 To Len(oDlg:aControls)
            If Upper(oM_Say[wy]:classname) = "TCOMBOBOX"
               If oM_Say[wy]:nId = oDlg:aControls[wz]:nId
                  oM_Say[wy]:Set(wMes)
               EndIf
            EndIf
         Next
      Next
   EndIf

   If wDia = 31 .And. (wMes = 04 .or. wMes = 06 .or. wMes = 09 .or. wMes = 11 )
      wDia := 30
   EndIf
   wData      := cTToD(padl(wDia,2) + "/" + padl(wMes,2) + "/" + right(padl(wAno,4 ),2),"DD/MM/YY" )
   wDtExtenso := dDateToString(wData)
   oDlg:aControls[wxData]:VarPut(wDtExtenso)

   oDlg:aControls[wxAno]:VarPut(wAno)
   wWorkDia := cTToD("01/" + padl(wMes,2) + "/" + right(padl(wAno,4 ),2),"DD/MM/YY" )
   Do While Dow(wWorkDia) > 1
      wWorkDia --
   EndDo

   wWorkDia   := fCalend_Color(oDlg,wInicio,wFinal,wWorkDia,wData,wMes,wxLen)
   oDlg:Cargo := wData

Return nil
*fim da Function fMoveCalendar(oDlg,nMode,nVar,wYear,wData)

 Function fMoveDay(oDlg)
*******************************************************************************
*                   funcao para Formatar a Data no Calendario                 *
*******************************************************************************
Local wWorkDia,wDtExtenso,wDia,wMes,wAno,wx,wxLen
Local wData   := oDlg:Cargo
Local wInicio := 0
Local wFinal  := 0
Local nDate   := 0
Local nSkip   := 0
Local wxData  := 0
Local wxAno   := 0

   wx    := 00
   wxLen := Len(oDlg:aControls)

   For wx := 01 To wxLen
      If oDlg:aControls[wx]:ClassName() == "TBTNBMP"
         If .Not.cEmpty(oDlg:aControls[wx]:Cargo)
            If cEmpty(wInicio)
               wInicio := wx
            EndIf
            wFinal := wx
         EndIf
      EndIf

      If ValType(oDlg:aControls[wx]:Cargo) == "C"
        If oDlg:aControls[wx]:Cargo == "DATE"
           wxData := wx
        EndIf
        If oDlg:aControls[wx]:Cargo == "YEAR"
           wxAno := wx
        EndIf
      EndIf
   next

   wDia := Day  (wData)
   wMes := Month(wData)
   wAno := Year (wData)

   wData := cTToD(padl(wDia,2) + "/" + padl(wMes,2) + "/" + right(padl(wAno,4 ),2),"DD/MM/YY" )
   wDtExtenso := dDateToString(wData)
   oDlg:aControls[wxData]:VarPut(wDtExtenso)
   oDlg:aControls[wxData]:Refresh()

   oDlg:aControls[wxAno]:VarPut(wAno)
   wWorkDia := cTToD("01/" + padl(wMes,2) +"/"+ Right(padl(wAno,4),2),"DD/MM/YY")
   Do While Dow(wWorkDia) > 1
      wWorkDia --
   EndDo

   wWorkDia   := fCalend_Color(oDlg,wInicio,wFinal,wWorkDia,wData,wMes,wxLen)
   oDlg:Cargo := wData

Return nil
*fim da Function fMoveDay(oDlg)

Function fCalend_Color(oDlg,wInicio,wFinal,wWorkDia,wData,wMes,wxLen)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wx,wContador

   wContador := 00
   For wx := wInicio TO wFinal
      wContador := wContador + 01
      oDlg:aControls[wx]:lPressed := .F.
      oDlg:aControls[wx]:SetText(Str(Day(wWorkDia),2))
      oDlg:aControls[wx]:Cargo := wWorkDia
      oDlg:aControls[wx]:Enable()
      If wWorkDia == cDate()
         oDlg:aControls[wx]:nClrText := 16711680
      ElseIf wWorkDia == wData
         oDlg:aControls[wx]:nClrText := 32768
      ElseIf Month(wWorkDia) == wMes
         If wContador=1 .or. wContador=8 .or. wContador=15 .or. wContador=22 .or. wContador=29 .or. wContador=36
            oDlg:aControls[wx]:nClrText := 255
         Else
            oDlg:aControls[wx]:nClrText := 0
         EndIf
      Else
         If wContador=1 .or. wContador=8 .or. wContador=15 .or. wContador=22 .or. wContador=29 .or. wContador=36
            oDlg:aControls[wx]:nClrText := 255
         Else
            oDlg:aControls[wx]:nClrText := 8421504
         EndIf
         oDlg:aControls[wx]:Disable()
      EndIf

      oDlg:aControls[wx]:cToolTip := DToC(wWorkDia)
      If wWorkDia == wData
         oDlg:aControls[wx]:lPressed := .T.
         oDlg:aControls[wx]:cToolTip := "Selecionado"
      EndIf
      wWorkDia++
   Next

   wx := 00
   For wx := 01 To wxLen
      If ValType(oDlg:aControls[wx]:Cargo)<>"U"
         oDlg:aControls[wx]:Refresh()
      EndIf
   Next

Return wWorkDia
*fim da Function fCalend_Color(wLinha,oDlg,wWorkDia)

 Function cTToD(wData,wFormato)
*******************************************************************************
*                   funcao para Formatar a Data no Calendario                 *
*******************************************************************************
Local wDia,wMes,wAno,wxAno,wRetorno,wTpFormato,wEpoca

   wTpFormato := Upper("dd/mm/yyyy")
   wEpoca     := wc_Epoca

   If ValType(wFormato) <> "C"
      wFormato := "MM/DD/YY"
   EndIf

   If cEmpty(wData)
      wRetorno := CTOD("")
   Else
      If ("YYYY" $ wFormato)
         wxAno := PADR(VAL(SubStr(wData,AT("YYYY",wFormato),4 )),4,"0")
         wAno := PADL(VAL(RIGHT(wxAno,2)),2,"0")
      ElseIf ("YY" $ wFormato)
         wAno := PADL(VAL(SubStr(wData,AT("YY",wFormato),2 )),2,"0")
         If VAL("19" + wAno) > wEpoca
            wxAno := "19" + wAno
         Else
            wxAno := "20" + wAno
         EndIf
      EndIf
      If ("MM" $ wFormato)
         wMes := PADL(AllTrim(SubStr(wData,AT("MM",wFormato),2 )),2,"0")
      EndIf
      If ("DD" $ wFormato)
         wDia := PADL(AllTrim(SubStr(wData,AT("DD",wFormato),2 )),2,"0")
      EndIf

      If ("YYYY" $ wTpFormato)
         wTpFormato := LEFT(wTpFormato,AT("YYYY",wTpFormato) - 1 ) + wxAno + SubStr(wTpFormato,AT("YYYY",wTpFormato) + 4 )
      ElseIf ("YY" $ wTpFormato)
         wTpFormato := LEFT(wTpFormato,AT("YY",wTpFormato) - 1 ) + wAno + SubStr(wTpFormato,AT("YY",wTpFormato) + 2 )
      EndIf
      If ("MM" $ wTpFormato)
         wTpFormato := LEFT(wTpFormato,AT("MM",wTpFormato) - 1 ) + wMes + SubStr(wTpFormato,AT("MM",wTpFormato) + 2 )
      EndIf
      If ("DD" $ wTpFormato)
         wTpFormato := LEFT(wTpFormato,AT("DD",wTpFormato) - 1 ) + wDia + SubStr(wTpFormato,AT("DD",wTpFormato) + 2 )
      EndIf
      wRetorno := CTOD(wTpFormato)
   EndIf

Return (wRetorno)
*fim da Function cTToD(wData,wFormato)

Function c_Get_CMB_Edit(nKey,nFlags,oGet,oCbx,wFunction)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wPos,wComboLinhas,wResp,wx,wWhere,wMatriz,wxLen,wxx,wAnt,wxFunction
Private oxGet,oxCbx,wBuffer,wLenBuffer

   If Len(GetWindowText(oGet:hWnd))=0
      oCbx:SetItems( {Space(252)} )
      oCbx:Select(1)
      Return .t.
   EndIf

   If nKey>=65.And.nKey<=128 .Or. nKey>=32.And.nKey<=57
      wBuffer := Trim(Left(GetWindowText(oGet:hWnd),oGet:oGet:Pos-1))
      wBuffer := Trim(wBuffer+Chr(nKey))
      wLenBuffer := Len(wBuffer)
      oxGet := oGet
      oxCbx := oCbx

      wxFunction := Trim(wFunction)
      wxFunction := &wxFunction

      oGet:SetSel(wLenBuffer,wLenBuffer)
      
      wPos := oCbx:FindString(Trim(wBuffer),wLenBuffer)
      If wPos>0
         oGet:SetSel( wLenBuffer, wLenBuffer)
         oCbx:Select(wPos)
         oGet:VarPut(wBuffer+Space(252))
         oGet:oGet:UpDateBuffer()
         oGet:DispText()
         oCbx:Refresh()
      EndIf
   EndIf

Return .T.
*fim da Function c_Get_CMB_Edit()

Function fClear_Grid(wGrid)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wx,wMM,wDefVar,wWork,wxLen

   If cEmpty(wGrid)
      wGrid := wM_Grid_Seq[wG_Atual]
   EndIf

   wM_BrwLin[wGrid] := 01
   wxLen := Len(wM_Case[wGrid,wCS_Coluna])
   aSize(wM_Grid[wGrid],0 )
   wM_Grid[wGrid] := {}

   aAdd(wM_Grid[wGrid],{})
   wx := 00
   wMM := {}
   For wx = 01 To wxLen
      wDefVar := cDefVar(wM_Case[wGrid,wCS_DefVar,wx],wM_Case[wGrid,wCS_TypeVar,wx],wGrid)
      wWork := iIf(wM_Case[wGrid,wCS_TypeVar,wx]="N",0,wDefVar)
      aAdd(wMM,wWork)
   Next
   wM_Grid[wGrid,01] := wMM

   oM_Brw[wGrid]:GoTop()
   oM_Brw[wGrid]:Refresh()
   fCaseDefVar(wGrid)
   fCaseAtrib(wGrid)
   fCaseRefresh(wGrid)

Return .t.
*fim da Function fClear_Grid(wGrid)

**************  SIMULAÇÂO DE TECLA - Inicio ***************
//keybd_event(asc("T"),,,0)
//keybd_event(asc("E"),,,0)
//keybd_event(asc("S"),,,0)
//keybd_event(asc("T"),,,0)
//keybd_event(asc("E"),,,0)
//keybd_event(13,,,0)
//keybd_event(asc("T"),,,0)
//keybd_event(asc("E"),,,0)
//keybd_event(asc("S"),,,0)
//keybd_event(asc("T"),,,0)
//keybd_event(asc("E"),,,0)

DLL32 Function keybd_event(bVk AS 7,bScan AS 7,dwFlags AS 8,dwExtraInfo AS 7) AS 7 PASCAL LIB "User32.dll"
******************  SIMULAÇÂO DE TECLA - Fim ******************

Function cBrw_Color(wGrid,wClrFundo,wClrTexto)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wNumClrFundo,wNumClrtexto

   If cEmpty(wGrid)
      wGrid := wM_Grid_Seq[wG_Atual]
   EndIf

   oM_Brw[wGrid]:nClrBackFocus := cColor(wClrFundo)
   oM_Brw[wGrid]:nClrForeFocus := cColor(wClrTexto)
   oM_Brw[wGrid]:Refresh()

Return .t.
*fim da Function cBrw_Color(wGrid,wClrFundo,wClrTexto)

Function cColor(wColor)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wNumColor

   wColor := iif(ValType(wColor)="C",Upper(AllTrim(wColor)),"")

   If     wColor == "AZUL"
      wNumColor := 8388608
   ElseIf wColor == "AZUL2"
      wNumColor := 16711680
   ElseIf wColor == "VERMELHO"
      wNumColor := 255
   ElseIf wColor == "VERDE"
      wNumColor := 32768
   ElseIf wColor == "AMARELO"
      wNumColor := 65535
   ElseIf wColor == "BRANCO"
      wNumColor := 16777215
   ElseIf wColor == "AMARELO2"
      wNumColor := 8257535
   EndIf

   If cEmpty(wNumColor)
     wNumColor := GetSysColor(18)
   EndIf

Return wNumColor
*fim da Function cColor(wColor)

Function xZoom(wObjBmp,nZoom )
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wFator,wnWidth,wnHeight

   If .Not.cEmpty(nZoom)
      If nZoom>0
         wFator := (10*nZoom)
         wnWidth := wObjBmp:nWidth + wFator
         wnHeight := wObjBmp:nHeight + wFator
      ElseIf nZoom<0
         wFator := (-10*nZoom)
         wnWidth := wObjBmp:nWidth - wFator
         wnHeight := wObjBmp:nHeight - wFator
      EndIf
      wObjBmp:nTop := 1
      wObjBmp:nLeft := 1
      wObjBmp:nWidth := wnWidth
      wObjBmp:nHeight := wnHeight
      PALBMPDraw(wObjBmp:hDC,1,1,wObjBmp:hBitmap,wObjBmp:hPalette,wnWidth,wnHeight,,,)
      wObjBmp:ScrollAdjust()
      wObjBmp:Refresh()
   EndIf

Return .t.
*fim da Function xZoom(wObjBmp,nZoom )

Function cAtrib_Data(wObjeto_Data,wValor)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wMacro

   If cEmpty(wObjeto_Data)
      Return .f.
   EndIf

   If .Not.cEmpty(wObjeto_Data)
      wMacro := Upper(AllTrim(wObjeto_Data))
      wMacro := &wMacro
      wMacro := wValor
   EndIf

Return .t.
*fim da Function cAtrib_Data(wObjeto,wDado,wValor )

Function fACS_ChkRestricao(wTipo,wObjeto)
*******************************************************************************
*      funcao para verIficar as restrições de acesso do perfil do usuario     *
*******************************************************************************
Local wx,wRestricao,wWhere,wResp,wWork

wTipo   := iIf(ValType(wTipo)="U",Space(00),AllTrim(Upper(wTipo)) )
wObjeto := iIf(ValType(wObjeto)="U",Space(00),AllTrim(Upper(wObjeto)) )

*--------------------------------Monta Matrix de Restrições do Perfil do Usuário-------------------*
If cEmpty(wACS_Perfil_TP) .and. .not.cEmpty(wc_User)
   wM_ACS_Restricao := {}
   wWhere := " usr_cod = " + Campo(wc_User) + " And perfil_sis_cod = " + campo(wc_Sistema)
   wResp := fConsulta2({"acs_usuario_perfil","acs_perfil"},{"acs_perfil.perfil_tp_acs"},wWhere,"acs_usuario_perfil.perfil_seq")
  
   If Len(wResp) > 0
      wACS_Perfil_TP := wResp[1,1] 
   EndIf
   wACS_Perfil_TP := iIf(cEmpty(wACS_Perfil_TP),"1",wACS_Perfil_TP)
   wResp := fConsulta2({"acs_usuario_perfil","acs_perfil_mov","acs_perfil"},{"perfil_mov_obj_nome","perfil_mov_obj_tp","perfil_mov_restricao","perfil_mov_dt_ini","perfil_mov_dt_fim","perfil_mov_hr_ini","perfil_mov_hr_fim"},wWhere,"perfil_mov_obj_nome,acs_usuario_perfil.perfil_seq")  

   wWork := space(00)	
   For wx:= 01 To Len(wResp)
       wResp[wx,01] := AllTrim(Upper(wResp[wx,01]))
       If wWork == wResp[wx,01]
       Else
          aadd(wM_ACS_Restricao,{wResp[wx,01],wResp[wx,02],wResp[wx,03],wResp[wx,04],wResp[wx,05],wResp[wx,06],wResp[wx,07]})    
       EndIf
       wWork := wResp[wx,01]
   Next

EndIf
*--------------------------------------------------------------------------------------------------*

If cEmpty(wTipo)
   Return .t.
EndIf
  
//If     wTipo = "MNU"
//   wRestricao := wACS_Perfil_TP
//ElseIf wTipo = "FRM"
//   wRestricao := Space(00)
//ElseIf wTipo = "FLT"
//   wRestricao := Space(00)
//ElseIf wTipo = "BTN"
//   wRestricao := Space(00)
//EndIf

wRestricao := Space(00)

For wx=1 to len(wM_ACS_Restricao)
    If wM_ACS_Restricao[wx,02] <> wTipo
       Loop
    EndIf
    If AllTrim(Upper(wM_ACS_Restricao[wx,01])) == wObjeto 
       wRestricao := wM_ACS_Restricao[wx,03]
       Exit
    EndIf
Next

If     wTipo = "MNU"
ElseIf wTipo = "FRM"
ElseIf wTipo = "FLT"
ElseIf wTipo = "BTN"
EndIf

Return wRestricao
*fim da Function fACS_ChkRestricao(wTipo,wObjeto)

Function cSinonimo(wParm1,wParm2)
*******************************************************************************
*             funcao para criar ou expandir um variavel de sinonimo 
* ex: cSinonimo("Nome_Assinante",wNome)  - cria sinonimo "Nome_Assinante" 
*                                          com conteudo da variavel "wNome"
* ex: cSinonimo(wTextoOriginal)  - Expande o texto com os sinonimos associados
*******************************************************************************
Local    wSinNome,wSinConteudo,wTextoOriginal,wTextoExpand,wLen,wPos,wx,wy,wz,wChar,wCharY

If Valtype(wParm2) <> "U"   // Cria sinonimo
   wSinNome     := Upper(wParm1)
   wSinConteudo := wParm2

   *----------------------------Scan em matrix----------------------------------------*
   wPos := 0 
   For wz:=1 to len(wM_Sinonimo)
      If wM_Sinonimo[wz,01] == wSinNome
         wPos := wz
         Exit
      EndIf
   Next
   *----------------------------------------------------------------------------------*
   If wPos = 0
      aadd(wM_Sinonimo,{wSinNome,wSinConteudo})
   Else
      wM_Sinonimo[wPos,2] := wSinConteudo
   EndIf

Else                       // Expande sinonimo
   wTextoOriginal := wParm1
   wTextoExpand   := space(00)
   wLen           := Len(wTextoOriginal)
   For wx=1 to wLen
      
       wChar := SubStr(wTextoOriginal,wx,1)
       If wchar = "["
          wSinNome := space(00)
          For wy=wx+1 to wLen
              wCharY := SubStr(wTextoOriginal,wy,1)
              If wcharY = "]"
                 exit
              EndIf
              wSinNome := wSinNome + Upper(wCharY)
          Next
          
          *----------------------------Scan em matrix----------------------------------------*
          wPos := 0 
          For wz:=1 to len(wM_Sinonimo)
             If wM_Sinonimo[wz,01] == wSinNome
                wPos := wz
                Exit
             EndIf
          Next
          *----------------------------------------------------------------------------------*
       
          If wPos > 0
             wSinConteudo := wM_Sinonimo[wPos,02]           
             If     valType(wSinConteudo) = "N"
                wChar := Str(wSinConteudo)
             ElseIf valType(wSinConteudo) = "D"
                wChar := dtoC(wSinConteudo)
             Else
                wChar := wSinConteudo
             EndIf
             wx := wy
          EndIf
       EndIf

       wTextoExpand := wTextoExpand + wChar
   Next

EndIf
Return wTextoExpand
*Fim Function cSinonimo(wParm1,wParm2)

function fBuscaPonto(wString)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wPontos , wIni , wFim , wObjeto, wy , wMResp

   wPontos := 0
   wString    := AllTrim(wString) + "."

   wIni   := 1
   wFim   := 0
   wMResp := {}

   For wy := 01 to Len(wString)
      If SubStr(wString,wy,1) = "."
         wPontos := wPontos + 1
         wFim := wy-wIni  //-1
         wObjeto := SubStr(wString,wIni,wFim)
         aAdd( wMResp , AllTrim(wObjeto) )
         wIni := wy+1
      EndIf
   Next

   wPontos := wPontos - 1

Return {wPontos,wMResp}
*fim da function fBuscaPonto(wString)

function fCase_Font(wObj_Nome,wOrig)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wWhere,wResp,wx,wNome,wLargura,wAltura,wNegrito,wItalico,wSublin,wPrp_Nome,wObjFont,oWndFont,wCor
Local wStrikeOut,wEscapement,wOrientation,wCharSet,wOutPrecision,wClipPrecision,wQuality,wPitchFamily

	If ValType(wObj_Nome)="A"
		wResp  := wObj_Nome
	Else
   	wWhere :=  " cCase_Obj.Obj_Nome = "+Campo(wObj_Nome+".%") + " and cCase_Obj.Obj_Tp = 'FNT' " 
   	wResp  := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Seq")
   EndIf

   Store Space(00) To wNome,wStrikeOut,wNegrito,wItalico,wSublin
   Store 0 To wLargura,wAltura,wEscapement,wOrientation,wCharSet,wOutPrecision,wClipPrecision,wQuality,wPitchFamily,wCor

	For wx := 01 To Len(wResp)
	   wResp[wx,01] := Lower(AllTrim(wResp[wx,01]))
	   wPrp_Nome    := AllTrim(wResp[wx,02])
	   wResp[wx,03] := AllTrim(wResp[wx,03])
	   If     wPrp_Nome == "NOME"
	      wNome          := wResp[wx,03]
	   ElseIf wPrp_Nome == "ALTURA"
	      wAltura        := wResp[wx,03]
	   ElseIf wPrp_Nome == "LARGURA"
	      wLargura       := wResp[wx,03]
	   ElseIf wPrp_Nome == "NEGRITO"
	      wNegrito       := wResp[wx,03]
	   ElseIf wPrp_Nome == "ITALICO"
	      wItalico       := wResp[wx,03]
	   ElseIf wPrp_Nome == "SUBLINHADO"
	      wSublin        := wResp[wx,03]
		ElseIf wPrp_Nome == "STRIKEOUT"
	      wStrikeOut     := wResp[wx,03]
		ElseIf wPrp_Nome == "ESCAPEMENT"
         wEscapement    := wResp[wx,03]
		ElseIf wPrp_Nome == "ORIENTATION"
         wOrientation   := wResp[wx,03]
		ElseIf wPrp_Nome == "CHARSET"
         wCharSet       := wResp[wx,03]
		ElseIf wPrp_Nome == "OUTPRECISION"
         wOutPrecision  := wResp[wx,03]
		ElseIf wPrp_Nome == "CLIPPRECISION"
         wClipPrecision := wResp[wx,03]
		ElseIf wPrp_Nome == "QUALITY"
         wQuality       := wResp[wx,03]
		ElseIf wPrp_Nome == "PITCHFAMILY"
         wPitchFamily   := wResp[wx,03]
		ElseIf wPrp_Nome == "COR"
         wCor           := iif(cEmpty(wResp[wx,03]),0,Val(wResp[wx,03]))
	   EndIf

	   If wx < Len(wResp)
	      wObj_Nome := wResp[wx+1,01]
	      wObj_Nome := Lower(AllTrim(wObj_Nome))
	   Else
	      wObj_Nome := Space(00)
	   EndIf

	   If wObj_Nome <> wResp[wx,01] .or. cEmpty(wObj_Nome)
	      wAltura        := iIf(cEmpty(wAltura ),nil,Val(wAltura ))
	      wAltura        := iIf(wOrig="REL",wAltura*-1,wAltura)
	      wLargura       := iIf(cEmpty(wLargura),nil,Val(wLargura))
	
	      wNegrito       := iIf(cEmpty(wNegrito  ),"N",SubStr(wNegrito  ,1,1))
	      wItalico       := iIf(cEmpty(wItalico  ),"N",SubStr(wItalico  ,1,1))
	      wSublin        := iIf(cEmpty(wSublin   ),"N",SubStr(wSublin   ,1,1))
	      wSublin        := iIf(cEmpty(wSublin   ),"N",SubStr(wSublin   ,1,1))
         wStrikeOut     := iIf(cEmpty(wStrikeOut),"N",SubStr(wStrikeOut,1,1))
                        
	      wNegrito       := iIf(wNegrito  ="S",.T.,.F.)
	      wItalico       := iIf(wItalico  ="S",.T.,.F.)
	      wSublin        := iIf(wSublin   ="S",.T.,.F.)
	      wStrikeOut     := iIf(wStrikeOut="S",.T.,.F.)

         wEscapement    := iif(cEmpty(wEscapement   ),nil,Val(wEscapement   ))
         wOrientation   := iif(cEmpty(wOrientation  ),nil,Val(wOrientation  ))
         wCharSet       := iif(cEmpty(wCharSet      ),nil,Val(wCharSet      ))
         wOutPrecision  := iif(cEmpty(wOutPrecision ),nil,Val(wOutPrecision ))
         wClipPrecision := iif(cEmpty(wClipPrecision),nil,Val(wClipPrecision))
         wQuality       := iif(cEmpty(wQuality      ),nil,Val(wQuality      ))
         wPitchFamily   := iif(cEmpty(wPitchFamily  ),nil,Val(wPitchFamily  ))

	      oWndFont := iIf(wOrig="REL",__oPrn,nil)

			wObjFont := TFont():New(wNome    ,wLargura,wAltura,         ,wNegrito,wEscapement,wOrientation,       ,wItalico,wSublin   ,wStrikeOut,wCharSet,wOutPrecision,wClipPrecision,wQuality,oWndFont,wPitchFamily)
	               //  METHOD New(cFaceName,nWidth  ,nHeight,lFromUser,lBold   ,nEscapement,nOrientation,nWeight,lItalic ,lUnderline,lStrikeOut,nCharSet,nOutPrecision,nClipPrecision,nQuality,oDevice ,nPitchFamily)

	      aAdd( __wM_Font , {wResp[wx,01],wObjFont,wOrig,wCor}) 

         Store Space(00) To wNome,wStrikeOut,wNegrito,wItalico,wSublin
         Store 0 To wLargura,wAltura,wEscapement,wOrientation,wCharSet,wOutPrecision,wClipPrecision,wQuality,wPitchFamily,wCor
	   EndIf
	Next

Return .T.
*fim da function fCase_Font()

function fCase_Font_Del(wOrig)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wx,wDel,wLen,wXLen

	If cEmpty(wOrig)
		wOrig := "OBJ"
	EndIf

	wx    := 0
	wDel  := 0
	wLen  := Len(__wM_Font)
	wXLen := wLen
	For wx := 01 To wLen
	   If wXLen >= wx
			If __wM_Font[wx,3]=wOrig
	         __wM_Font[wx,2]:End()
            __wM_Font[wx,2] := nil
	         aDel(__wM_Font,wx)
	         wDel  := wDel  + 1
	         wXLen := wXLen - 1
	         wx    := wx    - 1
	      EndIf
	   EndIf
	Next
   aSize(__wM_Font,wLen-wDel)

Return .T.
*fim da function fCase_Font_Del()

function cFont(_wObj_Nome)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wFont,wxLen,wx,wCor

   _wObj_Nome := Lower(AllTrim(_wObj_Nome))
   wxLen := Len(__wM_Font)
   For wx := 01 To wxLen
   	If __wM_Font[wx,1] == _wObj_Nome
   		wFont := __wM_Font[wx,2]
   		wCor  := __wM_Font[wx,4]
   		Exit
   	EndIf
   Next
   
Return {wFont,wCor}
*fim da function cFont(_wObj_Nome)

function fCase_Pen(wMatriz)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wx,wCor,wLargura,wFormato,wObj_Nome,wPrp_Nome,oPen

	For wx := 01 To Len(wMatriz)
	   wMatriz[wx,01] := Lower(AllTrim(wMatriz[wx,01]))
	   wPrp_Nome      := AllTrim(wMatriz[wx,02])
	   wMatriz[wx,03] := AllTrim(wMatriz[wx,03])
	   If     wPrp_Nome == "COR"
	      wCor     := wMatriz[wx,03]
	   ElseIf wPrp_Nome == "LARGURA"
	      wLargura := wMatriz[wx,03]
	   ElseIf wPrp_Nome == "FORMATO_PEN"
	      wFormato := wMatriz[wx,03]
	   EndIf
	
	   If wx < Len(wMatriz)
	      wObj_Nome := wMatriz[wx+1,01]
	      wObj_Nome := Lower(AllTrim(wObj_Nome))
	   Else
	      wObj_Nome := Space(00)
	   EndIf
	   
	   If wObj_Nome <> wMatriz[wx,01] .or. cEmpty(wObj_Nome)
	      wFormato := iIf(cEmpty(wFormato),0,Val(wFormato))
	      wLargura := iIf(cEmpty(wLargura),3,Val(wLargura))
	      wCor     := iIf(cEmpty(wCor),0,Val(wCor))

		 	oPen := TPen():New(wFormato,wLargura,wCor,)
	      aAdd( __wM_Pen , {wMatriz[wx,01],oPen})
	   EndIf
	Next

Return .T.
*fim da function fCase_Pen(wMatriz)

function cPen(_wObj_Nome)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local oPen,wxLen,wx

   _wObj_Nome := Lower(AllTrim(_wObj_Nome))
   wxLen := Len(__wM_Pen)
   For wx := 01 To wxLen
   	If __wM_Pen[wx,1] == _wObj_Nome
   		oPen := __wM_Pen[wx,2]
   	EndIf
   Next
   
Return oPen
*fim da function cPen(_wObj_Nome)

function __fCase_Var()
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wWhere,wResp,wx,wNome,wDescricao,wConteudo,wSistema,wObj_Nome,wxConteudo,wxNome,wPrp_Nome
Public __wMVaruser := {}

   Store "" To wNome,wDescricao,wConteudo,wSistema

   wWhere := " cCase_Obj.Obj_Tp = 'VAR' "
   wResp  := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj.Obj_Nome","cCase_Obj_Prp.Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Nome")

   For wx := 01 To Len(wResp)
      wPrp_Nome    := AllTrim(wResp[wx,02])
      wResp[wx,03] := AllTrim(wResp[wx,03])
      If     wPrp_Nome == "NOME"
         wNome      := wResp[wx,03]
      ElseIf wPrp_Nome == "DESCRICAO"
         wDescricao := wResp[wx,03]
      ElseIf wPrp_Nome == "CONTEUDO"
         wConteudo  := wResp[wx,03]
      ElseIf wPrp_Nome == "SISTEMA"
         wSistema   := wResp[wx,03]
      EndIf
      
      If wx < Len(wResp)
         wObj_Nome := wResp[wx+1,01]
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wResp[wx,01] .or. cEmpty(wObj_Nome)
         If Upper(wSistema) == wc_Sistema .or. Upper(wSistema) == "GLB"
            __MVPUBLIC(wNome)
            wxNome := wNome
            If .Not.cEmpty(wConteudo)
               wxConteudo := wConteudo
               wxConteudo := &wxConteudo
               &wxNome    := wxConteudo

               aAdd(__wMVaruser,wNome)
            EndIf
         EndIf
         Store "" To wNome,wDescricao,wConteudo,wSistema,wxConteudo,wxNome
      EndIf
   Next

Return .T.
*fim da function __fCase_Var()

function cMsg_SN(wMsg,wTitulo,wDefault)
*************************************************************************************
*                  Box de Mensagem:   "S" - "Sim" / "N" - "Não"                     *
*************************************************************************************
Private oDlg,wPixel,wLeft,wS,wST,wN,wNT,wReturn

   wMsg    := cNvl( wMsg    , "Confirma esta operação "+chr(63) )
   wTitulo := cNvl( wTitulo , "Escolha uma opção..."     )
   wDefault := cNvl( wDefault , 1                          )
   wDefault := iif(Valtype(wDefault)<>"N",1,wDefault)

   oDlg := TDIALOG():New( 1 , 1 , 100 , 288 , wTitulo ,,, .F.,,,,,, .T.,, oFont,,, )

      wS  := "wReturn := " + Campo("S") + ",oDlg:End()"
      wST := "wReturn := " + Campo("ST") + ",oDlg:End()"
      wN  := "wReturn := " + Campo("N") + ",oDlg:End()"
      wNT := "wReturn := " + Campo("NT") + ",oDlg:End()"

      c_Button(,oDlg,,2 ,00.75 ,0.75 ,3.25 ,"&Sim"      ,,,0,,wS,)
      c_Button(,oDlg,,2 ,04.85 ,0.75 ,3.75 ,"Sim &Todos",,,0,,wST,)
      c_Button(,oDlg,,2 ,09.50 ,0.75 ,3.25 ,"&Não"      ,,,0,,wN,)
      c_Button(,oDlg,,2 ,13.50 ,0.75 ,3.75 ,"Nã&o Todos",,,0,,wNT,)

      wPixel := c_Pixel_Len(wMsg,.F.)

      wLeft := (oDlg:nWidth/2) - wPixel
      wLeft := wLeft / 2

      TSay():New( 12 , wLeft , {|| wMsg },oDlg,,, .F. , .F. , .F. , .T. ,,, wPixel , 07 , .F. , .F. , .F. , .F. , .F. )   //mostra o conteudo do texto na tela

      If wDefault>1 .and. wDefault<=4
         oM_Button[wDefault]:Setfocus(.t.)
      EndIf

   oDlg:Activate( oDlg:bLClicked, oDlg:bMoved , oDlg:bPainted, .T. ,,,, oDlg:bRClicked,, )

return wReturn
*fim da function cMsg_SN()

//function fPRC_ccase_PRC_grava()
//*************************************************************************************
//*                                                                                   *
//*************************************************************************************
//Local wWhere,wObj_Nome,wResp,wMemo,wGrid,wKeySql
//
//   wObj_Nome := AllTrim(cV("Obj_Nome",2))
//
//   If cN_Fld(1,2,.t.)
//      fCaseButton(4)
//
//      wKeySql := "Obj_Nome = " + Campo(wObj_Nome) + " And Prp_Nome = " + Campo("Sistema")
//      wResp   := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr"},wKeySql)
//      If Len(wResp)=0
//         fInsert( "cCase_Obj_Prp" ,,, {"Obj_Nome",wObj_Nome,"Prp_Nome","SISTEMA","Obj_Prp_Vlr",cV("Sistema",2)}) 
//      Else
//         fUpdate( "cCase_Obj_Prp" ,,wKeySql,, {"Obj_Prp_Vlr",cV("Sistema",2)})
//      EndIf
//   EndIf
//
//   If cN_Fld(1,3,.t.)
//      wMemo   := AllTrim(cVF("Obj_Prp_Memo",3))
//      wKeySql := "Obj_Nome = " + Campo(wObj_Nome) + " And Prp_Nome = " + Campo("Procedure")
//      wResp   := fConsulta( "cCase_Obj_Prp" ,, wKeySql ,,, {"Obj_Nome"} )
//      If Len(wResp)=0
//         fInsert( "cCase_Obj_Prp" ,,, {"Obj_Nome",wObj_Nome,"Prp_Nome","Procedure","Obj_Prp_Memo",wMemo}) 
//      Else
//         fUpdate( "cCase_Obj_Prp" ,,wKeySql,, {"Obj_Prp_Memo",wMemo})
//      EndIf
//   EndIf
//
//Return .T.
//*fim da function fPRC_ccase_PRC_grava()
//
    
function CX_MsgMeter( bAction, cMsg, cTitle )
*******************************************************************************
*                       monta a evolucao do processo                          *
*******************************************************************************
Local oDlg, oText, oBtn, oFont , lEnd := .f., lCancel := .f. , nVal := 0

   DEFAULT bAction := { || nil }, cMsg := "Processando...", cTitle := "Aguarde..."
      
   DEFINE FONT oFont NAME "Ms Sans Serif" SIZE 0, -8
      
   DEFINE DIALOG oDlg FROM 5, 5 TO 10.4, 45 TITLE cTitle FONT oFont
      
   @ 0.2, 0.5  SAY oText VAR cMsg SIZE 130, 10 OF oDlg
      
   @ 1,   0.5  METER oXMeter VAR nVal TOTAL 10 SIZE 150, 10 OF oDlg

   oDlg:bStart := { || Eval( bAction, oXMeter, oText, oDlg, @lEnd, oBtn ), lEnd := .t., oDlg:End() }

   ACTIVATE DIALOG oDlg CENTERED VALID lEnd

return lCancel
*fim da function CX_MsgMeter

function fqg
   CX_MsgMeter({|oMeter,oText,oDlgx,lEnd|  fTab_Defrag("SCT","DCE01","S")  },"Gerando Relatório","Aguarde.....")
return nil

function fAtrib_Combo(wConteudo,wObjGet)
*************************************************************************************************
*                         Funcao para Atribuir informação no Combo                              *
*************************************************************************************************
Local wMatriz,wxLen,wResposta,wPos,wy,wXConteudo

   wXConteudo := Space(0)
   wConteudo  := cNvl(wConteudo,"")
   wMatriz    := {}
   wxLen      := 00
   wResposta  := Space(0)
   wPos       := 0
   wy         := 0
   If ValType(wConteudo)="C"
      wConteudo := AllTrim(wConteudo)
      wPos := At("-",wConteudo)
      If wPos>0
         wPos := wPos-1
      Else
    	   wPos := Len(wConteudo)
      EndIf
      wXConteudo := Upper(SubStr(wConteudo,1,wPos))
   ElseIf ValType(wConteudo)="N"
      wXConteudo := AllTrim(StrZero(wConteudo))
   EndIf

   wMatriz := wObjGet:aItems
   wxLen  := Len(wMatriz)
   For wy := 01 to wxLen
      If cEmpty(wMatriz[wy])
         Loop
      EndIf
      wMatriz[wy] := AllTrim(wMatriz[wy])

      wPos := At("-",wMatriz[wy])
      wPos := iIf(cEmpty(wPos),At("#",wMatriz[wy]),wPos)

      If wPos>0
         wPos := wPos-1
      Else
    	   wPos := Len(wMatriz[wy])
      EndIf
      If Upper(SubStr(wMatriz[wy],1,wPos)) == wXConteudo
         wResposta := wMatriz[wy]
         Exit
      EndIf
   Next

return wResposta
*fim da function fAtrib_Combo(wConteudo,wObjGet,wFormato,wAuxFunction)

Function fCarrega_Combo(wColuna,wxCase,wMatriz,wDefault)
********************************************************************************
*             Funcao para Criar ou setar uma conexao ODBC                      *
********************************************************************************
Local wxLen,wComboLinhas,wNum_Coluna,wObjeto

   wMatriz := cNvl(wMatriz,{})

   If cEmpty(wxCase)
      wxCase      := m->wM_Grid_Seq[wG_Atual]
      wNum_Coluna := cNC(wColuna,wxCase,.f.,"fCarrega_Combo")
      If cEmpty(wNum_Coluna)
         wxCase      := Len(wM_Case)
         wNum_Coluna := cNC(wColuna,wxCase,.f.,"fCarrega_Combo")
      EndIf
   Else
      wNum_Coluna := cNC(wColuna,wxCase,.f.,"fCarrega_Combo")
   EndIf
   If wNum_Coluna>0
      wObjeto := wM_Case[wxCase,wCS_ObjGet,wNum_Coluna]

      wObjeto:SetItems( wMatriz )
      wxLen  := Len(wMatriz)
      If wxLen < 6
         wComboLinhas := wxLen * 26
      Else
         wComboLinhas := 6 * 26
      EndIf

      wObjeto:SetSize( wObjeto:nWidth, wComboLinhas , .T. )
      wObjeto:nAt := 1
      wObjeto:Select(1)
      wM_Case[wxCase,wCS_Conteudo,wNum_Coluna] := fAtrib_Combo(wDefault,wObjeto)
      wM_Case[wxCase,wCS_ObjGet,wNum_Coluna]:Refresh()
   Else
      cCancel("Coluna: "+Campo(wColuna)+"não encontrado na CASE nº: " + Str(wxCase))
   EndIf

Return .t.
*Fim da Function fCarrega_Combo(wColuna,wxCase,wMatriz,wDefault)

Function fGRD_GoTop(wGrid)
********************************************************************************
*                  Funcao o cursor do Grid p/ a 1º posicao                     *
********************************************************************************

   if Len(wM_Grid[wGrid])=0
      return nil
   endif

   wM_BrwLin[wGrid]         := 01
   oM_Brw[wGrid]:lHitTop    := .T.
   oM_Brw[wGrid]:lHitBottom := .F.
   oM_Brw[wGrid]:nRowPos    := 01
   oM_Brw[wGrid]:Refresh( .f. )
   if oM_Brw[wGrid]:oVScroll <> nil
      oM_Brw[wGrid]:VGoTop()
   endif
   if oM_Brw[wGrid]:bChange <> nil
      fCaseAtrib(wGrid)
      fCaseRefresh(wGrid)
   endif

return nil
*fim da Function fGRD_GoTop(wGrid)

Function fGRD_GoBottom(wGrid)
********************************************************************************
*                  Funcao o cursor do Grid p/ a última posicao                 *
********************************************************************************
Local wSkip,wLinha,wx,wGridAtual

   wLinha := oM_Brw[wGrid]:nRowCount()

   if Len(wM_Grid[wGrid])=0
      return nil
   endif

   if .Not. oM_Brw[wGrid]:lHitBottom
      oM_Brw[wGrid]:lHitBottom := .T.
      oM_Brw[wGrid]:lHitTop    := .F.

      wM_BrwLin[wGrid] := Len(wM_Grid[wGrid])

      wGridAtual := m->wM_Grid_Seq[wG_Atual]
      m->wM_Grid_Seq[wG_Atual] := wGrid
      wSkip := oM_Brw[wGrid]:Skip( -( wLinha - 1 ) )
      oM_Brw[wGrid]:nRowPos := 1 - wSkip
      oM_Brw[wGrid]:GetDC()
      For wx := 1 to -wSkip
          oM_Brw[wGrid]:DrawLine( wx )
          oM_Brw[wGrid]:Skip( 1 )
      Next
      oM_Brw[wGrid]:DrawSelect()
      oM_Brw[wGrid]:ReleaseDC()
      if oM_Brw[wGrid]:oVScroll != nil
         oM_Brw[wGrid]:nLen := Len(wM_Grid[wGrid])
         if oM_Brw[wGrid]:VGetMax() <> oM_Brw[wGrid]:nLen
            oM_Brw[wGrid]:VSetRange()
         endif
         oM_Brw[wGrid]:VGoBottom()
      endif
      if oM_Brw[wGrid]:bChange <> nil
         fCaseAtrib(wGrid)
         fCaseRefresh(wGrid)
      endif
      m->wM_Grid_Seq[wG_Atual] := wGridAtual
   endif


return nil
*fim da Function fGRD_GoBottom(wGrid)

Function fGRD_GoUp(wGrid)
********************************************************************************
*          Funcao para movimentar o cursor do Grid uma posicao acima           *
********************************************************************************
Local wLinha,wx,wGridAtual

   if Len(wM_Grid[wGrid])=0
      return nil
   endif

   if .Not. oM_Brw[wGrid]:lHitTop
      wGridAtual := m->wM_Grid_Seq[wG_Atual]
      m->wM_Grid_Seq[wG_Atual] := wGrid
      oM_Brw[wGrid]:DrawLine()
      if oM_Brw[wGrid]:Skip( -1 ) == -1
         oM_Brw[wGrid]:lHitBottom := .f.
         if oM_Brw[wGrid]:nRowPos > 1
            oM_Brw[wGrid]:nRowPos --
         else
            WBrwScroll( oM_Brw[wGrid]:hWnd, -1, If( oM_Brw[wGrid]:oFont <> nil, oM_Brw[wGrid]:oFont:hFont, 0 ) )
         endif
      else
         oM_Brw[wGrid]:lHitTop := .T.
      endif
      oM_Brw[wGrid]:DrawSelect()
      if oM_Brw[wGrid]:oVScroll <> nil
         oM_Brw[wGrid]:VGoUp()
      endif
      if oM_Brw[wGrid]:bChange <> nil
         fCaseAtrib(wGrid)
         fCaseRefresh(wGrid)
      endif
      m->wM_Grid_Seq[wG_Atual] := wGridAtual
   endif

return nil
*fim da Function fGRD_GoUp(wGrid)

Function fGRD_GoDown(wGrid)
********************************************************************************
*          Funcao para movimentar o cursor do Grid uma posicao abaixo          *
********************************************************************************
Local wLinha,wx,wGridAtual 

   wLinha := oM_Brw[wGrid]:nRowCount()

   if Len(wM_Grid[wGrid])=0
      return nil
   endif

   if .Not. oM_Brw[wGrid]:lHitBottom
      wGridAtual := m->wM_Grid_Seq[wG_Atual]
      m->wM_Grid_Seq[wG_Atual] := wGrid
      oM_Brw[wGrid]:DrawLine()
      if oM_Brw[wGrid]:Skip( 1 ) == 1
         oM_Brw[wGrid]:lHitTop = .F.
         if oM_Brw[wGrid]:nRowPos < wLinha
            oM_Brw[wGrid]:nRowPos++
         else
            WBrwScroll( oM_Brw[wGrid]:hWnd, 1, If( oM_Brw[wGrid]:oFont <> nil, oM_Brw[wGrid]:oFont:hFont, 0 ) )
         endif
      else
         oM_Brw[wGrid]:lHitBottom := .T.
      endif
      oM_Brw[wGrid]:DrawSelect()
      if oM_Brw[wGrid]:oVScroll <> nil
         oM_Brw[wGrid]:VGoDown()
      endif
      if oM_Brw[wGrid]:bChange <> nil
         fCaseAtrib(wGrid)
         fCaseRefresh(wGrid)
      endif
      m->wM_Grid_Seq[wG_Atual] := wGridAtual 
   endif

return nil
*fim da Function fGRD_GoDown(wGrid)

Function fSeek_Matrix(nKey,nFlag)
*******************************************************************************
*                       funcao para pesquisa na dbedit                        *
*******************************************************************************
Local w__wKeySeek,waScan , wKeyPress , wx

   wKeyPress := cKeyPressConvert(nKey)
   If wKeyPress > 0 .or. nKey = 8 
      If nKey=8                                                 // se For backspace, elinima o ultimo caracter digitado
         __wKeySeek:=SubStr(__wKeySeek,1,Len(Trim(__wKeySeek))-1)
      Else
         __wKeySeek:=__wKeySeek+CHR(wKeyPress)                           // TransForma o valor ACSII em caracter e soma con o conteudo da variavel
      EndIf
      * -------------------------------------------------------- *
      w__wKeySeek := __wKeySeek
      waScan    := cScan( _wMM_Grid , w__wKeySeek , 1 , "=")
      oBrwSay:Refresh()
      If waScan = 0
         Return( NIL )
      EndIf

      _wBrwLin   := waScan               // Redefine a Matriz de posição da Linha do Grid com a localiza Posiciona a Cursor do Grid
      wXoBrw:nAt := waScan               // Posiciona a Cursor do Grid
      wXoBrw:Refresh()              // atualiza as inFormacoes no objeto
   EndIf

Return( NIL )
*fim da Function fSeek_Matrix(nKey,nFlag)

Function fSort_Matrix()
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wwSeta,wx

   If wGrid_Order = .T.                             // Se estiver Crescente
      aSort( _wMM_Grid ,,,{|x,y| Upper(x[1]) > Upper(y[1])})   // ordena a coluna em ordem DECRESCENTE
      wGrid_Order := .F.
      wwSeta := Chr(24)
      wwSeta := "^"
   Else
      aSort( _wMM_Grid ,,,{|x,y| Upper(x[1]) < Upper(y[1])})   // ordena a coluna em ordem CRESCENTE
      wGrid_Order := .T.
      wwSeta := Chr(25)
      wwSeta := "v"
   EndIf

   wXoBrw:aHeaders[1] := AllTrim(StrTran(wXoBrw:aHeaders[1],Chr(24),""))  // Retira a Seta para Cima da coluna anterior
   wXoBrw:aHeaders[1] := AllTrim(StrTran(wXoBrw:aHeaders[1],Chr(25),""))  // Retira a Seta para Baixo da coluna anterior
   wXoBrw:aHeaders[1] := AllTrim(StrTran(wXoBrw:aHeaders[1],"^",""))      // Retira a Seta para Cima da coluna anterior
   wXoBrw:aHeaders[1] := AllTrim(StrTran(wXoBrw:aHeaders[1],"v",""))      // Retira a Seta para Baixo da coluna anterior

   wXoBrw:aHeaders[1] := wwSeta + " " + wXoBrw:aHeaders[1]    // coloca a seta na coluna atual

   __wKeySeek := Space(00)
   oBrwSay:Refresh()

   wXoBrw:GoTop()
   wXoBrw:Refresh()

Return(nil)
*Fim da Function fSort_Matrix()

function fSaida_F2()
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************

   _wAbre_Pesquisa := .T.
   If GetKeyState(27)=.T.
      cV("mrc_pac_nom",1,__wKeySeek+space(252))
   EndIf

Return .T.
*Fim da Function fSort_Matrix()

function cCaseSequence(wSeq_Cod,wUpdate)
************************************************************************************************
*  wUpdate => .F. - Retorna o valor da Sequence                                                *
*  wUpdate => .T. - Incrementa o Valor da Sequence                                             *
************************************************************************************************
Local wSql_Cursor, wVl_Seq, wSql , wValor
   //wSql_Cursor := fConsulta2("ccase_seq",{"seq_vl_seq","seq_vl_fator"},"seq_cod="+Campo(wSeq_Cod))
   wSql_Cursor := fConnect_Tabela("ccase_seq","select seq_vl_seq,seq_vl_fator from ccase_seq where seq_nome="+Campo(wSeq_Cod))

   If Len(wSql_Cursor)>0
   	wVl_Seq := wSql_Cursor[1,1]
   	wUpdate := cNvl(wUpdate,.T.)
   	If wUpdate
   	   wValor := wVl_Seq + cNvl(wSql_Cursor[1,2],1)
   	   wSql   := "Update ccase_seq Set seq_vl_seq = " + Str(wValor) + " where seq_nome = " + Campo(wSeq_Cod)
   	   cSql_Execute("ccase_seq",wSql)
   	EndIf
   Else
      wVl_Seq := 0
   EndIf

return wVl_Seq
*fim da function cCaseSequence(wSeq_Cod,wOpc)

Function cCaseLog(wLog_Cod,wLog_Obj,wLog_Dsc,wLog_Ref,wLog_Force)
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local wLog_Seq,wLog_Sis,wLog_Session,wLog_Usr,wLog_Dt,wLog_Hr
// wLog_Seq     := cCaseSequence("cCase_Log")
   wLog_Force   := iif(ValType(wLog_Force)="L",wLog_Force,.f.)

   If cScanBin( wM_Tabelas , upper("ccase_prp") , 01 ) = 0  // cicero140709
      return nil
   endIf

   If wLog_Force .or. wc_Log  // se estiver ativo (ver ccase.ini)
	   wLog_Sis     := wc_Sistema
	   wLog_Session := wc_Session
	   wLog_Usr     := wc_User
	   wLog_Dt      := cDate()
	   wLog_Hr      := cTime()

      fInsert2("ccase_log",{"Log_Cod",wLog_Cod,"Log_Sis",wLog_Sis,"Log_Session",wLog_Session,"Log_Obj",wLog_Obj,"Log_Usr",wLog_Usr,"Log_Dt",wLog_Dt,"Log_Hr",wLog_Hr,"Log_Dsc",wLog_Dsc ,"Log_Ref",wLog_Ref} )   
   EndIf

return nil
*fim da Function cCaseLog(wLog_Obj,wLog_Dsc)

Function fCase_Final(wObjeto) 
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local c

	fUpdate2("acs_usuario","usr_cod="+Campo(wc_user),{"usr_connect",0})

   If ValType(__oMsnTray)="O"
      __kMensagem_SysTray_Log("W","0")
   
      If .Not.Empty(__oMsnTray:oTray)
         __oMsnTray:oTray:uFlags := 0
         c := __oMsnTray:oTray:cBuffer
         Shell_NotifyIcon(2,@c)
         __oMsnTray:oTray:cBuffer := c
      Endif
      
      If .Not.Empty(__oMsnTray:oIcon)
         __oMsnTray:oIcon:End()
      Endif
   EndIf

   If ValType(__oWFTray)="O"
      __kWorkFlow_SysTray_Log("W","0")
   
      If .Not.Empty(__oWFTray:oTray)
         __oWFTray:oTray:uFlags := 0
         c := __oWFTray:oTray:cBuffer
         Shell_NotifyIcon(2,@c)
         __oWFTray:oTray:cBuffer := c
      Endif
      
      If .Not.Empty(__oWFTray:oIcon)
         __oWFTray:oIcon:End()
      Endif
      __oWFTray:end()
      __oWFTray := nil
   EndIf

   If Valtype(__oMsgWin)="O"
     __oMsgWin:bValid := nil
     DestroyWindow( __oMsgWin:hWnd )
   EndIf

   If Valtype(__oWFWin)="O"
     __oWFWin:bValid := nil
     DestroyWindow( __oWFWin:hWnd )
	  SET RESOURCES TO
	  QUIT
   EndIf


return .T.
*fim da Function fCase_Final(wObjeto)

Function fCase_Verifica_Exec(wObjeto,wTitulo) 
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local wx,wy,wResp,wWhere,wOpen,wnWhd

   wOpen := .F.
   wnWhd := FindWindow(, wTitulo ) //AllTrim(wResp[wx,1]) )

   If wnWhd>0
      wOpen := .T.
   EndIf

return wOpen
*fim da Function fCase_Verifica_Exec(wObjeto)

Function cHora_Intervalo(wHr_Ini,wHr_Fin,wHr_Qtd)
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local wTotHoras,wHora,wMin,wTotMin,wQtd,wInt,wSob,wHr_Final

   wTotHoras := cwSomaHora(wHr_Fin,"-",wHr_Ini)

   wHora   := Val(substr(wTotHoras,2,3))
   wHora   := wHora * 60
   wMin    := Val(substr(wTotHoras,6,2))
   wTotMin := wHora + wMin
   wHr_Qtd := cNvl(wHr_Qtd,1)
   wHr_Qtd := iif(valtype(wHr_Qtd)<>"N",Val(wHr_Qtd),wHr_Qtd)

   wQtd := wTotMin /(wHr_Qtd-1)
   If wQtd>60
      wQtd := wQtd /60
      wInt := Int(wQtd)
      wSob := wQtd - wInt
      wSob := Round((wSob*60),2)
   ElseIf wQtd=60
      wInt := 01
      wSob := 00
   Else
      wInt := 00
      wSob := Round(wQtd,2)
   EndIf
   wHr_Final := StrZero(wInt,2,0) + ":" + StrZero(wSob,2,0)

return wHr_Final
* fim da Function cHora_Intervalo(wHr_Ini,wHr_Fin,wHr_Qtd)

Function fKey_Func(wopcao)
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local wKeySql

   If Len(wc_Prog)=0
      return .t.
   EndIf
   
   If wopcao=1
      If wc_Prog[1]="Cadastro de Admissão do Paciente"
         If cN_Fld(1,1,.t.)
            If .Not.cEmpty(wM_Case[1,wCS_F1Conteudo,cNC("mrc_data",1)])
               wKeySql := "mrc_data>="+Campo(wM_Case[1,wCS_F1Conteudo,cNC("mrc_data",1)],"D") 
               wKeySql := wKeySql + " And mrc_data<="+Campo(wM_Case[1,wCS_F2Conteudo,cNC("mrc_data",1)],"D")
            Else
               wKeySql := "mrc_data="+Campo(cDate(),"D") 
            EndIf
            c_Pesquisa(1,wKeySql,,.T.)
         ElseIf cN_Fld(1,2,.t.)
            If .Not.cEmpty(wM_Case[2,wCS_F1Conteudo,cNC("adm_dtentrada",2)])
               wKeySql := "adm_dtentrada>="+Campo(wM_Case[2,wCS_F1Conteudo,cNC("adm_dtentrada",2)],"D") 
               wKeySql := wKeySql + " And adm_dtentrada<="+Campo(wM_Case[2,wCS_F2Conteudo,cNC("adm_dtentrada",2)],"D")
            Else
               wKeySql := "adm_dtentrada="+Campo(cDate(),"D") 
            EndIf
            c_Pesquisa(2,wKeySql,,.T.)
         EndIf
      EndIf
      If wc_Prog[1]="Movimentação/Comanda Eletrônica"
         If cN_Fld(1,1,.t.)
            If .Not.cEmpty(wM_Case[1,wCS_F1Conteudo,cNC("adm_dtentrada",1)])
               wKeySql := "adm_dtentrada>="+Campo(wM_Case[1,wCS_F1Conteudo,cNC("adm_dtentrada",1)],"D") 
               wKeySql := wKeySql + " And adm_dtentrada<="+Campo(wM_Case[1,wCS_F2Conteudo,cNC("adm_dtentrada",1)],"D")
            Else
               wKeySql := "adm_dtentrada="+Campo(cDate(),"D") 
            EndIf
            c_Pesquisa(1,wKeySql,,.T.)
         EndIf
      EndIf
      If wc_Prog[1]="Agenda do Médico"
         If cN_Fld(1,1,.t.)
            fPRC_Execute("PRC_sam_agd_muda_agenda",{2})
         EndIf
      EndIf
      If wc_Prog[1]="Marcação de Consultas"
         If cN_Fld(1,1,.t.)
            fPRC_Execute("PRC_sam_agd_med_change",{1})
         EndIf
      EndIf
   EndIf

return .T.
*fim da Function fKey_Func(wopcao)

Function fCase_Form_Acesso()
************************************************************************************************
*                       Função para controlar o acesso dos Forms                               *
************************************************************************************************
Local wx,wy,wz,wAcesso,wRestricao

   For wx := 01 To Len(wM_Case)
      For wy := 01 To Len(wM_Case[wx,wCS_ObjGet])

         wAcesso    := wM_Case[wx,wCS_Acesso,wy]
         wRestricao := fACS_ChkRestricao("GET",wM_Case[wx,wCS_ObjNome,wy])
         wRestricao := iif(cEmpty(wRestricao),wAcesso,wRestricao)

         If     wRestricao = "1"     // Mostra desabilitado

            If Upper(wM_Case[wx,wCS_ObjGet,wy]:ClassName)="TRADMENU"
               For wz := 01 To Len(wM_Case[wx,wCS_ObjGet,wy]:aItems)
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:bValid   := nil
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:bWhen    := {||.F.}
               Next
            Else
               wM_Case[wx,wCS_ObjGet,wy]:bValid := nil
               wM_Case[wx,wCS_ObjGet,wy]:bWhen  := {||.F.}
            EndIf

         ElseIf wRestricao = "2"    // Não Mostra

            If Upper(wM_Case[wx,wCS_ObjGet,wy]:ClassName)="TRADMENU"
               For wz := 01 To Len(wM_Case[wx,wCS_ObjGet,wy]:aItems)
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:nRight   := 0
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:cCaption := ""
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:bValid   := nil
                  wM_Case[wx,wCS_ObjGet,wy]:aItems[wz]:bWhen    := {||.F.}
               Next
            Else
               wM_Case[wx,wCS_ObjGet,wy]:bValid := nil
               wM_Case[wx,wCS_ObjGet,wy]:bWhen  := {||.F.}
               wM_Case[wx,wCS_ObjGet,wy]:nRight := 0
            EndIf

            If ValType(wM_Case[wx,wCS_ObjCab,wy])="O"
               wM_Case[wx,wCS_ObjCab,wy]:cCaption := ""
               wM_Case[wx,wCS_ObjCab,wy]:nRight   := 0
               wM_Case[wx,wCS_ObjCab,wy]          := nil
            EndIf
         EndIf
      Next
   Next

   For wx := 1 to Len(wM_Folder)
      For wy := 1 to Len(wM_Folder[wx,wFld_Acesso])
         If wM_Folder[wx,wFld_Acesso,wy] = "2"
            oM_Fld[wx]:aPrompts[wy] := ""
         EndIf
      Next
   Next

   For wx := 1 to Len(oM_Button)
      If oM_BtnAcs[wx] <> "0"
         oM_Button[wx]:bAction := nil
         oM_Button[wx]:bWhen   := {||.F.}
         if oM_BtnAcs[wx] = "2"
            oM_Button[wx]:nRight := 0
         EndIf
      EndIf
   Next

return .T.
*fim da Function fCase_Form_Acesso()

************************************************************************************************
************************************************************************************************
************************************************************************************************
*                                        R E L A T O R I O                                     *
************************************************************************************************
************************************************************************************************
************************************************************************************************

Function cCall_Rel(_wObj_Nome,__wM_Parametros)
************************************************************************************************
*                               Função para chamada do Relatorio                               *
************************************************************************************************
	cCall_Rel_Aux(_wObj_Nome,__wM_Parametros)
return .T.
*fim da Function cCall_Rel(_wObj_Nome,__wM_Parametros)

Function cCall_Rel_Aux(_wObj_Nome,__wM_Parametros,__wRELoPrn)
************************************************************************************************
*                               Função para chamada do Relatorio                               *
************************************************************************************************
Local wx,wy,wPos,wxLen,wEstru_Nome,wEstru_Pai,wObj_Pai,wMM,wResp,wMFont,wWhere,wObjPai,wMPen,wFiltro
Local wObj_Nome,wObj_Tp,wObj_Seq,wFont_Title,wRelLin
Local wPre_Fnc,wPos_Fnc,wFont,wTamanho,wDefault,wPicture,wNegrito,wCor,wAcesso,wPapel,wNome,wModal,wImagem,wCentral
Local wQuebra,wQuebra_Lin,wQuebra_Rel,wTotaliza,wImprime,wOrienta,wQtd_Linhas,wLinha,wColuna,wGeradorAnt,wNaoRepete
Local wAltura,wLargura,wSelect,wPreview,wTitle,wTab_Nome,wCol_Nome,wCursor_Rel,wFormato,wType,wRowNumStart
Local wBorda_Alt,wBorda_Lar,wPen,wObj_Prp_Vlr,wAlinhamento,wObj_Prp_Memo,wPrp_Nome,wQuebra_Txt,wRowNumEnd
Local wTitlePag,wTitleBox,wAutoSize,wDominio,wTpRel,wRodape,wDom_Dsc,wFilTitle,wPesquisa
Private __wM_Imp_REL,__wM_Imp_PAG,__wM_Imp_CUR,__wM_Imp_CMP,__wM_Imp_SAY,__wM_Imp_BOX,__wM_Imp_RFM,__wM_Imp_IMG,__wM_Imp_PAR
Private __wM_RelFiltro,__wMRelOrderBy,__wPrn_Largura,__wObj_Rel,__wTpRel,__wMRelObj

   If cEmpty(_wObj_Nome)
      MsgStop("Erro na chamada do Relatório (nome do objeto não informado)","Atenção")
      Return .F.
   Else
      _wObj_Nome := Lower(AllTrim(_wObj_Nome))
      __wObj_Rel := _wObj_Nome
      __wMRelObj := {}
   EndIf
// wPos := cScan(_wM_Relatorio,_wObj_Nome,01)
// If wPos > 0
//    __wM_Imp_Obj := _wM_Relatorio[wPos,2]
//    __wM_Imp_PAG := _wM_Relatorio[wPos,3]
//    __wM_Imp_CUR := _wM_Relatorio[wPos,4]
//    __wM_Imp_CMP := _wM_Relatorio[wPos,5]
//    __wM_Imp_SAY := _wM_Relatorio[wPos,6]
//    __wM_Imp_BOX := _wM_Relatorio[wPos,7]
//    __wM_Imp_RFM := _wM_Relatorio[wPos,8]
// Else
      wWhere:= " ( cCase_Obj.Obj_Nome="+Campo(_wObj_Nome)+" Or cCase_Obj.Obj_Nome Like "+Campo(_wObj_Nome+".%") + ")"
      wResp := fConsulta2({"cCase_Obj_Prp","cCase_Obj"},{"cCase_Obj_Prp.Obj_Nome","Obj_Tp","Obj_Seq","Prp_Nome","Obj_Prp_Vlr","Obj_Prp_Memo"},wWhere,"cCase_Obj.Obj_Nome")
      If Len(wResp)=0
      	MsgStop("Nenhum relatório localizado")
      	return .F.
      EndIf

      __wM_Imp_REL := {}
      __wM_Imp_PAG := {}
      __wM_Imp_CUR := {}
      __wM_Imp_CMP := {}
      __wM_Imp_SAY := {}
      __wM_Imp_BOX := {}
      __wM_Imp_RFM := {}
      __wM_Imp_IMG := {}
      __wM_Imp_PAR := {}

      __wM_RelFiltro := {}
      __wMRelOrderBy := {}
      __wPrn_Largura := 00

      Store 00        To wTamanho,wQuebra_Lin,wQtd_Linhas,wLinha,wColuna,wAltura,wLargura,wFiltro
      Store 00        To wBorda_Alt,wBorda_Lar,wCor,wOrienta,wPapel,wRowNumStart,wRowNumEnd,wImagem
      Store "N"       To wNegrito,wTotaliza,wQuebra,wTitleBox,wAutoSize,wNaoRepete,wCentral,wDom_Dsc
      Store Space(00) To wPicture,wAcesso,wCol_Nome,wFormato,wDefault,wTab_Nome,wFilTitle,wPesquisa
      Store Space(00) To wCursor_Rel,wTitlePag,wRodape,wPen,wFont_Title,wDominio,wTpRel,wType,wNome
      Store Space(00) To wQuebra_Rel,wTitle,wPre_Fnc,wPos_Fnc,wFont,wAlinhamento,wQuebra_Txt,wImprime

      wxLen  := Len(wResp)
      For wx := 01 To wxLen
      	wResp[wx,1]  := Lower(AllTrim(wResp[wx,1]))
      	wObj_Tp      := wResp[wx,2]
      	wResp[wx,4]  := AllTrim(wResp[wx,4])
      	wPrp_Nome    := wResp[wx,4]
      	wResp[wx,5]  := AllTrim(wResp[wx,5])
      	wObj_Prp_Vlr := wResp[wx,5]
      	wObj_Prp_Memo:= AllTrim(wResp[wx,6])

      	If     wPrp_Nome == "TITLE"
      		wTitle      := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PRE_FNC"
      		wPre_Fnc    := wObj_Prp_Memo
      	ElseIf wPrp_Nome == "POS_FNC"
      		wPos_Fnc    := wObj_Prp_Memo
      	ElseIf wPrp_Nome == "FONT"
      		wFont       := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "FONT_TITLE"
      		wFont_Title := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PEN"
      		wPen        := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TAMANHO"
      		wTamanho    := wObj_Prp_Vlr
      		wTamanho    := iif(cEmpty(wTamanho),0,Val(wTamanho))
      	ElseIf wPrp_Nome == "CONTEUDO"
      		wDefault    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PICTURE"
      		wPicture    := wObj_Prp_Vlr
      		wPicture    := AllTrim(wPicture)
      	ElseIf wPrp_Nome == "NEGRITO"
      		wNegrito    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "COR"
      		wCor        := wObj_Prp_Vlr
      		wCor        := iif(cEmpty(wObj_Prp_Vlr),0,Val(wObj_Prp_Vlr))
      	ElseIf wPrp_Nome == "ALINHAMENTO"
      		wAlinhamento:= wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "COL_NOME"
      		wCol_Nome   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TAB_NOME"
      		wTab_Nome   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "SELECT"
      		wSelect     := wObj_Prp_Memo
      	ElseIf wPrp_Nome == "QUEBRA"
      		wQuebra     := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "QUEBRA_LIN"
      		wQuebra_Lin := wObj_Prp_Vlr
      		wQuebra_Lin := iif(cEmpty(wQuebra_Lin),0,Val(wQuebra_Lin))
      	ElseIf wPrp_Nome == "QUEBRA_REL"
      		wQuebra_Rel := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "QUEBRA_TXT"
      		wQuebra_Txt := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TOTALIZA"
      		wTotaliza   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "IMPRIME"
      		wImprime    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "ORIENTACAO"
      		wOrienta    := wObj_Prp_Vlr
      		wOrienta    := iIf(cEmpty(wOrienta),1,Val(SubStr(wOrienta,1,1)))  // Default Retrato
      	ElseIf wPrp_Nome == "PAPEL"
      		wPapel      := wObj_Prp_Vlr
      		wPapel      := iIf(cEmpty(wPapel),9,Val(SubStr(wPapel,1,2)))    // Default -  A4 210 x 297 mm
      	ElseIf wPrp_Nome == "FORMATO_IMP"
      		wFormato    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "QTD_LINHAS"
      		wQtd_Linhas := wObj_Prp_Vlr
      		wQtd_Linhas := iif(cEmpty(wQtd_Linhas),0,Val(wQtd_Linhas))
      	ElseIf wPrp_Nome == "LINHA"
      		wLinha      := wObj_Prp_Vlr
      		wLinha      := iif(cEmpty(wLinha),0,Val(wLinha))
      	ElseIf wPrp_Nome == "COLUNA"
      		wColuna     := wObj_Prp_Vlr
      		wColuna     := iif(cEmpty(wColuna),0,Val(wColuna))
      	ElseIf wPrp_Nome == "ALTURA"
      		wAltura     := wObj_Prp_Vlr
      		wAltura     := iif(cEmpty(wAltura),0,Val(wAltura))
      	ElseIf wPrp_Nome == "LARGURA"
      		wLargura    := wObj_Prp_Vlr
      		wLargura    := iif(cEmpty(wLargura),0,Val(wLargura))
      	ElseIf wPrp_Nome == "ACESSO"
      		wAcesso     := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PREVIEW"
      		wPreview    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "CURSOR_REL"
      		wCursor_Rel := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "NOME"
      		wNome       := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TYPE"
      		wType       := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "BORDA_ALTURA"
      		wBorda_Alt  := wObj_Prp_Vlr
      		wBorda_Alt  := iif(cEmpty(wBorda_Alt),0,Val(wBorda_Alt))
      	ElseIf wPrp_Nome == "BORDA_LARGURA"
      		wBorda_Lar  := wObj_Prp_Vlr
      		wBorda_Lar  := iif(cEmpty(wBorda_Lar),0,Val(wBorda_Lar))
      	ElseIf wPrp_Nome == "MODAL"
      		wModal      := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "GERADOR_ANTIGO"
      		wGeradorAnt := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "ROWNUM_START"
      		wRowNumStart:= wObj_Prp_Vlr
      		wRowNumStart:= iif(cEmpty(wRowNumStart),0,Val(wRowNumStart))
      	ElseIf wPrp_Nome == "ROWNUM_END"
      		wRowNumEnd  := wObj_Prp_Vlr
      		wRowNumEnd  := iif(cEmpty(wRowNumEnd),0,Val(wRowNumEnd))
      	ElseIf wPrp_Nome == "DOMINIO"
			   wDominio    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TIPO_FILTRO"
			   wFiltro     := iif(cEmpty(wObj_Prp_Vlr),0,Val(wObj_Prp_Vlr))
      	ElseIf wPrp_Nome == "CABECALHO"
			   wTitlePag   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "RODAPE"
			   wRodape     := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TITLE_BOX"
			   wTitleBox   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "AUTO_SIZE"
			   wAutoSize   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PATH"
			   wImagem     := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "REPETE"
			   wNaoRepete  := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TIPO_REL"
			   wTpRel      := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "CENTERED"
			   wCentral    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "TITLE_FILTER"
			   wFilTitle   := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "DOM_DSC"
			   wDom_Dsc    := wObj_Prp_Vlr
      	ElseIf wPrp_Nome == "PESQUISA"
			   wPesquisa   := wObj_Prp_Vlr
			EndIf

      	If wx < Len(wResp)
      	   wObj_Nome := wResp[wx+1,01]
      	   wObj_Nome := Lower(AllTrim(wObj_Nome))
      	Else
      	   wObj_Nome := Space(00)
      	EndIf
      	If .Not.(wObj_Nome==wResp[wx,01]) .or. cEmpty(wObj_Nome)
          	wObjPai := SubStr(wResp[wx,01],1,rAt(".",wResp[wx,01])-1)

      		If     wObj_Tp="REL"
             	wTitle      := iif(cEmpty(wTitle     ),"",wTitle     )
             	wPre_Fnc    := iif(cEmpty(wPre_Fnc   ),"",wPre_Fnc   )
             	wPos_Fnc    := iif(cEmpty(wPos_Fnc   ),"",wPos_Fnc   )
             	wOrienta    := iif(cEmpty(wOrienta   ),01,wOrienta   )
             	wPapel      := iif(cEmpty(wPapel     ),09,wPapel     )
             	wFormato    := iif(cEmpty(wFormato   ),"A",wFormato   )
             	wPreview    := iif(cEmpty(wPreview   ),.T.,iif(wPreview="S",.T.,.F.))
             	wCursor_Rel := iif(cEmpty(wCursor_Rel),"",wCursor_Rel)
             	__wTpRel    := iif(cEmpty(wTpRel     ),"1",wTpRel)
             	wModal      := iif(cEmpty(wModal     ),.F.,iif(wModal     ="S",.T.,.F.))
             	wGeradorAnt := iif(cEmpty(wGeradorAnt),.F.,iif(wGeradorAnt="S",.T.,.F.))
      		   aAdd(__wM_Imp_REL,{wTitle,wPre_Fnc,wPos_Fnc,wOrienta,wPapel,wFormato,wPreview,wCursor_Rel,wModal,wTpRel})
      		ElseIf wObj_Tp="CUR"
            	wNome   := cLower(iif(cEmpty(wNome),wResp[wx,01],wNome))
            	aAdd(__wM_Imp_CUR,{wResp[wx,01]; //01
            	                  ,wSelect     ; //02
            	                  ,wNome       ; //03
            	                  ,wTab_Nome  }) //05
      		ElseIf wObj_Tp="SAY"
            	aAdd(__wM_Imp_SAY,{wResp[wx,01] ;  //01 
            	                  ,wResp[wx,03] ;  //02 
            	                  ,wObjPai      ;  //03 
            	                  ,wLinha       ;  //04 
            	                  ,wColuna      ;  //05 
            	                  ,wAltura      ;  //06 
            	                  ,wLargura     ;  //07 
            	                  ,wTitle       ;  //08 
            	                  ,wFont        ;  //09 
            	                  ,wImprime     ;  //10 
            	                  ,wNaoRepete   ;  //11 
            	                  ,"S"          ;  //12 
            	                  ,wCentral     ;  //13 
            	                  ,wQuebra_Rel })  //14 
         	ElseIf wObj_Tp="BOX"
            	aAdd(__wM_Imp_BOX,{wResp[wx,01],wResp[wx,03],wObjPai,wLinha,wColuna,wAltura,wLargura,wCor,wBorda_Alt,wBorda_Lar,wPen})
         	ElseIf wObj_Tp="IMG"
            	aAdd(__wM_Imp_IMG,{wResp[wx,01],wResp[wx,03],wObjPai,wLinha,wColuna,wAltura,wLargura,wImagem})
         	ElseIf wObj_Tp="PAR"
            	aAdd(__wM_Imp_PAR,{wResp[wx,01],wResp[wx,03],wType,wDefault,})
            Else
      			If wObj_Tp="PAG"
            		aAdd(__wM_Imp_PAG,{wResp[wx,01];  //01
            		                  ,wObjPai     ;  //02
            		                  ,wResp[wx,03];  //03
            		                  ,wQtd_Linhas ;  //04
            		                  ,wAltura     ;  //05
            		                  ,wAcesso     ;  //06
            		                  ,wFont       ;  //07
            		                  ,wPre_Fnc    ;  //08
            		                  ,wPos_Fnc    ;  //09
            		                  ,wOrienta    ;  //10
            		                  ,wPapel      ;  //11
            		                  ,wFormato    ;  //12
            		                  ,wCursor_Rel ;  //13
            		                  ,wTitlePag   ;  //14
            		                  ,wRodape    })  //15
      			ElseIf wObj_Tp="RFM"
            		aAdd(__wM_Imp_RFM,{wResp[wx,01];  //01
            		                  ,wObjPai     ;  //02
            		                  ,wLinha      ;  //03
            		                  ,wColuna     ;  //04
            		                  ,wAltura     ;  //05
            		                  ,wAcesso     ;  //06
            		                  ,wFont       ;  //07  
            		                  ,wPre_Fnc    ;  //08  
            		                  ,wPos_Fnc    ;  //09  
            		                  ,wFormato    ;  //10  
            		                  ,wCursor_Rel ;  //11  
            		                  ,wFont_Title ;  //12  
            		                  ,wRowNumStart;  //13  
            		                  ,wRowNumEnd  ;  //14
            		                  ,wTitleBox   ;  //15
            		                  ,wAutoSize   ;  //16
            		                  ,wResp[wx,03];  //17
            		                  ,"S"        })  //18

      			ElseIf wObj_Tp="CMP"
            		aAdd(__wM_Imp_CMP,{wResp[wx,1] ;  //01
            		                  ,wObjPai     ;  //02
            		                  ,wResp[wx,3] ;  //03
            		                  ,""          ;  //04
            		                  ,wLinha      ;  //05
            		                  ,wColuna     ;  //06
            		                  ,wAltura     ;  //07
            		                  ,wLargura    ;  //08
            		                  ,wCol_Nome   ;  //09
            		                  ,wDefault    ;  //10
            		                  ,wTitle      ;  //11
            		                  ,wPicture    ;  //12
            		                  ,wImprime    ;  //13
            		                  ,wTotaliza   ;  //14
            		                  ,wQuebra     ;  //15
            		                  ,wCor        ;  //16
            		                  ,wFont       ;  //17
            		                  ,wPre_Fnc    ;  //18
            		                  ,wPos_Fnc    ;  //19
            		                  ,wQuebra_Txt ;  //20
            		                  ,wAlinhamento;  //21
            		                  ,wType       ;  //22
            		                  ,wFont_Title ;  //23
            		                  ,wDominio    ;  //24
            		                  ,wFiltro     ;  //25
            		                  ,            ;  //26 (conteudo corrente)
            		                  ,wFilTitle   ;  //27
            		                  ,wDom_Dsc    ;  //28
            		                  ,wPesquisa  })  //29
            	EndIf
            EndIf

		      Store 00        To wTamanho,wQuebra_Lin,wQtd_Linhas,wLinha,wColuna,wAltura,wLargura,wFiltro
		      Store 00        To wBorda_Alt,wBorda_Lar,wCor,wOrienta,wPapel,wRowNumStart,wRowNumEnd,wImagem
		      Store "N"       To wNegrito,wTotaliza,wQuebra,wTitleBox,wAutoSize,wNaoRepete,wCentral,wDom_Dsc
			   Store Space(00) To wPicture,wAcesso,wCol_Nome,wFormato,wDefault,wTab_Nome,wFilTitle,wPesquisa
			   Store Space(00) To wCursor_Rel,wTitlePag,wRodape,wPen,wFont_Title,wDominio,wTpRel,wType,wNome
			   Store Space(00) To wQuebra_Rel,wTitle,wPre_Fnc,wPos_Fnc,wFont,wAlinhamento,wQuebra_Txt,wImprime

 		    	aAdd( __wMRelObj , {wResp[wx,1],wObj_Tp})
      	EndIf
      Next

	   __wM_Parametros := iif(ValType(__wM_Parametros)="A",__wM_Parametros,{})
	   aSort(__wM_Imp_PAR,,,{|x,y| x[2] < y[2] })
      For wx := 01 To Len(__wM_Imp_PAR)
      	For wy := 01 To Len(__wM_Parametros)
      		If wx=wy
      			__wM_Imp_PAR[wx,5] := __wM_Parametros[wy]
      			Exit
     			EndIf
      	Next
      Next

	   wMFont := {}
	   wMPen  := {}
	   For wx := 01 To Len(wResp)
	   	If     wResp[wx,2]="FNT"
    			aAdd( wMFont , {wResp[wx,1],wResp[wx,4],wResp[wx,5]})
    		ElseIf wResp[wx,2]="PEN"
    			aAdd( wMPen , {wResp[wx,1],wResp[wx,4],wResp[wx,5]})
    		EndIf
    	Next

		fCase_Pen(wMPen)
      
	   wxLen  := Len(__wM_Imp_CMP)
	   For wx := 01 To wxLen
			wObj_Nome := __wM_Imp_CMP[wx,01]
			wObj_Pai  := __wM_Imp_CMP[wx,02]
			wObj_Seq  := __wM_Imp_CMP[wx,03]

			wEstru_Nome := StrZero(wObj_Seq,7,0)+"."+SubStr(wObj_Nome,rAt(".",wObj_Nome)+1)

			wPos := cScan( __wM_Imp_CMP , wObj_Pai , 1)
			If wPos>0
				wEstru_Nome := AllTrim(__wM_Imp_CMP[wPos,4])+"."+wEstru_Nome
				wEstru_Nome := Lower(StrTran(wEstru_Nome,"_",""))
			EndIf
			__wM_Imp_CMP[wx,4] := wEstru_Nome
	   Next
	   aSort(__wM_Imp_CMP,,,{|x,y| x[4] < y[4] })

      If __wTpRel="1"
	   	For wx := 01 To wxLen
      	   * -------------- Informações do Filtro -------------- *
				wFiltro := __wM_Imp_CMP[wx,25]
      	                                                              
				If wFiltro>0                                               
    				wObj_Pai  := __wM_Imp_CMP[wx,02]                        
      	      wLargura  := __wM_Imp_CMP[wx,08]                        
	   	      wCol_Nome := __wM_Imp_CMP[wx,09]                        
	   	      wDefault  := __wM_Imp_CMP[wx,10]                        
      	      wTitle    := __wM_Imp_CMP[wx,11]                        
      	      wPicture  := __wM_Imp_CMP[wx,12]                        
      	      wType     := SubStr(__wM_Imp_CMP[wx,22],1,1)
      	      wDominio  := __wM_Imp_CMP[wx,24]
      	      wFilTitle := __wM_Imp_CMP[wx,27]
      	      wPesquisa := __wM_Imp_CMP[wx,29]

				   If .Not.cEmpty(wFilTitle)
			   	   wTitle := &(wFilTitle)
				   Else
				   	If .Not.cEmpty(wTitle)
				   	   wTitle := &(wTitle)
				   	Else
				   	   wTitle := ""
				   	EndIf
				   EndIf

				   wPos := cScan( __wM_Imp_RFM , wObj_Pai , 1)
				   If wPos>0
				      wCursor_Rel := __wM_Imp_RFM[wPos,11]
				   Else
				      wCursor_Rel := ""
				   EndIf

      	      aAdd( __wM_RelFiltro , {wFiltro,,,,,wCursor_Rel,wLargura,wCol_Nome,wFiltro,wDefault,wTitle,wPicture,wType,wDominio,wPesquisa})
				EndIf
	   	Next
      EndIf

//    aAdd(_wM_Relatorio,{_wObj_Nome,__wM_Imp_Obj,__wM_Imp_PAG,__wM_Imp_CUR,__wM_Imp_CMP,__wM_Imp_SAY,__wM_Imp_BOX})
// EndIf

  	wRelLin := __fCase_Rel_Monta(_wObj_Nome,wMFont,__wRELoPrn)
   __wMRelObj := {}

return wRelLin
*fim da Function cCall_Rel_Aux(_wObj_Nome,__wM_Parametros,__wRELoPrn)

Function __fCase_Rel_Monta(_wObj_Nome,wMFont,__wRELoPrn)
************************************************************************************************
*                                 Função que monta o Relatorio                                 *
************************************************************************************************
Local wx,wxLen,wxFatorLinha,wxFatorColuna,wErro,wExecuta,wTitle,wRelLin
Local wPre_Fnc,wPos_Fnc,wPapel,wFormato,wPreview,wCursor_Rel,wModal
Private __oFontCmp,__oFontTit,__oFontPag,__oFontRfm,__oFontRfmTit,__oFontSay,__oPenDefault,__oFontDefaultCmp,__oFontDefaultTit
Private __oPrn,__wRelItem,__wTotaliza,__wTitle,__wFormato,__wTitleBox,__wAutoSize,__wOrienta,__nRowStep,__nColStep
Private wcDebug := .F. , wPosTrace := 1 , wQGGRid := 0 

   If Len(__wM_Imp_REL)=0
   	Return .F.
   EndIf

   wPre_Fnc := __wM_Imp_REL[1,02]

	If .Not.cEmpty(wPre_Fnc)
		If .Not.cCaseScript(_wObj_Nome+".pre_fnc",,wPre_Fnc)
			Return .F.
		EndIf
	EndIf

   wTitle := __wM_Imp_REL[1,01]
   If .Not.cEmpty(wTitle)
   	wTitle := &(wTitle)
   EndIf

   If Len(__wM_RelFiltro)>0
   	wExecuta := __fCase_Rel_Filtro(wTitle)
   Else
      wExecuta := .T.
   EndIf

   If wExecuta
  		__wTitleBox := .F.
  		__wAutoSize := .F.
  		__wTotaliza := .F.
  		
  		__nRowStep := 0
  		__nColStep := 0

		aSort(__wM_Imp_PAG,,,{|x,y| x[03] < y[03] })
		aSort(__wM_Imp_RFM,,,{|x,y| x[17] < y[17] })
		aSort(__wM_Imp_SAY,,,{|x,y| x[02] < y[02] })
		aSort(__wM_Imp_BOX,,,{|x,y| x[02] < y[02] })
		aSort(__wM_Imp_IMG,,,{|x,y| x[02] < y[02] })

   	If __wTpRel<>"1"
	   	__oPrn := __wRELoPrn
			fCase_Font(wMFont,"REL")
	   	wRelLin := __fCase_Rel_Pagina(1)
      Else
   		wPos_Fnc    := __wM_Imp_REL[1,03]
   		__wOrienta  := __wM_Imp_REL[1,04]
   		wPapel      := __wM_Imp_REL[1,05]
   		__wFormato  := __wM_Imp_REL[1,06]
   		wPreview    := __wM_Imp_REL[1,07]
   		wCursor_Rel := __wM_Imp_REL[1,08]
   		wModal      := __wM_Imp_REL[1,09]
   		__wTitle    := wTitle

			__oPrn := PrintBegin(__wTitle,.F.   , wPreview,       , wModal )
			        //PrintBegin( cDoc   , lUser, lPreview, xModel, lModal )

				if Empty(__oPrn:hDC )
				   MsgStop("Impressora não esta pronta!" )
				   return nil
				EndIf
   		
   			if     __wOrienta = 1     // RETRATO
   			   __oPrn:SetPortrait()
   			ElseIf __wOrienta = 2     // PAISAGEM
   			   __oPrn:SetLandscape()
   			EndIf
   		
			 	__oPenDefault := TPen():New(0,3,0,)
			 	__oFontSay    := TFont():New("Arial"  ,0 ,-12    ,         ,     ,           ,            ,       ,       ,          ,,,,,,__oPrn,)
											  //New(cFaceName,nWidth,nHeight,lFromUser,lBold,nEscapement,nOrientation,nWeight,lItalic,lUnderline,lStrikeOut, nCharSet, nOutPrecision, nClipPrecision,nQuality, oDevice, nPitchFamily )
				__oFontDefaultCmp := TFont():New("Arial"  ,0     ,(12*-1),         ,     ,           ,            ,       ,       ,          ,,,,,,__oPrn,)
				__oFontDefaultTit := TFont():New("Arial"  ,0     ,(12*-1),         ,.T.  ,           ,            ,       ,       ,          ,,,,,,__oPrn,)
			   __oPrn:SetFont(__oFontDefaultCmp)
      	
				fCase_Font(wMFont,"REL")
   		
   			__oPrn:SetPage(wPapel)
   		   wxFatorLinha  := __oPrn:nVertRes() / 55
   		   wxFatorColuna := __oPrn:nHorzRes() / 100
      	
				wErro := __fCase_Rel_Cursor(wCursor_Rel)
				If wErro=0
			   	wxLen := cSql_Cursor(wCursor_Rel,"Len")
				Else
			   	wxLen := 1
				EndIf
   		
   			For wx := 01 To wxLen
  			   	__fCase_Rel_Pagina(Len(__wM_Imp_PAG))
   		
					If wErro=0
				   	cSql_Cursor(wCursor_Rel,"Next")
				   EndIf
   			Next
   		
				If .Not.cEmpty(wPos_Fnc)
					cCaseScript(_wObj_Nome+".pos_fnc",,wPos_Fnc)
				EndIf
			PrintEnd()
		EndIf
	EndIf

  	If __wTpRel="1"
		fCase_Font_Del("REL")
		cSql_Cursor(0,0)
   	aSize(__wM_Imp_REL,0)
   	aSize(__wM_Imp_PAG,0)
   	aSize(__wM_Imp_CUR,0)
   	aSize(__wM_Imp_CMP,0)
   	aSize(__wM_Imp_SAY,0)
   	aSize(__wM_Imp_BOX,0)
   	aSize(__wM_Imp_RFM,0)
   	aSize(__wM_Imp_IMG,0)
   EndIf

return wRelLin
*fim da Function __fCase_Rel_Monta(_wObj_Nome)

Function __fCase_Rel_Pagina(wLenPag)
************************************************************************************************
*                                Função que montagem da Pagina                                 *
************************************************************************************************
Local wx,wCursorLen,wCursorWx,wErro,wTitlePag,wFormato,wCursor_Rel,wRodape
Local wObj_Nome,wQtd_Linhas,wAltura,wLargura,wAcesso,wFont,wPre_Fnc,wPos_Fnc,wOrienta,wPapel
Local __wMCamposImp,__wLenCamposImp,__wMQuebraImp,wWhere,wObjCab,wRelLin,wObjRod
Private __wMCabecalho,__wMParCab,__wMRodape,__wMParRod,__wTitlePag,__wRodape

	For wx := 01 To wLenPag
		wAcesso := __wM_Imp_PAG[wx,06]
      If wAcesso = "2"
      	Loop
      EndIf

		wObj_Nome   := __wM_Imp_PAG[wx,01]
		wQtd_Linhas := __wM_Imp_PAG[wx,04]
		wAltura     := __wM_Imp_PAG[wx,05]
		wFont       := __wM_Imp_PAG[wx,07]
		wPre_Fnc    := __wM_Imp_PAG[wx,08]
		wPos_Fnc    := __wM_Imp_PAG[wx,09]
		wOrienta    := __wM_Imp_PAG[wx,10]
		wPapel      := __wM_Imp_PAG[wx,11]
		wFormato    := __wM_Imp_PAG[wx,12]
		wCursor_Rel := __wM_Imp_PAG[wx,13]
		wTitlePag   := __wM_Imp_PAG[wx,14]
		wRodape     := __wM_Imp_PAG[wx,15]
		__wTitlePag := wTitlePag
		__wRodape   := wRodape

		If .Not.cEmpty(wTitlePag)
			wWhere        :=          " Obj_Nome Like "+Campo(__wTitlePag+".%")
			wWhere        := wWhere + " And Obj_Tp = "+Campo("PAR")
			__wMCabecalho := fConsulta2("cCase_Obj",{"Obj_Nome"},wWhere,"Obj_Seq")

			wObjCab       := __wObj_Rel+"."+wTitlePag
			wWhere        := " cCase_Obj.Obj_Nome Like "+Campo(wObjCab+".%")
			wWhere        := wWhere + " And cCase_Obj.Obj_Tp = "+Campo("PAR")
			wWhere        := wWhere + " And Prp_Nome = "+Campo("CONTEUDO")
			__wMParCab    := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","Obj_Prp_Vlr"},wWhere,"Obj_Seq")

			wWhere        :=          " Obj_Nome Like "+Campo(__wRodape+".%")
			wWhere        := wWhere + " And Obj_Tp = "+Campo("PAR")
			__wMRodape    := fConsulta2("cCase_Obj",{"Obj_Nome"},wWhere,"Obj_Seq")

			wObjRod       := __wObj_Rel+"."+__wRodape
			wWhere        := " cCase_Obj.Obj_Nome Like "+Campo(wObjRod+".%")
			wWhere        := wWhere + " And cCase_Obj.Obj_Tp = "+Campo("PAR")
			wWhere        := wWhere + " And Prp_Nome = "+Campo("CONTEUDO")
			__wMParRod    := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","Obj_Prp_Vlr"},wWhere,"Obj_Seq")
		EndIf

		wFont       := __fCase_Rel_Atrib_Font(wFont)
		__oFontPag  := wFont[1]

		If __wTpRel<>"1"
			wErro := 9
		Else
			wErro := __fCase_Rel_Cursor(wCursor_Rel)
		EndIf

		If wErro=0
	   	wCursorLen := cSql_Cursor(wCursor_Rel,"Len")
		Else
	   	wCursorLen := 1
		EndIf

		For wCursorWx := 01 To wCursorLen
			If __wTpRel="1"
				PageBegin()
			EndIf

		   wRelLin := __fCase_Rel_Cabecalho(0)

			If .Not.cEmpty(wPre_Fnc)
				cCaseScript(wObj_Nome+".pre_fnc",,wPre_Fnc)
			EndIf

			__fCase_Rel_Desenho(wObj_Nome,wCursorWx,wCursorLen,0,0)

	  		__wMCamposImp   := __fCase_Rel_Campo(wObj_Nome,wCursor_Rel,0,wAltura)
      	__wLenCamposImp := Len(__wMCamposImp)

			wRelLin := __fCase_Rel_Dados(__wMCamposImp,__wLenCamposImp,,wCursor_Rel,wRelLin,wCursorWx)

			wRelLin := __fCase_Rel_Frame(wObj_Nome,wQtd_Linhas,wRelLin)

			If .Not.cEmpty(wPos_Fnc)
				cCaseScript(wObj_Nome+".pos_fnc",,wPos_Fnc)
			EndIf
			
			__fCase_Rel_Rodape()

			If __wTpRel="1"
				PageEnd()
			EndIf

			If wErro=0
				cSql_Cursor(wCursor_Rel,"next")
			EndIf
		Next
	Next

return wRelLin
*fim da Function __fCase_Rel_Pagina(_wObj_Nome)

Function __fCase_Rel_Frame(wObj_Pai,wQtd_Linhas,wRelLin)
************************************************************************************************
*                                Função que montagem da Pagina                                 *
************************************************************************************************
Local wx,wLen,wErro,wx_cursor,wMatriz,wFont_Title,wPre_Fnc,wPos_Fnc,wFormato,wLenCur
Local wObj_Nome,wRowNumStart,wRowNumEnd,wLinha,wColuna,wAltura,wLargura,wAcesso,wFont,wCursor_Rel
Local wAutoSize,wTitleBox,__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wImprime,wqtdwx

	wObj_Pai    := Lower(AllTrim(wObj_Pai))
   wQtd_Linhas := cNvl(wQtd_Linhas,0)

	wLen := Len(__wM_Imp_RFM)
	For wx := 01 To wLen
		If __wM_Imp_RFM[wx,02] == wObj_Pai
         
         wAcesso := __wM_Imp_RFM[wx,06]
         If wAcesso = "2"
         	Loop
         EndIf

         wObj_Nome    := __wM_Imp_RFM[wx,01]
         wPre_Fnc     := __wM_Imp_RFM[wx,08]
			If .Not.cEmpty(wPre_Fnc)
				cCaseScript(wObj_Nome+".pre_fnc",,wPre_Fnc)
			EndIf

         wImprime := __wM_Imp_RFM[wx,18]
         If wImprime="N"
         	Loop
         EndIf

         wLinha       := __wM_Imp_RFM[wx,03]
         wColuna      := __wM_Imp_RFM[wx,04]
         wAltura      := __wM_Imp_RFM[wx,05]
         wFont        := __wM_Imp_RFM[wx,07]
         wPos_Fnc     := __wM_Imp_RFM[wx,09]
         wFormato     := __wM_Imp_RFM[wx,10]
         wCursor_Rel  := __wM_Imp_RFM[wx,11]
         wFont_Title  := __wM_Imp_RFM[wx,12]
         wRowNumStart := __wM_Imp_RFM[wx,13]
         wRowNumEnd   := __wM_Imp_RFM[wx,14]
         wTitleBox    := __wM_Imp_RFM[wx,15]
         wAutoSize    := __wM_Imp_RFM[wx,16]

         __wTitleBox  := iif(cEmpty(wTitleBox),.F.,iif(wTitleBox="S",.T.,.F.))
         __wAutoSize  := iif(cEmpty(wAutoSize),.F.,iif(wAutoSize="S",.T.,.F.))

         wAltura      := iif(cEmpty(wAltura),1,wAltura)
         If .Not.cEmpty(wLinha)
            wRelLin := wRelLin + wLinha
         EndIf

         wFont_Title   := __fCase_Rel_Atrib_Font(wFont_Title)
         __oFontRfmTit := wFont_Title[1]
         wFont         := __fCase_Rel_Atrib_Font(wFont)
         __oFontRfm    := wFont[1]

         wErro := __fCase_Rel_Cursor(wCursor_Rel)
	   	__wRelItem := 1

	   	__wMCamposImp   := __fCase_Rel_Campo(wObj_Nome,wCursor_Rel,wColuna,wAltura)
   	   __wLenCamposImp := Len(__wMCamposImp)
			__wMQuebraImp   := __fCase_Rel_Campo_QuebraTot(__wMCamposImp,__wLenCamposImp)

         If wQtd_Linhas>0 .And. cEmpty(__nRowStep)
		      __nRowStep := __oPrn:nVertRes() / 50    // linhas por pagina
		   EndIf
		   If __wPrn_Largura>0 .And. cEmpty(__nColStep)
		      __nColStep := __oPrn:nHorzRes() / __wPrn_Largura // colunas por pagina
		   EndIf

			If __wTitleBox
				wRelLin := __fCase_Rel_BoxTitle(__wMCamposImp,__wLenCamposImp,wRelLin)
			EndIf

	      If wErro=0
         	wLenCur := cSql_Cursor(wCursor_Rel,"Len")
	      Else
         	wLenCur := 1
	      EndIf

			wRowNumStart := iif(cEmpty(wRowNumStart),     01,wRowNumStart)
			wRowNumEnd   := iif(cEmpty(wRowNumEnd  ),wLenCur,wRowNumEnd  )

			If wLenCur<wRowNumEnd
			   wRowNumEnd := wLenCur
			EndIf

			wqtdwx := 0
			For wx_cursor := wRowNumStart To wRowNumEnd
				wqtdwx := wqtdwx+1

		 	   __fCase_Rel_Desenho(wObj_Nome,wqtdwx,wLenCur,wRelLin,wAltura)
		      If wErro=0
					wRelLin := __fCase_Rel_Dados(__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wCursor_Rel,wRelLin,wx_cursor)
					wRelLin := wRelLin + wAltura
				EndIf

            wRelLin := __fCase_Rel_PagQtdLin(wObj_Nome,wObj_Pai,wqtdwx,wQtd_Linhas,wRelLin,wLinha,wAltura,wLenCur,__wMCamposImp,__wLenCamposImp)
				wRelLin := __fCase_Rel_Frame(wObj_Nome,wQtd_Linhas,wRelLin)

		      If wErro=0
					cSql_Cursor(wCursor_Rel,"next")
					wRelLin := __fCase_Verif_Quebra(wObj_Nome,wObj_Pai,wCursor_Rel,wRelLin,wLenCur,wLinha,wAltura,__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wx_cursor=wLenCur,wQtd_Linhas,wqtdwx)
				EndIf

				__wRelItem := __wRelItem+1
			Next
			If __wTotaliza .And. wErro=0 .And. wLenCur>0
				wRelLin := __fCase_Rel_Total(__wMCamposImp,__wLenCamposImp,wRelLin)
         EndIf

			If .Not.cEmpty(wPos_Fnc)
				cCaseScript(wObj_Nome+".pos_fnc",,wPos_Fnc)
			EndIf
		EndIf
	Next

return wRelLin
*fim da Function __fCase_Rel_Frame(_wObj_Nome)

Function __fCase_Rel_Cursor(wCursor_Rel)
************************************************************************************************
*                                Função para montar o Cursor                                   *
************************************************************************************************
Local wErro,wPos_Cursor,w1Select,w2Select,w3Select,wTab_Nome,wPosOrder,wPosGroup,wInicio,wFinSqlCur,wxy,wx_vazio
Local wy,wx_str,wStrwx,wComando,wLenStr,wIniTab,wFinTab,wIniSqlCur,wBy,wOrderBy,wVerComand,wSqlComando,wIniSqlX,wx_len
Local wFiltro,wCol_Nome,wType,wValor1,wValor2,wWhere,wWhereFiltro,wOrder,wGroup,wResto,wLimit,wPosLimit,wx_filtro

	wErro := 0
	If .Not.cEmpty(wCursor_Rel)
	   wCursor_Rel := cLower(wCursor_Rel)
		wPos_Cursor := cScan(__wM_Imp_CUR,wCursor_Rel,3)

		If wPos_Cursor>0
	   	w1Select  := __wM_Imp_CUR[wPos_Cursor,02]
	      wTab_Nome := __wM_Imp_CUR[wPos_Cursor,04]

			w2Select := cLower(w1Select)
			wLenStr  := Len(w2Select)
	      If cEmpty(wTab_Nome)
	   		wIniTab := 0
	   		wFinTab := 0
				For wx_str := 01 To wLenStr
					If SubStr(w2Select,wx_str,5)="from "
						wx_str := wx_str+5
						wIniTab := wx_str
					EndIf
					If wIniTab>0
					   wStrwx := SubStr(w2Select,wx_str,1)
						If wStrwx="," .Or. wStrwx=" " .Or. wStrwx=chr(13)  .Or. wStrwx=wLenStr
							Exit
						Else
						   wFinTab := wFinTab+1
						EndIf
					EndIf
				Next
				wTab_Nome := SubStr(w2Select,wIniTab,wFinTab)
			EndIf

			wSqlComando := {}
			wIniSqlX    := 1

			For wx_str := 01 To wLenStr
				wVerComand := .F.
				If SubStr(w2Select,wx_str,12)=="csql_cursor("
					wFinSqlCur := 12
					wVerComand := .T.
				EndIf
				If SubStr(w2Select,wx_str,5)=="ccur("
					wFinSqlCur := 5
               wVerComand := .T.
				EndIf
				If SubStr(w2Select,wx_str,5)=="cpar("
					wFinSqlCur := 5
               wVerComand := .T.
				EndIf
				If SubStr(w2Select,wx_str,11)=="ccurfiltro("
					wFinSqlCur := 11
               wVerComand := .T.
				EndIf

            If wVerComand
					wIniSqlCur := wx_str+1
					wxy        := 0
					For wy := wIniSqlCur to wLenStr
					   wxy := wxy + 1
						If SubStr(w2Select,wy,1)=")"
						   aAdd( wSqlComando , {,})
						   wComando := SubStr(w2Select,wIniSqlCur,wxy)
						   wComando := &(wComando)
						   wComando := Campo(wComando,ValType(wComando))
						   wSqlComando[Len(wSqlComando),1] := SubStr(w1Select,wIniSqlX,wIniSqlCur-wIniSqlX)
						   wSqlComando[Len(wSqlComando),2] := wComando
						   wIniSqlX := wIniSqlCur+wxy+1
						   Exit
						EndIf
					Next
				EndIf
			Next

			w3Select := Space(0)
			For wy := 01 To Len(wSqlComando)
			   w3Select := w3Select+    wSqlComando[wy,1]
			   w3Select := w3Select+" "+wSqlComando[wy,2]
			Next
			If .Not.cEmpty(w3Select)
				w3Select := w3Select + SubStr(w1Select,wIniSqlCur+wxy+1,wLenStr)
				w1Select := w3Select
			EndIf
			w2Select := cLower(w1Select)
			wLenStr  := Len(w2Select)

			If cEmpty(wTab_Nome)
		     	MsgInfo("Nome da Tabela não localizada","Erro...")
	      	wErro := 3   // Nome da Tabela não localizada
			EndIf

         wx_len       := Len(__wM_RelFiltro)
         wx_vazio     := 0
         wWhere       := Space(0)
         wWhereFiltro := Space(0)

   		For wx_filtro := 01 To wx_len
				If wCursor_Rel == __wM_RelFiltro[wx_filtro,6]
   	   		wValor1   := __wM_RelFiltro[wx_filtro,02]
   	   		If cEmpty(wValor1)
   	   		   wx_vazio := wx_vazio + 1
   	   		   Loop
   	   		EndIf

				   wFiltro   := __wM_RelFiltro[wx_filtro,01]
   	   		wCol_Nome := __wM_RelFiltro[wx_filtro,08]
   	   		wType     := __wM_RelFiltro[wx_filtro,13]

   	   		If At(".",wCol_Nome)=0
   	   		   wCol_Nome := wTab_Nome+"."+wCol_Nome
   	   		EndIf
   	   		If ValType(wValor1)="C"
   	   		   wValor1 := AllTrim(wValor1)
   	   		EndIf

   	   		If ValType(wValor2)="C"
   	   		   wValor2 := AllTrim(wValor2)
   	   		EndIf

				   If     wFiltro = 21  // Iniciado com (xx%)
               	wWhere := wCol_Nome+" Like " + Campo(wValor1+"%")
				   ElseIf wFiltro = 22  // Que contenha (%xx%)
               	wWhere := wCol_Nome+" Like " + Campo("%"+wValor1+"%")
				   ElseIf wFiltro = 23  // Terminado em (%xx)
               	wWhere := wCol_Nome+" Like " + Campo("%"+wValor1)
				   ElseIf wFiltro >= 30 .And. wFiltro <= 39
      	   		wValor2:= __wM_RelFiltro[wx_filtro,04]
               	wWhere := "("+wCol_Nome+">="+Campo(wValor1,wType)+" And "+wCol_Nome+"<="+Campo(wValor2,wType)+")"
				   ElseIf wFiltro = 50
				      wValor1 := AllTrim(wValor1)
				      If At("-",wValor1)>0
				         wValor1 := SubStr(wValor1,1,At("-",wValor1)-1)
				      EndIf
               	wWhere := wCol_Nome + "=" + Campo(wValor1)
				   Else
               	wWhere := wCol_Nome + "=" + Campo(wValor1,wType)
				   EndIf

				   wWhereFiltro := wWhereFiltro + " And " + wWhere
				EndIf
   		Next
         
         If wx_len>0
   			If wx_vazio = wx_len
   				MsgStop("Nenhum item de pesquisa selecionado")
   				return 7  // Nenhum item no filtro
   			EndIf
   		EndIf

         wPosOrder := 0
         wPosGroup := 0
         wPosLimit := 0
         wLimit    := .F.
         wOrder    := .F.
         wGroup    := .F.
         wBy       := .F.

			For wx_str := 01 To wLenStr
				If     SubStr(w2Select,wx_str,6)="order "
				   wOrder := .T.
				   wPosOrder := wx_str
				ElseIf SubStr(w2Select,wx_str,6)="group "
				   wGroup := .T.
				   wPosGroup := wx_str
				ElseIf SubStr(w2Select,wx_str,3)="by "
				   wBy := .T.
				ElseIf SubStr(w2Select,wx_str,6)="limit "
				   wLimit := .T.
				   wPosLimit := wx_str
				EndIf
			Next

			If ((wOrder .Or. wGroup) .And. wBy) .Or. wLimit
			   If     wPosOrder > 0 .And. wPosGroup > 0
			      wPosOrder := iIf(wPosGroup>wPosOrder,wPosOrder,wPosGroup)   // (Order By aparece 1º que o Group By)
				ElseIf wPosGroup > 0
			      wPosOrder := wPosGroup
				ElseIf wPosGroup > 0
			      wPosOrder := wPosLimit
			   EndIf
            wResto   := SubStr(w1Select,wPosOrder)
            wOrderBy := Lower(wResto)

            If wOrder
               wCol_Nome := Space(0)
				   wInicio   := At("order ",wOrderBy)
				   wOrderBy  := SubStr(wOrderBy,wInicio+5)
				   wInicio   := At("by ",wOrderBy)+2
				   wOrderBy  := AllTrim(wOrderBy)
				   wLenStr   := Len(wOrderBy)+1
			   	For wx_str := wInicio To wLenStr
			   	   wStrwx := SubStr(wOrderBy,wx_str,1)
			   	   If wStrwx="," .Or. wStrwx=" " .Or. wx_str = wLenStr
			   	      If .Not.cEmpty(wCol_Nome)
			   	         wCol_Nome := AllTrim(wCol_Nome)
			   	      	aAdd( __wMRelOrderBy , {wCursor_Rel,wCol_Nome} )
			   	      EndIf
			   	      wCol_Nome := Space(0)
			   	   Else
			   	      wCol_Nome := wCol_Nome + wStrwx
			   	   EndIf

			   	   If SubStr(wOrderBy,wx_str,5)="group" .And. wPosGroup>0
			   	      Exit
			   	   EndIf
			   	Next
            EndIf
         EndIf

         If .Not.cEmpty(wWhereFiltro)
         	If At("where",w2Select)=0
         	   wWhereFiltro := "Where "+SubStr(wWhereFiltro,5)
         	EndIf
				If .Not.cEmpty(wResto)
					w1Select := StrTran(w1Select,wResto,"")
					w1Select := w1Select+" "+wWhereFiltro+" "+wResto
				Else
				   w1Select := w1Select+" "+wWhereFiltro
				EndIf
         Endif

			cSql_Cursor(wCursor_Rel,fConnect_Tabela(wTab_Nome,w1Select))
      Else
      	MsgInfo("Cursor não localizado","Erro...")
      	wErro := 2      // Cursor não localizado
      EndIf
   Else
   //	MsgInfo("Não existe cursor para pesquisa","Erro...")
     	wErro := 1         // Não existe cursor para pesquisa
   EndIf

return wErro
*fim da Function __fCase_Rel_Cursor(wCursor_Rel)

Function __fCase_Rel_Campo(wObj_Pai,wCursor_Rel,_wRFM_Coluna,_wRFM_Altura)
************************************************************************************************
*                                Função que montagem dos Campos                                *
************************************************************************************************
Local wLen,wx,wLinha,wColuna,wAltura,wLargura,wCol_Nome,wDefault,wTitle,wPicture,wType,wTypeP,wPrn_Tam_Carac,wDom_Dsc
Local wImprime,wTotaliza,wQuebra,wQuebra_Rel,wCor,wFont,wPre_Fnc,wPos_Fnc,wQuebra_Txt,wGetCursor,wDominio,__wMCamposImp
Local wx_say,wAlinhamento,wnPad,wPos,wTam,wDec,wAlinTXT,wFont_Title,wObj_Nome,wGetTitle,wFiltro,wy,wOrderQuebra,wCor_Title

   __wMCamposImp := {}
	wLen    := Len(__wM_Imp_CMP)
	For wx := 01 To wLen
		If wObj_Pai == __wM_Imp_CMP[wx,2]
			wObj_Nome    := __wM_Imp_CMP[wx,01]
			wLinha       := __wM_Imp_CMP[wx,05]
			wColuna      := __wM_Imp_CMP[wx,06]
			wAltura      := __wM_Imp_CMP[wx,07]
			wLargura     := __wM_Imp_CMP[wx,08]
			wCol_Nome    := __wM_Imp_CMP[wx,09]
			wDefault     := __wM_Imp_CMP[wx,10]
			wTitle       := __wM_Imp_CMP[wx,11]
			wPicture     := __wM_Imp_CMP[wx,12]
			wImprime     := __wM_Imp_CMP[wx,13]
			wTotaliza    := __wM_Imp_CMP[wx,14]
			wQuebra      := __wM_Imp_CMP[wx,15]
			wCor         := __wM_Imp_CMP[wx,16]
			wFont        := __wM_Imp_CMP[wx,17]
			wPre_Fnc     := __wM_Imp_CMP[wx,18]
			wPos_Fnc     := __wM_Imp_CMP[wx,19]
			wQuebra_Txt  := __wM_Imp_CMP[wx,20]
			wAlinhamento := __wM_Imp_CMP[wx,21]
			wType        := __wM_Imp_CMP[wx,22]
			wFont_Title  := __wM_Imp_CMP[wx,23]
			wDominio     := __wM_Imp_CMP[wx,24]
			wFiltro      := __wM_Imp_CMP[wx,25]
			wDom_Dsc     := __wM_Imp_CMP[wx,28]
                                                        
			If cEmpty(wColuna)
				wColuna := _wRFM_Coluna
			EndIf

			If cEmpty(wAltura)
				If cEmpty(_wRFM_Altura)
					wAltura := 1
				Else
					wAltura := _wRFM_Altura
				EndIf
			EndIf

			wDom_Dsc := iif(cEmpty(wImprime),.F.,iif(wDom_Dsc="S",.T.,.F.))
			wImprime := iif(cEmpty(wImprime),.T.,iif(wImprime="S",.T.,.F.))
			If wImprime
				__wPrn_Largura := __wPrn_Largura + wLargura
			EndIf

			wFont := __fCase_Rel_Atrib_Font(wFont)
			If cEmpty(wCor)
			   wCor := wFont[2]
			EndIf
			wFont := wFont[1]

			wFont_Title := __fCase_Rel_Atrib_Font(wFont_Title)
	      wCor_Title  := wFont_Title[2]
			wFont_Title := wFont_Title[1]

			wOrderQuebra := 0
			If .Not.cEmpty(wCol_Nome) .And. .Not.cEmpty(wCursor_Rel)
	         wGetCursor := .T.

			   For wy := 01 To Len(__wMRelOrderBy)
			   	If wCursor_Rel==__wMRelOrderBy[wy,1] .And. wCol_Nome==__wMRelOrderBy[wy,2]
			   		wOrderQuebra := wy
			   		Exit
			   	EndIf
			   Next
			Else
	         wGetCursor := .F.
			EndIf
			If wOrderQuebra=0
			   If wQuebra="P"   
				   wOrderQuebra := -1  // Quebra por Pagina totaliza por ultimo sempre
				EndIf
			EndIf

         wnPad := 0
         wTam  := 0
		   wDec  := 0
		   If wQuebra_Txt="S"
	         wQuebra_Txt := .T.
		   Else
	         wQuebra_Txt := .F.
            wTypeP := SubStr(wType,1,1)
            If wTypeP="N"
               If wType=="NE" // Extenso
  			         wnPad := 0
               Else
	   				If .Not.cEmpty(wPicture)
	   				  	wPos := At(".",wPicture)
	   				  	wTam := Len(wPicture)
   					  	wDec := wTam-iif(wPos>0,wPos,wTam)
   					Endif
	  					wnPad := 1
	  				EndIf
            ElseIf wTypeP="D"
   				wnPad := 2
            EndIf

   			If     wAlinhamento="E"
	   			wnPad := 0                                      //#define PAD_LEFT   0
   			ElseIf wAlinhamento="D" 
	   			wnPad := 1                                      //#define PAD_RIGHT  1
   			ElseIf wAlinhamento="C" .Or. wAlinhamento="J"
	   			wnPad := 2                                      //#define PAD_CENTER 2
   			EndIf
			EndIf

			If .Not.cEmpty(wTitle)
			   wTitle    := &(wTitle)
	      	wGetTitle := .T.
			Else
	      	wGetTitle := .F.
			EndIf

			wAlinTXT  := iif(wAlinhamento="J",.T.,.F.)
			wTotaliza := iif(cEmpty(wTotaliza),"N",wTotaliza)
			wQuebra   := iif(cEmpty(wQuebra  ),"N",wQuebra  )

			If wTotaliza<>"N"
				__wTotaliza := .T.
			EndIf

         If .Not.cEmpty(wDominio) .And. wFiltro<>40
				wDominio := &(wDominio)
         EndIf

			aAdd( __wMCamposImp,{wObj_Nome   ,;      // 01
										wLinha      ,;      // 02
										wColuna     ,;      // 03
										wAltura     ,;      // 04
										wLargura    ,;      // 05
										wCol_Nome   ,;      // 06
										wDefault    ,;      // 07
										wFont       ,;      // 08
										wCor        ,;      // 09
										wTitle      ,;      // 10
										wFont_Title ,;      // 11
										wPicture    ,;      // 12
										wImprime    ,;      // 13
										wTotaliza   ,;      // 14
										wQuebra     ,;      // 15
										wQuebra_Txt ,;      // 16
										wPre_Fnc    ,;      // 17
										wPos_Fnc    ,;      // 18
										wAlinTXT    ,;      // 19
										wnPad       ,;      // 20
										wTypeP      ,;      // 21
										wType       ,;      // 22
										wGetCursor  ,;      // 23
										wGetTitle   ,;      // 24
										wTam        ,;      // 25
										wDec        ,;      // 26
										wDominio    ,;      // 27
										""          ,;      // 28   // Conteudo Anterior
										00          ,;      // 29   // Totalizador do Relatório
										wOrderQuebra,;      // 30 Ordem dos totais na Quebra
										wCor_Title  ,;      // 31 Cor do Titulo
										wDom_Dsc    })      // 32 
	   EndIf
	Next

	__wPrn_Largura := __wPrn_Largura + 2 // soma margem direita e esquerda

	If __wAutoSize
  		If     __wOrienta = 1     // RETRATO
  		   wPrn_Tam_Carac := int(round((180/(31.2*(__wPrn_Largura/180))),0))
  		   if (wPrn_Tam_Carac/2)-int((wPrn_Tam_Carac/2)) = 0
  		      wPrn_Tam_Carac := wPrn_Tam_Carac -1
  		   EndIf
  		ElseIf __wOrienta = 2     // PAISAGEM
  		   wPrn_Tam_Carac := int(round((230/(31.2*(__wPrn_Largura/230))),0))
  		   if (wPrn_Tam_Carac/2)-int((wPrn_Tam_Carac/2)) = 0
  		      wPrn_Tam_Carac := wPrn_Tam_Carac -1
  		   EndIf
  		EndIf
  		
		If wPrn_Tam_Carac > 12
		   wPrn_Tam_Carac := 12
		EndIf
		If wPrn_Tam_Carac < 05
		   wPrn_Tam_Carac := 05
		EndIf
   	
		__oFontCmp := TFont():New("Arial"  ,0     ,(wPrn_Tam_Carac*-1),         ,     ,           ,            ,       ,       ,          ,,,,,,__oPrn,)
		__oFontTit := TFont():New("Arial"  ,0     ,(wPrn_Tam_Carac*-1),         ,.T.  ,           ,            ,       ,       ,          ,,,,,,__oPrn,)
	                       //New(cFaceName,nWidth,nHeight            ,lFromUser,lBold,nEscapement,nOrientation,nWeight,lItalic,lUnderline,lStrikeOut, nCharSet, nOutPrecision, nClipPrecision,nQuality, oDevice, nPitchFamily )
   	__oPrn:SetFont(__oFontCmp)
   EndIf

return __wMCamposImp
*fim da Function __fCase_Rel_Campo(wx_Ini,wLen,_wObj_Nome_RFM)

Function __fCase_Rel_Campo_QuebraTot(__wMCamposImp,__wLenCamposImp)
************************************************************************************************
*                        Função que montagem dos totalizadores por Campo                       *
************************************************************************************************
Local wx,wy,wQuebra,wTotaliza,__wMQuebraImp

	__wMQuebraImp := {}
	For wx := 01 To __wLenCamposImp
		wQuebra := __wMCamposImp[wx,15]
		If wQuebra<>"N"
			For wy := 01 To __wLenCamposImp
				wTotaliza := __wMCamposImp[wy,14]
				If wTotaliza<>"N"
					aAdd(__wMQuebraImp, {wx,wy,0})  // 1º Posição Quebra , 2º posição Totalizador
				EndIf
			Next
		EndIf
	Next

return __wMQuebraImp
*fim da Function __fCase_Rel_Campo_QuebraTot()

Function __fCase_Rel_Get_QuebraTotal(__wMQuebraImp,wPos_Quebra,wPos_Totalizador)
************************************************************************************************
*                        Função que montagem dos totalizadores por Campo                       *
************************************************************************************************
Local wx,wValor

	wValor := 0
	For wx := 01 To Len(__wMQuebraImp)
		If __wMQuebraImp[wx,1] = wPos_Quebra .And. __wMQuebraImp[wx,2] = wPos_Totalizador
		   wValor := __wMQuebraImp[wx,3]
		   Exit
		EndIf
	Next

return wValor
*fim da Function __fCase_Rel_GuardaTotal()

Function __fCase_Rel_Set_QuebraTotal(__wMQuebraImp,wOpcao,wValor,wPos_Totalizador,wPos_Quebra)
************************************************************************************************
*                        Função que montagem dos totalizadores por Campo                       *
* wOpcao -> 1 - Soma o valor do campo totalizador                                              *
*        -> 2 - Zera o contador por quebra                                                     *
************************************************************************************************
Local wx

	For wx := 01 To Len(__wMQuebraImp)
	   If wOpcao = 2
	   	If  __wMQuebraImp[wx,1] <> wPos_Quebra
	   	    Loop
	   	EndIf
	   EndIf
		If __wMQuebraImp[wx,2] = wPos_Totalizador
		   If wOpcao = 2
	   		__wMQuebraImp[wx,3] := wValor
	   	Else
	   		__wMQuebraImp[wx,3] := __wMQuebraImp[wx,3] + wValor
	   	EndIf
		EndIf
	Next

return .T.
*fim da Function __fCase_Rel_GuardaTotal()

Function __fCase_Rel_Dados(__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wCursor_Rel,wRelLin,wx_cursor)
************************************************************************************************
*                                Função que montagem dos Dados                                 *
************************************************************************************************
Local wLen,wx,wLinha,wColuna,wAltura,wLargura,wCol_Nome,wDefault,wTitle,wPicture,wGetTitle,wFont_Title
Local wImprime,wTotaliza,wQuebra,wCor,wFont,wPre_Fnc,wPos_Fnc,wQuebra_Txt,wType,wCol,wDom_Dsc
Local wx_say,wMaiorLin,wLinSay,wQtdLin,wTam,wDec,wAlinTXT,wnPad,wTypeP,wGetCursor,wObj_Nome,wDominio
Local wTitLinha,wTitColuna,wCor_Title,wRelLinMax,wConteudo,wPos

   wCol       := 1
   wRelLinMax := 0
   wMaiorLin  := 0
	For wx := 01 To __wLenCamposImp
		wObj_Nome   := __wMCamposImp[wx,01]
		wLinha      := __wMCamposImp[wx,02]
		wColuna     := __wMCamposImp[wx,03]
		wAltura     := __wMCamposImp[wx,04]
		wLargura    := __wMCamposImp[wx,05]
		wCol_Nome   := __wMCamposImp[wx,06]
		wDefault    := __wMCamposImp[wx,07]
		wFont       := __wMCamposImp[wx,08]
		wCor        := __wMCamposImp[wx,09]
		wTitle      := __wMCamposImp[wx,10]
		wFont_Title := __wMCamposImp[wx,11]
		wPicture    := __wMCamposImp[wx,12]
		wImprime    := __wMCamposImp[wx,13]
		wTotaliza   := __wMCamposImp[wx,14]
		wQuebra     := __wMCamposImp[wx,15]
		wQuebra_Txt := __wMCamposImp[wx,16]
		wPre_Fnc    := __wMCamposImp[wx,17]
		wPos_Fnc    := __wMCamposImp[wx,18]
		wAlinTXT    := __wMCamposImp[wx,19]
		wnPad       := __wMCamposImp[wx,20]
		wTypeP      := __wMCamposImp[wx,21]
		wType       := __wMCamposImp[wx,22]
		wGetCursor  := __wMCamposImp[wx,23]
		wGetTitle   := __wMCamposImp[wx,24]
		wTam        := __wMCamposImp[wx,25]
		wDec        := __wMCamposImp[wx,26]
		wDominio    := __wMCamposImp[wx,27]
		wCor_Title  := __wMCamposImp[wx,31]
      wDom_Dsc    := __wMCamposImp[wx,32]

   	If wGetCursor
	      wConteudo := cSql_Cursor(wCursor_Rel,wCol_Nome)
		Else
			wConteudo := Get_Prp_Rel(wObj_Nome,"CONTEUDO")
		EndIf

	   If cEmpty(wConteudo)
		   If .Not.cEmpty(wDefault)
			   wConteudo := &(wDefault)
		   Else
	      	If wTypeP="C"
	   			wConteudo := ""
      		ElseIf wTypeP="N"
   				wConteudo := 0
      		ElseIf wTypeP="D"
   				wConteudo := cTod("  /  /    ")
		   	EndIf
		   EndIf
		EndIf
      __wMCamposImp[wx,28] := wConteudo

		If __wAutoSize .And. ValType(wConteudo)="C"
		   wConteudo := SubStr(wConteudo,1,wLargura)
		EndIf

      Set_Prp_Rel(wObj_Nome,"CONTEUDO",wConteudo)
		If .Not.cEmpty(wPre_Fnc)
			cCaseScript(wObj_Nome+".pre_fnc",,wPre_Fnc)
			wConteudo := Get_Prp_Rel(wObj_Nome,"CONTEUDO")
		   wCor      := Get_Prp_Rel(wObj_Nome,"COR"     )
		   wImprime  := Get_Prp_Rel(wObj_Nome,"IMPRIME" )
		   wImprime  := iif(wImprime="S",.T.,.F.)
		EndIf

      If wTotaliza<>"N"
         If wTypeP="N"
		      __fCase_Rel_Set_QuebraTotal(__wMQuebraImp,1,wConteudo,wx)
         	__wMCamposImp[wx,29] := __wMCamposImp[wx,29] + wConteudo
         EndIf
      EndIf

	   If wImprime
			If wLinha>wRelLinMax
			   wRelLinMax := wLinha
			EndIf

			wLinSay := wRelLin + wLinha

			If wType=="NC" // Contabil
				If wConteudo<0
					wCor := 255
				EndIf
			EndIf

			wConteudo := __fCase_Rel_Dados_Conteudo(wConteudo,wTypeP,wType,wLargura,wAlinTXT,wDominio,wTam,wDec,wGetCursor,wQuebra_Txt,wPicture,wDom_Dsc)

	   	If __wRelItem = 1
				If wGetTitle .And. .Not.__wAutoSize
				   wLinSay    := wLinSay+1

				   wTitLinha  := wLinha
				   wTitColuna := wColuna

				   __oPrn:Cmtr2Pix(@wTitLinha, @wTitColuna)

  	   			__oPrn:Say(wTitLinha, wTitColuna, wTitle ,wFont_Title,       ,          ,        , wnPad)
	   	           //Say(nRow     , nCol      , cText  ,oFont      , nWidth, nClrText , nBkMode, nPad ); 
				EndIf
			EndIf

			wQtdLin := 0
	   	For wx_say := 01 To Len(wConteudo)
	   		If cEmpty(wConteudo[wx_say]) // AllTrim(wConteudo[wx_say])=CHR(13)+CHR(10)
					Loop
	   		EndIf

				If wx_say>1
					wLinSay := wLinSay + 1
					wQtdLin := wQtdLin + 1
				EndIf
				
				If __wAutoSize
               wLinha := cRelLin(wLinSay)
               If     wnPad = 0
	               wColuna := cRelCol(wCol+0.25)
               ElseIf wnPad = 1
	               wColuna := cRelCol(wCol+wLargura-0.50)
					ElseIf wnPad = 2
	               wColuna := cRelCol(wCol+wLargura-5)
               EndIf
				Else
			   	wLinha := wLinSay*(0.50) //*wAltura)
				   __oPrn:Cmtr2Pix(@wLinha, @wColuna)
				EndIf

 	   		//If wType=="NT" // Total de Páginas
 	   		//	//aAdd( __wMRel_TotalPag , {}
 	   		//Else
 	   		
 	   		__oPrn:Say( wLinha, wColuna, wConteudo[wx_say],wFont,      , wCor     ,        , wnPad)
	      	    // Say( nRow  , nCol   , cText            ,oFont,nWidth, nClrText , nBkMode, nPad );
	      	
	      	//EndIf
			Next
  		   If wQtdLin > wMaiorLin
  		   	wMaiorLin := wQtdLin
  		   EndIf

         wCol := wCol + wLargura
	   EndIf  

		If .Not.cEmpty(wPos_Fnc)
			cCaseScript(wObj_Nome+".pos_fnc",,wPos_Fnc)
		EndIf
	Next

   wRelLin := wRelLin+wMaiorLin+wRelLinMax

return wRelLin
*fim da Function __fCase_Rel_Dados(wCursor_Rel,wRelLin)

Function __fCase_Rel_Dados_Conteudo(wConteudo,wTypeP,wType,wLargura,wAlinTXT,wDominio,wTam,wDec,wGetCursor,wQuebra_Txt,wPicture,wDom_Dsc)
************************************************************************************************
*                                Função que montagem dos Dados                                 *
************************************************************************************************
Local wItem1,wItem2,wxx,wPos,wMdate,wData,wTime

	If ValType(wDominio)="A"
		For wxx := 01 To Len(wDominio)
			wPos := At("-",wDominio[wxx])
			If wPos>0
			   wItem1 := SubStr(wDominio[wxx],1,wPos-1)
			   wItem1 := AllTrim(wItem1)
			   If ValType(wConteudo)="N"
               wItem2 := Str(wConteudo)
			   EndIf
            wItem2 := AllTrim(wConteudo)
			   If wItem1==wItem2
               wConteudo := AllTrim(wDominio[wxx])
               If wDom_Dsc
               	wConteudo := SubStr(wConteudo,wPos+1)
               EndIf
			   	Exit
			   EndIf
			EndIf
		Next
		wConteudo := {wConteudo}
	ElseIf wQuebra_Txt
      wConteudo := cQuebraTXT2(wConteudo,wLargura,wAlinTXT,"M")
	Else
      If     wTypeP="C"
   		If ValType(wConteudo)="C"
   			wConteudo := AllTrim(wConteudo)
   		ElseIf ValType(wConteudo)="N"
   			wConteudo := "#Campo Tipo Caracter#"
   		EndIf
      ElseIf wTypeP="N"
   		If     ValType(wConteudo)="N"
  				If     wType=="NP"  // Numero da pagina corrente
  					wConteudo :=  StrZero(__oPrn:nPage,3,0)
         	ElseIf wType=="NE" // Extenso
             	wConteudo := cExtenso(wConteudo)
      			wConteudo := cQuebraTXT2(wConteudo,wLargura,.T.,"M")
				Else
   			   If .Not.cEmpty(wPicture)
						If wType=="NC" // Contabil
				   		wConteudo := cStrPonto(wConteudo,wTam,wDec)
				   	Else
				   	   wConteudo := Str(wConteudo,wTam,wDec)
				   	EndIf
   			   Else
   		   		wConteudo := Str(wConteudo)
   			   EndIf
   			EndIf
   		ElseIf ValType(wConteudo)="C" .Or. ValType(wConteudo)="D"
   			wConteudo := "#Campo Tipo Numérico#"
   		EndIf
      ElseIf wTypeP="D"
   		If wGetCursor .And. .Not.cEmpty(wConteudo)
				wConteudo := cTod(SubStr(wConteudo,9,2)+"/"+SubStr(wConteudo,6,2)+"/"+SubStr(wConteudo,1,4))
   		EndIf

   		If ValType(wConteudo)="D"
   			If     wType=="D3"
					wConteudo := cDataExtenso(wConteudo)
				ElseIf wType=="D4"
      	      wConteudo := cDSemana(wConteudo)
				ElseIf wType=="D5"
      	      wConteudo := cMes(wConteudo) 
				ElseIf wType=="D6"
      	      wConteudo := Str(Year(wConteudo),4)
				ElseIf wType=="D7" .Or. wType=="D8" // Data (Hora) do Sistema
      	      wMdate := fConnect_Tabela( "ccase_obj" , "Select current_date a,SubString(current_time,1,5) b from dual" )
      	      If Len(wMdate)>0
						wData := wMdate[1,1]
						wData := SubStr(wData,9,2)+"/"+SubStr(wData,6,2)+"/"+SubStr(wData,1,4)
      	         wTime := wMdate[1,2]
      	      Else
      	         wData := dToc(cDate())
      	         wTime := SubStr(cTIME(),1,5)
      	      EndIf
      	      wConteudo := wData
      	      If wType=="D8"
      	      	wConteudo := wConteudo + " " + wTime
      	      EndIf
				Else
   				wConteudo := dToc(wConteudo)
   				If     wType=="D1"
						wConteudo := SubStr(wConteudo,1,5)
   				ElseIf wType=="D2"
						wConteudo := SubStr(wConteudo,4)
   				EndIf
   			EndIf
   		ElseIf ValType(wConteudo)="C" .Or. ValType(wConteudo)="N"
   			wConteudo := "#Campo Tipo Data#"
   		EndIf
		EndIf

   	If .Not.(wType=="NE") // Número Extenso
			wConteudo := {wConteudo}
		EndIf
	EndIf

return wConteudo
*fim da Function __fCase_Rel_Dados_Conteudo()

function __fCase_Rel_Cabecalho(wRelLin)
*******************************************************************************
*                   funcao interna para impressao do cabecalho                *
*******************************************************************************
Local wMMPar,wConteudo,wxz1,wxz2,wLin

	If .Not.cEmpty(__wTitlePag)
		wMMPar := {}
		For wxz1 := 01 To Len(__wMCabecalho)
			wConteudo := nil
			For wxz2 := 01 To Len(__wMParCab)
		   	If Lower(__wObj_Rel+"."+__wMCabecalho[wxz1,1]) == Lower(__wMParCab[wxz2,1])
		   		wConteudo := __wMParCab[wxz2,2]
		   		If .Not.cEmpty(wConteudo)
		   			wConteudo := &(wConteudo)
		   		EndIf
		   		Exit
		   	EndIf
			Next
			aAdd( wMMPar , wConteudo )
		Next
		wLin := cCall_Rel_Aux(__wTitlePag,wMMPar,__oPrn)
		wRelLin := wRelLin+wLin
   EndIf

return wRelLin
* fim da function __fCase_Rel_Cabecalho()

function __fCase_Rel_Rodape()
*******************************************************************************
*                   funcao interna para impressao do rodapé                   *
*******************************************************************************
Local wMMPar,wConteudo,wxz1,wxz2,wLin

	If .Not.cEmpty(__wRodape)
		wMMPar := {}
		For wxz1 := 01 To Len(__wMRodape)
			wConteudo := nil
			For wxz2 := 01 To Len(__wMParRod)
		   	If Lower(__wObj_Rel+"."+__wMRodape[wxz1,1]) == Lower(__wMParRod[wxz2,1])
		   		wConteudo := __wMParRod[wxz2,2]
		   		If .Not.cEmpty(wConteudo)
		   			wConteudo := &(wConteudo)
		   		EndIf
		   		Exit
		   	EndIf
			Next
			aAdd( wMMPar , wConteudo )
		Next
		cCall_Rel_Aux(__wRodape,wMMPar,__oPrn)
   EndIf

return .T.
* fim da function __fCase_Rel_Rodape()

function __fCase_Rel_BoxTitle(__wMCamposImp,__wLenCamposImp,wLin)
*******************************************************************************
*                   funcao interna para impressao do cabecalho                *
*******************************************************************************
Local wx,wLargura,wTitle,wImprime,wCol,wPixTexto,wIniCol,wFimCol

   wlin := wlin + 4

   wCol := 1
   For wx := 1 To __wLenCamposImp
		wLargura := __wMCamposImp[wx,05]
		wTitle   := __wMCamposImp[wx,10]
		wImprime := __wMCamposImp[wx,13]                                          	
      If .Not.wImprime // se nao sai no relatorio
         Loop
      EndIf

      wIniCol := cRelCol(wCol)
      wFimCol := cRelCol(wCol+wLargura)

      __oPrn:Box( cRelLin(wlin-0.25) , wIniCol , cRelLin(wlin+1), wFimCol ,__oPenDefault)

	   wPixTexto := __oPrn:GetTextWidth( wTitle , __oFontTit )
      __oPrn:Say( cRelLin(wLin), wIniCol+(((wFimCol-wIniCol)-wPixTexto)/2) ,wTitle,__oFontTit,,CLR_BLACK)
      wCol := wCol + wLargura
   Next
   wlin := wlin+1.25

return wlin
* fim da function __fCase_Rel_BoxTitle()

function __fCase_Verif_Quebra(wObj_Nome,wObj_Pai,wCursor_Rel,wLin,wLenCur,_wRFM_Linha,_wRFM_Altura,__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wEof,wQtd_Linhas,wqtdwx)
*******************************************************************************
*            funcao interna para verificar se havera quebra e imprimi-la      *
*******************************************************************************
Local wLen,wx,wQuebra,wCol_Nome,wConteudo,wImprime,wGetCursor,wConteudoAnt,wTypeP
Local wMM,wDiferente,wQuebraQtd,wQuebraPag,wLenOrder,wy,wOrderQuebra,wObj_Quebra

	wQuebraQtd := 0
	wMM := {}
	For wx := 01 To __wLenCamposImp
		wQuebra := __wMCamposImp[wx,15]
		If wQuebra<>"N"       // N-Nao Quebra / L-Quebra por Linha / P-Quebra por pagina
			wObj_Quebra := __wMCamposImp[wx,01]
			wCol_Nome   := __wMCamposImp[wx,06]
			wConteudo   := __wMCamposImp[wx,07]
			wImprime    := __wMCamposImp[wx,13]
			wTypeP      := __wMCamposImp[wx,21]
			wGetCursor  := __wMCamposImp[wx,23]
			wConteudoAnt:= __wMCamposImp[wx,28]
			wOrderQuebra:= __wMCamposImp[wx,30]
      	
			If wEof
				wDiferente := .T.
			Else
				If wGetCursor
	   		   wConteudo := cSql_Cursor(wCursor_Rel,wCol_Nome)
				Else
				   wConteudo := cRelDefVar(wTypeP,wConteudo)
				EndIf

				wDiferente := .Not.(wConteudoAnt==wConteudo)
			EndIf

			If wDiferente
				wQuebraQtd := wQuebraQtd + 1
   	   Endif
			aAdd( wMM , { wx , wDiferente , wQuebra , wOrderQuebra , wObj_Quebra })
		EndIf
   Next
   aSort(wMM ,,,{|x,y| x[4] > y[4] })

   wLen := Len(wMM)
   wQuebraPag := .F.

  	For wx := 01 To wLen
  	   If wMM[wx,3] = "P"    // se for quebra por PAGINA
         wQuebraPag := .T.
		Endif
  	   If wQuebraQtd>0 .And. __wTotaliza .And. wMM[wx,2]
  	   	wlin := __fCase_Rel_PagQtdLin(wObj_Nome,wObj_Pai,wqtdwx,wQtd_Linhas,wlin,_wRFM_Linha,_wRFM_Altura,wLenCur,__wMCamposImp,__wLenCamposImp)
  	   	wlin := __fCase_Rel_TotQuebra(__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wlin,wMM[wx,1],wMM[wx,5])
  	   	wlin := wlin + 0.50 
  	   	wlin := __fCase_Rel_PagQtdLin(wObj_Nome,wObj_Pai,wqtdwx,wQtd_Linhas,wlin,_wRFM_Linha,_wRFM_Altura,wLenCur,__wMCamposImp,__wLenCamposImp)
  	  	EndIf
   Next
   If wQuebraQtd>0
	   wlin := wlin + 0.50
		If wQuebraPag .And. .Not.wEof
  	   	wlin := __fCase_Rel_PagQtdLin(wObj_Nome,wObj_Pai,wqtdwx,wQtd_Linhas,wlin,_wRFM_Linha,_wRFM_Altura,wLenCur,__wMCamposImp,__wLenCamposImp)
		EndIf
	EndIf

return wLin
*fim da function __fCase_Verif_Quebra()

function __fCase_Rel_TotQuebra(__wMCamposImp,__wLenCamposImp,__wMQuebraImp,wLin,wx_quebra,wObj_Quebra)
*******************************************************************************
*            funcao interna para impressao de totalizacao de campos           *
*******************************************************************************
Local wImprime,wLargura,wTotaliza,wnPad,wTypeP,wTam,wDec,wConteudoAnt,wT_Quebra,wDom_Dsc
Local wCol,wx_totaliza,wQuebra_Txt,wAlinTXT,wType,wGetCursor,wPicture,wDominio,wFont,wColuna

	If __wFormato = "A"
	   //wlin := wlin + 0.25
	   __oPrn:line( cRelLin(wLin) , cRelCol(01), cRelLin(wLin) , cRelCol(__wPrn_Largura-1),__oPenDefault)
	   wlin := wlin + 0.25
	EndIf

	__fCase_Rel_SayQuebra(wObj_Quebra,wlin)

   wCol := 1
   For wx_totaliza := 1 To __wLenCamposImp
		wImprime  := __wMCamposImp[wx_totaliza,13]                                          	
      If .Not.wImprime // se nao sai no relatorio
         Loop
      EndIf

		wColuna      := __wMCamposImp[wx_totaliza,03]
		wLargura     := __wMCamposImp[wx_totaliza,05]
		wFont        := __wMCamposImp[wx_totaliza,08]
		wPicture     := __wMCamposImp[wx_totaliza,12]
		wTotaliza    := __wMCamposImp[wx_totaliza,14]
		wQuebra_Txt  := __wMCamposImp[wx_totaliza,16]
		wAlinTXT     := __wMCamposImp[wx_totaliza,19]
		wnPad        := __wMCamposImp[wx_totaliza,20]
   	wTypeP       := __wMCamposImp[wx_totaliza,21]
		wType        := __wMCamposImp[wx_totaliza,22]
		wGetCursor   := __wMCamposImp[wx_totaliza,23]
		wTam         := __wMCamposImp[wx_totaliza,25]
		wDec         := __wMCamposImp[wx_totaliza,26]
		wDominio     := __wMCamposImp[wx_totaliza,27]
		wConteudoAnt := __wMCamposImp[wx_totaliza,28]
      wDom_Dsc     := __wMCamposImp[wx_totaliza,32]

   	wT_Quebra    := __fCase_Rel_Get_QuebraTotal(__wMQuebraImp,wx_quebra,wx_totaliza)

		If __wAutoSize
			If     wnPad = 0
			   wColuna := cRelCol(wCol+0.25)
			ElseIf wnPad = 1
			   wColuna := cRelCol(wCol+wLargura-0.50)
			ElseIf wnPad = 2
			   wColuna := cRelCol(wCol+wLargura-5)
			EndIf
		Else
			__oPrn:Cmtr2Pix(0,@wColuna)
		EndIf

///	If wx_totaliza = wx_quebra .And. wTotaliza = "N"
///		wConteudoAnt := __fCase_Rel_Dados_Conteudo(wConteudoAnt,wTypeP,wType,wLargura,wAlinTXT,wDominio,wTam,wDec,wGetCursor,wQuebra_Txt,wPicture,wDom_Dsc)
///      __oPrn:Say( cRelLin(wLin), wColuna , wConteudoAnt[1] ,wFont,,CLR_BLACK,,wnPad)
///	Else
      	If wTypeP = "N"
      	   wTam := wTam + 5
      	   If wTotaliza = "S"
      	      __oPrn:Say( cRelLin(wLin), wColuna ,cStrPonto(wT_Quebra,wTam,wDec),wFont,,CLR_BLACK,,wnPad)
      	// Elseif wTotaliza = "C"   // Calcula
      	//    wwnomecampo = strtran(lower(wnomecampo),"wconteudo","wt_quebra")
      	//    wwconteudo = &wwnomecampo
      	//    __oPrn:Say( cRelLin(wLin), wColuna ,cstrponto(wwconteudo,wTam,wDec),wFont,,CLR_BLACK,,wnPad)
      	   Elseif wTotaliza = "R"   // Repete a ultima linha
      	      __oPrn:Say( cRelLin(wLin), wColuna ,cStrPonto(wConteudoAnt,wTam,wDec),wFont,,CLR_BLACK,,wnPad)
      	   Endif
      	ElsEif wTypeP = "C" .and. __wFormato = "S"
      	   __oPrn:Say( cRelLin(wLin), wColuna , wConteudoAnt ,wFont,,CLR_BLACK,,wnPad)
      	ElsEif wTypeP = "D" .and. __wFormato = "S"
      	   __oPrn:Say( cRelLin(wLin), wColuna , dToc(wConteudoAnt),wFont,,CLR_BLACK,,wnPad)
      	EndIf
   // EndIf
      
      __fCase_Rel_Set_QuebraTotal(__wMQuebraImp,2,0,wx_totaliza,wx_quebra)

      wCol := wCol + wLargura
   Next
   wLin := wlin+0.25

	If __wFormato = "A"
	   __oPrn:line( cRelLin(wLin+0.50) , cRelCol(01), cRelLin(wLin+0.50) , cRelCol(__wPrn_Largura-1),__oPenDefault)
	   wLin := wlin+0.25
	EndIf

return wLin
* fim da function __fCase_Rel_TotQuebra

function __fCase_Rel_Total(__wMCamposImp,__wLenCamposImp,wLin)
*******************************************************************************
*            funcao interna para impressao de totalizacao de campos           *
*******************************************************************************
Local wImprime,wLargura,wTotaliza,wnPad,wTam,wDec,wT_Geral,wCol,wx,wColuna,wFont
   
   wLin++
   __oPrn:line( cRelLin(wLin) , cRelCol(01), cRelLin(wLin) , cRelCol(__wPrn_Largura-1),__oPenDefault)
   wLin := wLin + 0.25

   wCol := 1
   For wx := 1 To __wLenCamposImp
		wImprime  := __wMCamposImp[wx,13]
      If .Not.wImprime // se nao sai no relatorio
         Loop
      EndIf

		wLargura     := __wMCamposImp[wx,05]
		wFont        := __wMCamposImp[wx,08]
		wTotaliza    := __wMCamposImp[wx,14]
		wnPad        := __wMCamposImp[wx,20]
		wTam         := __wMCamposImp[wx,25]
		wDec         := __wMCamposImp[wx,26]
     	wT_Geral     := __wMCamposImp[wx,29]
      
      __fCase_Rel_SayQuebra("TOTAL GERAL",wlin)
      
	   wColuna := cRelCol(wCol+wLargura-0.50)
      If wTotaliza = "S"
     	   wTam := wTam + 8
         __oPrn:Say( cRelLin(wLin), wColuna ,cStrPonto(wT_Geral,wTam,wDec),wFont,,CLR_BLACK,,wnPad)
   // Elseif wTotaliza = "C"   // Calcula
   //    wwnomecampo = strtran(lower(wnomecampo),"wconteudo","wtg_quebra")
   //    wwconteudo = &wwnomecampo
   //    __oPrn:Say( cRelLin(wLin), wColuna ,cstrponto(wwconteudo,wTam,wDec),wFont,,CLR_BLACK,,wnPad)
      Endif

      __wMCamposImp[wx,29] := 0

      wCol := wCol + wLargura
   Next
   wLin := wlin+0.75
   __oPrn:line( cRelLin(wLin) , cRelCol(01), cRelLin(wLin) , cRelCol(__wPrn_Largura-1),__oPenDefault)
   wLin := wlin+0.25

return wLin
* fim da function __fCase_Rel_Total

Function __fCase_Rel_Desenho(wObj_Pai,wItemCursor,wLenCur,wRelLin,_wRFM_Altura)
************************************************************************************************
*                                Função que Desenho do relatorio                               *
************************************************************************************************
Local wx,wLinha,wColuna,wAltura,wLargura,wCor,wTitle,wFont,wBorda_Lar,wBorda_Alt,wPen,oPen
Local wImprime,wNaoRepete,wImagem,wPixTexto,wPixFolha,wCentral

   _wRFM_Altura := iif(cEmpty(_wRFM_Altura),1,_wRFM_Altura)
	wObj_Pai     := Lower(AllTrim(wObj_Pai))

	For wx := 01 To Len(__wM_Imp_IMG)
		If wObj_Pai == __wM_Imp_IMG[wx,03]
			wLinha   := __wM_Imp_IMG[wx,04]
			wColuna  := __wM_Imp_IMG[wx,05]
			wAltura  := __wM_Imp_IMG[wx,06]
			wLargura := __wM_Imp_IMG[wx,07]
			wImagem  := __wM_Imp_IMG[wx,08]

		   If .Not.cEmpty(wImagem)
		      wImagem := &(wImagem)
         	CmSayImage( __oPrn, wImagem , wLinha, wColuna, wAltura, wLargura )
			EndIf
		EndIf
	Next

	For wx := 01 To Len(__wM_Imp_BOX)
		If wObj_Pai == __wM_Imp_BOX[wx,03]
			wLinha     := __wM_Imp_BOX[wx,04]
			wColuna    := __wM_Imp_BOX[wx,05]
			wAltura    := __wM_Imp_BOX[wx,06]
			wLargura   := __wM_Imp_BOX[wx,07]
			wCor       := __wM_Imp_BOX[wx,08]
			wBorda_Alt := __wM_Imp_BOX[wx,09]
			wBorda_Lar := __wM_Imp_BOX[wx,10]
			wPen       := __wM_Imp_BOX[wx,11]

   		If cEmpty(wPen)
				oPen := __oPenDefault
			Else
				If wPen="null"
				 	oPen := TPen():New(5,0,0,)
				Else
				   wPen := __wObj_Rel+"."+wPen
					oPen := cPen(wPen)
				EndIf
			EndIf

         wLinha  := wRelLin + wLinha
     		wLinha  := (wLinha*0.50) //*_wRFM_Altura

			If cEmpty(wAltura) .Or. cEmpty(wLargura)
  				If cEmpty(wAltura)
  				   wAltura  := wLinha
	            wLargura := wLargura + wColuna
  				Else
  				   wLargura := wColuna
  				EndIf
				CmLine( __oPrn, wLinha, wColuna, wAltura, wLargura, oPen )
			Else
				wCor     := iif(cEmpty(wCor),nil,wCor)
            wAltura  := wAltura  + wLinha
            wLargura := wLargura + wColuna
				CmBox( __oPrn, wLinha, wColuna, wAltura, wLargura, wBorda_Lar, wBorda_Alt, oPen, wCor )
			EndIf
		EndIf
	Next

	For wx := 01 To Len(__wM_Imp_SAY)
		If wObj_Pai == __wM_Imp_SAY[wx,03]
			If     __wM_Imp_SAY[wx,10]="N" .And. wLenCur=0  //imprime com cursor vazio
			   Loop
         ElseIf __wM_Imp_SAY[wx,11]="S" .And. wItemCursor>1  // nao repete
			   Loop
			ElseIf __wM_Imp_SAY[wx,12]="N"
			   Loop
			ElseIf .Not.cEmpty(__wM_Imp_SAY[wx,14])
			   Loop
			EndIf

         wLinha   := __wM_Imp_SAY[wx,04]
			wColuna  := __wM_Imp_SAY[wx,05]
			wAltura  := __wM_Imp_SAY[wx,06]
			wLargura := __wM_Imp_SAY[wx,07]
			wTitle   := __wM_Imp_SAY[wx,08]
			wFont    := __wM_Imp_SAY[wx,09]
			wCentral := __wM_Imp_SAY[wx,13]
			
			If .Not.cEmpty(wTitle)
				wTitle := &(wTitle)
			EndIf

			If cEmpty(wFont)
			   wFont := __oFontSay
			   wCor  := 0
			Else
			   wFont := __wObj_Rel+"."+wFont
			   wFont := cFont(wFont)
			   wCor  := wFont[2]
			   wFont := wFont[1]
			EndIf
			wLinha   := wRelLin + wLinha
			wLinha   := (wLinha*0.50) //*_wRFM_Altura

			__oPrn:Cmtr2Pix(@wLinha,@wColuna)
         If wCentral="S"
		   	wPixTexto := __oPrn:GetTextWidth( wTitle , wFont )
		   	wPixFolha := __oPrn:nHorzRes()
		   	wColuna   := (wPixFolha-wPixTexto)/2
		   EndIf

			__oPrn:Say(wLinha,wColuna,wTitle,wFont,      ,wCor    ,       ,    )
        	    // Say(nRow  ,nCol   ,cText ,oFont,nWidth,nClrText,nBkMode,nPad);
		EndIf
	Next

///For wx := 01 To Len(__wM_Imp_EPC)
///	If wObj_Pai == __wM_Imp_EPC[wx,02]
///		wLinha   := __wM_Imp_EPC[wx,03]
///		wColuna  := __wM_Imp_EPC[wx,04]
///		wAltura  := __wM_Imp_EPC[wx,05]
///		wLargura := __wM_Imp_EPC[wx,06]
///
///      CmEllipse( __oPrn, wLinha, wColuna, wAltura, wLargura, oPen )
///	EndIf
///Next

return .T.
*fim da Function __fCase_Rel_Desenho(wObj_Pai)

Function CmLine( oPrn, nTop, nLeft, nBottom, nRight, oPen )
	oPrn:Cmtr2Pix(@nTop, @nLeft)
	oPrn:Cmtr2Pix(@nBottom, @nRight)

	oPrn:Line( nTop, nLeft, nBottom, nRight, oPen )
Return .t.
*fim da Function CmLine( nTop, nLeft, nBottom, nRight, oPen )

Function CmBox( oPrn, nRow, nCol, nBottom, nRight, nWidth, nHeight, oPen, nBGColor )
	oPrn:Cmtr2Pix(@nRow   , @nCol)
	oPrn:Cmtr2Pix(@nBottom, @nRight)
	oPrn:Cmtr2Pix(@nHeight, @nWidth)

   oPrn:RoundBox( nCol, nRow, nRight, nBottom, nWidth, nHeight, oPen, nBGColor )
     // RoundBox( nCol, nRow, nRight, nBottom, nWidth, nHeight, oPen, nBGColor )

Return .t.
*fim da Function CmBox( nRow, nCol, nBottom, nRight, oPen )

Function CmSayImage( oPrn, wImage, nRow, nCol, nHeight, nWidth)
Local oImage

   oImage := TImage():Define(,wImage,)
	oPrn:Cmtr2Pix(@nRow   , @nCol  )
	oPrn:Cmtr2Pix(@nHeight, @nWidth)
   oPrn:SayImage( nRow, nCol, oImage, nWidth, nHeight) 
   oImage:End()

Return .t.
*fim da Function CmSayImage( oPrn, wImage, nRow, nCol, nWidth, nHeight )

Function CmEllipse( oPrn, nRow, nCol, nBottom, nRight, oPen )
	oPrn:Cmtr2Pix(@nRow, @nCol)
	oPrn:Cmtr2Pix(@nBottom, @nRight)
   oPrn:Ellipse( nRow, nCol, nBottom, nRight, oPen )

Return .t.
*fim da Function CmEllipse( oPrn, nRow, nCol, nBottom, nRight, oPen )

Function __fCase_Rel_Atrib_Font(wFont)
************************************************************************************************
*                                Função para atribuir font                                     *
************************************************************************************************
Local wFontAtrib,wCor

	wCor := 0
	If cEmpty(wFont)
		If ValType(__oFontCmp)="O"  
			wFontAtrib := __oFontCmp
		Else
			If ValType(__oFontRfm)="O"
				wFontAtrib := __oFontRfm
			Else
				If ValType(__oFontPag)="O"
					wFontAtrib := __oFontPag
				Else
					wFontAtrib := __oFontDefaultCmp
				EndIf
			EndIf
		EndIf
	Else
		wFont      := __wObj_Rel+"."+wFont
		wFontAtrib := cFont(wFont)
		wCor       := wFontAtrib[2]
		wFontAtrib := wFontAtrib[1]
	EndIf

Return {wFontAtrib,wCor}
*fim da Function __fCase_Rel_Atrib_Font(wFont)

Function Get_Prp_Rel(_wObj_Nome,_wPrp_Nome)
************************************************************************************************
*                                 Função que monta o Relatorio                                 *
************************************************************************************************
Local wPosRel,wPosObj,wObj_Tp,wObj_Prp_Vlr
	
	If cEmpty(_wObj_Nome)
		MsgInfo("Objeto relatório não cadastrado")
		Return nil
	Else
		If cEmpty(_wPrp_Nome)
			MsgInfo("Objeto relatório não cadastrado")
			Return nil
		Else
		
			_wObj_Nome := Lower(AllTrim(_wObj_Nome))
			_wPrp_Nome := Upper(AllTrim(_wPrp_Nome))

			wPosRel := cScan(__wMRelObj,_wObj_Nome,1)
			If wPosRel>0
 			   wObj_Tp := __wMRelObj[wPosRel,2]
		      wPosObj := __fCase_Rel_Scan(_wObj_Nome,wObj_Tp)

			   If     wObj_Tp = "REL"
		      	If     _wPrp_Nome == "TITLE"
      				wObj_Prp_Vlr := __wM_Imp_REL[wPosObj,1]
	      		ElseIf _wPrp_Nome == "CURSOR_REL"
            		wObj_Prp_Vlr := __wM_Imp_REL[wPosObj,8]
               EndIf
			   ElseIf wObj_Tp = "PAG"
	      		If _wPrp_Nome == "CURSOR_REL"
            		wObj_Prp_Vlr := __wM_Imp_PAG[wPosObj,13]
            	EndIf
			   ElseIf wObj_Tp = "RFM"
	      		If _wPrp_Nome == "CURSOR_REL"
            		wObj_Prp_Vlr := __wM_Imp_RFM[wPosObj,11]
	        		ElseIf _wPrp_Nome == "IMPRIME"
            		wObj_Prp_Vlr := __wM_Imp_RFM[wPosObj,18]
            	EndIf
			   ElseIf wObj_Tp = "CUR"
	      		If _wPrp_Nome == "SELECT"
 	   	          wObj_Prp_Vlr := __wM_Imp_CUR[wPosObj,02]
            	EndIf
			   ElseIf wObj_Tp = "CMP"
            	If     _wPrp_Nome == "CONTEUDO"
            		wObj_Prp_Vlr := __wM_Imp_CMP[wPosObj,26]
	        		ElseIf _wPrp_Nome == "IMPRIME"
            		wObj_Prp_Vlr := __wM_Imp_CMP[wPosObj,13]
            	ElseIf _wPrp_Nome == "COR"
            		wObj_Prp_Vlr := __wM_Imp_CMP[wPosObj,16]
            	EndIf
			   ElseIf wObj_Tp = "SAY"
	        		If _wPrp_Nome == "IMPRIME"
            		wObj_Prp_Vlr := __wM_Imp_SAY[wPosObj,13]
            	EndIf
            EndIf
			EndIf
		EndIf
	EndIf

   If ValType(wObj_Prp_Vlr)="C"
   	wObj_Prp_Vlr := AllTrim(wObj_Prp_Vlr)
   EndIf

return wObj_Prp_Vlr
*fim da Function Get_Prp_Rel(_wObj_Nome,wPrp_Nome,wNovoValor)

Function Set_Prp_Rel(_wObj_Nome,_wPrp_Nome,wObj_Prp_Vlr)
************************************************************************************************
*                                 Função que monta o Relatorio                                 *
************************************************************************************************
Local wPosRel,wPosObj,wObj_Tp
	
	If cEmpty(_wObj_Nome)
		MsgInfo("Objeto relatório não cadastrado")
		Return .F.
	Else
		If cEmpty(_wPrp_Nome)
			MsgInfo("Objeto relatório não cadastrado")
			Return .F.
		Else
			If ValType(wObj_Prp_Vlr)="C"
				wObj_Prp_Vlr := AllTrim(wObj_Prp_Vlr)
			EndIf
			
			_wObj_Nome := Lower(AllTrim(_wObj_Nome))
			_wPrp_Nome := Upper(AllTrim(_wPrp_Nome))

			wPosRel := cScan(__wMRelObj,_wObj_Nome,1)
			If wPosRel>0
 			   wObj_Tp := __wMRelObj[wPosRel,2]
		      wPosObj := __fCase_Rel_Scan(_wObj_Nome,wObj_Tp)

			   If     wObj_Tp = "REL"
		      	If     _wPrp_Nome == "TITLE"
      				__wM_Imp_REL[wPosObj,1] := wObj_Prp_Vlr
	      		ElseIf _wPrp_Nome == "ORIENTACAO"
      				__wM_Imp_REL[wPosObj,4] := iIf(cEmpty(wObj_Prp_Vlr),1,wObj_Prp_Vlr)  // Retrato
	      		ElseIf _wPrp_Nome == "PREVIEW"
      				__wM_Imp_REL[wPosObj,7] := iif(cEmpty(wObj_Prp_Vlr),.T.,wObj_Prp_Vlr)
	      		ElseIf _wPrp_Nome == "CURSOR_REL"
            		__wM_Imp_REL[wPosObj,8] := wObj_Prp_Vlr
               EndIf
			   ElseIf wObj_Tp = "PAG"
	      		If _wPrp_Nome == "CURSOR_REL"
            		__wM_Imp_PAG[wPosObj,13] := wObj_Prp_Vlr
            	EndIf
			   ElseIf wObj_Tp = "RFM"
	      		If _wPrp_Nome == "CURSOR_REL"
            		__wM_Imp_RFM[wPosObj,11] := wObj_Prp_Vlr
	        		ElseIf _wPrp_Nome == "IMPRIME"
            		__wM_Imp_RFM[wPosObj,18] := wObj_Prp_Vlr
            	EndIf
			   ElseIf wObj_Tp = "CUR"
	      		If _wPrp_Nome == "SELECT"
 	   	         __wM_Imp_CUR[wPosObj,02] := wObj_Prp_Vlr
            	EndIf
			   ElseIf wObj_Tp = "CMP"
            	If     _wPrp_Nome == "CONTEUDO"
            		__wM_Imp_CMP[wPosObj,26] := wObj_Prp_Vlr
	        		ElseIf _wPrp_Nome == "IMPRIME"
	        		   If ValType(wObj_Prp_Vlr)<>"C"
                     MsgStop("Propriedade IMPRIME deve ser valor 'N' ou 'S'",_wObj_Nome)
                     Return .F.
	        		   EndIf
            		__wM_Imp_CMP[wPosObj,13] := wObj_Prp_Vlr
            	ElseIf _wPrp_Nome == "COR"
            		__wM_Imp_CMP[wPosObj,16] := wObj_Prp_Vlr
            	EndIf
			   ElseIf wObj_Tp = "SAY"
	        		If _wPrp_Nome == "IMPRIME"
            		__wM_Imp_SAY[wPosObj,13] := wObj_Prp_Vlr
            	EndIf
            EndIf
			EndIf
		EndIf
	EndIf

return .T.
*fim da Function Set_Prp_Rel(_wObj_Nome,wPrp_Nome,wNovoValor)

Function cCase_Valida_Nome(wNome)
********************************************************************************
*                         Configura nome do objeto                             *
* (A..Z-065..090) (a..z-097..122) (0..9-48..57)                                *
********************************************************************************
Local wTextoResp,wChar,wAsc,wx,wLen

   wTextoResp := Space(00)
	wNome  := AllTrim(cNvl(wNome,""))
   wLen   := Len(wNome)

	For wx := 01 To wLen
		wChar := SubStr(wNome,wx,1)
      wAsc  := Asc(wChar)

      If (wAsc>=48.and.wAsc<=057) .or.;  // (0..9-48..57)
         (wAsc>=65.and.wAsc<=090) .or.;  // (A..Z-065..090)
         wAsc=095                 .or.;  // "_"
         (wAsc>=97.and.wAsc<=122)        // (a..z-097..122)

         if (wAsc>=65.and.wAsc<=090)
            wChar := CHR(wAsc + 32)
         EndIf
         
      Else
         wChar := "#"
      EndIf
      wTextoResp := wTextoResp + wChar
	Next

	wTextoResp := StrTran(wTextoResp,"#","")

return wTextoResp
*Fim da Function cCase_Valida_Nome

function cRelLin(wLinPrn)
*******************************************************************************
*                  calcula a Linha atual p/ impressao                         *
*******************************************************************************
return (__nRowStep*wLinPrn)
*fim da function cRelLin(wLinPrn)

function cRelCol(wColPrn)
*******************************************************************************
*                  calcula a Coluna atual p/ impressao                        *
*******************************************************************************
return (__nColStep*wColPrn)
*fim da function cRelCol(wColPrn)

Function __fCase_Rel_Filtro(wTitle)
********************************************************************************
*                   funcao para o Filtro Automatico do Relatório               *
********************************************************************************
Local wx,wLen,oDlg,oBtn,wFRM_Largura,wFRM_Atura,wQtdObj,wTamanho,wBtnLin,wColAnt
Local wFiltro,wCursor_Rel,wLargura,wPrimeiro,wDesloc_Lin,wDesloc_Col
Local wLarguraMax,wLarguraObj,wGETLargura,wObjDesloc,wReturn

   wReturn      := .F.
   wFRM_Largura := 700
   wFRM_Atura   := 400
   wQtdObj      := 00
   wTamanho     := 00
   wBtnLin      := 01

   wLen := Len(__wM_RelFiltro)
   For wx := 01 To wLen
      wFiltro     := __wM_RelFiltro[wx,1]
		wCursor_Rel := __wM_RelFiltro[wx,6]

      __wM_RelFiltro[wx,4] := .F.
      If cEmpty(wCursor_Rel)
         Loop
      ElseIf wFiltro=10
         __wM_RelFiltro[wx,2] := cRelDefVar(__wM_RelFiltro[wx,13],__wM_RelFiltro[wx,10])
         Loop
      EndIf
      __wM_RelFiltro[wx,4] := .T.
//
//    wLargura := __wM_RelFiltro[wx,7]
//    wFator   := (wLargura*3.5) + 100
//    wQtdObj  := wQtdObj + wFator
//    If wFiltro >= 30 .And. wFiltro <= 39
//       wQtdObj := wQtdObj + wFator + 10
//    EndIf
//
//    If wQtdObj >= wFRM_Largura
//       wQtdObj    := 00
//       wFRM_Atura := wFRM_Atura + 72.50
//       wBtnLin    := wBtnLin + 01
//    EndIf
   Next

   If wBtnLin = 1
      wBtnLin  := 01.10
   EndIf

   oDlg := TDIALOG():New( 0   , 0    , wFRM_Atura , wFRM_Largura , wTitle   ,,, .F.,,,,,, .T.    ,, oFont,,, )
                   //New( nTop, nLeft, nBottom    , nRight       , cCaption ,,,lVbx,,,,,, lPixels,, oFont,, nWidth, nHeight ) CLASS TDialog

   wPrimeiro   := .T.
   wDesloc_Lin := 05
   wDesloc_Col := 10
   wFRM_Atura  := 107

   For wx := 01 To wLen
		wFiltro     := __wM_RelFiltro[wx,1]
		wCursor_Rel := __wM_RelFiltro[wx,6]

      If .Not.__wM_RelFiltro[wx,4]
         Loop
      EndIf

		wLargura := __wM_RelFiltro[wx,07]

      If wPrimeiro
         wLarguraObj := wDesloc_Col
      Else
         wDesloc_Col := wObjDesloc:nLeft+wObjDesloc:nWidth+10
         wLarguraObj := wLarguraObj + wDesloc_Col
         wGETLargura := wLargura*3.5
		   If wFiltro >= 30 .And. wFiltro <= 39
	         wGETLargura := wGETLargura*2
         EndIf
        	wLarguraMax := wLarguraObj + wGETLargura + (wGETLargura/2)

      	If wLarguraMax >= 500 //(wFRM_Largura
      	   wDesloc_Lin := wDesloc_Lin + 28
      	   wDesloc_Col := 10
				wFRM_Atura  := wFRM_Atura + 55
      	EndIf
      EndIf

      wObjDesloc := __fCase_Rel_Filtro_Get(wx,wFiltro,wLargura,wDesloc_Lin,wDesloc_Col,oDlg) // retorno oBox

      wPrimeiro  := .F.
   Next

   wDesloc_Lin := wDesloc_Lin + 32

   oBtn := TButton():New( wDesloc_Lin , 105  , "Impressão" , oDlg,        , 40   , 10     ,,,, .T.   ,.F.     ,,.F.    ,      ,       , .T.)
                  // New( nRow        , nCol , cCaption    , oWnd, bAction,nWidth, nHeight,,,, lPixel, lDesign,,lUpdate, bWhen, bValid, lCancel ) CLASS TButton
   oBtn:cToolTip := "Impressão do relatório..."
   oBtn:bAction  := {|| wReturn := .T. , oDlg:End() }
//   oBtn:bAction  := {|| MsgRun("Pesquisando...","Aguarde",{||__fCase_Rel_Monta(_wObj_Rel,wMFont)}) , oDlg:End() }
   
   oBtn := TButton():New( oBtn:nTop , oBtn:nLeft+oBtn:nWidth+50 , "Cancela" ,oDlg ,,oBtn:nWidth,oBtn:nHeight,,,.F.,.T.,.F.,,.F.,,, .T.)
   oBtn:cToolTip := "Sai da tela de filtro..."
   oBtn:bAction  := {|| wReturn := .F. , oDlg:End() }

   oDlg:nBottom := wFRM_Atura
// oDlg:nRight  := 10

   oDlg:Activate( oDlg:bLClicked, oDlg:bMoved , oDlg:bPainted, .T. ,  ,,, oDlg:bRClicked,, )

Return wReturn
*fim da Function __fCase_Rel_Filtro()

Function __fCase_Rel_Filtro_Get(wx_filtro,wFiltro,wLargura,wDesloc_Lin,wDesloc_Col,oDlg)
********************************************************************************
*                   funcao para o Filtro Automatico do Relatório               *
********************************************************************************
Local wAjuste,wPos,wImagem,wVar_Nome,wGETLargura,wBOXLargura,wGETColuna,wPesquisa
Local wCol_Nome,wConteudo,wTitle,wPicture,wType,wDominio,wx,wBlock
Local oBtn,oSay1,oSay2,oBox,oGet1,oGet2,wCMBLargura,wCMBLin,wCMBLen

	wCol_Nome := __wM_RelFiltro[wx_filtro,08]
	wConteudo := __wM_RelFiltro[wx_filtro,10]
	wTitle    := __wM_RelFiltro[wx_filtro,11]
	wPicture  := __wM_RelFiltro[wx_filtro,12]
	wType     := __wM_RelFiltro[wx_filtro,13]
	wDominio  := __wM_RelFiltro[wx_filtro,14]
	wPesquisa := __wM_RelFiltro[wx_filtro,15]

	wVar_Nome := "__wM_RelFiltro["+StrZero(wx_filtro,3,0)+",2]"
	wVar_Nome := "{|u| If( PCount()==0, "+wVar_Nome+","+wVar_Nome+" :=u )}"

	//wDesloc_Lin := (wDesloc_Lin*5)
   wGETLargura := wLargura*3.5

   If wFiltro = 50  // ComboBOX
      If .Not.cEmpty(wDominio)
         wDominio := &(wDominio)
      Else
         wDominio := {"Dominio não informado"}
      EndIf

      If ValType(wDominio)<>"A"
         wDominio := {"Conteudo do domínio diferente de matriz"}
      Else
      	If .Not.cEmpty(wDominio[1])
      		aAdd(wDominio,nil)
      		aIns(wDominio,1)
      		wDominio[1] := ""
      	EndIf
      EndIf

      wCMBLin := 6 * 13
      wCMBLen := Len(wDominio)
      If wCMBLen < 6
         If wCMBLen = 2
            wCMBLin := wCMBLen * 15
         Else
            wCMBLin := wCMBLen * 13
         EndIf
      EndIf
      
      For wx := 01 To wCMBLen
         wCMBLargura := Len(AllTrim(wDominio[wx]))
         If wLargura < wCMBLargura
            wLargura := wCMBLargura
         EndIf
      Next
      wGETLargura := (wLargura+5) * 3.5
      wBOXLargura := wDesloc_Col + wGETLargura + 5

   ElseIf wFiltro >= 30 .And. wFiltro <= 39
      wBOXLargura := wDesloc_Col + 10s + 14 + (wGETLargura*2) + 6  //wGETLargura  //wDesloc_Col+(wGETLargura*3)
   Else
      wBOXLargura := wDesloc_Col + wGETLargura + 6

  		If wFiltro = 40
	      wBOXLargura := wBOXLargura + 8
  		EndIf
  	EndIf

	oBox := TGroup():New(wDesloc_Lin,wDesloc_Col,wDesloc_Lin+22, wBOXLargura ,wTitle,oDlg,,,.T.   ,,oFont,.T.)
                // New( nTop       , nLeft     , nBottom      ,  nRight     ,cLabel,oWnd,,,lPixel, lDesign, oFont, lTransparent ) CLASS TGroup

   If wFiltro >= 30 .And. wFiltro <= 39
      wGETColuna := oBox:nLeft+13
   Else
      wGETColuna := oBox:nLeft+3
  	EndIf

   If wFiltro = 50 
      oGet1:= TComboBox():New(oBox:nTop+9,wGETColuna,&(wVar_Nome),wDominio,wGETLargura,wCMBLin,oDlg,,,,,,.T.,,,.F.,,.F.,,,,,)
   Else
  		oGet1 := TGet():New(oBox:nTop+9,wGETColuna ,&(wVar_Nome),oDlg,wGETLargura ,010 ,     ,      ,,,,.F.,,.T.    ,    ,.F.     ,      , .F.    ,iif(wType="N",.t.,.f.),        ,.F.      ,          ,.F.,,.F.,,,,)
		             //New(nRow       ,nCol       , bSetGet    ,oWnd, nWidth     ,010 ,cPict,bValid,,,,   ,, lPixel,cMsg, lUpdate, bWhen, lCenter, lRight               ,bChanged,lReadOnly, lPassword, lNoBorder, nHelpId,lSpinner, bUp, bDown, bMin, bMax ) CONSTRUCTOR
  		oGet1:cPicture     := wPicture
  		oGet1:oGet:Picture := wPicture
  	EndIf

   __wM_RelFiltro[wx_filtro,02] := cRelDefVar(wType,wConteudo)
  	__wM_RelFiltro[wx_filtro,03] := oGet1

  	If wFiltro = 40   // Combo DB
  	   wImagem := cIMG_Arquivo("BTN_COMBOB")
  	   If cEmpty(wImagem)
  	      wImagem := "image\combo.bmp"
  	   EndIf
  	   wPesquisa := iIf(cEmpty(wPesquisa),".T.",wPesquisa)

      oBtn := TBTNBMP():New(oGet1:nTop,oGet1:nLeft+oGet1:nWidth+1,08,10,,,wImagem,,,oDlg,,,.F.,.F.,,,,,.T.,)
  	   oBtn:lCancel := .T.
  	   oBtn:bAction := {|Self|&(wPesquisa)}

 		wBlock := "__fCase_Rel_Filtro_GetValid(3,"+Str(wx_filtro)+")"
  		oGet1:bValid := {|| &(wBlock) }

   ElseIf wFiltro >= 30 .And. wFiltro <= 39

 		wBlock := "__fCase_Rel_Filtro_GetValid(1,"+Str(wx_filtro)+")"
  		oGet1:bValid := {|| &(wBlock) }

      oSay1 := TSay():New( oGet1:nTop+2, oGet1:nLeft-9, {|| "De"} ,oDlg,, oFont,.F.      ,.F.   ,.F.    ,.T.    ,,, 09   , 07     , .F.    , .F.    , .F.    , .F. , .F. )
                   // New( nRow        , nCol         , bText     ,oWnd,, oFont,lCentered,lRight,lBorder,lPixels,,,nWidth, nHeight, lDesign, lUpdate, lShaded, lBox, lRaised )


		wVar_Nome := "__wM_RelFiltro["+StrZero(wx_filtro,3,0)+",4]"
		wVar_Nome := "{|u| If( PCount()==0, "+wVar_Nome+","+wVar_Nome+" :=u )}"

  		oGet2 := TGet():New(oGet1:nTop,oGet1:nLeft+oGet1:nWidth+14,&(wVar_Nome),oDlg, oGet1:nWidth,010 ,      ,        ,,,,.F.,,.T.    ,    ,.F.     ,      ,.F.    ,iif(wType="N",.t.,.f.),,.F.      ,          ,.F.,,.F.,,,,)
		             //New( nRow      , nCol                      , bSetGet    ,oWnd, nWidth      ,010 , cPict, bValid ,,,,   ,, lPixel,cMsg, lUpdate, bWhen,lCenter,lRight                ,,lReadOnly, lPassword, lNoBorder, nHelpId,lSpinner, bUp, bDown, bMin, bMax ) CONSTRUCTOR
  		oGet2:cPicture     := wPicture
 		oGet2:oGet:Picture := wPicture
 		
 		wBlock := "__fCase_Rel_Filtro_GetValid(2,"+Str(wx_filtro)+")"
  		oGet2:bValid := {|| &(wBlock) }

  		__wM_RelFiltro[wx_filtro,05] := oGet2

      oSay2 := TSay():New( oGet2:nTop+2 , oGet2:nLeft-10 , {|| "Até"} ,oDlg,, oFont,.F.      ,.F.   ,.F.    ,.T.    ,,, 10   , 07     , .F.    , .F.    , .F.    , .F. , .F. )

      If wFiltro = 31
         __wM_RelFiltro[wx_filtro,02] := cDate()
         __wM_RelFiltro[wx_filtro,04] := __wM_RelFiltro[wx_filtro,02]
      Else
         __wM_RelFiltro[wx_filtro,02] := cRelDefVar(wType,wConteudo)
         __wM_RelFiltro[wx_filtro,04] := __wM_RelFiltro[wx_filtro,02]
      EndIf
      __wM_RelFiltro[wx_filtro,03]:Refresh()
      __wM_RelFiltro[wx_filtro,05]:Refresh()
  	EndIf

Return oBox
*fim da Function __fCase_Rel_Filtro_Get()

Function __fCase_Rel_Filtro_GetValid(wopcao,wx_filtro)
********************************************************************************
*              funcao para o Valid automatico dos GETS do Filtro               *
********************************************************************************
Local wWhere,wResp,wTitle,wDefVar,wCursor_Rel,wCol_Nome,wPos_Cursor,wTab_Nome,wConteudo,wType

   wDefVar := cRelDefVar(__wM_RelFiltro[wx_filtro,13])

   If wopcao = 1
      If cEmpty(__wM_RelFiltro[wx_filtro,02])
         __wM_RelFiltro[wx_filtro,02]:= wDefVar
         __wM_RelFiltro[wx_filtro,04]:= wDefVar
         __wM_RelFiltro[wx_filtro,03]:Refresh()
         __wM_RelFiltro[wx_filtro,05]:Refresh()
      Else
         __wM_RelFiltro[wx_filtro,04]:= __wM_RelFiltro[wx_filtro,02]
         __wM_RelFiltro[wx_filtro,05]:Refresh()
      EndIf
      Return .T.
   ElseIf wopcao = 2
      If cEmpty(__wM_RelFiltro[wx_filtro,04])
         __wM_RelFiltro[wx_filtro,04] := __wM_RelFiltro[wx_filtro,02]
         __wM_RelFiltro[wx_filtro,05] :Refresh()
         Return .T.
      EndIf

      If __wM_RelFiltro[wx_filtro,04] < __wM_RelFiltro[wx_filtro,02]
			wTitle := __wM_RelFiltro[wx_filtro,11]
         MsgInfo( wTitle + " final não pode ser menor que " + wTitle + " inicial","Atenção")
         __wM_RelFiltro[wx_filtro,04]:= wDefVar
         __wM_RelFiltro[wx_filtro,05]:Refresh()
         Return .F.
      EndIf
	ElseIf wopcao = 3
		wConteudo := __wM_RelFiltro[wx_filtro,2]
		If cEmpty(wConteudo)
			return .T.
		EndIf

		wCursor_Rel := __wM_RelFiltro[wx_filtro,6]
		wCol_Nome   := __wM_RelFiltro[wx_filtro,8]

		If .Not.cEmpty(wCursor_Rel)
			wPos_Cursor := cScan(__wM_Imp_CUR,wCursor_Rel,3)
			If wPos_Cursor>0
		      wTab_Nome := __wM_Imp_CUR[wPos_Cursor,04]

		      wType  := ValType(wConteudo)
		      wWhere := wCol_Nome+"="+Campo(wConteudo,wType)
				wResp  := fConsulta2(wTab_Nome,{wCol_Nome},wWhere)

				If Len(wResp)=0
					wTitle := __wM_RelFiltro[wx_filtro,11]
					MsgInfo(wTitle + " não existe para esse relatório.","Atenção")
					Return .F.
				EndIf
			EndIf
		EndIf
   EndIf

Return .t.
*fim da Function __fCase_Rel_Filtro_GetValid(wopcao,wx_filtro)

Function cRelDefVar(wTypeVar,wConteudo)
******************************************************************************
*                 funcao para Localizar o Objeto da Coluna                   *
******************************************************************************
   If cEmpty(wTypeVar)
      wTypeVar := "C"
   EndIf

	If .Not.cEmpty(wConteudo)
	   wConteudo := &(wConteudo)
	Else
	   If     wTypeVar="C"
			wConteudo := Space(255)
		ElseIf wTypeVar="N"
			wConteudo := 0
		ElseIf wTypeVar="D"
			wConteudo := cTod("  /  /    ")
	   EndIf
	EndIf

Return wConteudo
*fim da Function cRelDefVar(wTypeVar,wConteudo)

Function cRel_AtribDB(wColuna,wConteudo)
******************************************************************************
*                 funcao para Localizar o Objeto da Coluna                   *
******************************************************************************
Local wx,wCol_Nome,wGet,wPos

   If cEmpty(wColuna)
      MsgInfo("Coluna não informada na função cRel_AtribDB()")
   Else
      wColuna := cLower(AllTrim(wColuna))
      wPos    := rAt(".",wColuna)
      If wPos>0
	      wColuna := SubStr(wColuna,wPos+1)
      EndIf
   EndIf

	For wx := 01 To Len(__wM_RelFiltro)
		wCol_Nome := __wM_RelFiltro[wx,08]
		wCol_Nome := cLower(wCol_Nome)

		If wCol_Nome == wColuna
			__wM_RelFiltro[wx,02] := wConteudo
			wGet := __wM_RelFiltro[wx,03]
			wGet:Refresh()
			Exit
		EndIf
	Next

	oM_Dlg[Len(oM_Dlg)]:End()
	wGet:SetFocus()

Return .T.
*fim da Function cRel_AtribDB(wColuna,wConteudo)

Function cPar(_wObj_Nome)
******************************************************************************
*                                                                            *
******************************************************************************
Local wx,wReturn

	_wObj_Nome := cLower(AllTrim(_wObj_Nome))

   For wx := 01 To Len(__wM_Imp_PAR)
		If __wM_Imp_PAR[wx,1] == _wObj_Nome
			wReturn := __wM_Imp_PAR[wx,5]
			Exit
		EndIf
   Next

Return wReturn
*fim da Function cPar(_wObj_Nome)

Function cCur(wColuna,wType)
******************************************************************************
*                                                                            *
******************************************************************************
Local wPos,wCursor,wReturn

   wPos := At(".",wColuna)
   If wPos>0
      wCursor := SubStr(wColuna,1,wPos-1)
      wColuna := SubStr(wColuna,wPos+1)
      wCursor := AllTrim(cLower(wCursor))
      wColuna := AllTrim(cLower(wColuna))
      
      wReturn := cSql_Cursor(wCursor,wColuna)
      If cNvl(wType,"")="D"
         wReturn := cTod(SubStr(wReturn,9,2)+"/"+SubStr(wReturn,6,2)+"/"+SubStr(wReturn,1,4))
      EndIf
   Else
   	MsgInfo("Cursor ou Coluna não informada.","Função cCur()")
   	return nil
   EndIf

Return wReturn
*fim da Function cCur(wColuna)

Function cCurFiltro(wColuna,wInfo)
******************************************************************************
*                                                                            *
******************************************************************************
Local wPos,wCursor,wRetorno,wLen,wx

   wPos := At(".",wColuna)
   If wPos>0
      wCursor := SubStr(wColuna,1,wPos-1)
      wColuna := SubStr(wColuna,wPos+1)
      wCursor := AllTrim(cLower(wCursor))
      wColuna := AllTrim(cLower(wColuna))

      wInfo := cNvl(wInfo,1)
      
      wLen := Len(__wM_RelFiltro)
      For wx := 01 To wLen
      	If __wM_RelFiltro[wx,6]==wCursor .And. __wM_RelFiltro[wx,8]==wColuna
				If wInfo=2
					wRetorno := __wM_RelFiltro[wx,4]
				Else
					wRetorno := __wM_RelFiltro[wx,2]
				EndIf
				Exit
      	EndIf
      Next
   Else
   	MsgInfo("Cursor ou Coluna não informada.","Função cCurFiltro()")
   	return nil
   EndIf

Return wRetorno
*fim da Function cCurFiltro(wColuna,wInfo)

Function __fCase_Rel_Scan(wObj_Nome,wObj_Tp)
******************************************************************************
*                                                                            *
******************************************************************************
Local wPosObj,wx

	If     wObj_Tp="REL"
		wPosObj := 1
	ElseIf wObj_Tp="PAG"
		For wx := 01 To Len(__wM_Imp_PAG)
			If __wM_Imp_PAG[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="RFM"
		For wx := 01 To Len(__wM_Imp_RFM)
			If __wM_Imp_RFM[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="CMP"
		For wx := 01 To Len(__wM_Imp_CMP)
			If __wM_Imp_CMP[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="SAY"
		For wx := 01 To Len(__wM_Imp_SAY)
			If __wM_Imp_SAY[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="BOX"
		For wx := 01 To Len(__wM_Imp_BOX)
			If __wM_Imp_BOX[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="IMG"
		For wx := 01 To Len(__wM_Imp_IMG)
			If __wM_Imp_IMG[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	ElseIf wObj_Tp="CUR"
		For wx := 01 To Len(__wM_Imp_CUR)
			If __wM_Imp_CUR[wx,1] == wObj_Nome
				wPosObj := wx
				Exit
			EndIf
		Next
	EndIf

Return wPosObj
*fim da Function __fCase_Rel_Scan(wObj_Tp)

Function __fCase_Rel_PagQtdLin(wObj_Nome,wObj_Pai,wqtdwx,wQtd_Linhas,wRelLin,wLinha,wAltura,wLenCur,__wMCamposImp,__wLenCamposImp)
******************************************************************************
*                   Quebra a Pagina no limite de linhas                      *
******************************************************************************

	If wQtd_Linhas>0
   	If wRelLin>(wQtd_Linhas-5)
			__fCase_Rel_Rodape()

			PageEnd()
			wRelLin := wLinha
			PageBegin()

			wRelLin := __fCase_Rel_Cabecalho(wRelLin)

			__fCase_Rel_Desenho(wObj_Pai,2,9,0,0)
			__fCase_Rel_Desenho(wObj_Nome,wqtdwx,wLenCur,wRelLin,wAltura)

			If __wTitleBox
				wRelLin := __fCase_Rel_BoxTitle(__wMCamposImp,__wLenCamposImp,wRelLin)
			EndIf
      EndIf
   EndIf

Return wRelLin
*fim da Function __fCase_Rel_PagQtdLin(wQtd_Linhas,wRelLin)

Function __fCase_Rel_SayQuebra(wObj_Quebra,wRelLin)
******************************************************************************
*                   Quebra a Pagina no limite de linhas                      *
******************************************************************************
Local wx,wLinha,wColuna,wAltura,wLargura,wTitle,wFont,wCentral,wCor,wPixTexto,wPixFolha

	For wx := 01 To Len(__wM_Imp_SAY)
		If wObj_Quebra == __wM_Imp_SAY[wx,14]

         wLinha   := __wM_Imp_SAY[wx,04]
			wColuna  := __wM_Imp_SAY[wx,05]
			wAltura  := __wM_Imp_SAY[wx,06]
			wLargura := __wM_Imp_SAY[wx,07]
			wTitle   := __wM_Imp_SAY[wx,08]
			wFont    := __wM_Imp_SAY[wx,09]
			wCentral := __wM_Imp_SAY[wx,13]

			If .Not.cEmpty(wTitle)
				wTitle := &(wTitle)
			EndIf

			If cEmpty(wFont)                                                          
			   wFont := __oFontSay                                                    
			   wCor  := 0                                                             
			Else                                                                      
			   wFont := __wObj_Rel+"."+wFont
			   wFont := cFont(wFont)
			   wCor  := wFont[2]
			   wFont := wFont[1]
			EndIf
			wLinha   := cRelLin(wRelLin+wLinha)

			__oPrn:Cmtr2Pix(0,@wColuna)
         If wCentral="S"
		   	wPixTexto := __oPrn:GetTextWidth( wTitle , wFont )
		   	wPixFolha := __oPrn:nHorzRes()
		   	wColuna   := (wPixFolha-wPixTexto)/2
		   EndIf

			__oPrn:Say(wLinha,wColuna,wTitle,wFont,      ,wCor    ,       ,    )
        	    // Say(nRow  ,nCol   ,cText ,oFont,nWidth,nClrText,nBkMode,nPad);
		EndIf
	Next

Return wRelLin
*fim da Function __fCase_Rel_SayQuebra()

*************************************************************************************
*************************************************************************************
*******************                                              ********************
*******************                   IDE CCASE                  ********************
*******************                                              ********************
*************************************************************************************
*************************************************************************************

function __fSuper_IDE(wObj_Nome,wObj_Tp,wObj_Seq)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wObj_Ref,wObjeto,oBtn,wPrpPos,wx,wLinha,wColuna,wLargura,wLenFRM,wResp,wPos_IDE,wFRM_IDE
Local oDlg,oGet1,oGet2,wPos,wImg_Firs,wImg_Prev,wImg_Next,oTree,oImageList,oWindow,_wMM_Obj,oFld
   
   If cEmpty(wObj_Nome)
      _wMM_Obj := __fSuper_Control()
      If cEmpty(_wMM_Obj[1])
         Return .F.
      Else
         wObj_Nome := _wMM_Obj[1]
         wObj_Tp   := _wMM_Obj[2]
         wObj_Seq  := _wMM_Obj[3]
         wFRM_IDE  := _wMM_Obj[4]
      EndIf
   Else
      wPos := At(".",wObj_Nome)
      If wPos>0
         wFRM_IDE := SubStr(wObj_Nome,1,wPos-1)
      Else
         wFRM_IDE := wObj_Nome
      EndIf
   EndIf

   If .Not.__wc_IDE_ObjOpen

      oWindow := TWindow():New( 00  , 00   , 25.45  , 91.7  ,wObj_Tp+"-"+StrZero(wObj_Seq,7,0)+"-"+wObj_Nome,      ,     ,      ,     ,       ,.F.     ,.F.     ,"N/W"   ,        ,       ,"NONE"  ,        ,        ,.T. ,.F.  , .F. )
                 // METHOD New( nTop, nLeft, nBottom, nRight, cTitle              ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore,nClrBack,oCursor, cBorder,lSysMenu,lCaption,lMin, lMax, lPixel ) CONSTRUCTOR

      oImageList = TImageList():New(16,16)
      oImageList:Add( TBitmap():Define( ,"image\FRM.bmp",oWindow) ,)  // 0
      oImageList:Add( TBitmap():Define( ,"image\FLD.bmp",oWindow) ,)  // 1
      oImageList:Add( TBitmap():Define( ,"image\FLT.bmp",oWindow) ,)  // 2
      oImageList:Add( TBitmap():Define( ,"image\GRD.bmp",oWindow) ,)  // 3
      oImageList:Add( TBitmap():Define( ,"image\GET.bmp",oWindow) ,)  // 4
      oImageList:Add( TBitmap():Define( ,"image\BTN.bmp",oWindow) ,)  // 5 
      oImageList:Add( TBitmap():Define( ,"image\FME.bmp",oWindow) ,)  // 6 
      oImageList:Add( TBitmap():Define( ,"image\SAY.bmp",oWindow) ,)  // 7 

      oTree := TTreeView():New( 01  , 01   , oWindow,GetSysColor(18),               , .T.   , .F.    , 325   , 381    ,    )
                    //     New( nTop, nLeft, oWnd   ,nClrFore       ,nClrBack       , lPixel, lDesign, nWidth, nHeight,cMsg)
      *--------------------Cria uma nova matrix Classificada por SISTEMA + PAI-----------------------*
      oTree:SetImageList(oImageList)

      __wc_IDE_Tree    := oTree
      __wc_IDE_objeto  := oWindow
      __wc_IDE_ObjOpen := .T.

      __fSuper_AddTree(oTree,wObj_Nome,wFRM_IDE)

      oFld := TFolder():New( 00 ,oTree:nLeft+oTree:nWidth+1,{"Propriedades","Variáveis","Comandos"},{}      ,oWindow,       ,        ,        ,.T.   ,.F.    ,400   ,oTree:nHeight,    ,.T.      ,)
              // METHOD New(nTop,nLeft                     ,aPrompts                               ,aDialogs,oWnd   ,nOption,nClrFore,nClrBack,lPixel,lDesign,nWidth,nHeight      ,cMsg,lAllWidth,oFont ) CONSTRUCTOR
      oFld:bChange := {|nOption| __fSuper_IDE_MudaFolder(nOption) }

      __fSuper_IDE_Prp_Grid(01,01,390,oTree:nHeight-50,oFld:aDialogs[1],oTree)
      __fSuper_IDE_Prp_Itens(wObj_Nome,wObj_Tp,__fSuper_IDE_Prp_TabGrp(wObj_Tp,__wc_IDE_ObjTab))

      __fSuper_IDE_Prp_Var(01,01,390,oTree:nHeight-60,oFld:aDialogs[2],oTree)
      __fSuper_IDE_Prp_Cmd(01,01,390,oTree:nHeight-60,oFld:aDialogs[3])

      oWindow:bValid   := {|| __fSuper_IDE_Prp_End() }

      oTree:bChanged  := {|| __fSuper_Tree_Change(oTree)}
      oTree:bRClicked := {|nRow,nCol| __fSuper_Tree_PopUp(oTree,nRow,nCol) }
      oTree:bkeydown  := {|nKey,nFlags| __fSuper_IDETree_Key(oTree,nKey)}

      WndCenter( oWindow:hWnd )
      oWindow:Activate( "NORMAL",,,,,,,,,,,,,,,,,,)
           // Activate( cShow, bLClicked, bRClicked, bMoved, bResized, bPainted, bKeyDown, bInit,bUp, bDown, bPgUp, bPgDn,bLeft, bRight, bPgLeft, bPgRight, bValid, bDropFiles,bLButtonUp )
   Else
      If ValType(__wc_IDE_Tree)="O"
         __fSuper_Tree_Refresh(__wc_IDE_Tree,wFRM_IDE)
      EndIf

      ShowWindow( __wc_IDE_objeto:hWnd , 9 )
   EndIf

Return .T.
* fim da function __fSuper_IDE(wObj_Nome,wObj_Tp)

Function __fSuper_IDE_Prp_End()
***************************************************************************************
*                         Finaliza a tela de edição de objeto                         *
***************************************************************************************
   __wc_IDE_ObjOpen := .F.
Return .T.
* fim da function __fSuper_IDE_Prp_End()

Function __fSuper_IDE_MudaFolder(wOption)
***************************************************************************************
*                         Finaliza a tela de edição de objeto                         *
***************************************************************************************
Local wx,wy,wVar,wxLen,wyLen,wValor,wType 

   If wOption=2     // Variaveis
      __wMCase_IDE_Var := {}
      aSize(__wMCase_IDE_Var,0)

      aAdd(__wMCase_IDE_Var,{"----- Globais "+Replicate("-",50) ,Replicate("-",10),Replicate("-",50),Replicate("-",10),Replicate("-",100)})
      aAdd(__wMCase_IDE_Var,{"wc_sistema",ValType(wc_Sistema),wc_Sistema,"C",""})
      aAdd(__wMCase_IDE_Var,{"wc_frm_act",ValType(wc_FRM_Act),wc_FRM_Act,"C",""})
      aAdd(__wMCase_IDE_Var,{"wc_log"    ,ValType(wc_Log    ),wc_Log    ,"C",""})
      aAdd(__wMCase_IDE_Var,{"wc_sql"    ,ValType(wc_Sql    ),wc_Sql    ,"C",""})

      For wx := 01 To Len(__wMVaruser)
         wVar := __wMVaruser[wx]
         If __MVEXIST(wVar)
            wValor := __MVGET(wVar)
            wType  := ValType(wValor)
            aAdd(__wMCase_IDE_Var,{wVar,wType,__FCGFC(wValor),"",""})
         EndIf
      Next
      
      If cScan(__wMCase_IDE_Var,"wc_emp",1)=0
         aAdd(__wMCase_IDE_Var,{"wc_emp",ValType(wc_emp),Str(wc_emp),"N",""})
      EndIf
      If cScan(__wMCase_IDE_Var,"wc_cli",1)=0
         aAdd(__wMCase_IDE_Var,{"wc_cli",ValType(wc_cli),Str(wc_cli),"N",""})
      EndIf

      wVar    := ""
      wValor  := ""
      wType   := ""
      wxLen   := Len(wM_Case)
      For wx := 01 To wxLen
         aAdd(__wMCase_IDE_Var,{"----- GRID: "+StrZero(wx,3,0)+" "+Replicate("-",50) ,Replicate("-",10),Replicate("-",50),Replicate("-",10),Replicate("-",100)})

         wyLen := Len(wM_Case[wx,wCS_Coluna])
         For wy := 01 To wyLen

            wVar   := Lower(wM_Case[wx,wCS_Coluna,wy])
            wType  := ValType(wM_Case[wx,wCS_Conteudo,wy])
            wValor := __FCGFC(wM_Case[wx,wCS_Conteudo,wy])

            aAdd(__wMCase_IDE_Var,{wVar                                ;
                                  ,wType                               ;
                                  ,wValor                              ;
                                  ,wM_Case[wx,wCS_TypeVar,wy]          ;
                                  ,Lower(wM_Case[wx,wCS_ObjNome,wy])   })
         Next
      Next

      If Len(__wMCase_IDE_Var)=0
         aAdd(__wMCase_IDE_Var,{"","","","",""})
      EndIf

      __wc_IDE_ObjVar:GoTop()
      __wc_IDE_ObjVar:Refresh()
   EndIf

Return .T.
* fim da Function __fSuper_IDE_MudaFolder(nOption)

Function __fSuper_Control()
***************************************************************************************
*                   Função que mostra Objeto Focado e Objetos Pais                    *
***************************************************************************************
Local wx,wy,wxLen1,wxLen2,hWnd,wnId,wMatriz,wPos,wFRM_Nome,wFLT_Nome,wCTRL_Nome,wCTRL_Tp,wCTRL_Seq,wx_Frm,wObjFRM,wPasta

   wxLen1 := Len(__wMCase_Obj)
   For wx_Frm := 01 To wxLen1
      wxLen2 := Len(__wMCase_Obj[wx_Frm])
      
      wFRM_Nome  := space(00)
      wFLT_Nome  := space(00)
      wCTRL_Nome := space(00)
      
      *----------------------------------- (FRM) ---------------------------------------*
      For wx = 01 To wxLen2
         If __wMCase_Obj[wx_Frm][wx,__wObj_Tp] = "FRM"
            If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
               If __wMCase_Obj[wx_Frm][wx,__wobjeto]:lActive
                  wFRM_Nome := __wMCase_Obj[wx_Frm][wx,__wObj_Nome]
                  wCTRL_Tp  := __wMCase_Obj[wx_Frm][wx,__wObj_Tp]
                  wCTRL_Seq := __wMCase_Obj[wx_Frm][wx,__wObj_Seq]
                  wObjFRM   := __wMCase_Obj[wx_Frm][wx,__wobjeto]
                  Exit
               EndIf
            EndIf
         EndIf
      Next
      *---------------------------------------------------------------------------------*
      
      *----------------------------------- (FLD) ---------------------------------------*
      If ValType(wObjFRM)="O"
         wMatriz := {}
      
         For wx = 01 To wxLen2
            If __wMCase_Obj[wx_Frm][wx,__wObj_Tp] = "FLD"
               If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
                  If __wMCase_Obj[wx_Frm][wx,__wobjeto]:oWnd:hWnd == wObjFRM:hWnd
                    aAdd( wMatriz , {__wMCase_Obj[wx_Frm][wx,__wObj_Nome],__wMCase_Obj[wx_Frm][wx,__wObj_Seq],__wMCase_Obj[wx_Frm][wx,__wobjeto]})
                  EndIf
               EndIf
            EndIf
         Next
      
         aSort(wMatriz,,,{|x,y| x[2] < y[2]})
         If Len(wMatriz)>0
            wPasta := 0
      
            For wx = 01 To wxLen2
               If __wMCase_Obj[wx_Frm][wx,__wObj_Tp] = "FLT"
                  If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
                     If __wMCase_Obj[wx_Frm][wx,__wobjeto]:oWnd:hWnd == wMatriz[1,3]:hWnd
                        wPasta := wPasta + 1
                        If wMatriz[1,3]:nOption = wPasta
                           wFLT_Nome := __fSuper_Control_Aux(__wMCase_Obj[wx_Frm][wx,__wobjeto],wxLen2,wx_Frm,__wMCase_Obj[wx_Frm][wx,__wObj_Nome])
                           Exit
                        EndIf
                     EndIf
                  EndIf
               EndIf
            Next
         EndIf

         *-----------------------------Controls geral (GET,BTN) ---------------------------*
         hWnd := GetFocus()
         wnID := GetCtrlID(hWnd)
         For wx = 01 To wxLen2
            If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
               If Upper(__wMCase_Obj[wx_Frm][wx,__wobjeto]:ClassName)="TRADMENU"
                  For wy=1 To Len(__wMCase_Obj[wx_Frm][wx,__wobjeto]:aItems)
                     If __wMCase_Obj[wx_Frm][wx,__wobjeto]:aItems[wy]:nID = wnID
                        wCTRL_Nome := __wMCase_Obj[wx_Frm][wx,__wObj_Nome]
                        wCTRL_Tp   := __wMCase_Obj[wx_Frm][wx,__wObj_Tp]
								wCTRL_Seq  := __wMCase_Obj[wx_Frm][wx,__wObj_Seq]
                        Exit
                     EndIf
                  Next
               Else
                  If __wMCase_Obj[wx_Frm][wx,__wobjeto]:nID = wnID
                     wCTRL_Nome := __wMCase_Obj[wx_Frm][wx,__wObj_Nome]
                     wCTRL_Tp   := __wMCase_Obj[wx_Frm][wx,__wObj_Tp]
							wCTRL_Seq  := __wMCase_Obj[wx_Frm][wx,__wObj_Seq]
                     Exit
                  EndIf
               EndIf
            EndIf
         Next
         *---------------------------------------------------------------------------------*

         If .Not.cEmpty(wCTRL_Nome)
            Exit
         EndIf
      EndIf
   Next

   If cEmpty(wCTRL_Nome)
      If cEmpty(wFLT_Nome)
         wCTRL_Nome := wFRM_Nome
      Else
         wCTRL_Nome := wFLT_Nome
      EndIf
   EndIf

Return {wCTRL_Nome,wCTRL_Tp,wCTRL_Seq,wFRM_Nome}
*fim da Function __fSuper_Control()

function __fSuper_Control_Aux(wObjetoFLT,wxLen2,wx_Frm,wFLT_Nome)
***************************************************************************************
*                    Verifica os objetos das pastas e sub pastas                      * 
***************************************************************************************
Local wMatriz,wPasta,wx

   wMatriz   := {}

   For wx = 01 To wxLen2
      If __wMCase_Obj[wx_Frm][wx,__wObj_Tp] = "FLD"
         If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
            If __wMCase_Obj[wx_Frm][wx,__wobjeto]:oWnd:hWnd == wObjetoFLT:hWnd
              aAdd( wMatriz , {__wMCase_Obj[wx_Frm][wx,__wObj_Nome],__wMCase_Obj[wx_Frm][wx,__wObj_Seq],__wMCase_Obj[wx_Frm][wx,__wobjeto]})
            EndIf
         EndIf
      EndIf
   Next

   aSort(wMatriz,,,{|x,y| x[2] < y[2]})
   If Len(wMatriz)>0
      wPasta := 0

      For wx = 01 To wxLen2
         If __wMCase_Obj[wx_Frm][wx,__wObj_Tp] = "FLT"
            If ValType(__wMCase_Obj[wx_Frm][wx,__wobjeto]) = "O"
               If __wMCase_Obj[wx_Frm][wx,__wobjeto]:oWnd:hWnd == wMatriz[1,3]:hWnd
                  wPasta := wPasta + 1
                  If wMatriz[1,3]:nOption = wPasta
                     wFLT_Nome := __fSuper_Control_Aux(__wMCase_Obj[wx_Frm][wx,__wobjeto],wxLen2,wx_Frm,__wMCase_Obj[wx_Frm][wx,__wObj_Nome])
                     Exit
                  EndIf
               EndIf
            EndIf
         EndIf
      Next
   EndIf

Return wFLT_Nome
*fim da Function __fSuper_Control_Aux()

function __fSuper_AddTree(oTree,wObj_Nome,wObj_FRM)
***************************************************************************************
*                    Adciona Itens a Arvore do Editor de Programa                     * 
***************************************************************************************
Local oItem,wWhere,wx,wy,wResp,wObjNome,wObjTp,wObjItem,wObjPai,oXItem,wMTree,oItemFRM,wObjSeq,wImage,wMObjNome
   
   oItemFRM := oTree:Add(wObj_FRM)
   oItemFRM:Cargo := {1,wObj_FRM,"FRM","","",1}

   wMTree    := {}
   wWhere    :=          " Obj_Nome Like " + Campo(wObj_FRM+".%")
   wWhere    := wWhere + " And Obj_Tp <> " + Campo("PRC")
   wMObjNome := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Tp","Obj_Seq","'A'","0"},wWhere,"Obj_Nome")
   For wx := 01 To Len(wMObjNome)
      wMObjNome[wx,1] := AllTrim(cNvl(wMObjNome[wx,1],""))
      wMObjNome[wx,2] := cUpper(AllTrim(cNvl(wMObjNome[wx,2],"")))
      wMObjNome[wx,3] :=                cNvl(wMObjNome[wx,3],00)
      wMObjNome[wx,4] := SubStr(wMObjNome[wx,1],1,rAt(".",wMObjNome[wx,1])-1) //cSuper_Obj_Pai(wMObjNome[wx,1])
      wMObjNome[wx,5] := cAtQtd(wMObjNome[wx,1],".")
      If wMObjNome[wx,5]=1
         aAdd( wMTree , { wMObjNome[wx,1] , wMObjNome[wx,2] , wMObjNome[wx,3] , wMObjNome[wx,4]})
      EndIf
   Next
   aSort(wMTree,,,{|x,y| x[3] < y[3]})

   For wx := 01 To Len(wMTree)
      wObjItem := SubStr(wMTree[wx,1],rAt(".",wMTree[wx,1])+1)

      if     wMTree[wx,2]="FLD"
         wImage := 1
      ElseIf wMTree[wx,2]="FLT"
         wImage := 2
      ElseIf wMTree[wx,2]="GRD"
         wImage := 3
      ElseIf wMTree[wx,2]="GET"
         wImage := 4
      ElseIf wMTree[wx,2]="BTN"
         wImage := 5 
      ElseIf wMTree[wx,2]="FME"
         wImage := 6 
      ElseIf wMTree[wx,2]="SAY"
         wImage := 7 
      Else
         wImage := 0
      EndIf

      oItem := oItemFRM:Add(wObjItem , wImage )
      oItem:Cargo := {2,wMTree[wx,1],wMTree[wx,2],wMTree[wx,4],wx,wMTree[wx,3]}

      If At(wMTree[wx,1],wObj_Nome)>0
         oItemFRM:Expand()
         oTree:Select(oItem)
      EndIf

      __fSuper_AddTree_Aux(wObj_Nome,oTree,oItem,wMTree[wx,1],wMObjNome,2)
   Next
   oTree:Refresh()

Return .T.
* fim da function __fSuper_AddTree(oTree,wObj_Nome)

function __fSuper_AddTree_Aux(wObj_Nome,oTree,oTreeItem,wpObj_Pai,wMObjNome,wNivel)
***************************************************************************************
*                    Adciona Itens a Arvore do Editor de Programa                     * 
***************************************************************************************
Local oItem,wx,wMTree,wObjNome,wObjTp,wObjSeq,wObjPai,wObjItem,wImage

   wMTree := {}
   For wx := 01 To Len(wMObjNome)
      wObjNome := wMObjNome[wx,1]
      wObjPai  := wMObjNome[wx,4]

      If wMObjNome[wx,5]=wNivel .And. wObjPai=wpObj_Pai
         aAdd(wMTree,{wObjNome,wMObjNome[wx,2],wMObjNome[wx,3],wObjPai})
      EndIf
   Next
   aSort(wMTree,,,{|x,y| x[3]<y[3]})

   wx := 00
   For wx := 01 To Len(wMTree)
      wObjItem := SubStr(wMTree[wx,1],rAt(".",wMTree[wx,1])+1)

      if     wMTree[wx,2]="FLD"
         wImage := 1
      ElseIf wMTree[wx,2]="FLT"
         wImage := 2
      ElseIf wMTree[wx,2]="GRD"
         wImage := 3
      ElseIf wMTree[wx,2]="GET"
         wImage := 4
      ElseIf wMTree[wx,2]="BTN"
         wImage := 5 
      ElseIf wMTree[wx,2]="FME"
         wImage := 6
      ElseIf wMTree[wx,2]="SAY"
         wImage := 7
      Else
         wImage := 0
      EndIf

      oItem := oTreeItem:Add(wObjItem , wImage)
      oItem:Cargo := {wNivel+1,wMTree[wx,1],wMTree[wx,2],wMTree[wx,4],wx,wMTree[wx,3]}

      If At(wMTree[wx,1],wObj_Nome)>0
         oTreeItem:Expand()
         oTree:Select(oItem)
      EndIf

      __fSuper_AddTree_Aux(wObj_Nome,oTree,oItem,wMTree[wx,1],wMObjNome,wNivel+1)
   Next

Return .T.
* fim da function __fSuper_AddTree_Aux(oTree,wObjNome,wObjTp,wObjItem,wObjPai)

function __fSuper_Tree_PopUp(oTree,nRow,nCol)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wObj_Tree , wObj_Tp , wObj_Nome , oPopup , wObj_FRM , wPos

   wObj_Tree := oTree:GetSelected()
   wObj_Nome := wObj_Tree:Cargo[2]
   wObj_Tp   := wObj_Tree:Cargo[3]
   wPos := At(".",wObj_Nome)
   If wPos>0
      wObj_FRM := SubStr(wObj_Nome,1,wPos-1)
   Else
      wObj_FRM := wObj_Nome
   EndIf

   oPopup := MenuBegin( .T. )

   If wObj_Tp$"FRM.FLD.FLT.GRD"
      MenuAddItem( "Adiciona objeto"   ,,.F.,,{|oMenuItem| __fSuper_Obj_Add(wObj_Tp,wObj_Nome,wObj_Tree) },,,,,,,.F.,,{||.T.},.F.)
   EndIf

   If wObj_Tp<>"FRM"
      MenuAddItem( "Clona objeto"   ,,.F.,,{|oMenuItem| __fSuper_Obj_Clona(oTree,wObj_Nome,"OBJETO") },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem( "Exclui objeto"  ,,.F.,,{|oMenuItem| __fSuper_Obj_Del(wObj_Tree,wObj_Tp,wObj_Nome) },,,,,,,.F.,,{||.T.},.F.)
   Else
      MenuAddItem( "Clona Programa" ,,.F.,,{|oMenuItem| __fSuper_Obj_Clona(oTree,wObj_Nome,"PROGRAMA") },,,,,,,.F.,,{||.T.},.F.)
   EndIf
   MenuAddItem()
   If     wObj_Tp="FLD"
      MenuAddItem( "Monta cN_Fld(n)"     ,,.F.,,{|oMenuItem| __fSuper_Obj_Tool(1,wObj_Nome,wObj_FRM) },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem()
   ElseIf wObj_Tp="FLT"
      MenuAddItem( "Monta cN_Fld(n,m)"  ,,.F.,,{|oMenuItem| __fSuper_Obj_Tool(2,wObj_Nome,wObj_FRM,wObj_Tree:Cargo[5]) },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem()
   ElseIf wObj_Tp="GRD"
      MenuAddItem( "Sequência Grid "  ,,.F.,,{|oMenuItem| __fSuper_Obj_Tool(3,wObj_Nome,wObj_FRM) },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem()
      MenuAddItem( "Grid corrente: " + Str(wM_Grid_Seq[wG_Atual])  ,,.F.,,{|oMenuItem| .T. },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem()
   ElseIf wObj_Tp="GET"
      MenuAddItem( "Monta cV(coluna,grid)"  ,,.F.,,{|oMenuItem| __fSuper_Obj_Tool(4,wObj_Nome,wObj_FRM,wObj_Tree:Cargo[4]) },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem( "Monta cO(coluna,grid)"  ,,.F.,,{|oMenuItem| __fSuper_Obj_Tool(5,wObj_Nome,wObj_FRM,wObj_Tree:Cargo[4]) },,,,,,,.F.,,{||.T.},.F.)
      MenuAddItem()
   EndIf
   MenuAddItem( "Copia nome" ,,.F.,,{||__oClpMaster:Open(),__oClpMaster:Clear(),__oClpMaster:SetText(wObj_Nome)},,,,,,,.F.,,{||.T.},.F.)
   MenuAddItem( "Atualizar"  ,,.F.,,{|oMenuItem| __fSuper_Tree_Refresh(oTree)  },,,,,,,.F.,,{||.T.},.F.)

   MenuEnd()

   oPopup:Activate(nRow,nCol,oTree)

Return .T.
* fim da function __fSuper_Tree_PopUp(oTree)

function __fSuper_Obj_Clona(oTree,wObj_Nome,wOpcao)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wClonaObj,wResp,wInic,wSql,wReturn,wRelac,wObj_Tp,wObj_Seq,wObj_Dsc,wObj_Pai

   wClonaObj := Space(50)
   wRelac    := .T.

   wReturn := MsgGet( "Novo Programa","Nome do Programa:",@wClonaObj)
   If wReturn
      If .Not.cEmpty(wClonaObj)
         wClonaObj := AllTrim(wClonaObj)
         wClonaObj := __fCase_Obj_Nome_Config(wClonaObj)
         
         If wOpcao="OBJETO"
            wObj_Pai  := SubStr(wObj_Nome,1,rAt(".",wObj_Nome)-1)
            wClonaObj := wObj_Pai+"."+wClonaObj
         EndIf

         wResp := fConsulta2("cCase_Obj",{"0"},"Obj_Nome="+Campo(wClonaObj))
         If Len(wResp)>0
            MsgInfo("Nome do programa já cadastrado","Atenção")
            Return .F.
         Else
            wResp := fConsulta2("cCase_Obj",{"Obj_Tp","Obj_Seq","Obj_Dsc"},"Obj_Nome="+Campo(wObj_Nome))
            If Len(wResp)>0
               wObj_Tp  := wResp[1,1]
               wObj_Seq := wResp[1,2]
               wObj_Dsc := wResp[1,3]
            EndIf
         EndIf

         fInsert2("cCase_Obj",{"Obj_Nome",wClonaObj,"obj_tp",wObj_Tp,"Obj_Seq",wObj_Seq,"obj_dsc",wObj_Dsc},)
      
         wSql := "Insert Into cCase_Obj_Prp (Obj_Nome,Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo) "
         wSql := wSql + " Select " + Campo(wClonaObj)+",Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo"
         wSql := wSql + " From cCase_Obj_Prp Where Obj_Nome = " + Campo(wObj_Nome)
         cSql_Execute("cCase_Obj_Prp",wSql)

         If wOpcao="OBJETO"
            If MsgYesNo("Deseja clonar objetos relacionados?","Atenção")
               wRelac := .T.
            Else
               wRelac := .F.
            EndIf
         Else
            wRelac := .T.
         EndIf
         
         If wRelac
            wInic := Len(wObj_Nome)+1

            wSql := "Insert Into cCase_Obj (Obj_Nome,Obj_Tp,Obj_Seq,Obj_Dsc,Obj_Sts) "
            wSql := wSql + " Select ConCat("+Campo(wClonaObj)+",SubString(Obj_Nome,"+StrZero(wInic,3,0)+",300)),Obj_Tp,Obj_Seq,Obj_Dsc,'1' "
            wSql := wSql + " From cCase_Obj Where Obj_Nome Like " + Campo(wObj_Nome+".%")
            cSql_Execute("cCase_Obj",wSql)
            
            wSql := "Insert Into cCase_Obj_Prp (Obj_Nome,Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo)"
            wSql := wSql + " Select ConCat(" + Campo(wClonaObj) + ",SubString(Obj_Nome," + StrZero(wInic,3,0) + ",300)),Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo"
            wSql := wSql + " From cCase_Obj_Prp Where Obj_Nome Like " + Campo(wObj_Nome+".%")
            cSql_Execute("cCase_Obj_Prp",wSql)
         EndIf

         MsgInfo("Clonagem realizada com sucesso!","Atenção")

         If wOpcao="OBJETO"
            __fSuper_Tree_Refresh(oTree)
         Else
            __fSuper_Tree_Refresh(oTree,wClonaObj)
         EndIf
      Else
         MsgInfo("Nome do programa não informado","Atenção")
         Return .F.
      EndIf
   EndIf

Return .T.
* fim da function __fSuper_Obj_Clona()

function __fSuper_Obj_Tool(wOpcao,wObj_Nome,wObj_FRM,wParm)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wComando,wResp,wx,wGrid,wObj_Prp_Vlr

   wComando := Space(00)

   If     wOpcao=1
      wComando := "cN_Fld(Len(oM_Folder))"
   ElseIf wOpcao=2
      wComando := "cN_Fld(Len(oM_Folder),"+AllTrim(Str(wParm))+")"
   ElseIf wOpcao=3
      wResp := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Seq"},"Obj_Nome like "+Campo(wObj_FRM+".%")+" And Obj_Tp='GRD'","Obj_Seq")

      For wx := 01 To Len(wResp)
         wResp[wx,1] := Lower(AllTrim(wResp[wx,1]))
         If wResp[wx,1]==Lower(wObj_Nome)
            wComando := wComando + "--> "
         EndIf
         wComando := wComando + wResp[wx,1]+" ("+AllTrim(Str(wResp[wx,2]))+"): " + AllTrim(Str(wx)) + CHR(13)+CHR(10)
      Next

      MsgInfo(wComando)
      Return .T.

   ElseIf wOpcao=4 .Or. wOpcao=5
      wResp := fConsulta2("cCase_Obj",{"Obj_Nome"},"Obj_Nome like "+Campo(wObj_FRM+".%")+" And Obj_Tp='GRD'","Obj_Seq")
      wGrid := 0
      For wx := 01 To Len(wResp)
         If Lower(AllTrim(wResp[wx,1]))==Lower(wParm)
            wGrid := wx
         EndIf
      Next

      If cEmpty(wGrid)
         wGrid := Len(wM_Case)
      EndIf

      wResp := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr"},"Obj_Nome="+Campo(wObj_Nome)+" And Prp_Nome='NOME_COLUNA'")
      If Len(wResp)>0
         wObj_Prp_Vlr := AllTrim(wResp[1,1])
         If wOpcao=4
            wComando := 'cV("'+wObj_Prp_Vlr+'",'+AllTrim(Str(wGrid))+')'
         Else
            wComando := 'cO("'+wObj_Prp_Vlr+'",'+AllTrim(Str(wGrid))+')'
         EndIf
      Else
         If wOpcao=4
            wComando := 'cV("",'+AllTrim(Str(wGrid))+')'
         Else
            wComando := 'cO("",'+AllTrim(Str(wGrid))+')'
         EndIf
      Endif
   EndIf
   __oClpMaster:Open()
   __oClpMaster:Clear()
   __oClpMaster:SetText(wComando)

Return .T.
* fim da function __fSuper_Obj_Tool(wOpcao,wObj_Nome)

function __fSuper_IDETree_Key(oTree,nKey)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wObj_Tree , wObj_Tp , wObj_Nome

   If     nKey=13
      __fSuper_Tree_PopUp(oTree,1,1)
   ElseIf nKey=46
      wObj_Tree := oTree:GetSelected()
      wObj_Nome := wObj_Tree:Cargo[2]
      wObj_Tp   := wObj_Tree:Cargo[3]

      __fSuper_Obj_Del(wObj_Tree,wObj_Tp,wObj_Nome)
   EndIf

Return nil
* fim da function __fSuper_IDETree_Key(oTree,nKey)

function __fSuper_IDE_Prp_Grid(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)
***************************************************************************************
*                    Monta Grid com Propriedades e Valores do Objeto                  *
***************************************************************************************
Local oBrw,wMatriz,oTab,wnLen,wcLen,wBrwCampos,wBrwLen,wColorT,wColorB,wClick,wResp

   aAdd(__wMCase_IDE_Obj,{"","","","","","","",""})

   oBrw := TWBrowse():New( wLinha,wColuna,wAltura,wLargura, , {"Propriedade","Valor"} , {130,500} , wObjRef ,,,,,,, oFont ,,,, "1" , .F.,, .T.,, .F.,,, )
   oBrw:nAt := 01

   __wc_IDE_ObjPrp := oBrw

   oBrw:bLine     := {||{__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,1],__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,2]}}
   oBrw:cAlias    := "ARRAY"
   oBrw:bLogicLen := { || Len(__wMCase_IDE_Obj) }
   oBrw:bGoTop    := { || oBrw:nAt := 01 }
   oBrw:bGoBottom := { || oBrw:nAt := Eval( oBrw:bLogicLen,oBrw) }
   oBrw:aJustIfy  := {.F.,.F.}
   oBrw:bSkip     := {|nwant,nOld| nOld:=oBrw:nAt,oBrw:nAt+=nwant,oBrw:nAt:=Min(Max(oBrw:nAt,1),Eval(oBrw:bLogicLen,oBrw)) , oBrw:nAt-nOld }

   oBrw:bLDblClick    := { || __fSuper_IDE_Prp_Edit() }
   oBrw:bkeydown      := { | nKey, nFlags | iIf(nKey=13,__fSuper_IDE_Prp_Edit(),) }

// oBrw:nClrText      := { || iif(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,5]="S",cColorText("VERMELHO"),cColorText("PRETO" )) }
// oBrw:nClrForeFocus := { || iif(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,5]="S",cColorText("VERMELHO"),cColorText("BRANCO")) }
   
   oBrw:nClrBackHead  := {|| cColorText("BRANCO")}    // Cor de Fundo do HEADER (Cabecalho)
   oBrw:nClrForeHead  := {|| cColorText("AZUL")  }    // Cor do Texto do HEADER (Cabecalho)
   oBrw:nLineStyle    := 8

   oBrw:bRClicked     := {|nRow,nCol,nKeyFlags,Self| iif(__wc_IDE_ObjTab:aPrompts[__wc_IDE_ObjTab:nOption]='codebloco',__fSuper_IDE_Prp_Procedure(nRow,nCol,Self,oTree,"__wMCase_IDE_Obj"),)}

   wLinha   := oBrw:nTop+oBrw:nHeight+1
   wColuna  := oBrw:nLeft
   wLargura := oBrw:nWidth

   oTab := TTabs():New(wLinha,wColuna,{""}     ,{|nOption|__fSuper_IDE_Prp_Tab_Grupo(nOption,oTree)},wObjRef,       ,cColorText("PRETO"),        ,.T.   ,.F.     ,wLargura,18      ,     )
         // METHOD New( nTop , nLeft , aPrompts, bAction                                            ,oWnd   ,nOption,nClrFore           ,nClrBack,lPixel, lDesign,nWidth  , nHeight,cMsg ) CONSTRUCTOR
   __wc_IDE_ObjTab := oTab

Return .T.
* fim da function __fSuper_IDE_Prp_Grid(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)

function __fSuper_IDE_Prp_Var(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)
***************************************************************************************
*                    Monta Grid com Propriedades e Valores do Objeto                  *
***************************************************************************************
Local oBrw,wMatriz,oTab,wnLen,wcLen,wBrwCampos,wBrwLen,wColorT,wColorB,wClick,wResp

   aAdd(__wMCase_IDE_Var,{"","","","",""})

   oBrw := TWBrowse():New( wLinha,wColuna,wAltura,wLargura, , {"Variável","Tipo","Valor","Tp.C","Obj_Nome"} , {150,25,150,25,500} , wObjRef ,,,,,,, oFont ,,,, "1" , .F.,, .T.,, .F.,,, )
   oBrw:nAt := 01

   __wc_IDE_ObjVar := oBrw

   oBrw:bLine     := {||{__wMCase_IDE_Var[__wc_IDE_ObjVar:nAt,1],;
                         __wMCase_IDE_Var[__wc_IDE_ObjVar:nAt,2],;
                         __wMCase_IDE_Var[__wc_IDE_ObjVar:nAt,3],;
                         __wMCase_IDE_Var[__wc_IDE_ObjVar:nAt,4],;
                         __wMCase_IDE_Var[__wc_IDE_ObjVar:nAt,5]}}
   oBrw:cAlias    := "ARRAY"
   oBrw:bLogicLen := { || Len(__wMCase_IDE_Var) }
   oBrw:bGoTop    := { || oBrw:nAt := 01 }
   oBrw:bGoBottom := { || oBrw:nAt := Eval( oBrw:bLogicLen,oBrw) }
   oBrw:aJustIfy  := {.F.,.F.,.F.,.F.,.F.}
   oBrw:bSkip     := {|nwant,nOld| nOld:=oBrw:nAt,oBrw:nAt+=nwant,oBrw:nAt:=Min(Max(oBrw:nAt,1),Eval(oBrw:bLogicLen,oBrw)) , oBrw:nAt-nOld }

//   oBrw:nClrBackHead  := {|| cColorText("BRANCO")}    // Cor de Fundo do HEADER (Cabecalho)
//   oBrw:nClrForeHead  := {|| cColorText("AZUL")  }    // Cor do Texto do HEADER (Cabecalho)
//   oBrw:nLineStyle    := 8

   oBrw:bRClicked := {|nRow,nCol,nKeyFlags,Self| __fSuper_IDE_Prp_Var_PopUp(nRow,nCol,Self)}
   
   TButton():New(oBrw:nTop+oBrw:nHeight+3,oBrw:nLeft,"&Atualizar",wObjRef,{||__fSuper_IDE_MudaFolder(2)},70,20,,,.F.,.T.,.F.,,.F.,,,.F. )

Return .T.
* fim da function __fSuper_IDE_Prp_Var(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)

function __fSuper_IDE_Prp_Var_PopUp(nRow,nCol,oBrw)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wValor,oPopup,wCol,wMenu

   wCol := oBrw:nAtCol(nCol)

   If     wCol=1
      wMenu := "Copiar nome da coluna"
   ElseIf wCol=3 
      wMenu := "Copiar valor da variável"
   ElseIf wCol=5
      wMenu := "Copiar nome do objeto"
   Else
      Return .F.
   EndIf

   wValor := __wMCase_IDE_Var[oBrw:nAt,wCol]

   oPopup := MenuBegin(.T.)
   MenuAddItem( wMenu ,,.F.,,{||__oClpMaster:Open(),__oClpMaster:Clear(),__oClpMaster:SetText(wValor)},,,,,,,.F.,,{||.T.},.F.)
   MenuEnd()
   oPopup:Activate(nRow,nCol,oBrw)

Return .T.
* fim da function __fSuper_IDE_Prp_Procedure(nRow,nCol,oBrw,oTree)


function __fSuper_IDE_Prp_Cmd(wLinha,wColuna,wLargura,wAltura,wObjRef)
***************************************************************************************
*                    Monta Grid com Propriedades e Valores do Objeto                  *
***************************************************************************************
Local oMemo
Public __wdbg_MemoCmd := ""

   oMemo  := TMultiGet():New(wLinha,wColuna,{|u| If( PCount()==0,__wdbg_MemoCmd,__wdbg_MemoCmd:=u)},wObjRef,wLargura,wAltura,oFontMemo,.T.     ,        ,        ,       ,.T.   ,    ,.F.    ,     ,.F.    ,.F.   ,.F.      ,      ,        ,.F.    ,          )
            //   METHOD New(nRow   ,nCol   ,bSetGet                                                ,oWnd   ,nWidth  ,nHeight,oFont    ,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR

   TButton():New(oMemo:nTop+oMemo:nHeight+3,oMemo:nLeft,"&Executa",wObjRef,{||__fSuper_IDE_Prp_CmdExe()},70,20,,,.F.,.T.,.F.,,.F.,,,.F. )

Return .T.
* fim da function __fSuper_IDE_Prp_Cmd(wLinha,wColuna,wLargura,wAltura,wObjRef)

function __fSuper_IDE_Prp_CmdExe()
***************************************************************************************
*                    Monta Grid com Propriedades e Valores do Objeto                  *
***************************************************************************************
Local _wWork01,_wWork02

   _wWork01 :=  Alltrim(__wdbg_MemoCmd)
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

      __wdbg_MemoCmd := "? " + _wWork01 + chr(13)+chr(10) + _wWork02
   Else
      &_wWork01
   EndIf

Return .T.
* fim da function __fSuper_IDE_Prp_CmdExe()

function __fSuper_DBG_Atrib(wOpcao,oBrw,wMatrixAtrib)
****************************************************************************
*                                                                          *
****************************************************************************
Local wWork,wGrid,wx,wLen,wMDados

   wMDados := {}   

   If wOpcao = 1
      wLen  := Len(wdbg_MProc)

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

      For wx = 01 to wLen
         aAdd(wMDados, {wdbg_MVar[wx,1],wdbg_MVar[wx,2],wdbg_MVar[wx,3]} )
      Next
   EndIf
             
   If Len(wMDados)>0
      &(wMatrixAtrib) := wMDados 
   Else
      &(wMatrixAtrib) := {}
      If wOpcao = 1
         aAdd( &(wMatrixAtrib) , {0,Space(0)})
      EndIf
      If wOpcao = 2
         aAdd( &(wMatrixAtrib) , {Space(0),Space(0),Space(0)})
      EndIf
   EndIf

   oBrw:GoTop()
   Eval( oBrw:bChange )

   oBrw:Click()
   oBrw:Refresh()
   oBrw:SetFocus()

Return .T.
*fim da function __fSuper_DBG_Atrib(wOpcao)

//////////function __fSuper_IDE_Prp_Scan(wObj_Nome)
//////////***************************************************************************************
//////////*                    Verifica se grid de propriedades ja esta aberto                  *
//////////***************************************************************************************
//////////Local wFRM_Nome,wPos
//////////
//////////   wObj_Nome := cLower(AllTrim(wObj_Nome))
//////////   wFRM_Nome := cSuper_Obj_Pai(wObj_Nome,"FRM")
//////////   wPos := cScan(_wMSuper_IDE , wFRM_Nome , 6 )
//////////
//////////Return wPos
//////////* fim da function __fSuper_IDE_Prp_Scan(_wObj_Nome)
//////////
//////////function __fSuper_IDE_Prp_Del(wTipo,wPos_IDE,oWindow,wMDel)
//////////***************************************************************************************
//////////*                          Controla nível de telas IDE                                *
//////////***************************************************************************************
//////////Local wResp,wLen,wx
//////////
//////////   If wPos_IDE>0
//////////      If wTipo=1
//////////         _wMSuper_IDE[wPos_IDE,2]:End() // oBrw
//////////         _wMSuper_IDE[wPos_IDE,3]:End() // oTab
//////////         _wMSuper_IDE[wPos_IDE,4]:End() // oTree 
//////////         wLen := Len(_wMSuper_IDE)
//////////         aDel(_wMSuper_IDE,wPos_IDE)
//////////         aSize(_wMSuper_IDE,wLen-1)
//////////      Else
//////////         _wMSuper_IDE[wPos_IDE,7] := .F.
//////////      EndIf
//////////   EndIf
//////////
//////////   If ValType(oWindow)="O"
//////////      For wx := 01 To Len(oWindow:aControls)
//////////         If ValType(oWindow:aControls[wx])="O"
//////////            oWindow:aControls[wx]:End()
//////////         EndIf
//////////      Next
//////////      wx:=0
//////////      wMDel := cNvl(wMDel,{})
//////////      For wx := 01 To Len(wMDel)
//////////         If ValType(wMDel[wx])="O"
//////////            wMDel[wx]:End()
//////////         EndIf
//////////      Next
//////////   EndIf
//////////
//////////Return .T.
//////////* fim da function __fSuper_IDE_Prp_Del(wTipo,wPos_IDE)

function __fSuper_IDE_Prp_Procedure(nRow,nCol,oBrw,oTree,wMatriz)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wObj_Nome,wPrp_Nome,wProcedure,oPopup,wObj_Prp_Vlr

   wObj_Nome := oTree:GetSelected():Cargo[2]
   If cEmpty(wObj_Nome)
      return .f.
   EndIf

   wPrp_Nome    := &(wMatriz)[oBrw:nAt,1]
   wObj_Prp_Vlr := &(wMatriz)[oBrw:nAt,2]
   
   oPopup := MenuBegin(.T.)
   MenuAddItem( "Abrir Procedure",,.F.,,{||__fSuper_Prc(wObj_Nome,wPrp_Nome,wObj_Prp_Vlr)},,,,,,, .F.,,, .F. )
   MenuEnd()
   oPopup:Activate(nRow,nCol,oBrw)

Return .T.
* fim da function __fSuper_IDE_Prp_Procedure(nRow,nCol,oBrw,oTree)

function __fSuper_IDE_Prp_Itens(wObj_Nome,wObj_Tp,wOpcaoTab)
**************************************************************************************
*  "Prp_Nome"         -  01 Nome da Propriedade                                      *
*  "Prp_Obj_Lst"      -  02 Lista de Objeto que a propriedade atende                 *
*  "Prp_Obj_Lst_Req"  -  03 Lista de Objetos que a Propriedade é Obrigatória         *
*  "Prp_Get_Pct"      -  04 Picture da Propriedade                                   *
*  "Prp_Cmb_Lst"      -  05 Dominio correspondente da Propriedade                    *
*  "Prp_Get_Dft"      -  06 Valor inicial da Propriedade                             *
*  "Prp_Grp"          -  07 Grupo de Propriedades                                    *
*  "Prp_Seq"          -  08 Sequencia da Propriedade                                 *
*  "Prp_Type"         -  09 Tipo da Propriedade                                      *
**************************************************************************************
Local wPrpPos,wx,wPos,wValor,wSql,wVlrDom,wy,wDominio,wPosX,wMatriz,wPos_IDE,wPrp_Grp,wPrp_Nome,wMObjPrp,wObj_Pai,wObj_Filho,wObj_Seq,wResp

   __wMCase_IDE_Obj := {}
   aSize(__wMCase_IDE_Obj,0)

   If cEmpty(wOpcaoTab).Or.wOpcaoTab>Len(__wc_IDE_ObjTab:aPrompts)
      wOpcaoTab := 1
      __wc_IDE_ObjTab:SetOption(1)
   EndIf

   wPrp_Grp := __wc_IDE_ObjTab:Cargo[wOpcaoTab,2]

   wResp := fConsulta2("cCase_Obj",{"Obj_Seq"},"Obj_Nome = " + Campo(wObj_Nome))
   If Len(wResp)>0
      wObj_Seq := wResp[1,1]
   Else
      wObj_Seq := 0
   EndIf

   aAdd( __wMCase_IDE_Obj, {"OBJ_SEQ"         ,;
                            __FCGFC(wObj_Seq) ,;
                            "N"               ,; //03 Tipo da Coluna
                            "9999999"         ,; //04 Picture
                            ""                ,; //05 Dominio correspondente
                            "S"               ,; //06 Propriedade Requerida
                            wObj_Nome         ,; //07 Nome do Objeto 
                            wObj_Tp           }) //08 Tipo do Objeto

   wPos := rAt(".",wObj_Nome)
   If wPos>0
      wObj_Pai   := SubStr(wObj_Nome,1,wPos-1)
      wObj_Filho := SubStr(wObj_Nome,wPos+1)
   Else
      wObj_Filho := wObj_Nome
   EndIf
   wPos := 0

   wSql :=        " Select cCase_Prp.Prp_Nome,Obj_Prp_Vlr From cCase_Obj_Prp,cCase_Prp "
   wSql := wSql + " Where cCase_Obj_Prp.Prp_Nome = cCase_Prp.Prp_Nome "
   wSql := wSql + " And   Obj_Nome = " + Campo(wObj_Nome)
   wSql := wSql + " And   Prp_Grp  = " + Campo(wPrp_Grp)
   wSql := wSql + " And   RTrim(Obj_Prp_Vlr) <> " + Campo("")  // ciceroSQL
   wMObjPrp := fConnect_Tabela( "cCase_Prp" , wSql )

   For wx := 01 To Len(__wMCase_IDE_Prp)
      If At(wObj_Tp,__wMCase_IDE_Prp[wx,2])>0 .And. __wMCase_IDE_Prp[wx,7]==wPrp_Grp

         wPrp_Nome := __wMCase_IDE_Prp[wx,1]
         
         If     wPrp_Nome=="OBJ_NOME"
            wValor := wObj_Filho
         ElseIf wPrp_Nome=="OBJ_NOME_PAI"
            wValor := wObj_Pai
         ElseIf wPrp_Nome=="OBJ_SEQ"
            wValor := Str(wObj_Seq,7,0)
         Else
            wPos := cScan( wMObjPrp , wPrp_Nome , 01 )
            If wPos>0
               wValor := AllTrim(wMObjPrp[wPos,2])
            Else
               wValor := __FCGFC(__wMCase_IDE_Prp[wx,6],__wMCase_IDE_Prp[wx,4])
            EndIf

            If .Not.cEmpty(__wMCase_IDE_Prp[wx,5]) .And. .Not.cEmpty(wValor)
               wDominio := cDominio(__wMCase_IDE_Prp[wx,5])
               If ValType(wDominio)="A"
                  For wy := 01 To Len(wDominio)
                     wVlrDom := AllTrim(wDominio[wy])
                     wPosX := At(".",wVlrDom)
                     If wPosX>0
                        If SubStr(wVlrDom,1,wPosX-1)=AllTrim(wValor)
                           wValor := AllTrim(wDominio[wy])
                           Exit
                        EndIf
                     Else
                        If wVlrDom==wValor
                           wValor := wVlrDom
                           Exit
                        EndIf
                     EndIf
                  Next
               EndIf
            EndIf
         EndIf
  
         wPrp_Nome := cLower(wPrp_Nome)
         aAdd( __wMCase_IDE_Obj, {wPrp_Nome                       ,; //01 Nome da Propriedade
                                  wValor                          ,; //02
                                  cNvl(__wMCase_IDE_Prp[wx,9],"") ,; //03 Tipo da Coluna
                                  cNvl(__wMCase_IDE_Prp[wx,4],"") ,; //04 Picture
                                  cNvl(__wMCase_IDE_Prp[wx,5],"") ,; //05 Dominio correspondente
                                  "N"                             ,; //06 Propriedade Requerida
                                  wObj_Nome                       ,; //07 Nome do Objeto 
                                  wObj_Tp                         }) //08 Tipo do Objeto
      EndIf
   Next

   If Len(__wMCase_IDE_Obj)=0
      aAdd( __wMCase_IDE_Obj , {"","","","","","N",wObj_Nome,wObj_Tp})
   EndIf
  
   __wc_IDE_ObjPrp:GoTop()
   __wc_IDE_ObjPrp:Refresh()

Return .T.
* fim da function __fSuper_IDE_Prp_Itens(_wObj_Nome,wObj_Tp)

function __fSuper_IDE_Prp_TabGrp(wObj_Tp,wObjeto)
***************************************************************************************
*                  Atualiza sub-pastas com Grupos de Propriedade                      *
***************************************************************************************
Local wMPrpGrp,wMTabs,wPrpPos,wx,oTab,wAntTab,wTabNew,wOpcao,wResp,wPrp_Grp,wChar,wOrder,wMM

   wMM     := {}
   wAntTab := ""

   If ValType(wObjeto)="O"
      If Len(wObjeto:aPrompts)>0
         wAntTab := wObjeto:aPrompts[wObjeto:nOption]
      EndIf
   EndIf

   wMPrpGrp := fConnect_Tabela( "cCase_Prp" , "Select distinct prp_grp from ccase_prp where prp_obj_lst like "+Campo("%"+wObj_Tp+"%") )
   For wx := 01 To Len(wMPrpGrp)
      
      wMPrpGrp[wx,1] := AllTrim(wMPrpGrp[wx,1])

      wPrp_Grp := Lower(wMPrpGrp[wx,1])
      wChar := SubStr(wPrp_Grp,1,1)
      If Asc(wChar) >= 48 .And. Asc(wChar) <= 57
         wPrp_Grp := SubStr(wPrp_Grp,2)
      EndIf

      If     wPrp_Grp=="geral"
         wOrder := "10"
      ElseIf wPrp_Grp=="dimensao"
         wOrder := "20"
      ElseIf wPrp_Grp=="controle"
         wOrder := "30"
      ElseIf wPrp_Grp=="display"
         wOrder := "40"
      ElseIf wPrp_Grp=="tabela"
         wOrder := "50"
      ElseIf wPrp_Grp=="codebloco"
         wOrder := "60"
      ElseIf wPrp_Grp=="relatorio"
         wOrder := "70"
      ElseIf wPrp_Grp=="dominio"
         wOrder := "80"
      ElseIf wPrp_Grp=="font"
         wOrder := "85"
      ElseIf wPrp_Grp=="login"
         wOrder := "90"
      Else
         wOrder := "99"
      EndIf

      aAdd( wMM, {wOrder+wPrp_Grp,wMPrpGrp[wx,1]} )
   Next

   wPrp_Grp := Space(00)
   wMTabs   := {}
   aSort(wMM,,,{|x,y| x[1] < y[1] })
   For wx := 01 To Len(wMM)
      wTabNew := AllTrim(SubStr(wMM[wx,1],3))

      aAdd( wMTabs , wTabNew )

      If wTabNew==wAntTab .Or. wx=1
         wOpcao := wx
      EndIf
   Next

   wObjeto:SetTabs(wMTabs,wOpcao)
   wObjeto:Cargo := wMM

Return wOpcao
* fim da function __fSuper_IDE_Prp_TabGrp()

function __fSuper_Tree_Change(oTree)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wObj_Tree , wObj_Tp , wObj_Nome , wObj_Seq

   wObj_Tree := oTree:GetSelected()
   wObj_Nome := wObj_Tree:Cargo[2]
   wObj_Tp   := wObj_Tree:Cargo[3]

   wObj_Seq  := wObj_Tree:Cargo[6]

   __wc_IDE_objeto:SetText(wObj_Tp+"-"+StrZero(wObj_Seq,7,0)+"-"+wObj_Nome)

   __fSuper_IDE_Prp_Itens(wObj_Nome,wObj_Tp,__fSuper_IDE_Prp_TabGrp(wObj_Tp,__wc_IDE_ObjTab))

Return .T.
* fim da function __fSuper_Tree_Change(oTree)

////////function fSuper_Var_Atrib(wObj_Nome,wObj_Tp)
////////***************************************************************************************
////////*                    Atribui na Variaveis os Controles de Objeto                      *
////////***************************************************************************************
////////Local wObjFLD,wObjFLT,wMM,wMatriz,wNivel,wObjNomeX,wx,wy,wxLen,wObjTpX,wObjeto
////////
////////   If  wObj_Tp = "FLD" .or. wObj_Tp = "FLT"
////////      wMM       := {}
////////      wMatriz   := cSuperEstru(wObj_Nome)
////////      wNivel    := wMatriz[2]
////////      wObjNomeX := Space(00)
////////      wxLen     := Len(wNivel)
////////
////////      For wx := 1 To wxLen
////////         wObjNomeX := wObjNomeX + iIf(wx=1,"",".") + wNivel[wx]
////////         If wx=1
////////            Loop
////////         EndIf
////////         wObjTpX := cSuper_Obj_Tp(wObjNomeX)
////////
////////         If wObjTpX="FLD"
////////            wMM := cNvl(cSuper(wObjNomeX,_wP_CONTEUDO),{})
////////            wObjeto := cSuper_Obj2(wObjNomeX)
////////            If wx = wxLen .And. ValType(wObjeto)="O"
////////               wObjeto:SetOption(1)
////////            EndIf
////////         EndIf
////////
////////         If wObjTpX="FLT"
////////            For wy := 01 To Len(wMM)
////////               If wMM[wy]=wObjNomeX
////////                  wObjeto:SetOption(wy)
////////                  Exit
////////               EndIf
////////            Next
////////         EndIf                                                   
////////      Next
////////   EndIf
////////
////////Return .T.
////////* fim da function fSuper_Var_Atrib(wObj_Nome,wObj_Tp)

function __fSuper_IDE_Prp_Edit()
**************************************************************************************
* 01 - Nome da Propriedade                                                           *
* 02 - Valor                                                                         *
* 03 - Tipo da Coluna                                                                *
* 04 - Picture                                                                       *
* 05 - Dominio correspondente                                                        *
* 06 - Propriedade Requerida                                                         *
* 07 - Nome do Objeto                                                                *
* 08 - Tipo do Objeto                                                                *
**************************************************************************************
Local wx,wDominio,wPrp_Type,wPrp_Pct,wPrp_Dom,wRequerido,oDlg,oGet,wRight,wLargura,wAltura,wLenPic
Local wObj_Nome,wBytes,wXBytes,wxLargura,wPropriedade,wObj_Tp,wTable,wValid_Lst,wPesqRelac,wDecPic
Local wObj_Prp_Var,_wObj_Prp_Help,wTexto,oGFlag1,wFlag1,wLen,wMatriz,oBrw,oBtn,oMmo,wPos
Local wObjeto_Dat,wColumn,wPesquisa,wReturn,wGrupo,wPosicao,oSay,oRad,wObj_Pai,oLbx,oWndLstVld

   wGrupo  := __wc_IDE_ObjTab:aPrompts[__wc_IDE_ObjTab:nOption]
   wLenPic := 0
   wDecPic := 0

   _wObj_Prp_Help := Space(500)
   wLargura       := 00

   wPrp_Type  := AllTrim(cNvl(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,3],"C"))
   wPrp_Pct   := AllTrim(cNvl(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,4],""))
   wPrp_Dom   := AllTrim(cNvl(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,5],""))
   wRequerido := AllTrim(cNvl(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,6],""))
   wObj_Nome  := AllTrim(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,7])
   wObj_Tp    := __wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,8]

   If wPrp_Type = "N"
      wRight       := .T.
      wObj_Prp_Var := __wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,2]
      If ValType(wObj_Prp_Var)="C"
         wObj_Prp_Var := Val(wObj_Prp_Var)
      EndIf
      wLargura     := GetTextWidth(,wPrp_Pct) //c_Pixel_Len(wPrp_Pct)*2
      If .Not.cEmpty(wPrp_Pct)
         wLenPic := Len(wPrp_Pct)

         wPos := At(".",wPrp_Pct)
         If wPos>0
            wDecPic := Len(SubStr(wPrp_Pct,wPos+1))
         Else
            wDecPic := 0
         EndIf
      EndIf
   Else
      wRight       := .F.
      wObj_Prp_Var := __wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,2]+Space(252)
   EndIf

   wPropriedade := Upper(AllTrim(__wMCase_IDE_Obj[__wc_IDE_ObjPrp:nAt,1]))

//   If wGrupo="funcao" .Or. wPropriedade = _wP_WHEN_DEFAULT
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "0 - Inativo")
//      aAdd( wDominio , "1 - Ativo"  )
//   ElseIf wPropriedade = _wP_GERACONTEUDO
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio ,"0 - Carrega vazio")
//      aAdd( wDominio ,"1 - Carrega quando visualizado")
//      aAdd( wDominio ,"2 - Carrega na abertura do Programa")
//      aAdd( wDominio ,"3 - Não Carrega")
//      aAdd( wDominio ,"4 - Sempre atualiza o Grid")
//      aAdd( wDominio ,"5 - Atributos do item 1 mas não posteriores")
     If wPropriedade = "OBJ_NOME_PAI"
        wPrp_Dom := "X"
        If     wObj_Tp="GET"
           wDominio := __fSuper_Obj_Lista(wObj_Nome,"FRM#FLT#GRD")
        ElseIf wObj_Tp="FLT"
           wDominio := __fSuper_Obj_Lista(wObj_Nome,"FLD")
        ElseIf     wObj_Tp$"GRD#SAY#FME#BTN"
           wDominio := __fSuper_Obj_Lista(wObj_Nome,"FRM#FLT")
        Else
           Return .F.
        EndIf
        wxLargura := 800
//   ElseIf wPropriedade = _wP_OBJ_DESLOC
//      wPrp_Dom := "X"
//      wObj_Pai := cSuper_Obj_Pai(wObj_Nome)
//      wDominio := __fSuper_Obj_Lista(wObj_Nome,"GRD#GET#FME",wObj_Pai)
//      aAdd(wDominio,wObj_Pai)
//      aAdd(wDominio,"")
//      wxLargura := 800
//   ElseIf wPropriedade = _wP_FONT
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd(wDominio,"P-Pequena")
//      aAdd(wDominio,"M-Média"  )
//      aAdd(wDominio,"G-Grande" )
//      wxLargura := 800
//   ElseIf wPropriedade = _wP_OBJ_DAT_RELAC
//      wPrp_Dom := "X"
//      wDominio := __fSuper_Obj_Lista(wObj_Nome,"DAT")
//      aAdd(wDominio,"")
//      wxLargura := 800
//   ElseIf wPropriedade = _wP_DOMINIO
//      wDominio    := {}
//      wObjeto_Dat := cSuper(wObj_Nome,_wP_OBJ_DAT_RELAC)
//      If cEmpty(wObjeto_Dat) .Or. wObj_Tp="GET"
//         wPesquisa := "X"
//      Else
//         wPrp_Dom := "X"
//         wTable := AllTrim(cNvl(cSuper(wObjeto_Dat,_wP_TABLE),""))
//         If cEmpty(wTable)
//            wTable := AllTrim(cNvl(cSuper(cSuper_Obj_Pai(wObjeto_Dat),_wP_TABLE),""))
//         EndIf
//         wColumn := AllTrim(cSuper(wObjeto_Dat,_wP_COLUMN))
//         If .Not.cEmpty(wTable) .And. .Not.cEmpty(wColumn)
//            wPos := cScan(__wM_Column,cLower(wTable+"."+wColumn),1)
//            If wPos>0
//               wDominio := __wM_Column[wPos,__wCOL_dominio]   // cSuperColumn(wTable+"."+wColumn,_wP_DOMINIO)
//            Else
//               wDominio := ""
//            EndIf
//            wDominio := cStrToMatriz(wDominio)
//         EndIf
//         aAdd(wDominio,"")
//      EndIf
//   ElseIf wPropriedade = _wP_STYLE
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "")
//      aAdd( wDominio , "01 - CHECKBOX" )
//      aAdd( wDominio , "02 - COMBOBOX" )
//   ElseIf wPropriedade = _wP_VALID_TP
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "")
//      aAdd( wDominio , "0 - Sempre"  )
//      aAdd( wDominio , "1 - Pos_Fnc" )
//      aAdd( wDominio , "2 - Grava"   )
//   ElseIf wPropriedade = _wP_EXPRESSION
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "="  )
//      aAdd( wDominio , ">=" )
//      aAdd( wDominio , "<=" )
//      aAdd( wDominio , "<>" )
//      aAdd( wDominio , "Like "+CHR(63)+"%"  )
//      aAdd( wDominio , "Like "+CHR(63)+".%" )
//      aAdd( wDominio , "Not Like "+CHR(63)+"%")
//      aAdd( wDominio , "Not Like "+CHR(63)+".%")
//      aAdd( wDominio , "")
//   ElseIf wPropriedade = _wP_ACAO
//      If wObj_Tp="GRD"
//      	wPrp_Dom := "X"
//      	wDominio := {}
//      	aAdd( wDominio , "0 - Sem ação           ")
//      	aAdd( wDominio , "1 - Padrão             ")
//      	aAdd( wDominio , "2 - Completo           ")
//      	aAdd( wDominio , "3 - Somente Atualização")
//      	aAdd( wDominio , "4 - Somente Exclusão   ")
//      	aAdd( wDominio , "5 - Somente Filtro     ")
//      Else
//      	Return .F.
//      EndIf
//   ElseIf wPropriedade = _wP_TYPE
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "C - CARACTER (Texto)")
//      aAdd( wDominio , "N - NUMERIC (Número)")
//      aAdd( wDominio , "D - DATE (Data)")
//   ElseIf wPropriedade = _wP_SORT
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "A - Crescente"  )
//      aAdd( wDominio , "D - Decrescente")
//   ElseIf wPropriedade = _wP_ACESSO
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "0 - Sem Restrição")
//      aAdd( wDominio , "1 - Mostra Desabilitado")
//      aAdd( wDominio , "2 - Não Mostra")
//   ElseIf wPropriedade = _wP_REQUERIDO    .Or.;
//          wPropriedade = _wP_FRAME        .Or.;
//          wPropriedade = _wP_PESQUISA     .Or.;
//          wPropriedade = _wP_CRIPTOGRAFADO.Or.;
//          wPropriedade = _wP_VERTICAL     .Or.;
//          wPropriedade = _wP_CENTER       .Or.;
//          wPropriedade = _wP_SELECT_KEY   .Or.;
//          wPropriedade = _wP_INSERT_KEY   .Or.;
//          wPropriedade = _wP_UPDATE_KEY   .Or.;
//          wPropriedade = _wP_DELETE_KEY   .Or.;
//          wPropriedade = _wP_VSCROLL      .Or.;
//          wPropriedade = _wP_HSCROLL      .Or.;
//          wPropriedade = _wP_QUEBRA       .Or.;
//          wPropriedade = _wP_SEQUENCE     .Or.;
//          wPropriedade = _wP_ALINHA
//      wPrp_Dom := "X"
//      wDominio := {}
//      aAdd( wDominio , "S - Sim")
//      aAdd( wDominio , "N - Não")
//   Else
//      wPrp_Dom := ""
     EndIf

   oDlg := TDialog():New(1,1,9.30,91.7,"Alteração da Propriedade: "+wPropriedade,,,.F.,,,,,,.F.,,,,,)

      wxLargura := (oDlg:nWidth/2)-1
      
      If .Not.cEmpty(wPrp_Dom)
         If ValType(wObj_Prp_Var)="N"
            wObj_Prp_Var := Str(wObj_Prp_Var)
         EndIf
         wObj_Prp_Var := AllTrim(wObj_Prp_Var)
         If wPrp_Dom<>"X"
            wDominio := cDominio(wPrp_Dom,"CCASE")
         EndIf
      
         If ValType(wDominio)="A"
            If Len(wDominio) < 6
               wAltura := Len(wDominio) * 14
            Else
               wAltura := 78
            EndIf
      
            wBytes  := 0
            wXBytes := 0
            For wx := 01 To Len(wDominio)
               wXBytes := Len(AllTrim(wDominio[wx]))
               If wBytes < wXBytes
                  wBytes := wXBytes
               EndIf
            Next
            wLargura := (wBytes+5)*4
         Else
            wAltura  := 14
            wDominio := {""}
         EndIf
      
         If cEmpty(wLargura) .Or. wLargura>wxLargura
            wLargura := wxLargura
         EndIf
      
         oGet := TComboBox():New(01  ,01  ,{|u| If( PCount()==0,wObj_Prp_Var,wObj_Prp_Var:=u)},wDominio, wLargura,wAltura,oDlg,,       ,      ,        ,        ,.T.   ,     ,    ,.F.     ,     ,.F.    ,         ,         ,      ,     ,         )
                 //          New(nRow,nCol, bSeTGet                                           , aItems , nWidth  ,nHeight,oWnd,,bChange,bValid,nClrText,nClrBack,lPixel,oFont,cMsg, lUpdate,bWhen,lDesign,acBitmaps,bDrawItem,nStyle,cPict,bEChange ) CONSTRUCTOR
      
         For wx := 1 To Len(wDominio)
            If AllTrim(SubStr(wDominio[wx],1,At("-",wDominio[wx])-1)) == wObj_Prp_Var
               wObj_Prp_Var := wDominio[wx]
               Exit
            EndIf
         Next

      // If wPropriedade = _wP_PESQUISA .And. wObj_Tp="GET"
      //    wPesqRelac := cSuper(wObj_Nome,_wP_PESQ_RELAC)
      //    wPesqRelac := wPesqRelac+Space(255)
      //    oGet := TGet():New(oGet:nTop,oGet:nLeft+oGet:nWidth+08,{|u| If( PCount()==0,wPesqRelac,wPesqRelac:=u)},oDlg,150   ,10     ,     ,        ,,,,.F.     ,,.T.   ,,.F.    ,     ,.F.    ,.F.   ,,         ,         ,.F.      ,,.F.     ,   ,     ,    ,      )
      //            //     New(nRow     ,nCol                     ,bSetGet                                        ,oWnd,nWidth,nHeight,cPict, bValid ,,,, lDesign,,lPixel,,lUpdate,bWhen,lCenter,lRight,,lReadOnly,lPassword,lNoBorder,,lSpinner,bUp,bDown,bMin, bMax ) CONSTRUCTOR
      //    oGet:cPicture     := ""
      //    oGet:oGet:Picture := ""
      // EndIf
      Else
         If cEmpty(wLargura) .Or. wLargura>wxLargura
            wLargura := wxLargura
            If .Not.cEmpty(wPesquisa)
               wLargura := wLargura - 40
            EndIf
         EndIf

         oGet := TGet():New( 01 , 01 ,{|u| If( PCount()==0,wObj_Prp_Var,wObj_Prp_Var:=u)},oDlg,wLargura,10     ,     ,        ,,,,.F.     ,,.T.   ,,.F.    ,     ,.F.    ,wRight,,         ,         ,.F.      ,,.F.     ,   ,     ,    ,      )
                 //     New(nRow,nCol,bSetGet                                            ,oWnd,nWidth  ,nHeight,cPict, bValid ,,,, lDesign,,lPixel,,lUpdate,bWhen,lCenter,lRight,,lReadOnly,lPassword,lNoBorder,,lSpinner,bUp,bDown,bMin, bMax ) CONSTRUCTOR
         oGet:cPicture     := AllTrim(wPrp_Pct)
//         oGet:oGet:Picture := AllTrim(wPrp_Pct)

      // If .Not.cEmpty(wPesquisa)
      //    oBtn := TBTNBMP():New(oGet:nTop,oGet:nLeft+oGet:nWidth+5, 10     ,10     ,,,"binoculo.bmp",         ,       ,oDlg,    ,      ,.F.    ,.F.     ,       ,     ,,         ,.F.    ,       )
      //            //        New( nTop    , nLeft                  , nWidth ,nHeight,,,cBmpFile1     ,cBmpFile2,bAction,oWnd,cMsg, bWhen,lAdjust, lUpdate,cPrompt,oFont,,cBmpFile3,lBorder,cLayout) CONSTRUCTOR
      //    oBtn:cToolTip := "Pesquisa Item"
      //    oBtn:bAction := {||fCase_Dominio(oGet)}
      //
      //    oBtn := TBTNBMP():New(oBtn:nTop,oBtn:nLeft+oBtn:nWidth+5, 10     ,10     ,,,"exclui.bmp",         ,       ,oDlg,    ,      ,.F.    ,.F.     ,       ,     ,,         ,.F.    ,       )
      //            //        New( nTop    , nLeft                  , nWidth ,nHeight,,,cBmpFile1   ,cBmpFile2,bAction,oWnd,cMsg, bWhen,lAdjust, lUpdate,cPrompt,oFont,,cBmpFile3,lBorder,cLayout) CONSTRUCTOR
      //    oBtn:cToolTip := "Limpa valor da propriedade"
      //    oBtn:bAction := {||wObj_Prp_Var:=iif(wPrp_Type="N",0,Space(252)),oGet:Refresh()}
      // EndIf
      //
      // wPosicao := 0
      // If wPropriedade = _wP_LINHA .And. cSuper_Obj_Tp(wObj_Nome)$"GET,CMB,CHK,RAD"
      //    wTexto  := "Desloca toda a linha"
      //    wFlag1  := .F.
      //    oGFlag1 := TCheckBox():New(oGet:nTop+oGet:nHeight+05,oGet:nLeft+10,HB_AnsiToOem(wTexto),{|u|If(PCount()==0,wFlag1,wFlag1:=u)},oDlg,060   ,12     ,          ,{||cSuper(wObj_Nome,_wP_DESLOC_LINHA,iif(wFlag1,"S","N"))},     ,      ,        ,        ,.F.    ,.T.    ,     ,.F.     ,     )
      //                    //   METHOD New(nRow                ,nCol         ,cCaption            ,bSetGet                              ,oWnd,nWidth,nHeight,nHelpTopic,bChange                                                 ,oFont,bValid,nClrFore,nClrBack,lDesign, lPixel, cMsg, lUpdate,bWhen) CONSTRUCTOR
      //    cSuper(wObj_Nome,_wP_DESLOC_LINHA,"N")
      // ElseIf wPropriedade = _wP_TITLE .And. wObj_Tp$"GET.CMB.MEM"
      //    wPosicao := cSuper(wObj_Nome,_wP_POSICAO)
      //    wPosicao := iif(cEmpty(wPosicao),1,wPosicao)
      //    oSay := TSay():New(oGet:nTop+oGet:nHeight+6,03,{||"Disposição:"},oDlg,,oFont,.F.,.F.,.F.,.T.,,,30,07,.F.,.T.,.F.,.F.,.F.)
      //    oRad := TRadMenu():New(oSay:nTop,oSay:nLeft+oSay:nWidth+10,{"Superior","Esquerda"},{|u|If(PCount()==0,wPosicao,wPosicao:=u)},oDlg,,,,,,.F.    ,,35    ,10     ,,,.T.,.T.   ,.F.      )
      //                    // New( nRow    ,nCol                     , acItems               , bSetGet                                 ,oWnd,,,,,,lUpdate,,nWidth,nHeight,,,l3D,lPixel,lVertical) CONSTRUCTOR
      // EndIf
      EndIf

      oBtn := TButton():New(15,175,"&Confirma",oDlg,,35,10,,,.F.,.T.,.F.,,.F.,,,.F. )
      oBtn:bAction := {||__fSuper_IDE_Prp_Save(wObj_Nome,wRequerido,wPropriedade,wObj_Prp_Var,wPrp_Dom,wGrupo,wLenPic,wDecPic,oDlg,"__wMCase_IDE_Obj",__wc_IDE_ObjPrp)}
      wReturn := .T.

      oMmo := TMultiGet():New(30  ,01  ,{|u| If( PCount()==0,_wObj_Prp_Help,_wObj_Prp_Help:=u)},oDlg,wxLargura-1,35     ,     ,.F.     ,         ,         ,        ,.T.    ,     ,.F.    ,      ,.F.     ,.F.    ,.T.      ,       ,        ,.F.     ,)
                 //METHOD New(nRow,nCol, bSetGet                                               ,oWnd, nWidth    ,nHeight,oFont,lHScroll, nClrFore, nClrBack, oCursor, lPixel, cMsg,lUpdate, bWhen, lCenter, lRight,lReadOnly, bValid,bChanged, lDesign, lNoVScroll ) CONSTRUCTOR

   oDlg:Activate(oDlg:bLClicked,oDlg:bMoved,oDlg:bPainted,.T.,,,,oDlg:bRClicked,,)

Return wReturn
* fim da function __fSuper_IDE_Prp_Edit()

function __fSuper_IDE_Prp_Save(wObj_Nome,wRequerido,wPropriedade,wObj_Prp_Vlr,wPrp_Dom,wGrupo,wLenPic,wDecPic,oDlg,wMatriz,wObjeto)
*************************************************************************************
*
************************************************************************************
Local wPos,wValor,wProcedure,wKeySql,wResp

   If wRequerido = "S"
      If cEmpty(wObj_Prp_Vlr)
         MsgInfo("Propriedade Obrigatória! Não pode ser nula","Atenção")
         Return .F.
      EndIf
   EndIf

   If .Not.cEmpty(wPrp_Dom)
      wPos := At( "-" , wObj_Prp_Vlr )
      If wPos>1
         wObj_Prp_Vlr := SubStr(wObj_Prp_Vlr,1,wPos-1)
      EndIf
   EndIf

   &(wMatriz)[wObjeto:nAt,2] := fObj_Prp_Update(wObj_Nome,wPropriedade,wObj_Prp_Vlr,wLenPic,wDecPic)
   wObjeto:Refresh()
   oDlg:End()

Return .T.
* fim da function __fSuper_IDE_Prp_Save()

function fObj_Prp_Update(wObj_Nome,wPropriedade,wObj_Prp_Vlr,wLenPic,wDecPic)
*************************************************************************************
*
************************************************************************************
Local wKeySql,wResp,wRespX,wXObjNome,wXObjNomeN,wSql,wx,wObj_Pai,wObj_PaiN

   If wPropriedade == "OBJ_SEQ"
      fUpdate2("cCase_Obj","Obj_Nome="+Campo(wObj_Nome),{"Obj_Seq",wObj_Prp_Vlr},)
   ElseIf wPropriedade == "OBJ_NOME_PAI"
      wObj_Pai   := SubStr(wObj_Nome,1,rAt(".",wObj_Nome))
      wObj_PaiN  := AllTrim(wObj_Prp_Vlr)+"."

      wKeySql := "Obj_Nome Like "+Campo(wObj_PaiN+"%")
      wRespX  := fConsulta2("cCase_Obj",{"Obj_Nome"},wKeySql)

      wKeySql := "Obj_Nome Like "+Campo(wObj_Nome+".%")
      wResp   := fConsulta2("cCase_Obj",{"Obj_Nome"},wKeySql)
      For wx := 01 To Len(wResp)
         wXObjNome  := wResp[wx,1]
         wXObjNomeN := AllTrim(StrTran(wXObjNome,wObj_Pai,wObj_PaiN))
         
         If cScan(wRespX,wXObjNomeN,1)=0
            wSql := "Obj_Nome = " + Campo(wXObjNome)
            fUpdate2("cCase_Obj"    ,wSql,{"Obj_Nome",wXObjNomeN},)
            fUpdate2("cCase_Obj_Prp",wSql,{"Obj_Nome",wXObjNomeN},)
  
            wSql := "Obj_Nome = " +Campo(wXObjNomeN)+ " And Prp_Nome="+Campo(wPropriedade)
            fUpdate2("cCase_Obj_Prp",wSql,{"Obj_Prp_Vlr",SubStr(wXObjNomeN,1,rAt(".",wXObjNomeN)-1)},)
         Else
            MsgInfo("Não foi possível alterar o objeto :" + Campo(wXObjNomeN),"Alteração dos filhos")
         EndIf
      Next
  
      wXObjNomeN := AllTrim(StrTran(wObj_Nome,wObj_Pai,wObj_PaiN))
      If cScan(wRespX,wXObjNomeN,1)=0
         wKeySql := "Obj_Nome="+Campo(wObj_Nome)
         fUpdate2("cCase_Obj"    ,wKeySql,{"Obj_Nome",wXObjNomeN},)
         fUpdate2("cCase_Obj_Prp",wKeySql,{"Obj_Nome",wXObjNomeN},)
  
         wSql := "Obj_Nome = " +Campo(wXObjNomeN)+ " And Prp_Nome="+Campo(wPropriedade)
         fUpdate2("cCase_Obj_Prp",wSql,{"Obj_Prp_Vlr",SubStr(wXObjNomeN,1,rAt(".",wXObjNomeN)-1)},)
  
         wSql :=        " Update cCase_Obj_Prp Set Obj_Prp_Vlr=replace(Obj_Prp_Vlr,"+Campo(wObj_Nome)+","+Campo(wXObjNomeN)+")"
         wSql := wSql + " Where Obj_Prp_Vlr Like " +Campo(wObj_Nome+".%")
         cSql_Execute("cCase_Obj_Prp",wSql)
  
         wSql := "Obj_Prp_Vlr = " +Campo(wObj_Nome)
         fUpdate2("cCase_Obj_Prp",wSql,{"Obj_Prp_Vlr",wXObjNomeN},)
      Else
         MsgInfo("Não foi possível alterar o objeto :" + Campo(wXObjNomeN) , "Inclusão do Objeto")
         Return .F.
      EndIf
   ElseIf wPropriedade == "OBJ_NOME"
      wObj_Pai   := SubStr(wObj_Nome,1,rAt(".",wObj_Nome))
      wXObjNomeN := wObj_Pai+AllTrim(wObj_Prp_Vlr)
      wObj_PaiN  := wXObjNomeN+"."

      wKeySql := "Obj_Nome="+Campo(wObj_Nome)
      fUpdate2("cCase_Obj"    ,wKeySql,{"Obj_Nome",wXObjNomeN},)
      fUpdate2("cCase_Obj_Prp",wKeySql,{"Obj_Nome",wXObjNomeN},)
  
      wSql :=        " Update cCase_Obj_Prp Set Obj_Prp_Vlr=replace(Obj_Prp_Vlr,"+Campo(wObj_Nome)+","+Campo(wXObjNomeN)+")"
      wSql := wSql + " Where (Obj_Prp_Vlr="+Campo(wObj_Nome)+" Or Obj_Prp_Vlr Like "+Campo(wObj_Nome+".%")+")"
      cSql_Execute("cCase_Obj_Prp",wSql)
  
      wXObjNomeN := Space(00)
      wObj_Pai   := wObj_Nome+"."
  
      wKeySql := "Obj_Nome Like "+Campo(wObj_Pai+"%")
      wResp   := fConsulta2("cCase_Obj",{"Obj_Nome"},wKeySql)
      For wx := 01 To Len(wResp)
         wXObjNome  := wResp[wx,1]
         wXObjNomeN := AllTrim(StrTran(wXObjNome,wObj_Pai,wObj_PaiN))
  
         wSql := "Obj_Nome = " + Campo(wXObjNome)
         fUpdate2("cCase_Obj"    ,wSql,{"Obj_Nome",wXObjNomeN},)
         fUpdate2("cCase_Obj_Prp",wSql,{"Obj_Nome",wXObjNomeN},)
      Next
   EndIf

   If ValType(wObj_Prp_Vlr)="N"
      If wPropriedade == "OBJ_SEQ"
         wObj_Prp_Vlr := Str(wObj_Prp_Vlr,wLenPic,wDecPic)
      Else
         wObj_Prp_Vlr := StrZero(wObj_Prp_Vlr,wLenPic,wDecPic)
      EndIf
   EndIf

   fDelete2("cCase_Obj_Prp","Obj_Nome="+Campo(wObj_Nome)+" And Prp_Nome="+Campo(wPropriedade))

   fInsert2("cCase_Obj_Prp",{"Obj_Nome",wObj_Nome,"Prp_Nome",wPropriedade,"Obj_Prp_Vlr",wObj_Prp_Vlr})

Return wObj_Prp_Vlr
* fim da function fObj_Prp_Update(wObj_Nome,wPropriedade,wObj_Prp_Vlr)

function __fSuper_IDE_Prp_Tab_Grupo(wOpcaoTab,oTree)
*************************************************************************************
*
************************************************************************************
Local oItem,wObj_Tp,wObj_Nome

   oItem     := oTree:GetSelected()
   wObj_Nome := oItem:Cargo[2]
   wObj_Tp   := oItem:Cargo[3]

   __fSuper_IDE_Prp_Itens(wObj_Nome,wObj_Tp,wOpcaoTab)

Return .T.
* fim da function __fSuper_IDE_Prp_Tab_Grupo(nOption,oTree)

function __fSuper_AddFRM(wObj_Nome)
*************************************************************************************
*
*************************************************************************************
Local wPos,wx

   wObj_Nome := AllTrim(wObj_Nome)
   __wc_FRM  := __wc_FRM+1

   aAdd(__wMCase_FRM,{wObj_Nome,__wc_FRM})
   aAdd(__wMCase_Obj , {})

   If ValType(__wc_IDE_Tree)="O"
      __fSuper_Tree_Refresh(__wc_IDE_Tree,wObj_Nome)
   EndIf

return .T.
*fim da function __fSuper_AddFRM(wObj_Nome)

function __fSuper_AddObj(wObj_Nome,wObj_Tp,wObj_Seq,wObjeto,wObjSay,wDominio,wRequerido,wColName,wGrid)
*************************************************************************************
*
*************************************************************************************

   wObj_Nome := AllTrim(wObj_Nome)
   wObj_Seq  := iif(ValType(wObj_Seq)<>"N",0,wObj_Seq)
   
   If cNvl(wRequerido,.F.) = .T.
   	wRequerido := "S"
   Else
   	wRequerido := "N"
   EndIf
   
   aAdd(__wMCase_Obj[__wc_FRM],{wObj_Nome,wObj_Tp,wObj_Seq,wObjeto,wObjSay,cNvl(wDominio,""),wRequerido,wColName,wGrid})

return Len(__wMCase_Obj[__wc_FRM])
*fim da function __fSuper_AddObj(wObj_Nome,wObj_Tp,wObjeto)

//Function cSuper_Obj_Tp(_wObj_Nome)
//********************************************************************************
//*                          Busca o Tipo do Obj_Nome                            *
//********************************************************************************
//Local wPosObj,wObj_Tp,wNivel,wFRM
//
//   wFRM := __fSuper_Scan_Frm(_wObj_Nome)
//   wPosObj  := cScanBin(_wMCase_Obj[wFRM],StrTran(_wObj_Nome,"_",""),__aSortBin)   //_fSuper_Scan(_wObj_Nome,"O")
//   If wPosObj=0
//      return ""
//   Else
//      wObj_Tp := _wMCase_Obj[wFRM][wPosObj,__wObj_Tp]
//   EndIf
//
//Return wObj_Tp
//*Fim da Function cSuper_Obj_Tp(_wObj_Nome)

function cSuperEstru(wString)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wPontos , wIni , wFim , wObjeto, wy , wMResp

   wPontos := 0
   wString    := AllTrim(wString) + "."

   wIni   := 1
   wFim   := 0
   wMResp := {}

   For wy := 01 to Len(wString)
      If SubStr(wString,wy,1) = "."
         wPontos := wPontos + 1
         wFim := wy-wIni  //-1
         wObjeto := SubStr(wString,wIni,wFim)
         aAdd(wMResp , AllTrim(wObjeto) )
         wIni := wy+1
      EndIf
   Next

   wPontos := wPontos - 1

Return {wPontos,wMResp}
*fim da function cSuperEstru(wString)

Function __fSuper_Scan_Frm(_wObj_Nome)
********************************************************************************
*     Funcao para Verificar se o Objeto/Propriedadedo estão Cadastrados        *
********************************************************************************
Local wLenFrm,wFRM,wPosFRM,wx_frm,wObj_FRM

   wLenFrm := Len(__wMCase_Frm)
   If wLenFrm=1
      wFRM := 1
   Else
      wPosFRM := At(".",_wObj_Nome)
      If wPosFRM>0
         wObj_FRM := SubStr(_wObj_Nome,1,wPosFRM-1)
      Else
         wObj_FRM := _wObj_Nome
      EndIf

      For wx_frm := 01 To wLenFrm
         If __wMCase_Frm[wx_frm,1] == wObj_FRM
            wFRM := __wMCase_Frm[wx_frm,2]
            Exit
         EndIf
      Next
   EndIf

Return wFRM
*Fim da Function __fSuper_Scan_Frm()

Function __FCGFC(wVar,wPicture,wDominio)
***************************************************************************************************
*                                                                                                 *
***************************************************************************************************
Local wTam := 00 , wPos := 00 , wDec := 00, wType

   wType := ValType(wVar)
   If     wType = "C"
      wVar := rTrim(wVar)
      If .Not.cEmpty(wDominio) .And. .Not.cEmpty(wVar)
         wVar := cDominio_Atrib(wVar,wDominio)
      EndIf
      wVar := StrTran(wVar,CHR(13)+CHR(10)," ")
   ElseIf wType = "N"
      If ValType(wPicture)="C" .And. .Not.cEmpty(wPicture)
         wTam := Len(wPicture)
         wPos := At("." , wPicture)
         If wPos>0
            wDec := Len(SubStr(wPicture,wPos+1))
         EndIf   
         wVar := Str(wVar,wTam,wDec)
      Else
         wVar := Str(wVar)
      EndIf
   ElseIf wType = "D"
      wVar := dToc(wVar)
   EndIf

Return wVar
*fim da Function __FCGFC(wVar,wPicture)

Function __fCase_IDE_Prp_Lst()
********************************************************************************
*              Funcao para Localizar a Propriedadedo do Objeto                 *
********************************************************************************
* Estrutura: __wMCase_IDE_Prp -> 1 - Lista de Tipos de Objetos
*                                2 - Grupo de Propriedades por Tipo de Objeto
********************************************************************************
Local wx,wRequerido,wMatriz,wy,wCampos,wPos,wMPrpGrp,wMObj_Tp,wOrder,wChar,wLen,wObj_Tp,wPrp_Lst
Local wPrp_Nome,wPrp_Dft,wPrp_Pct,wPrp_Dom,wPrp_Req,wPrp_Grp,wPrp_Seq,wPrp_Grp_Ori,wPrp_Grp_Aux,wSql

   __wMCase_IDE_Prp := {}

   wCampos := {}
   aAdd( wCampos , "Prp_Nome"        ) // 01 Nome da Propriedade
   aAdd( wCampos , "Prp_Obj_Lst"     ) // 02 Lista de Objeto que a propriedade atende
   aAdd( wCampos , "Prp_Obj_Lst_Req" ) // 03 Lista de Objetos que a Propriedade é Obrigatória
   aAdd( wCampos , "Prp_Get_Pct"     ) // 04 Picture da Propriedade
   aAdd( wCampos , "Prp_Cmb_Lst"     ) // 05 Dominio correspondente da Propriedade
   aAdd( wCampos , "Prp_Get_Dft"     ) // 06 Valor inicial da Propriedade
   aAdd( wCampos , "Prp_Grp"         ) // 07 Grupo de Propriedades
   aAdd( wCampos , "Prp_Seq"         ) // 08 Sequencia da Propriedade
   aAdd( wCampos , "Prp_Type"        ) // 09 Tipo da Propriedade

   wMPrpGrp := fConsulta2( "cCase_Prp",wCampos,,"Prp_Grp,Prp_Seq")
   For wx := 01 To Len(wMPrpGrp)

      wMPrpGrp[wx,1] := AllTrim(wMPrpGrp[wx,01])
      wMPrpGrp[wx,2] := AllTrim(wMPrpGrp[wx,2])
      wMPrpGrp[wx,3] := AllTrim(wMPrpGrp[wx,3])
      wMPrpGrp[wx,6] := iIf(cEmpty(wMPrpGrp[wx,06]),Space(252),wMPrpGrp[wx,06])
      wMPrpGrp[wx,7] := AllTrim(wMPrpGrp[wx,7])
   Next

   __wMCase_IDE_Prp := wMPrpGrp

Return .T.
*Fim da Function __fCase_IDE_Prp_Lst()

Function __fSuper_Prc(wObj_Nome,wPrp_Nome,wObj_Prp_Vlr)
*******************************************************************************
*                           Editor de Procedure v 1.0                         *
*******************************************************************************
Local oMemo,oLbx,oBar,oFld,wBlock,wLen,wMemo,wObjRef,oFldPrp,wProcedure,wNew
Local wPos,wPosObj,wPosPrp,oBtn,wPosX,wFRM_Nome,wMatriz,wx,wMPastas,wSysWidth,wSysHeight

   If cEmpty(wObj_Nome)
      return nil
   EndIf

   wObj_Nome := AllTrim(wObj_Nome)
   wPrp_Nome := cLower(AllTrim(cNvl(wPrp_Nome,"")))

   wPos := At(".",wObj_Nome)
   If wPos>0
      wFRM_Nome := SubStr(wObj_Nome,1,wPos-1)
   Else
      wFRM_Nome := wObj_Nome
   EndIf
   wObj_Prp_Vlr := AllTrim(wObj_Prp_Vlr)

   If .Not.(wPrp_Nome=="newprc")
      wNew  := .F.
   Else
      wNew  := .T.
   EndIf

   wMatriz := __fSuper_Prc_Scan(wObj_Prp_Vlr)

   If ValType(__oWndProcedure)="O"
      __fSuper_Prc_Show(wFRM_Nome,wObj_Prp_Vlr,wMatriz)
   Else
///wSysWidth  := GetSysMetrics( 0 )
///wSysHeight := GetSysMetrics( 1 )

      __oWndProcedure := TWindow():New(0   ,0     ,GetSysMetrics(1) , GetSysMetrics( 0 ),"Editor de Procedure",      ,     ,      ,     ,       ,.F.     ,.F.     ,         ,cColorText("WINDOWS"),       ,"NONE" ,        ,        ,.T. ,.F.  , .T.   )
//    __oWndProcedure := TWindow():New(0   ,0     , 47              , 129               ,"Editor de Procedure",      ,     ,      ,     ,       ,.F.     ,.F.     ,         ,cColorText("WINDOWS"),       ,"NONE" ,        ,        ,.T. ,.F.  , .F.   )
                                //New( nTop, nLeft, nBottom         , nRight            ,cTitle               ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore ,nClrBack             ,oCursor,cBorder,lSysMenu,lCaption,lMin, lMax, lPixel) CONSTRUCTOR

         oBar := TBar():New(__oWndProcedure,         ,          ,.T.,     ,       )
              // METHOD New( oWnd         ,nBtnWidth,nBtnHeight,l3D,cMode,oCursor) CONSTRUCTOR
         oBar:nClrPane := cColorText("WINDOWS")
         oBar:SetColor( oBar:nClrText, oBar:nClrPane )

         __vProcedure := {}
         __oFldPrpPrc := {}

         __oFldObjPrc := TFolder():New(oBar:nHeight ,1    ,{wFRM_Nome},{},__oWndProcedure,,,,.T.   ,,GetSysMetrics(0)-5,GetSysMetrics(1)-85 ,    ,.T.      ,oFont)
                        // METHOD New(nTop          ,nLeft, aPrompts   ,  , oWnd         ,,,,lPixel,,nWidth            ,nHeight             ,cMsg,lAllWidth,oFont) CONSTRUCTOR
         __oFldObjPrc:bChange := {|| __fSuper_Prc_MudaFolder(1,__oFldObjPrc) }

         wObjRef := __oFldObjPrc:aDialogs[1]

//////// If wPrp_Nome == "newprc"
////////    wPrp_Nome := __fSuper_Prc_New_Next()
//////// EndIf

         aAdd(__vProcedure,{})
         wMPastas := {}

         For wx := 01 To Len(wMatriz)
            aAdd(wMPastas , wMatriz[wx,1])
         Next

         oFldPrp:= TFolder():New( 00 ,  00 , wMPastas ,{},wObjRef,,,,.T.   ,.F.    ,__oFldObjPrc:nWidth-10,__oFldObjPrc:nHeight-30,,.T.,oFont)
                   // METHOD New(nTop,nLeft, aPrompts,  , oWnd  ,,,,lPixel,lDesign,nWidth                ,nHeight                   ,,lAllWidth,oFont) CONSTRUCTOR
         oFldPrp:bChange := {|| __fSuper_Prc_MudaFolder(2,oFldPrp) }

         aAdd( __oFldPrpPrc , oFldPrp )

         For wx := 01 To Len(wMatriz)
            wObjRef := oFldPrp:aDialogs[wx]
            wMemo   := iif(cEmpty(wMatriz[wx,2]),Space(2000),wMatriz[wx,2])

            aAdd(__vProcedure[1],{wMemo,,})

            wBlock := "__vProcedure[1,"+Str(wx)+",1]"
            wBlock := "{|u| If( PCount()==0,"+wBlock+","+wBlock+":=u)}"
            oMemo  := TMultiGet():New( 0  , 0  ,&(wBlock),wObjRef,oFldPrp:nWidth-10,oFldPrp:nHeight-30,oFontMemo,.T.     ,        ,        ,       ,.F.   ,    ,.F.    ,     ,.F.    ,.F.   ,.F.      ,      ,        ,.F.    ,          )
                     //   METHOD New(nRow,nCol,bSetGet   ,oWnd   ,nWidth           ,nHeight           ,oFont    ,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR

            __vProcedure[1,wx,1] := wMemo
            __vProcedure[1,wx,2] := oMemo
            __vProcedure[1,wx,3] := wNew
         Next

         oBtn := TBtnBmp():NewBar(         ,         ,"image\open.bmp" ,         ,    ,       ,.F.   ,oBar,.F.    ,{||.f.} ,"Abrir"   ,.F.     ,     ,       ,    ,         ,         ,.T.   ,        )
                        // NewBar(cResName1,cResName2,cBmpFile1        ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen   ,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR
         //oBtn:bAction := {||__fSuper_Prc_Open()}

         oBtn := TBtnBmp():NewBar(         ,         ,"image\close.bmp",         ,    ,       ,.F.   ,oBar,.F.    ,     ,"Fechar"  ,.F.     ,     ,       ,    ,         ,         ,.T.    ,       )
                        // NewBar(cResName1,cResName2,cBmpFile1        ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR
         oBtn:bAction := {||__fSuper_Prc_Close()}

         oBtn := TBtnBmp():NewBar(         ,         ,"image\grava.bmp",         ,    ,       ,.F.   ,oBar,.F.    ,     ,"Salvar"  ,.F.     ,     ,       ,    ,         ,         ,.T.    ,       )
                        // NewBar(cResName1,cResName2,cBmpFile1        ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR
         oBtn:bAction := {||__fSuper_Prc_Save(),wM_Objeto:={}}

         oBtn := TBtnBmp():NewBar(         ,         ,"image\xdesfazer.bmp",         ,    ,       ,.F.   ,oBar,.F.    ,{||.f.},"Desfazer",.F.     ,     ,       ,    ,         ,         ,.T.    ,       )
                        // NewBar(cResName1,cResName2,cBmpFile1            ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen  ,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR

         oBtn := TBtnBmp():NewBar(         ,         ,"image\xrefazer.bmp",         ,    ,       ,.F.   ,oBar,.F.    ,{||.f.},"Refazer" ,.F.     ,     ,       ,    ,         ,         ,.T.    ,       )
                        // NewBar(cResName1,cResName2,cBmpFile1           ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen  ,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR

         oBtn := TBtnBmp():NewBar(         ,         ,"image\pesquisar.bmp",         ,    ,       ,.F.   ,oBar,.F.    ,{||.f.},"Refazer" ,.F.     ,     ,       ,    ,         ,         ,.T.    ,       )
                        // NewBar(cResName1,cResName2,cBmpFile1            ,cBmpFile2,cMsg,bAction,lGroup,oBar,lAdjust,bWhen  ,cToolTip  ,lPressed,bDrop,cAction,nPos,cResName3,cBmpFile3,lBorder,cLayout) CONSTRUCTOR

      __oWndProcedure:bValid := {||__fSuper_Prc_Exit()}
      __oWndProcedure:Activate("NORMAL",__oWndProcedure:bLClicked,__oWndProcedure:bRClicked,__oWndProcedure:bMoved,__oWndProcedure:bResized,__oWndProcedure:bPainted,__oWndProcedure:bKeyDown,__oWndProcedure:bInit,,,,,,,,,,,__oWndProcedure:bLButtonUp )
   EndIf

Return .T.
*fim da Function __fSuper_Prc()

Function __fSuper_Prc_Exit()
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wx,wy

   //__vProcedure    := {}
   __oFldPrpPrc    := {}
   __oFldObjPrc    := nil
   __oWndProcedure := nil

Return .T.
*fim da Function __fSuper_Prc_Exit()
                                                  
Function __fSuper_Prc_Save()
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wPrc_Nome , oFldPrp , wObj_Prp_Text , wKeySql , wResp, wWhere

   oFldPrp   := __oFldPrpPrc[__oFldObjPrc:nOption]
   wPrc_Nome := oFldPrp:aPrompts[oFldPrp:nOption]
   wPrc_Nome := AllTrim(wPrc_Nome)
   wWhere    := "Obj_Nome="+Campo(wPrc_Nome)
   If cUpper(SubStr(wPrc_Nome,1,13))=="NEW PROCEDURE"
      MsgGet( "Nova Procedure","Nome da Procedure:",@wPrc_Nome)
      If cEmpty(wPrc_Nome)
         MsgStop("Informe o nome da Procedure","Erro...")
         Return .F.
      EndIf
      wResp := fConsulta2("cCase_Obj",{"Obj_Tp"},wWhere)
      If Len(wResp)>0
         MsgInfo("Nome de Procedure já cadastrada","Atenção")
         Return .F.
      EndIf
      oFldPrp:aPrompts[oFldPrp:nOption] := wPrc_Nome
      oFldPrp:Refresh()

      fInsert2("ccase_obj",{"Obj_Nome",wPrc_Nome,"Obj_Tp","PRC","Obj_Seq",1,"Obj_Sts_Dt_A",cDate(),"Obj_Sts_Usr_A",wc_user},)
   Else
      fUpdate2("ccase_obj",wWhere,{"Obj_Sts_Dt_A",cDate(),"Obj_Sts_Usr_A",wc_user},)
   EndIf

   wObj_Prp_Text := __vProcedure[__oFldObjPrc:nOption,oFldPrp:nOption,1]
   wObj_Prp_Text := AllTrim(wObj_Prp_Text)

   fDelete2("ccase_obj_prp",wWhere+" And Prp_Nome="+Campo("PROCEDURE"))
   fInsert2("ccase_obj_prp",{"Obj_Nome",wPrc_Nome,"Prp_Nome","PROCEDURE","Obj_Prp_Memo",wObj_Prp_Text},)

Return .T.
*fim da Function __fSuper_Prc_Save()

Function __fSuper_Prc_Memo(wObj_Nome)
*******************************************************************************
*                                                                             *
*******************************************************************************
Local wKeySql , wResp , wRetorno

   wKeySql := "Obj_Nome = " + Campo(wObj_Nome) + " And Prp_Nome = " + Campo("PROCEDURE")
   wResp   := fConsulta2( "cCase_Obj_Prp",{"Obj_Prp_Memo"},wKeySql)

   wRetorno := Space(00)
   If Len(wResp)>0
      wRetorno := AllTrim(wResp[1,1])
   EndIf

Return wRetorno
* fim da Function __fSuper_Prc_Memo(wObj_Nome)

function __fSuper_Prc_Show(wObj_Nome,wObj_Prp_Vlr,wMatriz)
*************************************************************************************
*                         verifica se a procedure esta aberta                       *
*************************************************************************************
Local wx,wPosObj,wPosPrc,wObjRef,oFldPrp,wPrc_Nome,wy,wMPastas,wyLen,wVisualPos
Local wBlock,oMemo,wMemo

   wPosObj    := 00
   wPosPrc    := 00
   wVisualPos := 00

   For wx := 01 To Len(__oFldObjPrc:aPrompts)
      if __oFldObjPrc:aPrompts[wx] == wObj_Nome
         wPosObj := wx
         Exit
      EndIf
   Next

   wyLen    := Len(wMatriz)

   If wPosObj=0
      __oFldObjPrc:AddItem(wObj_Nome)
      wPosObj := Len(__oFldObjPrc:aPrompts)

      wMPastas := {}
      For wx := 01 To Len(wMatriz)
         aAdd(wMPastas , wMatriz[wx,1])
      Next

//    If wPrc_Nome == "newprc"
//       wPrc_Nome := __fSuper_Prc_New_Next()
//    EndIf

      oFldPrp := TFolder():New( 00 , 00  , wMPastas ,{},__oFldObjPrc:aDialogs[wPosObj],,,,.T.   ,.F.    ,__oFldObjPrc:nWidth-10,__oFldObjPrc:nHeight-30,,.T.,oFont)
                 // METHOD New(nTop,nLeft, aPrompts ,  , oWnd                         ,,,,lPixel,lDesign,nWidth                ,nHeight                ,,lAllWidth,oFont) CONSTRUCTOR
      oFldPrp:bChange := {|| __fSuper_Prc_MudaFolder(2,oFldPrp) }

      aAdd( __oFldPrpPrc , oFldPrp )
      aAdd( __vProcedure , {} )

      For wy := 01 To wyLen
         wMemo   := wMatriz[wy,2]
         wObjRef := oFldPrp:aDialogs[wy]

         aAdd( __vProcedure[wPosObj],{wMemo,,})

         wBlock := "__vProcedure["+Str(wPosObj)+","+Str(wy)+",1]"
         wBlock := "{|u| If( PCount()==0,"+wBlock+","+wBlock+":=u)}"
         oMemo  := TMultiGet():New(0   ,0   ,&(wBlock),wObjRef,oFldPrp:nWidth-10,oFldPrp:nHeight-30,oFontMemo,.T.     ,        ,        ,       ,.F.   ,    ,.T.    ,     ,.F.    ,.F.   ,.F.      ,      ,        ,.F.    ,          )
                   //   METHOD New(nRow,nCol,bSetGet  ,oWnd   ,nWidth           ,nHeight           ,oFont    ,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR
         oMemo:Set3DLooK()

         __vProcedure[wPosObj,wy,1] := wMemo
         __vProcedure[wPosObj,wy,2] := oMemo
         __vProcedure[wPosObj,wy,3] := .F. //wNew
      Next

      __oFldObjPrc:SetOption(wPosObj)
      oFldPrp:SetOption(1)
   Else
      __oFldObjPrc:SetOption(wPosObj)

      oFldPrp := __oFldPrpPrc[wPosObj]
      If ValType(oFldPrp)="O"
         For wy := 01 To wyLen
            wPosPrc   := 0
            wPrc_Nome := wMatriz[wy,1]
       
            For wx := 01 To Len(oFldPrp:aPrompts)
               if oFldPrp:aPrompts[wx] == wPrc_Nome
                  wPosPrc := wx
                  Exit
               EndIf
            Next

            If wPosPrc=0
               wMemo := wMatriz[wy,2]

               oFldPrp:AddItem(wPrc_Nome)
               wPosPrc := Len(oFldPrp:aPrompts)
               wObjRef := oFldPrp:aDialogs[wPosPrc]

               aAdd( __vProcedure[wPosObj] , {wMemo,,})

               wBlock := "__vProcedure["+Str(wPosObj)+","+Str(wPosPrc)+",1]"
               wBlock := "{|u| If( PCount()==0,"+wBlock+","+wBlock+":=u)}"
               oMemo  := TMultiGet():New(0   ,0   ,&(wBlock),wObjRef,oFldPrp:nWidth-10,oFldPrp:nHeight-30,oFontMemo,.T.     ,        ,        ,       ,.F.   ,    ,.T.    ,     ,.F.    ,.F.   ,.F.      ,      ,        ,.F.    ,          )
                         //   METHOD New(nRow,nCol,bSetGet  ,oWnd   ,nWidth           ,nHeight           ,oFont    ,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR
               oMemo:Set3DLooK()

               __vProcedure[wPosObj,wPosPrc,1] := wMemo
               __vProcedure[wPosObj,wPosPrc,2] := oMemo
               __vProcedure[wPosObj,wPosPrc,3] := .F. //wNew
            Else
               If cEmpty(wVisualPos)
                  wVisualPos := wPosPrc
               EndIf
            EndIf
         Next
      EndIf

      If wVisualPos=0
         wVisualPos := Len(oFldPrp:aPrompts)
      EndIf

      oFldPrp:SetOption(wVisualPos)
   EndIf

Return .T.
*fim da Function __fSuper_Prc_Show()

function __fSuper_Prc_Scan(wObj_Prp_Vlr)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wTexto,wLen,wx,wInicio,wFinal,wAchou,wMatriz,wProc,wMemo
Private __wMatrizPrcMemo := {}

   wTexto  := Lower(wObj_Prp_Vlr)
   wLen    := Len(wTexto)
   wInicio := 0
   wFinal  := 0
   wAchou  := .F.
   wMatriz := {}
   wProc   := ""

   For wx := 01 To wLen
      If SubStr(wTexto,wx,12)=="fprc_execute"
         wAchou := .T.
         Loop
      EndIf

      If wAchou
         If SubStr(wTexto,wx,1)=='"'
           If wInicio=0
              wInicio := wx+1
           Else
              wProc := SubStr(wTexto,wInicio,wx-wInicio)
              wProc := AllTrim(wProc)

              If cScan(__wMatrizPrcMemo,wProc,1)=0
                 wMemo := __fSuper_Prc_Memo(wProc)
                 __fSuper_Prc_Scan_Aux(wProc,wMemo)
              EndIf

              wInicio := 0
              wAchou  := .F.
              wProc   := ""
           EndIf
         EndIf
      EndIf
   Next

Return __wMatrizPrcMemo
*fim da Function __fSuper_Prc_Scan(wObj_Prp_Vlr)

function __fSuper_Prc_Scan_Aux(wObj_Nome,wMemo)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wTexto,wLen,wx,wInicio,wFinal,wAchou,wProc

   aAdd( __wMatrizPrcMemo , {wObj_Nome,wMemo} )

   wTexto  := Lower(wMemo)
   wLen    := Len(wTexto)
   wInicio := 0
   wFinal  := 0
   wAchou  := .F.
   wProc   := ""

   For wx := 01 To wLen
      If SubStr(wTexto,wx,12)=="fprc_execute"
         wAchou  := .T.
         Loop
      EndIf

      If wAchou
         If SubStr(wTexto,wx,1)=='"'
           If wInicio=0
              wInicio := wx+1
           Else
              wProc := SubStr(wTexto,wInicio,wx-wInicio)
              wProc := AllTrim(wProc)

              If cScan(__wMatrizPrcMemo,wProc,1)=0
                 wMemo := __fSuper_Prc_Memo(wProc)
                 __fSuper_Prc_Scan_Aux(wProc,wMemo)
              EndIf

              wInicio := 0
              wAchou  := .F.
              wProc   := ""
           EndIf
         EndIf
      EndIf
   Next

Return .T.
*fim da Function __fSuper_Prc_Scan_Aux(wMemo)

//function __fSuper_Prc_Open()
//*************************************************************************************
//*                                                                                   *
//*************************************************************************************
//
//    fObj_LoadAll("frm_super_prc_open")
//
//Return .T.
//*fim da Function __fSuper_Prc_Open()

function __fSuper_Prc_Close()
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wPosObj,oFldPrp,oMemo,wPosPrc,wQtd,wOpt,wxLen,wx

   wPosObj := __oFldObjPrc:nOption
   oFldPrp := __oFldPrpPrc[wPosObj]
   wPosPrc := oFldPrp:nOption
   
   If Len(__vProcedure)>0
      oMemo := __vProcedure[wPosObj,wPosPrc,2]
      oMemo:End()
      oMemo:Destroy()
      
      __vProcedure[wPosObj,wPosPrc,1] := ""
      __vProcedure[wPosObj,wPosPrc,2] := NIL
   EndIf

   oFldPrp:aPrompts[wPosPrc] := ""
   oFldPrp:aEnable [wPosPrc] := .F.
   
   wQtd  := 0
   wOpt  := 0
   wxLen := Len(oFldPrp:aEnable)
   
   For wx := 01 To wxLen
     If oFldPrp:aEnable[wx] = .F.
        wQtd := wQtd + 1
     Else
        If cEmpty(wOpt)
           wOpt := wx
        EndIf
     EndIf
   Next
   
   If wQtd = wxLen
      oFldPrp:DelPages()
      oFldPrp:End()

      __oFldObjPrc:aPrompts[__oFldObjPrc:nOption] := ""
      __oFldObjPrc:aEnable [__oFldObjPrc:nOption] := .F.

      wQtd := 0
      wOpt := 0

      wxLen := Len(__oFldObjPrc:aEnable)
      For wx := 01 To wxLen
        If __oFldObjPrc:aEnable[wx] = .F.
           wQtd := wQtd + 1
        Else
           If cEmpty(wOpt)
              wOpt := wx
           EndIf
        EndIf
      Next

      If wQtd = wxLen
         __oWndProcedure:End()
      Else
         __oFldObjPrc:SetOption(wOpt)
      EndIf
   Else
      oFldPrp:SetOption(wOpt)
   EndIf

Return .T.
*fim da Function __fSuper_Prc_Close()

function __fSuper_Prc_MudaFolder(wNum_Fld,oFld)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wObj_Nome

   wObj_Nome := Space(00)

   If wNum_Fld = 1
      If oFld:nOption <= Len(__oFldPrpPrc)
         wObj_Nome := " - " + __oFldPrpPrc[oFld:nOption]:aPrompts[__oFldPrpPrc[oFld:nOption]:nOption]
      EndIf
   Else
      wObj_Nome := " - " + oFld:aPrompts[oFld:nOption]
   EndIf

   __oWndProcedure:SetText("Editor de Procedure" + wObj_Nome)

Return .T.
*fim da Function __fSuper_Prc_MudaFolder(wNum_Fld,oFld)

function __fSuper_Prc_New_Next()
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wLenPrc,wz1,wz2,wz3,wPrp_Nome

   wLenPrc := 01
   For wz1 := 01 To Len(__vProcedure)
      For wz2 := 01 To Len(__vProcedure[wz1])
         If __vProcedure[wz1,wz2,03] = .T.    // Procedure Nova
            wLenPrc := wLenPrc + 01
         EndIf
      Next
   Next
   wPrp_Nome := "New Procedure_"+AllTrim(Str(wLenPrc))

Return wPrp_Nome
*fim da Function __fSuper_Prc_New_Next()

function __fSuper_Obj_Add(wObj_Tp_Pai,wObj_Nome_Pai,pItem,oTree,oBrwFRM,oBrwPRC)
*************************************************************************************
*                             Adciona um novo Objeto                                *
************************************************************************************* 
Local wLinha, wColuna, oBtn , wMatriz_Tp , wObj_Nome , oTreeX , oTreeClone,wResp,wWhere,wx,oXItem
Local oG_Nome_Pai, oS_Nome_Pai, oG_Nome, oS_Nome, oG_Tipo, oS_Tipo, wObj_Pai_Tp,wxSistema,wSistema,wPrograma
Local oG_Estru_Pai , oG_Estrutura , wEstrutura , oCkb, wV_Tipo , oG_Clona , wClona,oImageList,oItem,oDlg

   If .Not.__wc_IDE_NewObjOpen
      wMatriz_Tp := {}
      wV_Tipo    := Space(003)
      wObj_Nome  := Space(252)
      wEstrutura := .F.
      
      wObj_Nome_Pai := AllTrim(cNvl(wObj_Nome_Pai,""))
      
      If .Not.cEmpty(wObj_Tp_Pai)
         If wObj_Tp_Pai = "MNU"
            aAdd( wMatriz_Tp , "MNU" )
         Else
           If wObj_Tp_Pai = "FLT" .Or. wObj_Tp_Pai = "FRM"
              aAdd( wMatriz_Tp , "FLD" )
              aAdd( wMatriz_Tp , "BTN" )
              aAdd( wMatriz_Tp , "GRD" )
              aAdd( wMatriz_Tp , "GET" )
              aAdd( wMatriz_Tp , "FME" )
              aAdd( wMatriz_Tp , "SAY" )
           ElseIf wObj_Tp_Pai = "FLD"
              aAdd( wMatriz_Tp , "FLT" )
           ElseIf wObj_Tp_Pai = "GRD"
              aAdd( wMatriz_Tp , "GET" )
           Else
              Return .F.
           EndIf
         EndIf
      Else
         aAdd( wMatriz_Tp , "FRM" )
      EndIf
      wV_Tipo := wMatriz_Tp[1]
      
      oDlg := TWindow():New( 10 , 20  , 125   , 910  ,"Novo Objeto...",      ,     ,      ,     ,       ,.F.     ,.F.     ,cColorText("PRETO"),cColorText("BRANCO"),       ,"NONE"  ,        ,        ,.F. ,.F.  , .T. )
                      // METHOD New(nTop,nLeft,nBottom,nRight, cTitle         ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore       ,nClrBack        ,oCursor, cBorder,lSysMenu,lCaption,lMin, lMax, lPixel ) CONSTRUCTOR
      
         oG_Nome_Pai := TMultiGet():New(25,10,{|u|If(PCount()==0,wObj_Nome_Pai,wObj_Nome_Pai:=u)} ,oDlg,450,50,oFont,.F.     ,,,,.T.    ,,.F.,,.F.,.F.    ,.T. ,,,.F.,)
         oG_Nome_Pai:Set3DLooK()
      
         wLinha  := oG_Nome_Pai:nTop-15
         wColuna := oG_Nome_Pai:nLeft
         oS_Nome_Pai := TSay():New( wLinha, wColuna , {|| "Nome do Objeto Pai"},oDlg,,oFont,.F.      ,.F.    , .F.    , .T.    ,         ,         ,100   ,14     ,.F.     ,.T.     ,.F.     ,.F. ,.F. )
      
         wLinha  := oG_Nome_Pai:nTop  //+oG_Nome_Pai:nHeight+13
         wColuna := oG_Nome_Pai:nLeft+oG_Nome_Pai:nWidth+20 
      
         oG_Nome := TGet():New(wLinha,wColuna ,{|u|If(PCount()==0,wObj_Nome,wObj_Nome:=u)},oDlg,395,20,,,,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,,.F.,,.F.,,,,)
         oG_Nome:cPicture     := "@a"
         oG_Nome:oGet:Picture := "@a"
         oG_Nome:Set3DLooK()
      
         wLinha  := oG_Nome:nTop-15
         oS_Nome := TSay():New( wLinha, wColuna , {|| "Nome do novo objeto"},oDlg,,oFont,.F.      ,.F.    , .F.    , .T.    ,         ,         ,120   ,14     ,.F.     ,.T.     ,.F.     ,.F. ,.F. )
      
         wLinha  := oG_Nome:nTop+oG_Nome:nHeight+15  
         oG_Tipo := TComboBox():New(wLinha,wColuna+80,{|u|If(PCount()==0,wV_Tipo,wV_Tipo:=u)},wMatriz_Tp,100   ,140    ,oDlg,,{||oG_Tipo:cMsg:=wV_Tipo},      ,        ,        ,.T.   ,     ,    ,.F.    ,     ,.F.    ,         ,         ,      ,     ,)
                    //   METHOD New( nRow , nCol     , bSetGet                               , aItems   ,nWidth,nHeight,oWnd        ,,bChange                  ,bValid,nClrText,nClrBack,lPixel,oFont,cMsg,lUpdate,bWhen,lDesign,acBitmaps,bDrawItem,nStyle,cPict, bEChange ) CONSTRUCTOR
         oG_Tipo:Set3DLooK()
         oG_Tipo:cMsg := wV_Tipo
         
         wLinha  := oG_Tipo:nTop+4
         oS_Tipo := TSay():New( wLinha, wColuna , {|| "Tipo do Objeto:"},oDlg,,oFont,.F.      ,.F.    , .F.    , .T.    ,         ,         ,080   ,14     ,.F.     ,.T.     ,.F.     ,.F. ,.F. )
         
         wLinha  := oG_Tipo:nTop
         wColuna := oG_Tipo:nLeft+oG_Tipo:nWidth+40
         oBtn    := TButton():New(wLinha,wColuna,"&Confirma",oDlg,{||__fSuper_Obj_Add_Create(wObj_Nome_Pai,wObj_Nome,oG_Tipo:cMsg,oG_Clona:cMsg,wEstrutura,oTreeX,pItem)},70,20,,,.F.,.T.,.F.,,.F.,,,.F. )
      
         wLinha  := oBtn:nTop
         wColuna := oBtn:nLeft+oBtn:nWidth+20
         oG_Clona = TCheckBox():New(wLinha,wColuna,HB_AnsiToOem("Importar"),{|u|If(PCount()==0,wClona,wClona:=u)},oDlg,060   ,16     ,          ,{||oDlg:Move(10,20,900,iif(oG_Clona:cMsg,115,600),.T.),oG_Clona:cMsg:=.Not.oG_Clona:cMsg},     ,      ,        ,        ,.F.    ,.T.    ,     ,.F.     ,     )
                         //   METHOD New(nRow  , nCol  , cCaption          ,bSetGet                              , oWnd       ,nWidth,nHeight,nHelpTopic,bChange                                                                                  ,oFont,bValid,nClrFore,nClrBack,lDesign, lPixel, cMsg, lUpdate,bWhen) CONSTRUCTOR
         oG_Clona:cMsg := .F.
      
         oImageList = TImageList():New(16,16)
         oImageList:Add( TBitmap():Define( ,"image\FRM.bmp",oDlg) ,)  // 0
         oImageList:Add( TBitmap():Define( ,"image\FLD.bmp",oDlg) ,)  // 1 
         oImageList:Add( TBitmap():Define( ,"image\FLT.bmp",oDlg) ,)  // 2 
         oImageList:Add( TBitmap():Define( ,"image\GRD.bmp",oDlg) ,)  // 3 
         oImageList:Add( TBitmap():Define( ,"image\GET.bmp",oDlg) ,)  // 5 
         oImageList:Add( TBitmap():Define( ,"image\BTN.bmp",oDlg) ,)  // 10
         oImageList:Add( TBitmap():Define( ,"image\FME.bmp",oDlg) ,)  // 11
         oImageList:Add( TBitmap():Define( ,"image\SAY.bmp",oDlg) ,)  // 13
      
         wLinha  := oG_Nome_Pai:nTop+oG_Nome_Pai:nHeight+20
         wColuna := oG_Nome_Pai:nLeft
         oTreeX  := TTreeView():New(wLinha,wColuna,oDlg,        ,        , .T.   , .F.    ,700   , 475    ,    )
                       //     New( nTop  , nLeft ,oWnd        ,nClrFore,nClrBack, lPixel, lDesign,nWidth, nHeight,cMsg)
         oTreeX:SetImageList( oImageList )
      
         wLinha  := oTreeX:nTop +25
         wColuna := oTreeX:nLeft+oTreeX:nWidth+20
         oG_Estrutura := TCheckBox():New(wLinha,wColuna,HB_AnsiToOem("Importar Sub-Estrutura"),{|u|If(PCount()==0,wEstrutura,wEstrutura:=u)},oDlg,125   ,16     ,          ,       ,     ,      ,        ,        ,.F.    ,.T.    ,     ,.F.     ,     )
                           //   METHOD New(nRow  , nCol  , cCaption                         ,bSetGet                                        , oWnd       ,nWidth,nHeight,nHelpTopic,bChange,oFont,bValid,nClrFore,nClrBack,lDesign, lPixel, cMsg, lUpdate,bWhen) CONSTRUCTOR
      
         oTreeX:bLDblClick := {|| fSuper_Obj_Tree_Click(oTreeX) }
         oTreeX:bChanged   := {|| wObj_Nome:=fSuper_Obj_Tree_Change(wObj_Tp_Pai,oTreeX,oG_Tipo) , oG_Nome:Refresh()  } //}
      
         wxSistema  := Space(00)
         wSistema   := Space(00)
         wPrograma  := Space(00)
      
         If wObj_Tp_Pai = "MNU"
            wWhere := " Obj_Tp = "+Campo("MNU") + " And Obj_Nome Not Like " + Campo("%.%")
            wResp  := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Seq"},wWhere,"OBJ_SEQ","DISTINCT")
      
            For wx := 01 To Len(wResp)
               wSistema := cUpper(AllTrim(cNvl(wResp[wx,1],"")))
      
               If .Not.cEmpty(wSistema)
                  oItem    := oTreeX:Add(wSistema,13)
                  oItem:Cargo := {1,wSistema,"MNU","","",wResp[wx,2]}
               EndIf
            Next
         Else
            wWhere := " cCase_Obj.Obj_Nome = cCase_Obj_Prp.Obj_Nome"
            wWhere := wWhere + " And Obj_Tp = " + Campo("FRM")
            wWhere := wWhere + " And Prp_Nome = " + Campo("SISTEMA")
            wResp  := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","Obj_Prp_Vlr","Obj_Seq"},wWhere,"Obj_Prp_Vlr,Obj_Seq")
            
            For wx := 01 To Len(wResp)
               wPrograma := cLower(AllTrim(cNvl(wResp[wx,1],"")))
               wSistema  := cUpper(AllTrim(cNvl(wResp[wx,2],"")))
            
               If .Not.cEmpty(wSistema)
                  If cEmpty(wxSistema) .Or. wSistema <> wxSistema
                     oItem := oTreeX:Add(wSistema,13)
                     oItem:Cargo := {1,"","","","",1}
                  EndIf
            
                  oXItem := oItem:Add(wPrograma,0)
                  oXItem:Cargo := {2,"","FRM",wPrograma,"",wResp[wx,3]}
                  wxSistema := wSistema
               EndIf
            Next
         EndIf
      
         If Len(wResp)=0
            oTreeX:Add("null")
         EndIf
         oTreeX:Refresh() 

         __wc_IDE_NewObj     := oDlg
         __wc_IDE_NewObjOpen := .T.

      oDlg:bValid := {||__fSuper_Obj_AddEnd()}
      oDlg:Activate( "NORMAL",,,,,,,,,,,,,,,,,,)
   Else
      ShowWindow( __wc_IDE_NewObj:hWnd , 9 )
   EndIf

Return .T.
* fim da function __fSuper_Obj_Add()

function __fSuper_Obj_AddEnd()
*************************************************************************************
*                           Saida da tela de novo objeto                            *
*************************************************************************************
   __wc_IDE_NewObjOpen := .F.
Return .T.
* fim da function __fSuper_Obj_AddEnd()

function __fSuper_Obj_Add_Create(wObj_Nome_Pai,wObj_Nome,wObj_Tp,wLclona,wEstrutura,oTree,pItem)
*************************************************************************************
*                           Confirma inclusão de Objeto                             *
*************************************************************************************
Local wObj_Nome_Db , wResp , wWhere , wObj_Seq , wx, wObj_Nome1FLT, wObj_Nome2FLT, wPos
Local wDLinha,wDColuna,wDAltura,wDLargura,oItem,wObj_Tp_Tree,wSql,wInic,wDate,wObj_Orig
Local wObjNome,wObjNomeP,wObjNomeF,wItem,wImage,wSistema,wTitulo,wNivel,wFRM_Nome,wPosObj

     If cEmpty(wObj_Tp)
        MsgInfo("Tipo do Novo Objeto não Informado" , "Atenção...")
        Return .F.
     EndIf

     If .Not.cEmpty(wObj_Nome)
        wObj_Nome_Pai := AllTrim(cNvl(wObj_Nome_Pai,""))
        wObj_Nome     := __fCase_Obj_Nome_Config(wObj_Nome)
  
        wObj_Seq      := 00
        wObj_Nome_Db  := wObj_Nome_Pai + iif(cEmpty(wObj_Nome_Pai),"",".") + wObj_Nome

        wWhere := "Obj_Nome = " + Campo(wObj_Nome_Db)
        wResp := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Tp"},wWhere)
        If Len(wResp)>0
           MsgInfo("Nome do Objeto ("+Campo(wResp[1,1])+") já Cadastrado como Tipo: "+Campo(wResp[1,2]) , "Atenção...")
           Return .F.
        Else
           wWhere := "Obj_Nome like " + Campo(wObj_Nome_Pai+".%")
           wWhere := wWhere + " And Obj_Nome not like " + Campo(wObj_Nome_Pai+".%.%")
           wResp  := fConsulta2("cCase_Obj",{"Max(Obj_Seq)"},wWhere)
           If Len(wResp)>0
              wObj_Seq := wResp[1,1]
           EndIf
           wObj_Seq := wObj_Seq + 10
        EndIf
    
        If wLclona
           oItem := oTree:GetSelected()
           If valtype(oItem)="U"
              oItem := oTree:aItems[1]
           EndIf
    
           wObj_Tp_Tree := oItem:Cargo[3]
           If wObj_Tp<>wObj_Tp_Tree
              MsgInfo("Tipo do novo objeto diferente do tipo de objeto a ser importado!","Erro...")
              return .F.
           EndIf

           wObj_Orig := oItem:Cargo[4]
           If wEstrutura
              wInic := Len(wObj_Orig)+1

              wSql := "Insert Into cCase_Obj (Obj_Nome,Obj_Tp,Obj_Seq,Obj_Dsc,Obj_Sts) "
              wSql := wSql + " Select ConCat("+Campo(wObj_Nome_Db)+",SubString(Obj_Nome,"+StrZero(wInic,3,0)+",300)),Obj_Tp,Obj_Seq,Obj_Dsc,'1' "
              wSql := wSql + " From cCase_Obj Where Obj_Nome Like " + Campo(wObj_Orig+".%")
              cSql_Execute("cCase_Obj",wSql)

              wSql := "Insert Into cCase_Obj_Prp (Obj_Nome,Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo)"
              wSql := wSql + " Select ConCat(" + Campo(wObj_Nome_Db) + ",SubString(Obj_Nome," + StrZero(wInic,3,0) + ",300)),Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo"
              wSql := wSql + " From cCase_Obj_Prp Where Obj_Nome Like " + Campo(wObj_Orig+".%")
              cSql_Execute("cCase_Obj_Prp",wSql)
           EndIf
                 * ---------------- Inclui Objeto no Cadastro de Objeto ---------------- *
           fInsert2("cCase_Obj",{"Obj_Nome",wObj_Nome_Db,"obj_tp",wObj_Tp,"Obj_Seq",wObj_Seq},)

           wSql := "Insert Into cCase_Obj_Prp (Obj_Nome,Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo) "
           wSql := wSql + " Select " + Campo(wObj_Nome_Db)+",Prp_Nome,Obj_Prp_Vlr,Obj_Prp_Memo"
           wSql := wSql + " From cCase_Obj_Prp Where Obj_Nome = " + Campo(wObj_Orig)
           cSql_Execute("cCase_Obj_Prp",wSql)

        // wWhere := "Obj_Nome Like " + Campo(wObj_Nome_Db+"%") 
        // wWhere := wWhere + " And ( Prp_Nome = " + Campo("OBJ_NOME_PAI")
        // wWhere := wWhere + " Or    Prp_Nome = " + Campo("OBJ_NOME")+ ")"
        // wResp  := fConsulta2("cCase_Obj_Prp",{"Obj_Nome"},wWhere,"Obj_Nome","DISTINCT")
        // For wx := 01 To Len(wResp)
        //    wObjNome  := cLower(AllTrim(cNvl(wResp[wx,01],"")))
        //    wObjNomeP := cSuper_Obj_Pai(wObjNome)
        //    wObjNomeF := StrTran(wObjNome,wObjNomeP+".","")
        //
        //    wSql := "Obj_Nome = " + Campo(wObjNome)
        //    fUpdate2("cCase_Obj_Prp",wSql+ " And Prp_Nome="+Campo("OBJ_NOME_PAI") ,{"Obj_Prp_Vlr",wObjNomeP},)
        //    fUpdate2("cCase_Obj_Prp",wSql+ " And Prp_Nome="+Campo("OBJ_NOME"),{"Obj_Prp_Vlr",wObjNomeF},)
        // Next
    
           oTree:oWnd:End() // Fecha o caixa de inclusão
           return .t.
        Else
           * ---------------- Inclui Objeto no Cadastro de Objeto ---------------- *
           If wObj_Tp="FRM"
              wObj_Nome_Pai := wObj_Nome_Db
              wFRM_Nome     := wObj_Nome_Db
           Else
              wFRM_Nome     := SubStr(wObj_Nome_Db,1,At(".",wObj_Nome_Db)-1)
           EndIf
           fInsert2("cCase_Obj",{"Obj_Nome",wObj_Nome_Db,"obj_tp",wObj_Tp,"obj_seq",wObj_Seq},)
  
           * -------- Inclui Objeto no Cadastro de Objeto e Propriedade ---------- *
           If wObj_Tp <> "MNU"
              oTree:oWnd:End() // Fecha o caixa de inclusão
              If wObj_Tp = "GRD"
                 //fSuper_Table_Grid_Create(wObj_Nome_Db,wObj_Nome_Pai,wPosObj)
              Else
                 If wObj_Tp="FRM"
                    wTitulo := wObj_Nome_Db
                 Else
                    wTitulo := SubStr(wObj_Nome_Db,rAt(".",wObj_Nome_Db)+1)
                 EndIf
    
                 wTitulo := cUpper(wTitulo,.T.)
                 If wObj_Tp="FLT"
                    wTitulo := "&"+wTitulo
                 EndIf

                 If wObj_Tp<>"FLD"
                    //fInsert2("cCase_Obj_Prp",{"Obj_Nome",wObj_Nome_Db,"Prp_Nome","TITLE","Obj_Prp_Vlr",wTitulo},)
                 EndIf
              EndIf

              If wObj_Tp = "FLD"
                 wObj_Nome1FLT := Space(100)
                 MsgGet( "Objeto FLT","Nome do objeto da 1º Aba:",@wObj_Nome1FLT,"image\folder.bmp")
                 If cEmpty(wObj_Nome1FLT)
                    wObj_Nome1FLT := "flt_default"
                 EndIf
                 wObj_Nome1FLT := AllTrim(wObj_Nome1FLT)
                 wObj_Nome2FLT := wObj_Nome_Db+"."+wObj_Nome1FLT

                 fInsert2("cCase_Obj",{"Obj_Nome",wObj_Nome2FLT,"obj_tp","FLT","obj_seq",10},)

                 wTitulo := "&"+cUpper(wObj_Nome1FLT,.T.)

                 //fInsert2("cCase_Obj_Prp",{"Obj_Nome",wObj_Nome2FLT,"Prp_Nome","TITLE","Obj_Prp_Vlr",wTitulo},)
              Else
                 wObj_Nome := wObj_Nome_Db
              EndIf

              //fSuper_Var_Atrib(wObj_Nome,wObj_Tp)
           EndIf

           //aSort(_wMCase_Obj[wc_FRM],,,{|x,y|x[__aSortBin]<y[__aSortBin]})  // será a posicao 1
        EndIf

        If wObj_Tp = "MNU"
           fInsert2("cCase_Obj_Prp",{"Obj_Nome",wObj_Nome_Db,"Prp_Nome","ACESSO","Obj_Prp_Vlr","0"})
           oTree:oWnd:End() // Fecha o caixa de inclusão
  
           wPos := rAt(".",wObj_Nome)
           If wPos=01
              wItem  := wObj_Nome
              wNivel := 2
              wImage := 1
           Else
              wItem  := SubStr(wObj_Nome,wPos+1)
              wNivel := 3
              wImage := 2
           EndIf
           oItem       := pItem:Add(wItem,wImage)
           oItem:Cargo := {wNivel,wObj_Nome_Db,wObj_Tp,wObj_Nome_Pai,"",wObj_Seq}
        Else
           wItem := SubStr(wObj_Nome_Db,rAt(".",wObj_Nome_Db)+1)
           If     wObj_Tp = "FRM"
              wImage := 0
              wItem  := wObj_Nome_Db
           ElseIf wObj_Tp = "FLD"
              wImage := 1
           ElseIf wObj_Tp = "FLT"
              wImage := 2
           ElseIf wObj_Tp = "GRD"
              wImage := 3
           ElseIf wObj_Tp = "GET"
              wImage := 4
           ElseIf wObj_Tp = "BTN"
              wImage := 5 
           ElseIf wObj_Tp = "FME"
              wImage := 6 
           ElseIf wObj_Tp = "SAY"
              wImage := 7
           Else
              wImage := 0
           EndIf
           If ValType(pItem)="O" .And. wObj_Tp<>"FRM"
              oItem       := pItem:Add(wItem,wImage)
              oItem:Cargo := {cAtQtd(wObj_Nome_Db,"."),wObj_Nome_Db,wObj_Tp,wObj_Nome_Pai,"",wObj_Seq}
           EndIf
    
           If wObj_Tp = "FLD"
              If ValType(oItem)="O"
                 oItem := oItem:Add(wObj_Nome1FLT,2)
                 oItem:Cargo := {cAtQtd(wObj_Nome2FLT,"."),wObj_Nome2FLT,"FLT",wObj_Nome_Db,"",wObj_Seq}
              EndIf
           EndIf
        EndIf
     Else
        MsgInfo("Nome do Novo Objeto não Informado" , "Atenção...")
        Return .F.
     EndIf

Return .T.
* fim da function __fSuper_Obj_Add_Create()

function fSuper_Obj_Tree_Click(oTree)
***************************************************************************************
*                          Carrega Pesquisa de Objetos                                *
***************************************************************************************
Local wObj_Nome,wObj_Tp,wObj_Pai,wObj_Tree,wWhere,wQtdPonto,oItem,wObj_Nome_Pai,wObj_Var,wResp,wx,oXItem,wImage

   oItem := oTree:GetSelected()
   If Len(oItem:aItems)=0
   // If oItem:Cargo[1]<2
   //   Return .F.
   // EndIf

      wObj_Nome_Pai := Space(00)
      If .Not.cEmpty(oItem:Cargo[2])
         wObj_Nome_Pai := oItem:Cargo[2]+"."
      EndIf
      wObj_Nome_Pai := wObj_Nome_Pai + AllTrim(oItem:cPrompt)

      wWhere :=          " Obj_Nome Like " + Campo(wObj_Nome_Pai+".%")
      wWhere := wWhere + " And Obj_Nome Not Like " + Campo(wObj_Nome_Pai+".%.%")
      wWhere := wWhere + " And Obj_Tp <> " + Campo("PRC")
      wResp  := fConsulta2("cCase_Obj",{"Obj_Nome","Obj_Tp","Obj_Seq"},wWhere,"Obj_Seq")

      For wx := 01 To Len(wResp)
         wObj_Tp     :=        AllTrim(cNvl(wResp[wx,2],""))
         wObj_Nome   := AllTrim(cNvl(wResp[wx,1],""))
         wQtdPonto   := cAtQtd(wObj_Nome,".")
         wObj_Var    := wObj_Nome
         wObj_Var    := StrTran(wObj_Nome,wObj_Nome_Pai+".","")

         if     wObj_Tp="FRM"
            wImage := 0
         Elseif wObj_Tp="FLD"
            wImage := 1
         ElseIf wObj_Tp="FLT"
            wImage := 2
         ElseIf wObj_Tp="GRD"
            wImage := 3
         ElseIf wObj_Tp="GET"
            wImage := 4
         ElseIf wObj_Tp="BTN"
            wImage := 5 
         ElseIf wObj_Tp="FME"
            wImage := 6 
         ElseIf wObj_Tp="SAY"
            wImage := 7 
         Else
            wImage := 0
         EndIf

         oXItem := oItem:Add(wObj_Var,wImage)
         oXItem:Cargo := {wQtdPonto+1,wObj_Nome_Pai,wObj_Tp,wObj_Nome,"",wResp[wx,3]}
      Next
      oItem:Expand()
      oTree:Refresh()
   EndIf

Return .T.
* fim da function fSuper_Obj_Tree_Click(oTree)

function fSuper_Obj_Tree_Change(wObj_Tp_Pai,oTreeX,oTipo)
***************************************************************************************
*                                                                                     *
***************************************************************************************
Local wObj_Nome,wObj_Tp_Tree,wx,wNivel

   wNivel    := oTreeX:GetSelected():Cargo[1]
   wObj_Nome := Space(00)

   If wObj_Tp_Pai="MNU"
      If wNivel>=2
         wObj_Nome  := AllTrim(oTreeX:GetSelected():cPrompt)
      EndIf
   Else   
      If wNivel=1
         Return Space(252)
      EndIf
      wObj_Nome := Space(00)
      
      wObj_Tp_Tree := oTreeX:GetSelected():Cargo[3]
      
      For wx := 01 To Len(oTipo:aItems)
         If oTipo:aItems[wx] = wObj_Tp_Tree
            oTipo:Set(oTipo:aItems[wx])
            oTipo:cMsg := wObj_Tp_Tree
            wObj_Nome  := AllTrim(oTreeX:GetSelected():cPrompt)
            Exit
         EndIf
      Next
   EndIf

Return wObj_Nome+Space(252)
* fim da function fSuper_Obj_Tree_Change(oTreeX)

Function __fCase_Obj_Nome_Config(wObj_Nome)
********************************************************************************
*                         Configura nome do objeto                             *
* (A..Z-065..090) (a..z-097..122) (0..9-48..57)                                *
********************************************************************************
Local wTextoResp,wChar,wAsc,wx,wLen

   wTextoResp := Space(00)
	wObj_Nome  := AllTrim(cNvl(wObj_Nome,""))
   wLen       := Len(wObj_Nome)
   
	For wx := 01 To wLen
		wChar := SubStr(wObj_Nome,wx,1)
      wAsc  := Asc(wChar)

      If (wAsc>=48.and.wAsc<=057) .or.;  // (0..9-48..57)
         (wAsc>=65.and.wAsc<=090) .or.;  // (A..Z-065..090)
         wAsc=095                 .or.;  // "_"
         (wAsc>=97.and.wAsc<=122)        // (a..z-097..122)

       //if (wAsc>=65.and.wAsc<=090)
       //   wChar := CHR(wAsc + 32)
       //EndIf
         
      Else
         wChar := "#"
      EndIf
      wTextoResp := wTextoResp + wChar
	Next

	wTextoResp := StrTran(wTextoResp,"#","")

return wTextoResp
*Fim da Function __fCase_Obj_Nome_Config()

Function __fSuper_Obj_AddMatrix(wObj_Nome,wObj_Tp,wObj_Seq)
********************************************************************************
*                  Adiciona Objeto na matriz correspondente                    *
********************************************************************************
Local wPosObj,wy

	If wObj_Tp = "FRM"
	   __fSuper_AddFRM(wObj_Nome)
	EndIf

return __fSuper_AddObj(wObj_Nome,wObj_Tp,wObj_Seq,nil)
*Fim da Function __fSuper_Obj_AddMatrix()

function __fSuper_Obj_Del(oxItem,wObj_Tp,wObj_Nome)
*************************************************************************************
*                                Exclui o Objeto do                                 *
************************************************************************************* 
Local wObj_Pai,wObjeto,wPos,wPosObj,wFRM

   If wObj_Tp="FLT"
      wObj_Pai := SubStr(wObj_Nome,1,rAt(".",wObj_Nome)-1)

	   wFRM    := _fCase_Scan_Frm(wObj_Pai)
	   wPosObj := cScan(__wMCase_Obj[wFRM],wObj_Pai,1)  //StrTran(_wObj_Nome,"_",""))

	   If wPosObj=0
	      Return nil
	   EndIf

	   wObjeto  := __wMCase_Obj[wFRM][wPosObj,__wobjeto ]

      If ValType(wObjeto)="O"
         If Len(wObjeto:aPrompts)<= 1
            wObj_Nome := wObj_Pai
            wObj_Tp   := "FLD"
         Else
            wPos := cScan( wObjeto:cargo , wObj_Nome , 1)
            If wPos>0
               aDel(wObjeto:cargo,wPos)
               aSize(wObjeto:cargo,Len(wObjeto:cargo)-1)
            EndIf
         EndIf
      EndIf
   EndIf

   If __fSuper_Del(wObj_Nome,wObj_Tp)
      __fSuper_Tree_Del(oxItem:oTree,oxItem,1)
      oxItem:oTree:Refresh()
      UpdateWindow( oxItem:oTree:hWnd )
   EndIf

Return .T.
* fim da function __fSuper_Obj_Del()

Function __fSuper_Del(wObj_Nome,wObj_Tp)
********************************************************************************
*                        Cria Matriz de Busca de Objeto                        *
********************************************************************************
Local wx,wDel,wXLen,wLen,wObj_Nome_Pesq,wKeySql

   If cEmpty(wObj_Nome)
      return .f.
   EndIf

   If MsgYesNo("Deseja realmente Exluir o Objeto: " +Campo(wObj_Nome) + " e relacionados " + chr(63) , "Atenção" )
      wObj_Nome := AllTrim(wObj_Nome)
      If At(".",wObj_Nome)=0
         If .Not.MsgYesNo("O programa "+Campo(wObj_Nome)+" será apagado."+Chr(13)+Chr(10)+"Deseja continuar "+CHR(63),"Atenção")
            Return .F.
         EndIf
      EndIf

      wKeySql := "Obj_Nome Like " + Campo(wObj_Nome+".%")
      fDelete2( "cCase_Obj_Prp",wKeySql,)
      fDelete2( "cCase_Obj"    ,wKeySql,)

      wKeySql := "Obj_Nome = " + Campo(wObj_Nome)
      fDelete2( "cCase_Obj_Prp",wKeySql,)
      fDelete2( "cCase_Obj"    ,wKeySql,)

      //__fCase_Del_Obj(wObj_Nome,wObj_Tp) //__fSuper_Del_Obj(wObj_Nome,wObj_Tp)
   Else
      Return .F.
   EndIf

return .t.
*Fim da Function __fSuper_Del(wObj_Nome,wObj_Tp)

Function __fCase_Del_Obj(_wObj_Nome,wObj_Tp)
************************************************************************************
*                     Função que exclui as propriedades do Objeto                  *
************************************************************************************
Local wx,wDel,wXLen,wMM,wLen,wObj_Tp_Del,wObj_Nome_Pesq,wObj_NomeX,wz,wObjeto,wPos,wLenM,wObjTpX,wPosFRM

   If wObj_Tp = "FRM"
      wLen := Len(__wMCase_Obj[__wc_FRM])
      For wx := 01 To wLen
         wObjeto := __wMCase_Obj[__wc_FRM][wx,__wobjeto]
         If ValType(wObjeto)<>"O"
            Loop
         EndIf
  
         wObjTpX := __wMCase_Obj[__wc_FRM][wx,__wObj_Tp]
         If wObjTpX = "FLD"
            wObjeto:Destroy()
         Else
            If wObjTpX = "RAD"
               For wz := 01 To Len(wObjeto:aItems)
                  wObjeto:aItems[wz]:End()
                  wObjeto:aItems[wz]:=nil
               Next
            Else
               wObjeto:bValid := nil
               wObjeto:End()
            EndIf
         EndIf
  
         If wObjTpX = "GET"
            wObjeto := wObjeto:cargo
            If ValType(wObjeto)="O"
               wObjeto:End()
            EndIf
         EndIf
  
         If wObjTpX = "GRD"
            If ValType(wobjeto:Cargo)="O"
               wobjeto:Cargo:End()
            EndIf
         EndIf
      Next
      wPosFRM := cScan(__wMCase_Frm,_wObj_Nome,1)
      If wPosFRM>0
        __wMCase_Frm[wPosFRM,2] := 0        
      EndIf
  
      __wc_FRM := __wc_FRM-1
      aSize( __wMCase_Obj , __wc_FRM )
   Else
      wMM := {}
      If wObj_Tp = "FLD"
         wObj_Tp_Del := "FLD.FLT.BTN.GRD.GET.FME.SAY.IMG.CAM"
      ElseIf wObj_Tp = "FLT"
         wObj_Tp_Del := "FLT.GRD.BTN.GET.FME.SAY.IMG.CAM"
      ElseIf wObj_Tp = "GRD"
         wObj_Tp_Del := "GRD.GET.FME.SAY.IMG.CAM"
      Else
         wObj_Tp_Del := wObj_Tp+".SAY"
      EndIf
      wObj_NomeX := _wObj_Nome+"."
  
      wLen := Len(__wMCase_Obj[__wc_FRM])
      For wx := wLen To 01 Step -1
         If __wMCase_Obj[__wc_FRM][wx,__wObj_Tp]$wObj_Tp_Del
            wObj_Nome_Pesq := __wMCase_Obj[__wc_FRM][wx,__wObj_Nome]
            If (_wObj_Nome==wObj_Nome_Pesq .Or. At(wObj_NomeX,wObj_Nome_Pesq)>0)
               aAdd(wMM,wObj_Nome_Pesq)
               cSuper(wObj_Nome_Pesq,_wP_DESTROY,1)
            EndIf
         EndIf
      Next
  
      wx    := 00
      wDel  := 00
      wXLen := wLen
      wLenM := Len(wMM)
      For wx := 01 To wLen
         If wx <= wXLen
            wPos := 0
            For wz := 01 To wLenM
               If wMM[wz]==__wMCase_Obj[__wc_FRM][wx,__wObj_Nome]
                  wPos := wz
               EndIf
            Next
            If wPos>0
               aDel(__wMCase_Obj[__wc_FRM],wx)
               wDel  := wDel  + 1
               wXLen := wXLen - 1
               wx    := wx    - 1
            EndIf
         EndIf
      Next
      aSize(__wMCase_Obj[__wc_FRM],wLen-wDel)
   EndIf

return .t.
*Fim da Function __fCase_Del_Obj(_wObj_Nome,wObj_Tp)

function __fSuper_Tree_Del(oTree,oItem,wNivel)
***************************************************************************************
*                          Carrega Pesquisa de Objetos                                *
***************************************************************************************
Local wx,oXItem,wz,wMatriz,ox

   For wx := 01 To Len(oTree:aItems)
      oXItem := oTree:aItems[wx]
      If oXItem:hItem = oItem:hItem
         oItem:DeleteBranches()
         wMatriz := oTree:aItems
         If wNivel=2
            oTree:DeleteBranches()
            oTree:Colapse()
         EndIf

         For wz := 01 To Len(wMatriz)
            If wz <> wx
               ox := oTree:Add(AllTrim(wMatriz[wz]:cPrompt),wMatriz[wz]:nImage)
               ox:Cargo := wMatriz[wz]:Cargo
            EndIf
         Next
         Exit
      Else
         __fSuper_Tree_Del(oXItem,oItem,2)
      EndIf
   Next

Return .T.
* fim da function __fSuper_Tree_Del(oTree,oItem)

function __fSuper_Tree_Refresh(oTree,wObjFrmAdd)
***************************************************************************************
*                          Carrega Pesquisa de Objetos                                *
***************************************************************************************
Local wx,wM_Programa,wPos

   wM_Programa := {}
   For wx := 01 To Len(oTree:aItems)
      aAdd( wM_Programa ,  AllTrim(oTree:aItems[wx]:cPrompt) )
   Next

   oTree:DeleteAll()

   If .Not.cEmpty(wObjFrmAdd)
      wObjFrmAdd := AllTrim(wObjFrmAdd)
      wPos := 0
      For wx := 01 To Len(wM_Programa)
         If wM_Programa[wx] == wObjFrmAdd
            wPos := wx
         EndIf
      Next

      If wPos=0
         __fSuper_AddTree(oTree,wObjFrmAdd,wObjFrmAdd)
      EndIf
   EndIf

   For wx := 01 To Len(wM_Programa)
      __fSuper_AddTree(oTree,wM_Programa[wx],wM_Programa[wx])
   Next
   
   oTree:Select(oTree:aItems[1])

return .t.
*Fim da Function __fSuper_Tree_Refresh(oTree)

Function __fSuper_Obj_Lista(wObj_Nome,wObj_Tp,wObj_Nome_Pai)
********************************************************************************
*                       Busca a Sequencia do Obj_Nome                          *
********************************************************************************
Local wPosObj,wx,wObjSeq,wObjSeq_Atu,wxObjTp,wxObj_Nome,wObj_Seq,wMatriz,wQtd_PontoPai,wMM,wBusca,wFRM

   //wObj_Seq := cSuper_Obj_Seq(wObj_Nome)
   wObj_Seq   := iif(cEmpty(wObj_Seq),9999999,wObj_Seq)
   wObj_Nome  := AllTrim(wObj_Nome)
   wxObj_Nome := Space(00)
   wMatriz    := {}
   wBusca     := .F.

   If cEmpty(wObj_Nome_Pai)
      wBusca := .T.
      wObj_Nome_Pai := SubStr(wObj_Nome,1,rAt(".",wObj_Nome)-1)
   EndIf
   wObj_Nome_Pai := AllTrim(wObj_Nome_Pai)+"."
   wQtd_PontoPai := cAtQtd(wObj_Nome_Pai,".")

   wFRM := __fSuper_Scan_Frm(wObj_Nome)
   For wx := 01 To Len(__wMCase_Obj[wFRM])
      wxObj_Nome := __wMCase_Obj[wFRM][wx,__wObj_Nome]
      wxObjTp    := __wMCase_Obj[wFRM][wx,__wObj_Tp]

      If wxObjTp$wObj_Tp
         If wBusca .Or. (At(wObj_Nome_Pai,wxObj_Nome)>0 .And. wQtd_PontoPai=cAtQtd(wxObj_Nome))
            aAdd( wMatriz , {wxObj_Nome,__wMCase_Obj[wFRM][wx,__wObj_Seq]})
         EndIf
      EndIf
   Next
   If wBusca
      aSort(wMatriz,,,{|x,y| x[1] < y[1] })
   Else
      aSort(wMatriz,,,{|x,y| x[2] < y[2] })
   EndIf

   wxObj_Nome := Space(00)
   wMM := {}
   wx  := 00
   For wx := 01 To Len(wMatriz)
      If (wMatriz[wx,2] < wObj_Seq .Or. wBusca ) .And. .Not.(wMatriz[wx,1]==wObj_Nome)
         aAdd( wMM , wMatriz[wx,1] )
      EndIf
   Next

Return wMM
*Fim da Function __fSuper_Obj_Lista(wObj_Nome,wObj_Tp,wObj_Nome_Pai)

*************************************************************************************
*************************************************************************************
*********************                                        ************************
*********************                  MENU                  ************************
*********************                                        ************************
*************************************************************************************
*************************************************************************************

function __fSuper_Menu()
*************************************************************************************
* Monta menu TREE com os dados do Menu da cCase (wM_Menu)                           *
*************************************************************************************
Local oTree,wx,wLen,oImageList,oSay,oBtn,oTreeX,wLinha,wColuna,wLargura,wResp,wPos_IDE,oBrwFRM,oBrwPRC,oWindow,oSay1,oSay2

   If __wc_IDE_Menu_Open = .F.
      oWindow := TWindow():New( 25  , 010  , 700    ,1010  ,"Gerenciador de Sistemas" ,      ,     ,      ,     ,       ,.F.     ,.F.     ,        ,cColorText("BRANCO"),       ,"NONE" ,        ,        ,.T. ,.F.  , .T. )
                         //New( nTop, nLeft, nBottom,nRight, cTitle                   ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore,nClrBack        ,oCursor,cBorder,lSysMenu,lCaption,lMin, lMax, lPixel ) CONSTRUCTOR

      oImageList = TImageList():New(16,16)

      oImageList:Add( TBitmap():Define( ,"image\ccase.bmp", oWindow ),)
      oImageList:Add( TBitmap():Define( ,"image\sys.bmp"  , oWindow ),)
      oImageList:Add( TBitmap():Define( ,"image\mnu.bmp"  , oWindow ),)
      oImageList:Add( TBitmap():Define( ,"image\frm.bmp"  , oWindow ),)

      oTree := TTreeView():New( 01  , 01   , oWindow,        ,        ,.T.   , .F.    , 300   , 350    ,     )
                    //     New( nTop, nLeft, oWnd        ,nClrFore,nClrBack,lPixel, lDesign, nWidth, nHeight,cMsg )

      oTree:SetImageList( oImageList )

      oTree:bLDblClick := {|| __fSuper_Menu_DbClick(oTree) }
      oTree:bKeyDown   := {|nKey| iif(nKey=13,__fSuper_Menu_DbClick(oTree),) }
      oTree:bRClicked  := {|nRow,nCol| __fSuper_Menu_rClick(nRow,nCol,oTree,oWindow,oBrwFRM,oBrwPRC)}
      oTree:bChanged   := {|| __fSuper_Menu_ChangeTree(oTree,oBrwFRM,oBrwPRC)}

      __fSuper_Menu_AddTree(oTree)

      __fSuper_Menu_IDE(oTree:nTop+oTree:nHeight+5,oTree:nLeft,oTree:nWidth,275,oWindow,oTree)

      oSay1 := TSay():New(6   , 306 ,     ,oWindow, ""      ,      , .F.      , .F.   , .T.    , .T.    ,         ,cColorText("BRANCO"), 685    , 325    , .F.    ,.F.     ,.T.     ,.F.  ,.F.)
            // TSay():New(nRow, nCol,bText, oWnd       , cPicture, oFont, lCentered, lRight, lBorder, lPixels, nClrText, nClrBack       , nWidth , nHeight, lDesign, lUpdate, lShaded, lBox, lRaised ) CONSTRUCTOR
      oBrwFRM := __fSuper_Menu_Form(oTree,oWindow,oSay1)

      oSay2 := TSay():New( 341 , 306 ,     ,oWindow, ""      ,      , .F.      , .F.   , .T.    , .T.    ,        ,cColorText("BRANCO"), 685    , 305  , .F.    ,.F.     ,.T.     ,.F.  ,.F.)
            // TSay():New( nRow, nCol,bText, oWnd       , cPicture, oFont, lCentered, lRight, lBorder, lPixels,nClrText,nClrBack        , nWidth , nHeight, lDesign, lUpdate, lShaded, lBox, lRaised ) CONSTRUCTOR
      oBrwPRC := __fSuper_Menu_Procedure(oWindow,oSay2)

      oBrwFRM:bChange := {|| __fSuper_Menu_Form_MontaPRC(oBrwPRC) }

      __wc_IDE_Menu_Open   := .T.
      __wc_IDE_Menu_Objeto := oWindow

      oWindow:bValid   := {|| __fSuper_Menu_End()}
      oWindow:Activate("NORMAL",,,,,,,,,,,,,,,,,,)
                // Activate( cShow, bLClicked, bRClicked, bMoved, bResized, bPainted, bKeyDown, bInit,bUp, bDown, bPgUp, bPgDn,bLeft, bRight, bPgLeft, bPgRight, bValid, bDropFiles,bLButtonUp )
   Else
      ShowWindow( __wc_IDE_Menu_Objeto:hWnd , 9 )
   EndIf

return nil
* fim da function __fSuper_Menu()

function __fSuper_Menu_End()
***************************************************************************************
*                               Saida da tela de menu                                 *
***************************************************************************************
   __wc_IDE_Menu_Open := .F.
return .T.
* fim da function __fSuper_Menu_End()

function __fSuper_Menu_IDE(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)
***************************************************************************************
*                    Monta Grid com Propriedades e Valores do Objeto                  *
***************************************************************************************
Local oBrw,wMatriz,oTab,wnLen,wcLen,wBrwCampos,wBrwLen,wColorT,wColorB,wClick,wResp,wPos_IDE

   aAdd(__wMCase_IDE_Menu,{"","","","","","","",""})

   oBrw := TWBrowse():New( wLinha,wColuna,wAltura,wLargura, , {"Propriedade","Valor"} , {130,500} , wObjRef ,,,,,,, oFont ,,,, "1" , .F.,, .T.,, .F.,,, )
   oBrw:nAt := 01

   __wc_IDE_Menu_ObjPrp := oBrw

   oBrw:cAlias        := "ARRAY"
   oBrw:bLine         := { ||{__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,1],__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,2]}}
   oBrw:bLogicLen     := { || Len(__wMCase_IDE_Menu) }
   oBrw:bGoTop        := { || oBrw:nAt := 01 }
   oBrw:bGoBottom     := { || oBrw:nAt := Eval( oBrw:bLogicLen,oBrw) }

   oBrw:aJustIfy      := {.F.,.F.}
   oBrw:bSkip         := { | nwant , nOld | nOld := oBrw:nAt , oBrw:nAt += nwant , oBrw:nAt := Min( Max( oBrw:nAt,1),Eval(oBrw:bLogicLen,oBrw)) , oBrw:nAt-nOld }

   oBrw:bLDblClick    := { || __fSuper_Menu_IDE_Prp_Edit(oTree) }
   oBrw:bkeydown      := { | nKey, nFlags | iIf(nKey=13,__fSuper_Menu_IDE_Prp_Edit(oTree),) }

   oBrw:nClrBackHead  := {|| cColorText("BRANCO")}    // Cor de Fundo do HEADER (Cabecalho)
   oBrw:nClrForeHead  := {|| cColorText("AZUL")  }    // Cor do Texto do HEADER (Cabecalho)
   oBrw:nLineStyle    := 8

   oBrw:bRClicked     := {|nRow,nCol,nKeyFlags,Self| iif(__wc_IDE_Menu_ObjTab:aPrompts[__wc_IDE_Menu_ObjTab:nOption]="codebloco",__fSuper_IDE_Prp_Procedure(nRow,nCol,Self,oTree,"__wMCase_IDE_Menu"),)}

   wLinha   := oBrw:nTop+oBrw:nHeight+1
   wColuna  := oBrw:nLeft
   wLargura := oBrw:nWidth

   oTab := TTabs():New(wLinha,wColuna,{""}     ,{|nOption|__fSuper_Menu_IDE_Prp_Tab_Grupo(nOption,oTree)},wObjRef,       ,cColorText("PRETO"),        ,.T.   ,.F.     ,wLargura,18      ,     )
         // METHOD New( nTop , nLeft , aPrompts, bAction                                          ,oWnd   ,nOption,nClrFore       ,nClrBack,lPixel, lDesign,nWidth  , nHeight,cMsg ) CONSTRUCTOR
   __wc_IDE_Menu_ObjTab := oTab

Return wPos_IDE
* fim da function __fSuper_Menu_IDE(wLinha,wColuna,wAltura,wLargura,wObjRef,oTree)

function __fSuper_Menu_IDE_Prp_Tab_Grupo(wOpcaoTab,oTree)
*************************************************************************************
*
************************************************************************************
Local oItem,wObj_Tp,wObj_Nome

   oItem     := oTree:GetSelected()
   wObj_Nome := oItem:Cargo[2]
   wObj_Tp   := oItem:Cargo[3]

   __fSuper_Menu_IDE_Prp_Itens(wObj_Nome,wObj_Tp,wOpcaoTab)

Return .T.                             
* fim da function __fSuper_Menu_IDE_Prp_Tab_Grupo(nOption,oTree)

function __fSuper_Menu_IDE_Prp_Edit(oTree)
*************************************************************************************
* wPrp_Nome  - Nome da Propriedade
* wPrp_Type  - Tipo da Propriedade (Caracter , Numerica)
* wPrp_Updt  - Se tem atualização na Função cSuper
* wPrp_Dft   - Valou inicial da Propriedade
* wPrp_Pct   - Picture da Propriedade
* wPrp_Dom   - Dominio correspondente da Propriedade
* wRequerido - Lista de Objetos que a Propriedade é Obrigatória
************************************************************************************
Local wx,wDominio,wPrp_Type,wPrp_Pct,wPrp_Dom,wRequerido,oDlg,oGet,wRight,wLargura,wAltura,wLenPic
Local wObj_Nome,wBytes,wXBytes,wxLargura,wPropriedade,wObj_Tp,wTable,wValid_Lst,wPesqRelac,wDecPic
Local wObj_Prp_Var,_wObj_Prp_Help,wTexto,oGFlag1,wFlag1,wLen,wLinha,oBrw,oBtn,oMmo,wPos
Local wObjeto_Dat,wColumn,wPesquisa,wReturn,wGrupo,wPosicao,oSay,oRad,wObj_Pai,oLbx,oWndLstVld

   wGrupo  := __wc_IDE_Menu_ObjTab:aPrompts[__wc_IDE_Menu_ObjTab:nOption]
   wLenPic := 0
   wDecPic := 0

   _wObj_Prp_Help := Space(500)
   wLargura       := 00

   wPrp_Type  := AllTrim(cNvl(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,3],"C"))
   wPrp_Pct   := AllTrim(cNvl(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,4],""))
   wPrp_Dom   := AllTrim(cNvl(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,5],""))
   wRequerido := AllTrim(cNvl(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,6],""))
   wObj_Nome  := AllTrim(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,7])
   wObj_Tp    := __wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,8]

   If wPrp_Type = "N"
      wRight       := .T.
      wObj_Prp_Var := __wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,2]
      If ValType(wObj_Prp_Var)="C"
         wObj_Prp_Var := Val(wObj_Prp_Var)
      EndIf
      wLargura     := GetTextWidth(,wPrp_Pct) //c_Pixel_Len(wPrp_Pct)*2
      If .Not.cEmpty(wPrp_Pct)
         wLenPic := Len(wPrp_Pct)

         wPos := At(".",wPrp_Pct)
         If wPos>0
            wDecPic := Len(SubStr(wPrp_Pct,wPos+1))
         Else
            wDecPic := 0
         EndIf
      EndIf
   Else
      wRight       := .F.
      wObj_Prp_Var := __wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,2]+Space(252)
   EndIf

   wPropriedade := Upper(AllTrim(__wMCase_IDE_Menu[__wc_IDE_Menu_ObjPrp:nAt,1]))

   oDlg := TDialog():New(1,1,9.30,91.7,"Alteração da Propriedade: "+wPropriedade,,,.F.,,,,,,.F.,,,,,)

      wxLargura := (oDlg:nWidth/2)-1
      
      If .Not.cEmpty(wPrp_Dom)
         If ValType(wObj_Prp_Var)="N"
            wObj_Prp_Var := Str(wObj_Prp_Var)
         EndIf
         wObj_Prp_Var := AllTrim(wObj_Prp_Var)
         If wPrp_Dom<>"X"
            wDominio := cDominio(wPrp_Dom,"CCASE")
         EndIf

         If ValType(wDominio)="A"
            If Len(wDominio) < 6
               wAltura := Len(wDominio) * 14
            Else
               wAltura := 78
            EndIf

            wBytes  := 0
            wXBytes := 0
            For wx := 01 To Len(wDominio)
               wXBytes := Len(AllTrim(wDominio[wx]))
               If wBytes < wXBytes
                  wBytes := wXBytes
               EndIf
            Next
            wLargura := (wBytes+5)*4
         Else
            wAltura  := 14
            wDominio := {""}
         EndIf
      
         If cEmpty(wLargura) .Or. wLargura>wxLargura
            wLargura := wxLargura
         EndIf

         oGet := TComboBox():New(01  ,01  ,{|u| If( PCount()==0,wObj_Prp_Var,wObj_Prp_Var:=u)},wDominio, wLargura,wAltura,oDlg,,       ,      ,        ,        ,.T.   ,     ,    ,.F.     ,     ,.F.    ,         ,         ,      ,     ,         )
                 //          New(nRow,nCol, bSeTGet                                             , aItems , nWidth  ,nHeight,oWnd,,bChange,bValid,nClrText,nClrBack,lPixel,oFont,cMsg, lUpdate,bWhen,lDesign,acBitmaps,bDrawItem,nStyle,cPict,bEChange ) CONSTRUCTOR
      
         For wx := 1 To Len(wDominio)
            If AllTrim(SubStr(wDominio[wx],1,At("-",wDominio[wx])-1)) == wObj_Prp_Var
               wObj_Prp_Var := wDominio[wx]
               Exit
            EndIf
         Next
      Else
         If cEmpty(wLargura) .Or. wLargura>wxLargura
            wLargura := wxLargura
            If .Not.cEmpty(wPesquisa)
               wLargura := wLargura - 40
            EndIf
         EndIf

         oGet := TGet():New( 01 , 01 ,{|u| If( PCount()==0,wObj_Prp_Var,wObj_Prp_Var:=u)},oDlg,wLargura,10     ,     ,        ,,,,.F.     ,,.T.   ,,.F.    ,     ,.F.    ,wRight,,         ,         ,.F.      ,,.F.     ,   ,     ,    ,      )
                 //     New(nRow,nCol,bSetGet                                            ,oWnd,nWidth  ,nHeight,cPict, bValid ,,,, lDesign,,lPixel,,lUpdate,bWhen,lCenter,lRight,,lReadOnly,lPassword,lNoBorder,,lSpinner,bUp,bDown,bMin, bMax ) CONSTRUCTOR
         oGet:cPicture     := AllTrim(wPrp_Pct)
         oGet:oGet:Picture := AllTrim(wPrp_Pct)
      EndIf

      oBtn := TButton():New(15,175,"&Confirma",oDlg,,35,10,,,.F.,.T.,.F.,,.F.,,,.F. )
      //oBtn:bAction := {||__fSuper_Menu_IDE_Prp_Save(wObj_Nome,wRequerido,wPropriedade,wObj_Prp_Var,wPrp_Dom,wGrupo,wPosicao,oDlg,wPesqRelac)}
      oBtn:bAction := {||__fSuper_IDE_Prp_Save(wObj_Nome,wRequerido,wPropriedade,wObj_Prp_Var,wPrp_Dom,wGrupo,wLenPic,wDecPic,oDlg,"__wMCase_IDE_Menu",__wc_IDE_Menu_ObjPrp)}

      wReturn      := .T.

      oMmo := TMultiGet():New(30  ,01  ,{|u| If( PCount()==0,_wObj_Prp_Help,_wObj_Prp_Help:=u)},oDlg,wxLargura-1,35     ,oFont,.F.     ,         ,         ,        ,.T.    ,     ,.F.    ,      ,.F.     ,.F.    ,.T.      ,       ,        ,.F.     ,)
                 //METHOD New(nRow,nCol, bSetGet                                               ,oWnd, nWidth    ,nHeight,oFont,lHScroll, nClrFore, nClrBack, oCursor, lPixel, cMsg,lUpdate, bWhen, lCenter, lRight,lReadOnly, bValid,bChanged, lDesign, lNoVScroll ) CONSTRUCTOR

   oDlg:Activate(oDlg:bLClicked,oDlg:bMoved,oDlg:bPainted,.T.,,,,oDlg:bRClicked,,)

Return wReturn
* fim da function __fSuper_Menu_IDE_Prp_Edit()

function __fSuper_Menu_AddTree(oTree)
*************************************************************************************
*                      Adiciona o Sistema a Árvore do Menu                          *
*************************************************************************************
Local oItem,wWhere,wMatriz,wxLen,wx,wTitle,wSistema,wPrp_Nome,wObj_Nome

   oItem:= oTree:Add("Administrador",0)
   oItem:Cargo := {1,"Administrador","CCS","","",""}

   wWhere  := "obj_tp = 'MNU' and ccase_obj.obj_nome not like '%.%'"
   wWhere  := wWhere + " And (cCase_Obj_Prp.Prp_Nome='CABECALHO' or cCase_Obj_Prp.Prp_Nome='SISTEMA')"
   wMatriz := fConsulta2({"ccase_obj","ccase_obj_prp"},{"ccase_obj.obj_nome","prp_nome","obj_prp_vlr"},wWhere,"ccase_obj.obj_nome")
   wxLen   := Len(wMatriz)

   Store Space(00) To wTitle,wSistema

   For wx := 01 To wxLen
      wMatriz[wx,01] := AllTrim(wMatriz[wx,01])
   
      wPrp_Nome := Upper(AllTrim(cNvl(wMatriz[wx,02],"")))
      If wPrp_Nome     == "CABECALHO"
         wTitle   := AllTrim(wMatriz[wx,03])
      ElseIf wPrp_Nome == "SISTEMA"
         wSistema := AllTrim(wMatriz[wx,03])
      EndIf

      If wx < Len(wMatriz)
         wObj_Nome := AllTrim(wMatriz[wx+1,01])
      Else
         wObj_Nome := Space(00)
      EndIf

      If wObj_Nome <> wMatriz[wx,01] .Or. cEmpty(wObj_Nome)
         If cEmpty(wTitle)
            If cEmpty(wSistema)
               wTitle := wMatriz[wx,01]
            Else
               wTitle := wSistema
            EndIf
         EndIf

         oItem:Add(wTitle,1):Cargo := {2,wMatriz[wx,1],"MNU","Administrador","",wSistema}

         Store Space(00) To wTitle,wSistema
      EndIf
   Next

return .T.
* fim da function __fSuper_Menu_AddTree(oTree)

function __fSuper_Menu_Form(oTree,oWindow,oSay)
*************************************************************************************
*                      Mostra lista de Propriedades e Valores                       *
*************************************************************************************
Local wLinha,wColuna,wLargura,oBrwFRM

   __wSuperLFRM := 01
   __wSuperMFRM := {}
   aAdd( __wSuperMFRM , {Space(252),Space(252),Space(1)})

   oBrwFRM := TWBrowse():New( oSay:nTop+05,oSay:nLeft+5,675,295,;
                           {||{__wSuperMFRM[__wSuperLFRM,1],__wSuperMFRM[__wSuperLFRM,2]}},;  //
                              {"Programa (FRM)","Referência cruzada"},;
                              {250,250},oWindow,,     ,     ,       ,          ,       ,oFont,       ,        ,         ,    ,.F.    ,      ,.T.   ,      , .F.   ,       ,        ,          )
                                    // ,oWnd        ,,uVal1,uVal2,bChange,bLDblClick,bRClick,oFont,oCursor,nClrFore,nForeBack,cMsg,lUpdate,cAlias,lPixel, bWhen,lDesign, bValid, bLClick, aActions ) CONSTRUCTOR

   oBrwFRM:ajustify  := {.f.,.f.}
   oBrwFRM:bLogicLen := { || Len( __wSuperMFRM ) }
   oBrwFRM:bGotop    := { || __wSuperLFRM := 1 }
   oBrwFRM:bGoBottom := { || __wSuperLFRM := eval( oBrwFRM:bLogicLen ) }
   oBrwFRM:bSkip     := { | nwant, nold | nold := __wSuperLFRM , __wSuperLFRM += nwant,;
      __wSuperLFRM := max( 1, min( __wSuperLFRM, eval( oBrwFRM:bLogicLen ))), __wSuperLFRM - nOld }
   oBrwFRM:cAlias    := "Array"
   oBrwFRM:bRClicked := {|nRow,nCol| __fSuper_Menu_Form_Lista(nRow,nCol,oBrwFRM,oTree) }
   oBrwFRM:bLDblClick:= {|| __fSuper_Menu_Form_Edit(__wSuperMFRM,__wSuperLFRM) }
   oBrwFRM:bkeydown  := { | nKey, nFlags | iIf(nKey=13,__fSuper_Menu_Form_Edit(__wSuperMFRM,__wSuperLFRM),) }

return oBrwFRM
* fim da function __fSuper_Menu_Form()

function __fSuper_Menu_Form_Lista(nRow,nCol,oBrw,oTree)
*************************************************************************************
*                  Mostra lista de opções para tarefa no Programa                   *
*************************************************************************************
Local oPopup

   oPopup := MenuBegin(.T.)

   MenuAddItem( "Executar programa" ,,.F.,,{||__fSuper_Menu_Form_Edit(__wSuperMFRM,__wSuperLFRM)},,,,,,,.F.,,{||.T.},.F.)
   MenuAddItem( "Editar programa"   ,,.F.,,{||__fSuper_IDE(__wSuperMFRM[__wSuperLFRM,1],"FRM",1)}  ,,,,,,,.F.,,{||.T.},.F.)
// MenuAddItem()
// MenuAddItem( "Excluir programa"  ,,.F.,,{||__fSuper_Menu_Form_Del(oBrw)},,,,,,,.F.,,{||.T.},.F.)
   MenuEnd()

   oPopup:Activate(nRow,nCol,oBrw)

return .T.
* fim da function __fSuper_Menu_Form_Lista()

function __fSuper_Menu_Form_Del(oBrw)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wKeySql,wObj_Nome

   wObj_Nome := __wSuperMFRM[__wSuperLFRM,1]
   wObj_Nome := AllTrim(wObj_Nome)

   If MsgYesNo("O programa "+Campo(wObj_Nome)+" será apagado."+Chr(13)+Chr(10)+"Deseja continuar "+CHR(63),"Atenção")

      wKeySql := "Obj_Nome Like " + Campo(wObj_Nome+".%")
      fDelete2( "cCase_Obj_Prp",wKeySql,)
      fDelete2( "cCase_Obj"    ,wKeySql,)

      wKeySql := "Obj_Nome = " + Campo(wObj_Nome)
      fDelete2( "cCase_Obj_Prp",wKeySql,)
      fDelete2( "cCase_Obj"    ,wKeySql,)

      aDel(__wSuperMFRM,__wSuperLFRM)
      aSize(__wSuperMFRM,Len(__wSuperMFRM)-1)
      
      If Len(__wSuperMFRM)=0
         aAdd(__wSuperMFRM,{Space(252),Space(252),Space(1)})
      EndIf
      oBrw:GoTop()
      oBrw:Refresh()
   EndIf

return .T.
* fim da function __fSuper_Menu_Form_Lista()

function __fSuper_Menu_Form_MontaPRC(oBrwPRC)
*************************************************************************************
*                      Mostra lista de Propriedades e Valores                       *
*************************************************************************************
Local wMObjNome,wWhere,wx,wPrograma,wMM,wy

   __wSuperLPRC := 01
   __wSuperMPRC := {}

   If Len(__wSuperMFRM)>0
      wPrograma := __wSuperMFRM[__wSuperLFRM,1]                                                       
      If .Not.cEmpty(wPrograma)                                                                       
         wPrograma := AllTrim(cNvl(wPrograma,""))

         wWhere := " Obj_Nome Like " + Campo(wPrograma+".%")+ " And Obj_Prp_Vlr like '%fprc_execute%'"
         wMObjNome := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr","Obj_Nome"},wWhere,"Obj_Nome","DISTINCT")
         For wx := 01 To Len(wMObjNome)
            CursorWait()
            If .Not.cEmpty(wMObjNome[wx,01])
               wMM := __fSuper_Prc_Scan(wMObjNome[wx,01])
               For wy := 01 To Len(wMM)
                  CursorWait()
                  If cScan(__wSuperMPRC,wMM[wy,1],1)=0
                     aAdd( __wSuperMPRC , {wMM[wy,1],wMObjNome[wx,2]})
                  EndIf
                  CursorWait()
               Next
            EndIf
            CursorWait()
         Next
      EndIf
   EndIf

   If Len(__wSuperMPRC)=0
      aAdd(__wSuperMPRC,{"",Space(100)})
   EndIf

   oBrwPRC:GoTop()
   oBrwPRC:Refresh()
   CursorArrow()

return .T.
* fim da function __fSuper_Menu_Form_MontaPRC(oBrwPRC)

function __fSuper_Menu_Form_Edit(wMM,wLin)
*************************************************************************************
*                      Mostra lista de Propriedades e Valores                       *
*************************************************************************************
Local wPrograma

   If Len(wMM)>0
      wPrograma := wMM[wLin,1]
      If .Not.cEmpty(wPrograma)
         fObj_LoadAll(wPrograma)
      EndIf
   EndIf

return .T.
* fim da function __fSuper_Menu_Form_Edit()

function __fSuper_Menu_Procedure(oWindow,oSay)
*************************************************************************************
*                      Mostra lista de Propriedades e Valores                       *
*************************************************************************************
Local wLinha,wColuna,wLargura,oBrwPRC

   __wSuperLPRC := 01
   __wSuperMPRC := {}
   aAdd( __wSuperMPRC , {Space(30),Space(100)})

   oBrwPRC := TWBrowse():New( oSay:nTop+10,oSay:nLeft+5,675,275,;
                           {||{__wSuperMPRC[__wSuperLPRC,1]   ,;  //
                               __wSuperMPRC[__wSuperLPRC,2] }},;  //
                              {"Nome da Procedure",;
                               "Descrição"       },;
                              {275,;
                               400},oWindow,,     ,     ,       ,          ,       ,oFont,       ,        ,         ,    ,.F.    ,      ,.T.   ,      , .F.   ,       ,        ,          )
                               //  ,oWnd        ,,uVal1,uVal2,bChange,bLDblClick,bRClick,oFont,oCursor,nClrFore,nForeBack,cMsg,lUpdate,cAlias,lPixel, bWhen,lDesign, bValid, bLClick, aActions ) CONSTRUCTOR

   oBrwPRC:ajustify  := {.f.,.f.}
   oBrwPRC:bLogicLen := { || Len( __wSuperMPRC ) }
   oBrwPRC:bGotop    := { || __wSuperLPRC := 1 }
   oBrwPRC:bGoBottom := { || __wSuperLPRC := eval( oBrwPRC:bLogicLen ) }
   oBrwPRC:bSkip     := { | nwant, nold | nold := __wSuperLPRC , __wSuperLPRC += nwant,;
      __wSuperLPRC := max( 1, min( __wSuperLPRC, eval( oBrwPRC:bLogicLen ))), __wSuperLPRC - nOld }
   oBrwPRC:cAlias    := "Array"
   oBrwPRC:bRClicked := {|nRow,nCol| __fSuper_Menu_Proc_Lista(nRow,nCol,oBrwPRC)}

return oBrwPRC
* fim da function __fSuper_Menu_Procedure()

function __fSuper_Menu_Proc_Lista(nRow,nCol,oBrw)
*************************************************************************************
*                  Mostra lista de opções para tarefa no Programa                   *
*************************************************************************************
Local oPopup,wObj_Nome,wPrp_Nome,wObj_Prp_Vlr
   oPopup := MenuBegin(.T.)

   wObj_Nome    := __wSuperMFRM[__wSuperLFRM,1]
   wPrp_Nome    := "X"
   wObj_Prp_Vlr := 'fPRC_Execute("'+__wSuperMPRC[__wSuperLPRC,1]+'")'

// MenuAddItem( "Nova Procedure"    ,,.F.,,{||__fSuper_Prc(__wSuperMFRM[__wSuperLFRM,1],"newprc")},,,,,,,.F.,,{||.T.},.F.)
   MenuAddItem( "Editar Procedure"  ,,.F.,,{||__fSuper_Prc(wObj_Nome,wPrp_Nome,wObj_Prp_Vlr)     },,,,,,,.F.,,{||.T.},.F.)
   MenuAddItem( "Atualizar"         ,,.F.,,{||__fSuper_Menu_Form_MontaPRC(oBrw)                  },,,,,,,.F.,,{||.T.},.F.)
   MenuEnd()

   oPopup:Activate(nRow,nCol,oBrw)

return .T.
* fim da function __fSuper_Menu_Proc_Lista()

function __fSuper_Menu_ChangeTree(oTree,oBrwFRM,oBrwPRC,wBusca)
***************************************************************************************
*                          Menu com opções do Objeto                                *
***************************************************************************************
Local wObj_Tree , wObj_Tp , wObj_Nome , wPrograma ,wy,wx, wMObjNome , wWhere , wSistema
Local wPath_MNU , wForm_MNU , wForm_FRM , wInativo , wMMenu, wMM , wxLen , wMLen

   wBusca      := cNvl(wBusca,.F.)
   wMObjNome   := {}
   wObj_Tree   := oTree:GetSelected()
   __wSuperLFRM := 01
   __wSuperMFRM := {}

   CursorWait()
   If wObj_Tree:Cargo[1] = 2 .Or. wBusca
      wObj_Nome := AllTrim(wObj_Tree:Cargo[2])
      wSistema  := AllTrim(wObj_Tree:Cargo[6])
      wWhere    :=          " cCase_Obj.Obj_Tp = " + Campo("FRM")
      wWhere    := wWhere + " And cCase_Obj_Prp.Prp_Nome = " + Campo("SISTEMA")
      wWhere    := wWhere + " And cCase_Obj_Prp.Obj_Prp_Vlr = " + Campo(wSistema)
      wMObjNome := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","cCase_Obj.Obj_Sts","cCase_Obj.Obj_Util_Dt","cCase_Obj.Obj_Util_Usr"},wWhere,"cCase_Obj.Obj_Nome","DISTINCT")
      wxLen := Len(wMObjNome)

      wWhere := "cCase_Obj.Obj_Tp='MNU' And cCase_Obj_Prp.Prp_Nome='AUX_FUNCTION' And Obj_Prp_Vlr like '%fObj_LoadAll%'"
      wMMenu := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj_Prp.Obj_Prp_Vlr","cCase_Obj.Obj_Nome"},wWhere,"cCase_Obj_Prp.Obj_Prp_Vlr,cCase_Obj.Obj_Seq","DISTINCT")
      wMLen  := Len(wMMenu)
      
      For wx := 01 To wxLen
         CursorWait()
         If .Not.cEmpty(wMObjNome[wx,01])
            wForm_FRM := AllTrim(wMObjNome[wx,01])
            wInativo := .T.
            For wy := 01 To wMLen
               CursorWait()
               wForm_MNU := AllTrim(wMMenu[wy,01])
               If At(wForm_FRM+'")',wForm_MNU)>0
                  wPath_MNU := AllTrim(wMMenu[wy,02])
                  aAdd( __wSuperMFRM , {wForm_FRM,wPath_MNU,"1"})
                  CursorWait()
                  wInativo := .F.
               EndIf
               CursorWait()
            Next
            If wInativo
               aAdd( __wSuperMFRM , {wForm_FRM,Space(00),"1"})
            EndIf
         EndIf
         CursorWait()
      Next

   ElseIf wObj_Tree:Cargo[1] > 2
      wPrograma := wObj_Tree:Cargo[5]
      If .Not.cEmpty(wPrograma)
         wPrograma := Lower(wPrograma)
         If At("fobj_loadall",wPrograma)>0
            CursorWait()
            wPrograma := StrTran(wPrograma,"fobj_loadall","")
            wPrograma := StrTran(wPrograma,"(","")
            wPrograma := StrTran(wPrograma,")","")
            wPrograma := StrTran(wPrograma,'"',"")
            aAdd( __wSuperMFRM , {wPrograma,wObj_Tree:Cargo[2],""})

            wWhere := " Obj_Nome Like " + Campo(wPrograma+".%")+ " And Obj_Prp_Vlr like '%fobj_loadall%'"

            wMObjNome := fConsulta2("cCase_Obj_Prp",{"Obj_Prp_Vlr","Obj_Nome"},wWhere,"Obj_Nome","DISTINCT")
            wxLen := Len(wMObjNome)
            If wxLen>0
               aAdd( __wSuperMFRM , {"Lista de Programas chamados internamente:","","__kennen"})
            EndIf

            For wx := 01 To wxLen
               CursorWait()
               If .Not.cEmpty(wMObjNome[wx,01])
                 wMM := __fSuper_Menu_ScanFrm(wMObjNome[wx,01])
                 For wy := 01 To Len(wMM)
                    CursorWait()
                    If cScan(__wSuperMFRM,wMM[wy],1)=0
                       aAdd( __wSuperMFRM , {wMM[wy],wMObjNome[wx,2],""})
                    EndIf
                    CursorWait()
                 Next
              EndIf
              CursorWait()
            Next
         EndIf
      EndIf
   EndIf

   If Len(__wSuperMFRM)=0
      aAdd(__wSuperMFRM,{Space(30),Space(01),Space(100),""})
   EndIf

   oBrwFRM:GoTop()
   oBrwFRM:Refresh()

   __fSuper_Menu_Form_MontaPRC(oBrwPRC)

   If wObj_Tree:Cargo[1] > 1
      __fSuper_Menu_IDE_Prp_Itens(wObj_Tree:Cargo[2],"MNU",__fSuper_IDE_Prp_TabGrp("MNU",__wc_IDE_Menu_ObjTab))
   Else
      __fSuper_IDE_Prp_TabGrp("SYS",__wc_IDE_Menu_ObjTab)

      __wMCase_IDE_Menu := {}
      aSize(__wMCase_IDE_Menu,0)
      aAdd( __wMCase_IDE_Menu , {"","","","","","",wObj_Nome,wObj_Tp})
      __wc_IDE_Menu_ObjPrp:GoTop()
      __wc_IDE_Menu_ObjPrp:Refresh()
   EndIf
   CursorArrow()

Return .T.
* fim da function __fSuper_Menu_ChangeTree(oTree)

function __fSuper_Menu_ScanFrm(wObj_Prp_Vlr)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wTexto,wLen,wx,wInicio,wFinal,wAchou,wMatriz,wFrm,wMemo

   wTexto  := Lower(wObj_Prp_Vlr)
   wLen    := Len(wTexto)
   wInicio := 0
   wFinal  := 0
   wAchou  := .F.
   wMatriz := {}
   wFrm    := ""

   For wx := 01 To wLen
      If SubStr(wTexto,wx,12)=="fobj_loadall"
         wAchou := .T.
         Loop
      EndIf

      If wAchou
         If SubStr(wTexto,wx,1)=='"'
           If wInicio=0
              wInicio := wx+1
           Else
              wFrm   := SubStr(wTexto,wInicio,wx-wInicio)

              aAdd(wMatriz,AllTrim(wFrm))

              wInicio := 0
              wAchou  := .F.
              wFrm    := ""
           EndIf
         EndIf
      EndIf
   Next

Return wMatriz
*fim da Function __fSuper_Menu_ScanFrm(wObj_Prp_Vlr)

function __fSuper_Menu_IDE_Prp_Itens(wObj_Nome,wObj_Tp,wOpcaoTab)
*************************************************************************************
*                                                                                   *
*************************************************************************************
Local wPrpPos,wx,wPos,wValor,wSql,wVlrDom,wy,wDominio,wPosX,wMatriz,wPos_IDE,wPrp_Grp,wPrp_Nome,wMObjPrp,wObj_Pai,wObj_Filho,wObj_Seq,wResp

   __wMCase_IDE_Menu := {}
   aSize(__wMCase_IDE_Menu,0)

   If cEmpty(wOpcaoTab).Or.wOpcaoTab>Len(__wc_IDE_Menu_ObjTab:aPrompts)
      wOpcaoTab := 1
      __wc_IDE_Menu_ObjTab:SetOption(wOpcaoTab)
   EndIf

   wPrp_Grp := __wc_IDE_Menu_ObjTab:Cargo[wOpcaoTab,2]

   wSql :=        " Select cCase_Prp.Prp_Nome,Obj_Prp_Vlr From cCase_Obj_Prp,cCase_Prp "
   wSql := wSql + " Where cCase_Obj_Prp.Prp_Nome = cCase_Prp.Prp_Nome "
   wSql := wSql + " And   Obj_Nome = " + Campo(wObj_Nome)
   wSql := wSql + " And   Prp_Grp  = " + Campo(wPrp_Grp)
   wSql := wSql + " And   RTrim(Obj_Prp_Vlr) <> " + Campo("")  // ciceroSQL
   wMObjPrp := fConnect_Tabela( "cCase_Prp" , wSql )

   For wx := 01 To Len(__wMCase_IDE_Prp)
      If At(wObj_Tp,__wMCase_IDE_Prp[wx,2])>0 .And. __wMCase_IDE_Prp[wx,7]==wPrp_Grp

         wPrp_Nome := cLower(__wMCase_IDE_Prp[wx,1])

         wPos := cScan( wMObjPrp , wPrp_Nome , 01 )
         If wPos>0
            wValor := AllTrim(wMObjPrp[wPos,2])
         Else
            wValor := __FCGFC(__wMCase_IDE_Prp[wx,6],__wMCase_IDE_Prp[wx,4])
         EndIf

         If .Not.cEmpty(__wMCase_IDE_Prp[wx,5])
            wDominio := cDominio(__wMCase_IDE_Prp[wx,5])
            If ValType(wDominio)="A"
               For wy := 01 To Len(wDominio)
                  wVlrDom := AllTrim(wDominio[wy])
                  wPosX := At(".",wVlrDom)
                  If wPosX>0
                     If SubStr(wVlrDom,1,wPosX-1)=AllTrim(wValor)
                        wValor := AllTrim(wDominio[wy])
                        Exit
                     EndIf
                  Else
                     If wVlrDom=wValor
                        wValor := wVlrDom
                        Exit
                     EndIf
                  EndIf
               Next
            EndIf
         EndIf

         aAdd( __wMCase_IDE_Menu , {wPrp_Nome              ,; //01 Nome da Propriedade
                                    wValor                 ,; //02
                                    __wMCase_IDE_Prp[wx,9] ,; //03 Tipo da Coluna
                                    __wMCase_IDE_Prp[wx,4] ,; //04 Picture
                                    __wMCase_IDE_Prp[wx,5] ,; //05 Dominio correspondente
                                    "N"                    ,; //06 Propriedade Requerida
                                    wObj_Nome              ,; //07 Nome do Objeto 
                                    wObj_Tp                }) //08 Tipo do Objeto 
      EndIf
   Next
   

   If Len(__wMCase_IDE_Menu)=0
      aAdd( __wMCase_IDE_Menu , {"","","","","","",wObj_Nome,wObj_Tp})
   EndIf

   __wc_IDE_Menu_ObjPrp:GoTop()
   __wc_IDE_Menu_ObjPrp:Refresh()

Return .T.
* fim da function __fSuper_Menu_IDE_Prp_Itens(wObj_Nome,wObj_Tp)

Function __fSuper_Menu_DbClick(oTree)
***********************************************************************************
* Função para criar os Menus da cCase atrav's do objeto "MNU"                     *
***********************************************************************************
Local wx,wy,wxLen,wWhere,wNome,wSistema,wTitulo,wPrograma,oItemSYS,oItem,wSeparador,wMMenu
Local wObjNomeAux,wMnu_Nome,wMnu_Seq,wMnu_Pai,wEstruSeq,wxMenu,wNivel,wMatriz,wPrp_Nome

   oItemSYS := oTree:GetSelected()

   wNivel := oItemSYS:Cargo[1]
   If wNivel <> 2 .Or. Len(oItemSYS:aItems)>0
      retur .f.
   EndIf

   wSistema := AllTrim(oItemSYS:Cargo[2])

   wWhere  :=          " cCase_Obj.Obj_Nome Like " + Campo(wSistema+".%")
   wWhere  := wWhere + " And cCase_Obj.Obj_Tp = 'MNU' "
   wWhere  := wWhere + " And (cCase_Obj_Prp.Prp_Nome='NOME' or cCase_Obj_Prp.Prp_Nome='AUX_FUNCTION' or cCase_Obj_Prp.Prp_Nome='SEPARADOR')"
   wMatriz := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","cCase_Obj.Obj_Seq","Prp_Nome","Obj_Prp_Vlr"},wWhere,"cCase_Obj.Obj_Nome,Prp_Nome")
   wMMenu    := {}
   wEstruSeq := ""
   wxLen     := Len(wMatriz)
   
   wTitulo    := Space(00)
   wPrograma  := Space(00)
   wSeparador := "N"

   For wx = 01 To wxLen
      wMnu_Nome := cLower(AllTrim(cNvl(wMatriz[wx,1],"")))
      wMnu_Seq  := wMatriz[wx,2]

      wPrp_Nome := Upper(AllTrim(wMatriz[wx,3]))
      If     wPrp_Nome = "NOME"
         wTitulo    := AllTrim(wMatriz[wx,4])
      ElseIf wPrp_Nome = "AUX_FUNCTION"
         wPrograma  := AllTrim(wMatriz[wx,4])
      ElseIf wPrp_Nome = "SEPARADOR"
         wSeparador := AllTrim(wMatriz[wx,4])
         wSeparador := iif(cEmpty(wSeparador),"N",wSeparador)
      EndIf

      If wx < wxLen
         wObjNomeAux := cLower(AllTrim(cNvl(wMatriz[wx+1,1],"")))
      Else
         wObjNomeAux := Space(00)
      EndIf

      If .Not.(wObjNomeAux==wMnu_Nome) .Or. cEmpty(wObjNomeAux)
         If cEmpty(wTitulo) .And. wSeparador="S"
            Loop
         EndIf

         wEstruSeq := Space(00)
         wMnu_Pai  := SubStr(wMnu_Nome,1,rAt(".",wMnu_Nome)-1) //cSuper_Obj_Pai(wMnu_Nome)

         For wy := 01 To Len(wMMenu)
            If wMMenu[wy,1] == wMnu_Pai
               wEstruSeq := wMMenu[wy,5]
            EndIf
         Next

         wEstruSeq := iif(cEmpty(wEstruSeq),"0",AllTrim(wEstruSeq))+"."
         wEstruSeq := wEstruSeq + StrZero(wMnu_Seq,7,0)
         aAdd( wMMenu , {wMnu_Nome,wMnu_Pai,wTitulo,wPrograma,wEstruSeq})

         wTitulo    := Space(00)
         wPrograma  := Space(00)
         wSeparador := "N"
      EndIf
   Next
   wMNU_Nome := Space(00)
   aSort( wMMenu ,,,{|x,y| x[5] < y[5]})                     // ordena a coluna em ordem CRESCENTE 

   wxMenu := 00
   For wxMenu := 01 To Len(wMMenu)
       wMNU_Nome := wMMenu[wxMenu,1]
       wTitulo   := wMMenu[wxMenu,3]
       wPrograma := wMMenu[wxMenu,4]
       wTitulo   := iif(cEmpty(wTitulo),SubStr(wMNU_Nome,rAt(".",wMNU_Nome)+1),StrTran(wTitulo,"&",""))

       oItem := oItemSYS:Add(wTitulo,iif(cEmpty(wPrograma),2,3))
       oItem:Cargo := {3,wMNU_Nome,"MNU",wMMenu[wxMenu,2],wPrograma}

       If cEmpty(wPrograma)
          wxMenu := __fSuper_Menu_AddTree_Aux(oItem,wMMenu,wxMenu,wMNU_Nome)
       EndIf
   Next

   oTree:Refresh()
   oItemSYS:Expand()

Return .T.
* Fim da Function __fSuper_Menu_DbClick(oTree)

Function __fSuper_Menu_AddTree_Aux(oXItem,wMMenu,wxMenu,wObj_Nome_Pai)
***********************************************************************************
*                     Funcao Auxiliar para a montagem de Menus                    *
***********************************************************************************
Local wTitulo,wAcesso,wPrograma,wRestricao,wMnu_Nome,wx,wxMenuPos,wxMenuLen,oItem

   wxMenuPos := wxMenu + 1
   wxMenuLen := Len(wMMenu)

   If wxMenuPos > wxMenuLen
      return wxMenuLen
   EndIf

   For wx := wxMenuPos To wxMenuLen
      wMNU_Nome := wMMenu[wx,1]
      If At(wObj_Nome_Pai,wMNU_Nome)>0
         wTitulo   := wMMenu[wx,3]
         wPrograma := wMMenu[wx,4]
         wTitulo   := iif(cEmpty(wTitulo),SubStr(wMNU_Nome,rAt(".",wMNU_Nome)+1),StrTran(wTitulo,"&",""))

         oItem := oXItem:Add(wTitulo,iif(cEmpty(wPrograma),2,3))
         oItem:Cargo := {4,wMNU_Nome,"MNU",wMMenu[wx,2],wPrograma}

         If cEmpty(wPrograma)
            wx := __fSuper_Menu_AddTree_Aux(oItem,wMMenu,wx,wMNU_Nome)
         EndIf
      Else
         wx := wx - 1
         Exit
      EndIf
   Next

Return wx
* Fim da Function __fSuper_Menu_AddTree_Aux(oTree,wMMenu,wxMenu,wObj_Nome_Pai)

Function __fSuper_Menu_rClick(nRow,nCol,oTree,oWnd,oBrwFRM,oBrwPRC)
************************************************************************************************
*                                                                                              *
************************************************************************************************
Local oItem , wMatriz , oPopup , wObj_Nome

   wMatriz   := {}
   oItem     := oTree:GetSelected()
   wObj_Nome := AllTrim(oItem:cargo[2])

   oPopup := MenuBegin( .T. )

   MenuAddItem( "Nome Objeto: "+wObj_Nome ,, .F.,,{|oMenuItem|oPopup:End()},,,,,,, .F.,,, .F. )
   MenuAddItem()

//   If     oItem:cargo[1] = 1
//      MenuAddItem( "Novo Sistema" ,,.F.,,{||__fSuper_Obj_Add("CCS",,oItem),oTree:Refresh() },,,,,,,.F.,,{||.T.},.F.)
//   Else
//      If oItem:cargo[1] = 2
//         MenuAddItem( "Novo Programa" ,,.F.,,{||__fSuper_Obj_Add(,,wObj_Nome,oTree,oBrwFRM,oBrwPRC)},,,,,,,.F.,,{||.T.},.F.)
//         MenuAddItem()
//      EndIf
//  
   If cEmpty(oItem:cargo[5])
      MenuAddItem( "Novo Submenu"        ,,.F.,,{||__fSuper_Obj_Add("MNU",wObj_Nome,oItem),oTree:Refresh() },,,,,,,.F.,,{||.T.},.F.)
   EndIf

////       If Len(oItem:aItems)=0
////          MenuAddItem( "Incluir Programa" ,,.F.,,{||__fSuper_Menu_CallFRM(oWnd,wObj_Nome,oItem,oTree,oBrwFRM,oBrwPRC)},,,,,,,.F.,,{||.T.},.F.)
////       EndIf
////    Else
////       MenuAddItem( "Alterar Programa"    ,,.F.,,{||__fSuper_Menu_CallFRM(oWnd,wObj_Nome,oItem,oTree,oBrwFRM,oBrwPRC)},,,,,,,.F.,,{||.T.},.F.)
////       MenuAddItem( "Desativar Programa"  ,,.F.,,{||__fSuper_Menu_CallFRM_Save(2,oWnd,wObj_Nome,oItem,oTree,,oBrwFRM,oBrwPRC)},,,,,,,.F.,,{||.T.},.F.)
//      EndIf

   MenuAddItem( "Exclui Menu"  ,,.F.,,{|| __fSuper_Menu_Del(wObj_Nome,oTree) },,,,,,,.F.,,{||.T.},.F.)
   MenuAddItem()
   MenuAddItem( "&Exit",, .F.,,{|oMenuItem|oPopup:End()},,,,,,, .F.,,, .F. )
   MenuEnd()
  
   oPopup:Activate(nRow,nCol,oTree)

return .t.
*fim da Function __fSuper_Menu_rClick()

//Function __fSuper_Menu_CallFRM(oWnd,wObj_Nome,oWItem,oWTree,oBrwFRM,oBrwPRC)
//************************************************************************************************
//*                               Relaciona um programa a um Menu                               *
//************************************************************************************************
//Local oTreeX,wResp,wWhere,wx,oXItem,wxSistema,wSistema,wPrograma,oDlg,oImageList,oItem
//
//   __fSuper_Menu_CallFRM_When("D",oWnd)
//
//   oDlg := TWindow():New( 01 , 01  , 530   , 400  ,"Ativar Programa",      ,     ,      ,     ,       ,.F.     ,.F.     ,cColorText("PRETO"),cColorText("BRANCO"),       ,"NONE"  ,        ,        ,.F. ,.F.  , .T. )
//           // METHOD New(nTop,nLeft,nBottom,nRight, cTitle          ,nStyle,oMenu,oBrush,oIcon,oParent,lVScroll,lHScroll,nClrFore       ,nClrBack        ,oCursor, cBorder,lSysMenu,lCaption,lMin, lMax, lPixel ) CONSTRUCTOR
//
////    wLinha  := oG_Tipo:nTop
////    wColuna := oG_Tipo:nLeft+oG_Tipo:nWidth+40
////    oBtn    := TButton():New(wLinha,wColuna,"&Confirma",oDlg,{||wObj_Nome:=fSuper_Obj_Add_Create(wObj_Nome_Pai,wObj_Nome,oG_Tipo:cMsg,oG_Clona:cMsg,wEstrutura,oTreeX,pItem)},70,20,,,.F.,.T.,.F.,,.F.,,,.F. )
//
//      oImageList = TImageList():New(16,16)
//      oImageList:Add( TBitmap():Define(,"SYS.BMP",oDlg),)
//      oImageList:Add( TBitmap():Define(,"FRM.BMP",oDlg),)
//
//      oTreeX := TTreeView():New(01  ,01   ,oDlg,        ,        , .T.   , .F.    ,375  , 500    ,    )
//                     //     New(nTop,nLeft,oWnd,nClrFore,nClrBack, lPixel, lDesign,nWidth, nHeight,cMsg)
//      oTreeX:SetImageList( oImageList )
//
//      oTreeX:bLDblClick := {|| __fSuper_Menu_CallFRM_Save(1,oWnd,wObj_Nome,oWItem,oWTree,oTreeX,oBrwFRM,oBrwPRC),oDlg:End() }
//      oTreeX:bkeydown   := { | nKey, nFlags | iIf(nKey=13,Eval(oTreeX:bLDblClick),) }
//
//      wxSistema  := Space(00)
//      wSistema   := Space(00)
//      wPrograma  := Space(00)
//
//      wWhere := " cCase_Obj.Obj_Nome = cCase_Obj_Prp.Obj_Nome"
//      wWhere := wWhere + " And Obj_Tp = " + Campo("FRM")
//      wWhere := wWhere + " And Prp_Nome = " + Campo(_wP_SISTEMA)
//      wResp  := fConsulta2({"cCase_Obj","cCase_Obj_Prp"},{"cCase_Obj.Obj_Nome","Upper(Obj_Prp_Vlr)"},wWhere,"Obj_Prp_Vlr,Obj_Nome")
//      
//      For wx := 01 To Len(wResp)
//         wPrograma := AllTrim(cNvl(wResp[wx,1],""))
//         wSistema  := AllTrim(cNvl(wResp[wx,2],""))
//         wSistema  := AllTrim(iif(cEmpty(wResp[wx,2]),"GLOBAL",wResp[wx,2]))
//
//         If .Not.cEmpty(wSistema)
//            If cEmpty(wxSistema) .Or. wSistema <> wxSistema
//               oItem := oTreeX:Add(wSistema,0)
//               oItem:Cargo := {1,"","",""}
//            EndIf
//      
//            oXItem := oItem:Add(wPrograma,1)
//            oXItem:Cargo := {2,"","FRM",wPrograma}
//            wxSistema := wSistema
//         EndIf
//      Next
//
//      If Len(wResp)=0
//         oTreeX:Add("null")
//      EndIf
//      oTreeX:Refresh()
//
//      WndCenter(oDlg:hWnd)
//
//      oDlg:bValid := {||__fSuper_Menu_CallFRM_When("E",oWnd)}
//
//   oDlg:Activate( "NORMAL",          ,          ,       ,         ,         ,        ,      ,   ,      ,      ,      ,     ,       ,        ,         ,       ,,)
//   //   Activate( cShow   , bLClicked, bRClicked, bMoved, bResized, bPainted,bKeyDown, bInit,bUp, bDown, bPgUp, bPgDn,bLeft, bRight, bPgLeft, bPgRight, bValid, bDropFiles,bLButtonUp )
//
//return .t.
//*fim da Function __fSuper_Menu_CallFRM()
//
//Function __fSuper_Menu_CallFRM_Save(wOpcao,oWnd,wObj_Nome,oWItem,oWTree,oTree,oBrwFRM,oBrwPRC)
//************************************************************************************************
//*                             Save o Programa relacionado no Menu                              *
//************************************************************************************************
//Local wx,oItem,wPrograma,wKeySql,wResp,wImage,wPrp_Nome
//
//   wPrp_Nome := _wP_PROGRAMA
//
//   If wOpcao=1
//      oItem     := oTree:GetSelected()
//      wPrograma := AllTrim(oItem:cPrompt)
//
//      __fSuper_Menu_CallFRM_When("E",oWnd)
//      wImage    := 4
//   Else
//      wPrograma := ""
//      wImage    := 3
//   EndIf
//
//   fObj_Prp_Update(wObj_Nome,wPrp_Nome,wPrograma)
//
//   oWItem:nImage  := wImage
//   oWItem:Cargo[5]:= wPrograma
//   __fSuper_Menu_ChangeTree(oWTree,oBrwFRM,oBrwPRC)
//   oWTree:Refresh()
//
//return .t.
//*fim da Function __fSuper_Menu_CallFRM_Save()
//
//Function __fSuper_Menu_CallFRM_When(wTipo,oWnd)
//************************************************************************************************
//*                             Save o Programa relacionado no Menu                              *
//************************************************************************************************
//Local wx
//
//   For wx:=01 To Len(oWnd:aControls)
//      If ValType(oWnd:aControls[wx])="O"
//         If wTipo="E"
//            oWnd:aControls[wx]:Enable()
//         Else
//            oWnd:aControls[wx]:Disable()
//         EndIf
//      EndIf
//   Next
//   oWnd:aEvalWhen()
//   oWnd:Refresh()
//
//return .t.
//*fim da Function __fSuper_Menu_CallFRM_When(wTipo,oWnd)

Function __fSuper_Menu_Del(wObj_Nome,oTree)
*******************************************************************************
*                                 Exclui menu                                 *
*******************************************************************************
Local wKeySql,wResp,wReturn

	wKeySql := " Obj_Nome Like " + Campo(wObj_Nome+".%")
	wResp   := fConsulta2({"cCase_Obj"},{"cCase_Obj.Obj_Nome"},wKeySql)
	
	If Len(wResp)>0
     wReturn := MsgYesNo("Existe sub-menus relacionados !"+CHR(13)+CHR(10)+" Deseja excluir Menu "+Chr(63) )
	Else
     wReturn := MsgYesNo("Deseja excluir Menu "+Chr(63) )
	EndIf
	
	If wReturn
      wKeySql := " Obj_Nome = " + Campo(wObj_Nome)
      fDelete2("cCase_Obj"    ,wKeySql)
      fDelete2("cCase_Obj_Prp",wKeySql)
      
      wKeySql := " Obj_Nome Like " + Campo(wObj_Nome+".%")
      fDelete2("cCase_Obj"    ,wKeySql)
      fDelete2("cCase_Obj_Prp",wKeySql)

	   oTree:DeleteAll()
		 __fSuper_Menu_AddTree(oTree)
	   oTree:Refresh()
   EndIf

return .t.
*fim da Function __fSuper_Menu_CallFRM_When(wTipo,oWnd)

function cEnviaEmail( wDe , wMPara , wAssunto , wCorpoEmail, wCorpoEmailRtf, wparamMAttach , wSmtpServer , nSmtpPort , wUser , wPassword )
*************************************************************************************
*                      Função para verificar click do grupo                         *
*************************************************************************************
Local wSendMail := ""  , cMacro , wx , wTmpFile , wTmpFileRtf , wTmpFileTxt ,wF1,wF2, wLen , wMAttach

   If cEmpty(wSmtpServer)
      MsgStop("Servidor SMTP inválido. Informar servidor correto!","Erro")
      return .F.
   EndIf

   wMAttach := {}
   If .Not.cEmpty(wCorpoEmail)
      wTmpFile    := AllTrim(GetEnv("TEMP"))+"\"+AllTrim(cTempFile())
      wTmpFileTxt := wTmpFile+".txt"

      wF1 := FCreate(wTmpFileTxt)
      fSeek(wF1,-1,2)
      fWrite(wF1,wCorpoEmail)
      fClose(wF1)

      If .Not.cEmpty(wCorpoEmailRtf)
         wTmpFileRtf := wTmpFile+".doc"
         wF2 := FCreate(wTmpFileRtf)
         fSeek(wF2,-1,2)
         fWrite(wF2,wCorpoEmailRtf)
         fClose(wF2) 

         aAdd( wMAttach , wTmpFileRtf )
      EndIf

      wSendMail := wSendMail + " -bodyf " + Alltrim(wTmpFileTxt)  //wSendMail := wSendMail + " /body " + Alltrim(wCorpoEmail)
   Else
      wSendMail := wSendMail + " -body . "
   EndIf

   If Len(wMPara) = 0
      MsgStop("Destinatário do Email é obrigatória","Erro")
      return .F.
   Else
      wSendMail := wSendMail + " -to "  //wSendMail := wSendMail + " /to "
      //For wx := 01 To Len(wMPara)
         //wSendMail := wSendMail + Alltrim(wMPara[wx])+","
      //Next
      wSendMail := wSendMail + Alltrim(StrTran(wMPara," ",""))
   EndIf

   If cEmpty(wDe)
      MsgStop("Informação de quem esta enviando o Email é obrigatória","Erro")
      return .F.
   Else
      wSendMail := wSendMail + " -f " + Alltrim(wDe) //wSendMail + " /from " + Alltrim(wDe)
   EndIf

   If cEmpty(wAssunto)
      If .Not.MsgYesNo("Deseja enviar email sem assunto?","Atenção")
         Return .F.
      EndIf
   Else
      wSendMail := wSendMail + " -subject " +'"'+Alltrim(wAssunto)+'"'
   EndIf

   wparamMAttach := cNvl(wparamMAttach,{})
   For wx := 01 To Len(wparamMAttach)
      If .Not.cEmpty(wparamMAttach[wx,1])
         aAdd( wMAttach , wparamMAttach[wx,1] )
      EndIf
   Next

   wLen := Len(wMAttach)
   If wLen>0
      wSendMail := wSendMail + " -attach "
      For wx := 01 To wLen
         wSendMail := wSendMail + Alltrim(wMAttach[wx])+","
      Next
      wSendMail := SubStr(wSendMail,1,Len(wSendMail)-1)
   EndIf

   wSendMail := wSendMail + " -server " + Alltrim(wSmtpServer) //" /smtpserver " + Alltrim(wSmtpServer)

   If .Not.cEmpty(nSmtpPort)
      wSendMail := wSendMail + " -port " + AllTrim(Str(nSmtpPort)) //" /smtpport " + AllTrim(Str(nSmtpPort))
   EndIf

   If .Not.cEmpty(wUser)
      wSendMail := wSendMail + " -u " + alltrim(wUser) //" /user " + alltrim(wUser)
   EndIf

   If .Not.cEmpty(wPassword)
      wSendMail := wSendMail + " -pw " + alltrim(wPassword) //" /password " + alltrim(wPassword)
   EndIf

   cMacro := "blat " + AllTrim(wSendMail) //cMacro := "SENDMAIL " + wSendMail
   memowrit( cMacro )
   memowrit("email.bat",cMacro)
   MsgRun( "Enviando email(s) ..." , "" , {|| WaitRun( cMacro, 7 ) })
   fErase("email.bat")

return .T.
* fim da function cEnviaEmail( wDe , wMPara , wAssunto , wCorpoEmail, wCorpoEmailRtf, wparamMAttach , wSmtpServer , nSmtpPort , wUser , wPassword )

#pragma BEGINDUMP

#include <Windows.h>
#include <Assert.h>
#include "hbapi.h"

#include <\Kennen\soft\fwh26\INCLUDE\WinTen.h>
#include <\Kennen\soft\fwh26\INCLUDE\ClipApi.h>
#ifdef __FLAT__
   #include <ShellApi.h>
#endif
#ifdef __HARBOUR__
   #include <hbapiitm.h>
   #include <hbdate.h>
   #include <hbset.h>
#endif
#include <iphlpapi.h>

HB_FUNC( GETMAC )
{
   IP_ADAPTER_INFO AdapterInfo[16]; // Allocate information
   // for up to 16 NICs
   // http://msdn2.microsoft.com/En-US/library/aa366062.aspx
   
   DWORD dwBufLen = sizeof(AdapterInfo); // Save memory size of buffer
   DWORD dwStatus = GetAdaptersInfo( // Call GetAdapterInfo
   AdapterInfo, // [out] buffer to receive data
   &dwBufLen); // [in] size of receive data buffer
   PIP_ADAPTER_INFO pAdapterInfo = AdapterInfo; // Contains pointer to
   // current adapter info
   char cMacAddress[17];
   PHB_ITEM pItem;
   PHB_ITEM paAddress = hb_itemArrayNew( 0 );
   
   // Verify return value is valid, no buffer overflow... 
   if (dwStatus != ERROR_SUCCESS)
   {
   hb_itemRelease(hb_itemReturn(paAddress));
   return;
   }
   
   pItem = hb_itemNew(NULL);
   do {
   PHB_ITEM pSubArray = hb_itemArrayNew(10);
   // Description of NIC 
   hb_arraySet(pSubArray, 1, hb_itemPutC(pItem, pAdapterInfo->Description));
   // MAC address
   sprintf( cMacAddress, "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", pAdapterInfo->Address[0], pAdapterInfo->Address[1], pAdapterInfo->Address[2],
   pAdapterInfo->Address[3], pAdapterInfo->Address[4], pAdapterInfo->Address[5] );
   
   hb_strUpper( cMacAddress, strlen(cMacAddress));
   hb_arraySet(pSubArray, 2, hb_itemPutC(pItem, cMacAddress ));
   // GUID of NIC
   hb_arraySet(pSubArray, 3, hb_itemPutC(pItem, pAdapterInfo->AdapterName));
   
   // IP Address
   hb_arraySet(pSubArray, 4, hb_itemPutC(pItem, pAdapterInfo->IpAddressList.IpAddress.String ));
   // IP Mask 
   hb_arraySet(pSubArray, 5, hb_itemPutC(pItem, pAdapterInfo->IpAddressList.IpMask.String ));
   // IP Gateway
   hb_arraySet(pSubArray, 6, hb_itemPutC(pItem, pAdapterInfo->GatewayList.IpAddress.String ));
   // DHCP server IP & Lease Obtained 
   if (pAdapterInfo->DhcpEnabled)
   {
   hb_arraySet(pSubArray, 7, hb_itemPutC( pItem, pAdapterInfo->DhcpServer.IpAddress.String ));
   hb_arraySet(pSubArray, 8, hb_itemPutNL(pItem, pAdapterInfo->LeaseObtained ));
   } else {
   hb_arraySet(pSubArray, 7, hb_itemPutC( pItem, "" ));
   hb_arraySet(pSubArray, 8, hb_itemPutNI(pItem, 0 ));
   }
   
   // WINS server info - Primary & Secondary ip address
   if (pAdapterInfo->HaveWins)
   {
   hb_arraySet(pSubArray, 9, hb_itemPutC( pItem, pAdapterInfo->PrimaryWinsServer.IpAddress.String ));
   hb_arraySet(pSubArray, 10, hb_itemPutC( pItem, pAdapterInfo->SecondaryWinsServer.IpAddress.String ));
   } else {
   hb_arraySet(pSubArray, 9, hb_itemPutC( pItem, "" ));
   hb_arraySet(pSubArray, 10, hb_itemPutC( pItem, "" ));
   }
   
   hb_arrayAdd(paAddress, pSubArray);
   
   hb_itemRelease(pSubArray);
   pAdapterInfo = pAdapterInfo->Next; // Progress through
   // linked list
   }
   while(pAdapterInfo); // Terminate if last adapter
   hb_itemRelease(pItem);
   hb_itemRelease(hb_itemReturn(paAddress));
   }
  
#pragma ENDDUMP
Return nil

Function cCase_ATualiza_Versao(wopcao,wMainParm2)
*****************************************************************************************************************
*                                                                                                               *
*****************************************************************************************************************
Local wArq,wArqZip,wArqDataFull,wwork,wPathUpd,wPathSqlFull,wPathSqlUpd,wMDir,wErro, wMsg, wMsgX

   cursorwait()

//If ValType(wMainParm2)="C"
//   wPathSqlUpd  := "cCaseUpd/"  
//   wPathSqlFull := StrTran(wMainParm2+"\"   ,"\\","\") + "Data\cCaseUpd\"
//   wPathUpd     := "Upd\"
//   msginfo(wPathSqlFull)
//Else
   wPathSqlUpd     := "cCaseUpd"  
   **wPathSqlFull    := wc_MySqlLocal + "\Data\cCaseUpd"
   wPathSqlFull    := wc_MySqlLocal + "\cCaseUpd"
   wPathUpd        := "Upd"
//EndIf

** If Len(Directory( wc_MySqlLocal + "\Data" ,"D" )) = 0
   If Len(Directory( wc_MySqlLocal + ""      ,"D" )) = 0
      ccancel('Diretorio  "' + wc_MySqlLocal + '" não exitste (ccase.ini -> MysqlLocal=)')
//    ccancel('Diretorio  "' + wc_MySqlLocal + '\Data\" não exitste (ccase.ini -> MysqlLocal=)')
   EndIf

If wOpcao = 9 // TESTE
		cCase_ATualiza_Etapa("Vai Atualizar",25)

		cCase_ATualiza_Etapa("Esta atualizando",50)

		cCase_ATualiza_Etapa("Terminou a atualização",100)
  	return .T.
EndIf


If wOpcao = 1 // Backup da cCase
*----------------------------------------BACKUP---------------------------------------------------*
*----------------------------------------BACKUP---------------------------------------------------*
*----------------------------------------BACKUP---------------------------------------------------*
   If .not. MsgYesNo("Deseja criar Backup da cCase?","Confirme") 
      cCancel("Rotina de Backup da cCase")
   EndIf   

   MakeDir(wPathSqlFull)
   MakeDir(wPathUpd)

   wMsg:= "INÍCIO DA ROTINA DE BACKUP DA cCASE: "  + dtoc(cdate()) +"-"+ ctime() + CHR(13)+CHR(10)
   cCase_ATualiza_Etapa(wMsg,01)
   msgWait(wMsg,"Aguarde",03)

   wMsg:= "Etapa 01 -Criando diretorios de trabalho:" +  wPathSqlFull + "    "+ curDrive()+":\"+curDir() + "\"+ wPathUpd
   cCase_ATualiza_Etapa(wMsg,01)
   msgWait(wMsg,"Aguarde",03)

   If Len(Directory( wPathSqlFull ,"D" )) = 0
      ccancel('Diretorio  "' + wPathSqlFull + '" não criado. Verifique permissões')
   EndIf
   If Len(Directory( wPathUpd ,"D" )) = 0
      ccancel('Diretorio  "' + curDrive()+":\"+curDir() + "\"+ wPathUpd + '" não criado. Verifique permissões')
   EndIf

   fErase(wPathSqlFull+"\cCase_prp.upd")
   fErase(wPathSqlFull+"\cCase_obj.upd")
   fErase(wPathSqlFull+"\cCase_obj_prp.upd")

   wMsg:= "Etapa 02 - Excluindo arquivos: " +  wPathSqlFull+"\cCase_prp.upd       " + wPathSqlFull+"\cCase_obj.upd      " + wPathSqlFull+"\cCase_obj_prp.upd"
   cCase_ATualiza_Etapa(wMsg,02)
   msgWait(wMsg,"Aguarde",15)

   wMsg:= "Etapa 03 - Gerando arquivo: " +  wPathSqlFull+"/cCase_prp.upd"
   cCase_ATualiza_Etapa(wMsg,03)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Select * Into OutFile '"+wPathSqlUpd+"/cCase_prp.upd'      From cCase_prp")

   wMsg:= "Etapa 04 - Gerando arquivo: "  + wPathSqlFull+"/cCase_obj.upd"
   cCase_ATualiza_Etapa(wMsg,04)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Select * Into OutFile '"+wPathSqlUpd+"/cCase_obj.upd'      From cCase_obj")

   wMsg:= "Etapa 05 - Gerando arquivo: " +  wPathSqlFull+"/cCase_obj_prp.upd"
   cCase_ATualiza_Etapa(wMsg,05)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Select * Into OutFile '"+wPathSqlUpd+"/cCase_obj_prp.upd'  From cCase_obj_prp")

   fErase(wPathUpd+"\cCaseStru.upd")
   wMsg:= "Etapa 06 - Excluindo arquivos: " + curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCaseStru.upd"
   cCase_ATualiza_Etapa(wMsg,06)
   msgWait(wMsg,"Aguarde",15)

   wMsg:= "Etapa 07 - Gerando arquivo de estrutura: " + curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCaseStru.upd"
   cCase_ATualiza_Etapa(wMsg,07)
   msgWait(wMsg,"Aguarde",03)
   fPRC_Execute("prc_Tab_Versao_Gera")

   wMsg:= "Etapa 08 - Consistendo criação dos arquivos"
   cCase_ATualiza_Etapa(wMsg,08)
   msgWait(wMsg,"Aguarde",03)

   wMDir := Directory( wPathSqlFull + "\cCase_prp.upd" )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ wPathSqlFull+"\cCase_prp.upd não foi gerado" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ wPathSqlFull+"\cCase_prp.upd gerado com ERRO" )
      endIf
   EndIf

   wMDir := Directory( wPathSqlFull + "\cCase_obj.upd" )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ wPathSqlFull+"\cCase_obj.upd não foi gerado" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ wPathSqlFull+"\cCase_obj.upd gerado com ERRO" )
      endIf
   EndIf

   wMDir := Directory( wPathSqlFull + "\cCase_obj_prp.upd" )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ wPathSqlFull+"\cCase_obj_prp.upd não foi gerado" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ wPathSqlFull+"\cCase_obj_prp.upd gerado com ERRO" )
      endIf
   EndIf

   wMDir := Directory( wPathUpd+"\cCaseStru.upd" )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCaseStru.upd não foi gerado" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCaseStru.upd gerado com ERRO" )
      endIf
   EndIf

   wMDir := Directory( "cCase.exe" )
   If Len(wMDir) = 0
      cCancel("Arquivo cCase.exe não encontrado" )
   EndIf

   wMDir := Directory( "cCase.ico" )
   If Len(wMDir) = 0
      cCancel("Arquivo cCase.ico não encontrado" )
   EndIf

   wMDir := Directory( "SysCare.lnk" )
   If Len(wMDir) = 0
      cCancel("Arquivo SysCare.lnk não encontrado" )
   EndIf

   wMDir := Directory( "image\logo_sysCare.JPG" )
   If Len(wMDir) = 0
      cCancel("Arquivo image\logo_sysCare.JPG não encontrado" )
   EndIf

   wMDir := Directory( "Upd\MyOdbc\myodbc3.lib" )
   If Len(wMDir) = 0
      cCancel("Arquivo Upd\MyOdbc\myodbc3.lib não encontrado" )
   EndIf
   wMDir := Directory( "Upd\MyOdbc\myodbc3.dll" )
   If Len(wMDir) = 0
      cCancel("Arquivo Upd\MyOdbc\myodbc3.dll não encontrado" )
   EndIf
   wMDir := Directory( "Upd\MyOdbc\myodbc3s.lib" )
   If Len(wMDir) = 0
      cCancel("Arquivo Upd\MyOdbc\myodbc3s.lib não encontrado" )
   EndIf
   wMDir := Directory( "Upd\MyOdbc\myodbc3s.dll" )
   If Len(wMDir) = 0
      cCancel("Arquivo Upd\MyOdbc\myodbc3s.dll não encontrado" )
   EndIf
   
   wMDir := Directory( "cabarc.exe" )
   If Len(wMDir) = 0
      cCancel("Arquivo cabarc.exe não encontrado" )
   EndIf

   wMsg:= "Etapa 09 - Compactando arquivos de Atualização"
   cCase_ATualiza_Etapa(wMsg,09)
   msgWait(wMsg,"Aguarde",03)
   
   wArq  := "\cCase" + dtos(cdate())   
// run(" cabarc n " +wPathUpd+wArq+".upZ " +wPathSqlFull+ "\ccase*.upd "+wPathUpd+"\cCaseStru.upd cCase.exe cCase.ico SysCare.lnk "+wPathUpd+"\MyOdbc\*.*  ")
   run(" cabarc n " +wPathUpd+wArq+".upZ " +wPathSqlFull+ "\ccase*.upd "+wPathUpd+"\cCaseStru.upd cCase.exe cCase.ico SysCare.lnk  image\logo_sysCare.JPG  "+wPathUpd+"\MyOdbc\*.*  ")

   msgWait(wMsg,"Aguarde",15)

   fErase(wPathSqlFull+"\cCase_prp.upd")
   fErase(wPathSqlFull+"\cCase_obj.upd")
   fErase(wPathSqlFull+"\cCase_obj_prp.upd")

   msgWait(wMsg,"Aguarde",15)

   wMDir := Directory( wPathUpd+wArq+".upZ" )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+wArq+".upZ não foi gerado" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+wArq+".upZ gerado com ERRO" )
      endIf
   EndIf

   cursorarrow()

   wMsg:= chr(13)+chr(10)+"BACKUP GERADO COM SUCESSO: "+curDrive()+":\"+curDir() + "\"+ wPathUpd+wArq+".upZ        " + dtoc(cdate()) +"-"+ ctime()
   cCase_ATualiza_Etapa(wMsg,100)
   msgInfo(wMsg)


ElseIf wOpcao = 2 // Update/Restore da cCase
*----------------------------------------UPDATE---------------------------------------------------*
*----------------------------------------UPDATE---------------------------------------------------*
*----------------------------------------UPDATE---------------------------------------------------*

   MakeDir(wPathSqlFull)
   MakeDir(wPathUpd)
   MakeDir(wPathUpd+"\MyOdbc")

   wMDir := Directory( wPathUpd + "\*.upZ" )
   If Len(wMDir) = 0
      cCancel("Arquivo de Atualização "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCasennnnnnnn.upZ não encontrado" )
   EndIf
    wArqZip := "\" + wMDir[len(wMDir),1]   // pega o mais novo
   wArqDataFull := dtoc(wMDir[len(wMDir),3]) + " " + substr(wMDir[len(wMDir),4],1,5)

   wMsg:= "INÍCIO DA ROTINA DE ATULAIZAÇÃO DA cCASE: "  + dtoc(cdate()) +"-"+ ctime() + "     " + +wArqZip + chr(13)+chr(10)
   cCase_ATualiza_Etapa(wMsg,01)
   msgWait(wMsg,"Aguarde",03)

   wMsg := "Etapa 01 - Criando diretorios de trabalho:" +"    "+ wPathSqlFull + "        "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+ "       "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\MyOdbc"
	 cCase_ATualiza_Etapa(wMsg,01)
   msgWait(wMsg,"Aguarde",15)

   If Len(Directory( wPathSqlFull ,"D" )) = 0
      ccancel('Diretorio  "' + wPathSqlFull + '" não criado. Verifique permissões')
   EndIf
   If Len(Directory( wPathUpd ,"D" )) = 0
      ccancel('Diretorio  "' + curDrive()+":\"+curDir() + "\"+ wPathUpd + '" não criado. Verifique permissões')
   EndIf
   If Len(Directory( wPathUpd+"\MyOdbc" ,"D" )) = 0
      ccancel('Diretorio  "' + curDrive()+":\"+curDir() + "\"+ wPathUpd+"\MyOdbc" + '" não criado. Verifique permissões')
   EndIf

   fErase(wPathSqlFull+"\cCase_prp.upd")
   fErase(wPathSqlFull+"\cCase_obj.upd")
   fErase(wPathSqlFull+"\cCase_obj_prp.upd")

   fErase(wPathSqlFull+"\myodbc3.lib" )
   fErase(wPathSqlFull+"\myodbc3.dll" )
   fErase(wPathSqlFull+"\myodbc3s.lib") 
   fErase(wPathSqlFull+"\myodbc3s.dll")
    
   fErase(wPathSqlFull+"\cCaseStru.upd")
   fErase(wPathSqlFull+"\cCase.exe")
   fErase(wPathSqlFull+"\cCase.ico")
   fErase(wPathSqlFull+"\SysCare.lnk")
   fErase(wPathSqlFull+"\logo_sysCare.JPG")

   wMsg := "Etapa 02 - Exclunido arquivos das atualizações anteriores"
   cCase_ATualiza_Etapa(wMsg,02)
   msgWait(wMsg,"Aguarde",10)

/*
   wMDir := Directory( wPathUpd + "\*.upZ" )
   If Len(wMDir) = 0
      cCancel("Arquivo de Atualização "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCasennnnnnnn.upZ não encontrado" )
   EndIf
 
   wArqZip := "\" + wMDir[len(wMDir),1]   // pega o mais novo
   wArqDataFull := dtoc(wMDir[len(wMDir),3]) + " " + substr(wMDir[len(wMDir),4],1,5)
*/
   If .not. MsgYesNo("Deseja Atualizar a cCase versão: " +chr(13)+chr(10)+wArqZip+"  (" + wArqDataFull + ") ?","Confirme") 
      cCancel("Rotina de atualização versão: "+ wArqZip )
   EndIf   

   wMsg := "Etapa 03 - extraindo arquivos para o diretório " + wPathUpd
   cCase_ATualiza_Etapa(wMsg,03)
   msgWait(wMsg,"Aguarde",3)

   winExec("Expand " +wPathUpd+wArqZip+ " -f:*.* " +wPathUpd+ "\  ")
   wMsg := "Etapa 04 - Extração concluida "
   cCase_ATualiza_Etapa(wMsg,04)
   msgWait(wMsg,"Aguarde",03)

   wMsg := "Etapa 05 - Copiando Banco de Dados cCase..."
   cCase_ATualiza_Etapa(wMsg,05)
   msgWait(wMsg,"Aguarde",10)
   Copyfile(wPathUpd+"\cCase_obj.upd"       , wPathSqlFull+"\cCase_obj.upd"   )
   Copyfile(wPathUpd+"\cCase_obj_prp.upd"   , wPathSqlFull+"\cCase_obj_prp.upd"   )
   Copyfile(wPathUpd+"\cCase_prp.upd"       , wPathSqlFull+"\cCase_prp.upd"   )

   wMsg := "Etapa 06 - Cópia dos Banco de dados da cCase concluida"
   cCase_ATualiza_Etapa(wMsg,06)
   msgWait(wMsg,"Aguarde",10)

   If .not. MsgYesNo("Inicia a Atualização da cCase?")
      cCancel("Rotina de atualização versão: "+ wArqZip )
   EndIf   

   wMsg := "Etapa 07 - Iniciando a atualização da versão da cCase..."
   cCase_ATualiza_Etapa(wMsg,07)
   msgWait(wMsg,"Aguarde",15)

   wMDir := Directory( upper( wPathUpd+ "\cCaseStru.upd") )
   If Len(wMDir) = 0
      cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+ "\cCaseStru.upd não extraido" )
   Else
      if wMDir[1,2] < 10000
         cCancel("Arquivo "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCaseStru.upd extraido com ERRO" )
      endIf
   EndIf

   *--------------Consite se arquivos foram extraidos------------------*

   wMsg := "Etapa 08 - Consitindo se os arquivos foram extraidos corretamente..."
   cCase_ATualiza_Etapa(wMsg,08)
   msgWait(wMsg,"Aguarde",03)

   wErro := Space(00)
   wMDir := Directory( wPathSqlFull + "\cCase_prp.upd" )
   If Len(wMDir) = 0
      wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_prp.upd não extraido" )
   Else
      if wMDir[1,2] < 10000
         //cCancel("Arquivo "+ wPathSqlFull+"\cCase_prp.upd extraido com ERRO" )
         wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_prp.upd extraido com ERRO" )
      endIf
   EndIf

   wMDir := Directory( wPathSqlFull + "\cCase_obj.upd" )
   If Len(wMDir) = 0
      wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_obj.upd não extraido" )
   Else
      if wMDir[1,2] < 10000
         wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_obj.upd extraido com ERRO" )
      endIf
   EndIf

   wMDir := Directory( wPathSqlFull + "\cCase_obj_prp.upd" )
   If Len(wMDir) = 0
      wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_obj_prp.upd não extraido" )
   Else
      if wMDir[1,2] < 100000
         wErro := wErro + chr(13)+chr(10)+ ("Arquivo "+ wPathSqlFull+"\cCase_obj_prp.upd extraido com ERRO" )
      endIf
   EndIf

   If Len(wErro) = 0   // se NÃO teve erros
      wMsg := "Etapa 09 - Arquivos foram extraidos corretamente..."
      cCase_ATualiza_Etapa(wMsg,09)
      msgWait(wMsg,"Aguarde",03)
   Else
      wMsg:= "Etapa 10 - Arquivos foram extraidos com ERROS..." + chr(13)+chr(10) + wErro 
      cCase_ATualiza_Etapa(wMsg,10)
      msgInfo(wMsg)
      If .not. MsgYesNo("Arquivos extraidos com erros. Deseja continuar mesmo assim?","Confirme") 
         cCancel("Rotina de atualização versão: "+ wArqZip )
      EndIf   
      If .not. MsgYesNo("Falou com o Analista? Sabe das consequências? Tem Certeza?????","Confirme") 
         cCancel("Rotina de atualização versão: "+ wArqZip )
      EndIf   
   EndIf
   *-------------------------------------------------------------------*

   wMsg:= "Etapa 11 - Copiando arquivos myodbc..."
   cCase_ATualiza_Etapa(wMsg,11)
   msgWait(wMsg,"Aguarde",03)
   Copyfile(wPathUpd+"\myodbc3.lib"   , wPathUpd+"\MyOdbc\myodbc3.lib" )
   Copyfile(wPathUpd+"\myodbc3.dll"   , wPathUpd+"\MyOdbc\myodbc3.dll" )
   Copyfile(wPathUpd+"\myodbc3s.lib"  , wPathUpd+"\MyOdbc\myodbc3s.lib" )
   Copyfile(wPathUpd+"\myodbc3s.dll"  , wPathUpd+"\MyOdbc\myodbc3s.dll" )

   wMsg:= "Etapa 12 - Copiando cCase.exe..."
   cCase_ATualiza_Etapa(wMsg,12)
   msgWait(wMsg,"Aguarde",03)
   wMDir := Directory( wPathUpd + "\ccase.exe" )
   wWork := "cCase"+dtos(wMDir[1,3])+".exe"
   Copyfile(wPathUpd+"\cCase.exe"     , wWork )

   wMsg:= "Etapa 13 - Copiando Atalho cCsase..."
   cCase_ATualiza_Etapa(wMsg,13)
   msgWait(wMsg,"Aguarde",03)
   Copyfile(wPathUpd+"\cCase.ico"          , "cCase.ico" )
   Copyfile(wPathUpd+"\SysCare.lnk"        , "SysCare.lnk" )
   Copyfile(wPathUpd+"\logo_sysCare.JPG"   , "image\logo_sysCare.JPG" )

   wMsg:= "Etapa 14 - Drop nas tabelas upd..."
   cCase_ATualiza_Etapa(wMsg,14)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Drop Table  If Exists cCase_prp_upd,cCase_obj_upd,cCase_obj_prp_upd")
   wWork := fConnect_Tabela( "cCase_prp" ,"Drop Table  If Exists cCase_prp_old,cCase_obj_old,cCase_obj_prp_old")

   wMsg:= "Etapa 15 - Re-criando as tabelas upd..."
   cCase_ATualiza_Etapa(wMsg,15)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Create Table cCase_prp_upd     Like cCase_prp")
   wWork := fConnect_Tabela( "cCase_prp" ,"Create Table cCase_obj_upd     Like cCase_obj")
   wWork := fConnect_Tabela( "cCase_prp" ,"Create Table cCase_obj_prp_upd Like cCase_obj_prp")

   wMsg:="Etapa 16 - carregando dados da cCase_prp.upd..."
   cCase_ATualiza_Etapa(wMsg,16)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Load Data InFile '"+wPathSqlUpd+"/cCase_prp.upd'      Into Table cCase_prp_upd")

   wMsg:= "Etapa 17 - carregando dados da cCase_obj.upd..."
   cCase_ATualiza_Etapa(wMsg,17)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Load Data InFile '"+wPathSqlUpd+"/cCase_obj.upd'      Into Table cCase_obj_upd")

   wMsg:= "Etapa 18 - carregando dados da cCase_obj_prp.upd..."
   cCase_ATualiza_Etapa(wMsg,18)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"Load Data InFile '"+wPathSqlUpd+"/cCase_obj_prp.upd'  Into Table cCase_obj_prp_upd")

   wWork := fConnect_Tabela( "cCase_prp" ,"Select count(*) as RecTot from cCase_prp_upd")
   If Val(wWork[1,1]) = 0
      cCancel("Tabela cCase_prp_upd importada com ERRO" )
   EndIf
   wMsg:= "Etapa 19 - Total de registros importados na cCase_prp_upd  " +Alltrim(cstr(wWork[1,1]))
   cCase_ATualiza_Etapa(wMsg,19)
   msgWait(wMsg,"Aguarde",03)

   wWork := fConnect_Tabela( "cCase_prp" ,"Select count(*) as RecTot from cCase_obj_upd")
   If Val(wWork[1,1]) = 0
      cCancel("Tabela cCase_obj_upd importada com ERRO" )
   EndIf
   wMsg:= "Etapa 20 - Total de registros importados na cCase_obj_upd  " +Alltrim(cstr(wWork[1,1]))
   cCase_ATualiza_Etapa(wMsg,20)
   msgWait(wMsg,"Aguarde",03)

   wWork := fConnect_Tabela( "cCase_prp" ,"Select count(*) as RecTot from cCase_obj_prp_upd")
   If Val(wWork[1,1]) = 0
      cCancel("Tabela cCase_obj_prp_upd importada com ERRO" )
   EndIf
   wMsg:= "Etapa 21 - Total de registros importados na cCase_obj_prp_upd  " +Alltrim(cstr(wWork[1,1]))
   cCase_ATualiza_Etapa(wMsg,21)
   msgWait(wMsg,"Aguarde",03)

   wMsg:= "Etapa 22 - Renomeando as Tabelas cCase... para cCase.._old " 
   cCase_ATualiza_Etapa(wMsg,22)
   msgWait(wMsg,"Aguarde",03)
   wWork := fConnect_Tabela( "cCase_prp" ,"RENAME TABLE cCase_prp TO cCase_prp_old, cCase_prp_upd TO cCase_prp, cCase_obj TO cCase_obj_old, cCase_obj_upd TO cCase_obj, cCase_obj_prp TO cCase_obj_prp_old, cCase_obj_prp_upd TO cCase_obj_prp")

   wMsg:= "Etapa 23 - Iniciando a atualização das estrutura das tabelas "
   cCase_ATualiza_Etapa(wMsg,23)
   msgWait(wMsg,"Aguarde",03)

   fPRC_Execute("prc_Tab_Versao_Atualiza")

//   wMsg:= "Etapa 24 - concluido a atualização das estrutura das tabelas "
//   cCase_ATualiza_Etapa(wMsg,24)
//   msgWait(wMsg,"Aguarde",03)

   wMsg:= "Etapa 25 - Excluindo arquivos...  "
   cCase_ATualiza_Etapa(wMsg,25)
   msgWait(wMsg,"Aguarde",03)

   fErase(wPathSqlFull+"\cCase_prp.upd")
   fErase(wPathSqlFull+"\cCase_obj.upd")
   fErase(wPathSqlFull+"\cCase_obj_prp.upd")

   fErase(wPathUpd+"\myodbc3.lib" )
   fErase(wPathUpd+"\myodbc3.dll" )
   fErase(wPathUpd+"\myodbc3s.lib") 
   fErase(wPathUpd+"\myodbc3s.dll")
    
   fErase(wPathUpd+"\cCaseStru.upd")
   fErase(wPathUpd+"\cCase.exe")
   fErase(wPathUpd+"\cCase.ico")
   fErase(wPathUpd+"\SysCare.lnk")
   fErase(wPathUpd+"\logo_sysCare.JPG")

   cursorarrow()
   
   wMsg:= chr(13)+chr(10)+"ATUALIZAÇÃO EXECUTADA COM SUCESSO: "  + dtoc(cdate()) +"-"+ ctime() + "     " + +wArqZip
   cCase_ATualiza_Etapa(wMsg,100)
   msgInfo(wMsg)


ElseIf wOpcao = 3 // Extrai o Arquivo upd\ccase.exe
*----------------------------------------EXTRAÇÃO-------------------------------------------------*
*----------------------------------------EXTRAÇÃO-------------------------------------------------*
*----------------------------------------EXTRAÇÃO-------------------------------------------------*
   wMDir := Directory( wPathUpd + "\*.upZ" )
   If Len(wMDir) = 0
      cCancel("Arquivo de Atualização "+ curDrive()+":\"+curDir() + "\"+ wPathUpd+"\cCasennnnnnnn.upZ não encontrado" )
   Else
      wArqZip := "\"+wMDir[len(wMDir),1]   // pega o mais novo
      If .not. MsgYesNo("Deseja Extrair o cCase.exe versão: "+wArqZip+" ?","Confirme") 
         cCancel("Rotina de atualização versão: "+ wArqZip )
      EndIf   
      winExec("Expand " +wPathUpd+wArqZip+ " -f:ccase.exe " +wPathUpd+ "\  ")
   EndIf

   cursorarrow()

   msginfo("Extração concluida. Verifique o arquivo upd\cCase.exe")

Endif

return .t.
*fim da Function cCase_ATualiza_Versao(wopcao)

function cCase_ATualiza_Dlg(paramDLL,wMainParm2)
*************************************************************************************
*                            kMensagem - Cor do Browse                              *
*************************************************************************************
Local oDlg,lEnd := .T.,bAction,nVal,nOption
Public __wAtualizaCCASE := Space(0),__oAtualizaCCASE, __oMeterAtualiza

   if Valtype(paramDLL) = "C"
      if     Substr(paramDLL,1,6) = "backup"
         nOption := 1  // backup
      ElseIf Substr(paramDLL,1,6) = "update"
         nOption := 2  // update
      ElseIf Substr(paramDLL,1,9) = "ccase.exe"
         nOption := 3
      ElseIf Substr(paramDLL,1,5) = "teste"
         nOption := 9
      ElseIf Substr(paramDLL,1,6) = "config"
         nOption := 0
      Else
         MsgInfo("       Parâmetros inválidos." + chr(13)+chr(10) + chr(13)+chr(10) +" Backup -> Backup de atualização da cCase" + chr(13)+chr(10) + " Update -> Restore de atualização da cCase"+ chr(13)+chr(10) + " cCase.exe -> Extrai o Arquivo upd\ccase.exe"+ chr(13)+chr(10) + " config -> Configura o SysCare (Registra Odbc, cria conexão e atalho)" + chr(13)+chr(10) + " configUser -> Configura o SysCare (cria conexão e atalho)")
      	Quit
      EndIf
   EndIf

   oDlg := TDIALOG():New( 0, 0, 40, 135 , "Atualização de Versão da cCase" ,,, .F.,,,,,, .F. ,, oFont,,, )

   __oAtualizaCCASE := TMultiGet():New(0   ,1   ,{|u| If( PCount()==0,__wAtualizaCCASE,__wAtualizaCCASE:=u)},oDlg,520   ,300     ,oFont,.T.     ,        ,        ,       ,.F.   ,    ,.T.    ,     ,.F.    ,.F.   ,.f.      ,      ,        ,.F.    ,          )
                       //   METHOD New(nRow,nCol,bSetGet                                                    ,oWnd,nWidth,nHeight,oFont,lHScroll,nClrFore,nClrBack,oCursor,lPixel,cMsg,lUpdate,bWhen,lCenter,lRight,lReadOnly,bValid,bChanged,lDesign,lNoVScroll) CONSTRUCTOR
	__oAtualizaCCASE:Set3DLooK()

   bAction := "cCase_ATualiza_Versao("+Str(nOption)+","+cNvl(wMainParm2,"")+")" 
	bAction := If(bAction == nil,{ || nil },bAction );

   __oMeterAtualiza := TMeter():New(20  ,2   ,{ | u | If( PCount()==0, nVal, nVal:= u ) },50	   ,oDlg,500   ,10     ,.F.    ,.F.   ,     ,     ,.F.          ,        ,        ,       ,         ,.F.    )
							 // METHOD New(nRow,nCol, bSetGet                                   ,nTotal,oWnd,nWidth,nHeight,lUpdate,lPixel,oFont,cText,lNoPercentage,nClrPane,nClrText,nClrBar,nClrBText,lDesign) CONSTRUCTOR
   oDlg:bStart := { || &(bAction) }

   //ACTIVATE DIALOG oDlg CENTERED
   oDlg:Activate(oDlg:bLClicked,oDlg:bMoved,oDlg:bPainted,.T.,oDlg:bValid,,oDlg:bInit,oDlg:bRClicked,)

return lEnd
*fim da Function cCase_ATualiza_Dlg(paramDLL,wMainParm2)

function cCase_ATualiza_Etapa( wEtapa , nEtapa)
*************************************************************************************
*                                                                                   *
*************************************************************************************

	__oAtualizaCCASE:Append( wEtapa+CHR(13)+CHR(10) )
//	__oAtualizaCCASE:Append( CHR(13)+CHR(10) )

	__oAtualizaCCASE:SetPos( __oAtualizaCCASE:Len() )
	__oAtualizaCCASE:Refresh()
	__oMeterAtualiza:Set( nEtapa )

return .T.
*fim da Function cCase_ATualiza_Dlg(paramDLL,wMainParm2)

Function __cCase_Clock()
************************************************************************************************
*                           Execução de Tarefas no sistema por tempo                           *
************************************************************************************************
Local oTempo,wTempo

	wTempo := 10*1000  // 10 segundos vezes fator 1000
   oTempo := TVTempo():New(wTempo,{|| __cCase_Clock_Action(oTempo) })

   oTempo:nIntervalo := wTempo

return .t.
*fim da Function __cCase_Clock()

Function __cCase_Clock_Action(oTempo)
************************************************************************************************
*                              Messenger - Aplicativo de Mensagens                             *
************************************************************************************************
   
   //oTempo:VerSituacao()
	//oTempo:End()
   
	//msginfo("Cícero usar esta função")

return .t.
*fim da Function __cCase_Clock_Action()

Function fpChave(wplv_chv)
Return  fplv_chv(wplv_chv)

Function fplv_chv(wplv_chv)
*****************************************************************************************************************
* Função para expandir a palavra chave (SysCare - Gerenciamento)                                                *
*****************************************************************************************************************
Private wSelect ,wResp1 , wPlv_chv_Result ,wPlv_chv_Tp ,wPlv_chv_Cmd , wPlv_chv_Cod, wPlv_chv_Desc, wPac_Cod , wCont 

//wPlv_chv := 10
//wXPac_Cod := 4390
//wM_Objeto := {} 

wPlv_chv_Result := nil

//If Valtype("wXPac_Cod")  "U"
//   cCancel("Variavel wXPac_Cod não definida")
//Endif
//If Valtype(wXPac_Cod) <> "N"
//   cCancel("Variavel wXPac_Cod não definida")
//Endif

If ValType(wPlv_chv) = "C"
   wPlv_chv := Upper(AllTrim(wPlv_chv))
   wPlv_chv_Cod := fPRC_Execute("PRC_Busca_Descricao",{"plv_chave_cod","see_script_plv_chave","plv_chave_desc = " + Campo(wPlv_chv),0})
   wPlv_chv_Desc := wPlv_chv
Else
   wPlv_chv_Desc := fPRC_Execute("PRC_Busca_Descricao",{"plv_chave_Desc","see_script_plv_chave","plv_chave_Cod = " + Campo(wPlv_chv,"N"),0})
   wPlv_chv_Cod := wPlv_chv
EndIf

If cEmpty(wPlv_chv_Cod) .or. cEmpty(wPlv_chv_Desc)
//   cCancel("Palavra chave "+AllTrim(cStr(wPlv_chv))+" não encontrada")
   msginfo("Palavra chave "+AllTrim(cStr(wPlv_chv))+" não encontrada")
   Return 0
EndIf

wPlv_chv_Cmd := fPRC_Execute("PRC_Busca_Descricao",{"plv_chave_Cmd","see_script_plv_chave","plv_chave_Cod = " + Campo(wPlv_chv_Cod,"N"),0})
wPlv_chv_Tp  := fPRC_Execute("PRC_Busca_Descricao",{"plv_chave_Tp","see_script_plv_chave","plv_chave_Cod = " + Campo(wPlv_chv_Cod,"N"),0})

If cEmpty(wPlv_chv_Cmd)     // Palavra Chave
   wPac_Cod := wc_Pac_Cod        
   wSelect := "Select script_mov_itens_valor,script_mov_itens_Texto "
   wSelect := wSelect + " FROM see.see_script_mov_itens "
   wSelect := wSelect + " where pac_codigo = " + campo(wPac_Cod,"N")
   wSelect := wSelect + "  and plv_chave_cod = " + Campo(wPlv_chv_Cod,"N") 
   wSelect := wSelect + "  Order by script_mov_itens_dt Desc, script_mov_itens_hr Desc Limit 1 " 

   wxtpCursor:= 1
   cSql_Cursor("wResp1",FConnect_Tabela("see_script_mov_itens",wSelect))

   If cSql_Cursor("wResp1","Len") > 0
      If wPlv_chv_Tp = "N"
         wPlv_chv_Result := cSql_Cursor("wResp1","script_mov_itens_valor")
      Else
         wPlv_chv_Result := AllTrim(cSql_Cursor("wResp1","script_mov_itens_Texto"))
      EndIf
   EndIf
      
Else                        // Palavra Reservada    ????

   wPlv_chv_Cmd := alltrim(wPlv_chv_Cmd)
   wPlv_chv_Cmd := StrTran(wPlv_chv_Cmd,chr(13),"")
   wPlv_chv_Cmd := StrTran(wPlv_chv_Cmd,chr(10),"")
   wCont := wPlv_chv_Cmd
   If .not. cempty(wCont)
      wCont := StrTran(wCont,chr(180),chr(39))
      wCont := &wCont
      If Substr(wPlv_chv_Cmd,1,1)= chr(34)  // se for aspa (") expande duas vezes
         wCont := &wCont
      EndIf
      If Valtype(wCont) = "A"
         wPlv_chv_Result := wCont[1,1]    // se for cursor sql
      Else
         wPlv_chv_Result := wCont
      EndIf
   EndIf

EndIf



Return wPlv_chv_Result
* fim da Function fplv_chv(wplv_chv)


Function cSuper(_wObj_Nome,_wPrp_Nome,wValorNovo)
********************************************************************************
*                                                                              *
********************************************************************************
Local wResposta,wPosObj,wPosPrp,wObj_Tp,wValorAtual,wx,wxLen,wObjeto,wUpdate,wObj_Pai,wMatriz,wObj_Pai_Tp
Local wFt_Lin,wFt_Col,wx_FRM,wPrp_Type,wObjetoAux,wMObj_Nome_Pos,wDeslocLinha,wPrimeiro,wObj_Nome_Pai,wnID
Local wObj_Nome_Ant,wObj_Ant,wObj_Nome_Pos,wObj_Pos,wLinha,wColuna,wAltura,wLargura,wNivel,wObjDesloc,wVertical
Local wxLinha,wxColuna,wxLargura,wxAltura,wyLinha,wyColuna,wy,wDominio,wDom_Pesq,wPos,wPosX,wType,wObj_Seq,wFRM

   If cEmpty(_wObj_Nome)
   //   cCancel("Parâmetro NOME DO OBJETO da função cSuper() não informado","Erro...")
   Else
      If cEmpty(_wPrp_Nome)
      //   cCancel("Parâmetro PROPRIEDADE da função cSuper() não informada","Erro...")
      EndIf
   EndIf

   _wObj_Nome := cLower(AllTrim(_wObj_Nome))

   wFRM := _fCase_Scan_Frm(_wObj_Nome)

   wPosObj  := cScan(__wMCase_Obj[wFRM],_wObj_Nome,1)  //StrTran(_wObj_Nome,"_",""))

   If wPosObj=0
      Return nil
   EndIf
   
// wObj_Seq := __wMCase_Obj[wFRM][wPosObj,__wobj_seq]
   wObjeto  := __wMCase_Obj[wFRM][wPosObj,__wobjeto ]
   wObj_Tp  := __wMCase_Obj[wFRM][wPosObj,__wobj_tp ]

   _wPrp_Nome := cLower(AllTrim(_wPrp_Nome))

   If _wPrp_Nome = "prompt" .Or. _wPrp_Nome = "cabecalho" .Or. _wPrp_Nome = "cabecalho_grid"
		_wPrp_Nome := _wP_TITLE
   End 

   If _wPrp_Nome = "cabecalho_grid"
      wObj_Tp    := "DAT"
   EndIf

   wObj_Nome_Pai := cSuper_Obj_Pai(_wObj_Nome)

   If _wPrp_Nome = _wP_CONTEUDO
      If ValType(wValorNovo)="U"
         wValorAtual := Eval( wObjeto:bSetGet )

         If wObjeto:classname="CHECKBOX"
            wValorAtual :=   iif(wValorAtual,"S","N")
         EndIf
         
         If wObjeto:classname="TRADMENU"
            wDominio :=  __wMCase_Obj[wFRM][wPosObj,__wdominio] //cSuper(_wObj_Nome,_wP_DOMINIO)
            If .Not.cEmpty(wDominio)
               wDominio := &(wDominio) //cDominio(wDominio)
               wxLen    := Len(wDominio)
               wDom_Pesq := ""
               If ValType(wValorAtual)="C"
                  wValorAtual := cUpper(AllTrim(wValorAtual))
                  For wx := 01 To wxLen
                     wDom_Pesq := AllTrim(wDominio[wx])+"-"
                     If wValorAtual == cUpper(AllTrim(SubStr(wDom_Pesq,1,At("-",wDom_Pesq)-1)))
                        wValorAtual := wx
                        Exit
                     EndIf
                  Next
               Else
                  If wValorAtual>wxLen
                     wValorAtual := wxLen
                  EndIf
               EndIf
               If cEmpty(wValorAtual) .Or. ValType(wValorAtual)="C"
                  wValorAtual := 1
               EndIf
               wValorAtual := wDominio[wValorAtual]
            EndIf
         EndIf

         If ValType(wValorAtual)="C"
            wValorAtual := rTrim(wValorAtual)
         EndIf
      Else
         If ValType(wValorNovo)="C"
            wValorNovo := rTrim(wValorNovo)
         EndIf

         wxLen := 0
         If wObjeto:classname="TGET"
            If ValType(wValorNovo)="C"
               wValorNovo := wValorNovo+Space(252)
            EndIf
         	cV(__wMCase_Obj[wFRM][wPosObj,__wconteudo],__wMCase_Obj[wFRM][wPosObj,__wgrid],wValorNovo)
            If ValType(wObjeto)="O"
               wObjeto:Refresh()
            EndIf
         ElseIf wObjeto:classname="TCOMBOBOX" .Or. wObjeto:classname="TRADMENU"
            wDominio := wObjeto:aItems
            wxLen    := Len(wDominio)
            If wxLen>0
               //If wObjeto:classname="TCOMBOBOX"
               //   //wDom_Pesq := __wMCase_Obj[wFRM][wPosObj,__wrequerido] //cSuper(_wObj_Nome,_wP_REQUERIDO)
               //   //wDom_Pesq := iif(cEmpty(wDom_Pesq),"N",wDom_Pesq)
               //   //If wDom_Pesq="N"
               //   //   wMatriz := wDominio
               //   //   wDominio:= {}
               //   //   aAdd(wDominio,"")
               //   //   For wx := 01 To Len(wMatriz)
               //   //      aAdd(wDominio,wMatriz[wx])
               //   //   Next
               //   //EndIf
               //EndIf
               wDom_Pesq := ""
               If ValType(wValorNovo)="C"
                  wValorNovo := cUpper(AllTrim(wValorNovo))

                  For wx := 01 To wxLen
                     wDom_Pesq := AllTrim(wDominio[wx])+"-"
                     If wValorNovo == cUpper(AllTrim(SubStr(wDom_Pesq,1,At("-",wDom_Pesq)-1)))
                     
                        If wObjeto:classname="TCOMBOBOX"
                     
                           cV(__wMCase_Obj[wFRM][wPosObj,__wconteudo],__wMCase_Obj[wFRM][wPosObj,__wgrid],wDominio[wx])
                        EndIf
                        wValorNovo := wx
                        Exit
                     EndIf
                  Next
               Else
                  If wValorNovo>wxLen
                     wValorNovo := wxLen
                  EndIf
               EndIf
            EndIf
         
            If cEmpty(wValorNovo) .Or. ValType(wValorNovo)="C"
               wValorNovo := 1
            EndIf
            If wxLen>0
               wValorAtual := wDominio[wValorNovo]
            EndIf
         
            If ValType(wObjeto)="O"
               If wObjeto:classname="TCOMBOBOX"
                  wObjeto:Select(wValorNovo)
               Else
                  cV(__wMCase_Obj[wFRM][wPosObj,__wconteudo],__wMCase_Obj[wFRM][wPosObj,__wgrid],wValorNovo)
                  wObjeto:nOption(wValorNovo)
                  wObjeto:Refresh()
               EndIf
            EndIf
         ElseIf wObjeto:classname="CHECKBOX"
            wValorNovo := iif(ValType(wValorNovo)="C",AllTrim(wValorNovo),"N")
            wValorNovo := iif(wValorNovo="S",.T.,.F.)
            cV(__wMCase_Obj[wFRM][wPosObj,__wconteudo],__wMCase_Obj[wFRM][wPosObj,__wgrid],wValorNovo)
        
            If ValType(wObjeto)="O"
               wObjeto:Refresh()
            EndIf
         ElseIf wObj_Tp = "GRD"
            If Len(wValorNovo)=0
               fClear_Grid(__wMCase_Obj[wFRM][wPosObj,__wobj_seq]) 
            Else
               //__wMCase_Obj[wFRM][wPosObj,__wconteudo] := wValorNovo
            EndIf
            If ValType(wObjeto)="O"
               fCase_Grid_GoTop(_wObj_Nome,wObjeto)
               If ValType(wObjeto:bChange)="B"
                  Eval(wObjeto:bChange)
               EndIf
            EndIf
         ElseIf wObj_Tp = "DAT"
            If ValType(wObjeto)="O"
               wColuna := 1 //__wMCase_Obj[wFRM][wPosObj,__witemobj] //cSuper(_wObj_Nome,_wP_ITEM_OBJ)
               If cNvl(wColuna,0)>0
                   //wPosObj := cScanBin(__wMCase_Obj[wFRM],StrTran(wObj_Nome_Pai,"_",""),__aSortBin)  //_fSuper_Scan(wObj_Nome_Pai,"O")
                   //__wMCase_Obj[wFRM][wPosObj,__wconteudo][wObjeto:nAt,wColuna] := wValorNovo
               //   wObjeto:Refresh()
               EndIf
            EndIf
         ElseIf wObj_Tp = "MMO"
            If ValType(wObjeto)="O"
               wObjeto:Refresh()
            EndIf
         ElseIf wObj_Tp = "IMG"
            If ValType(wObjeto)="O"
               wObjeto:LoadImage(,wValorNovo)
               wObjeto:Refresh()
            EndIf
         EndIf
         wValorAtual := wValorNovo
      EndIf
      Return wValorAtual
   EndIf

   wUpdate := .F.
   If At("()",_wPrp_Nome)>0
      If ValType(wObjeto)<>"O"
         Return wValorAtual
      EndIf
   // If _wPrp_Nome == _wP_SETIMAGE
   //    If cEmpty(wValorNovo)
   //       wPosX := AllTrim(cUpper(__wMCase_Obj[wFRM][wPosObj,__wimagempri]))    ///cSuper(_wObj_Nome,_wP_IMAGEM_PRI)))
   //       If .Not.cEmpty(wPosX)
   //          If cUpper(wObjeto:ClassName)="TBTNBMP"
   //             wPos  := AllTrim(cUpper(cNvl(wObjeto:cBmpFile1,"")))
   //             If wPos==wPosX
   //                wPosX := __wMCase_Obj[wFRM][wPosObj,__wimagemsec] //cSuper(_wObj_Nome,_wP_IMAGEM_SEC)
   //             EndIf
   //             wObjeto:SetFile(wPosX)
   //          EndIf
   //       EndIf
   //    Else
   //       If wValorNovo=2
   //          wObjeto:SetFile(__wMCase_Obj[wFRM][wPosObj,__wimagemsec]) ///cSuper(_wObj_Nome,_wP_IMAGEM_SEC))
   //       Else
   //          wObjeto:SetFile(__wMCase_Obj[wFRM][wPosObj,__wimagempri]) ///cSuper(_wObj_Nome,_wP_IMAGEM_PRI))
   //       EndIf
   //       wObjeto:Refresh()
   //    EndIf
   // EndIf

      If _wPrp_Nome == _wP_END
         wObjeto:End()
      EndIf

      If _wPrp_Nome == _wP_VALID
         //wValorAtual := __wMCase_Obj[wFRM][wPosObj,__wconteudo]
         If AllTrim(cNvl(__wMCase_Obj[wFRM][wPosObj,__wrequerido],"N"))="S".And.cEmpty(wValorAtual,AllTrim(cNvl(__wMCase_Obj[wFRM][wPosObj,__wpicture],"")))
            MsgStop(AllTrim(cNvl(__wMCase_Obj[wFRM][wPosObj,__wtitle],"")) + " não foi informado","Atenção")
            If ValType(wObjeto)="O"
               SetFocus(wObjeto:hWnd)
            EndIf
            Return .F.
         EndIf

         If ValType(wObjeto)="O"
            If cUpper(wObjeto:ClassName)="TRADMENU"
               wObjeto := wObjeto:aItems[1]
            EndIf
            If .Not.wObjeto:lValid()
               SetFocus(wObjeto:hWnd)
               Return .F.
            EndIf
         EndIf
         Return .T.
      EndIf

      If _wPrp_Nome == _wP_DESTROY
         wValorNovo := cNvl(wValorNovo,0)
         If wObj_Tp = "FRM"
            __wKeySeek := Space(00) //wc_KeySeek := Space(00)

            __fCase_Del_Obj(_wObj_Nome,wObj_Tp) //_fSuper_Del_Obj(_wObj_Nome,wObj_Tp)
            If wValorNovo=0
               wObjeto:bValid := nil
               wObjeto:End()
            EndIf
         ElseIf wObj_Tp = "FLD"
            wMatriz := wObjeto:Cargo
            wObjeto:Update()
            wObjeto:Hide()   
            wObjeto:Refresh()
            wObjeto:Destroy() 
            wObjeto:= nil

            For wx := 01 To Len(wMatriz)
               cSuper(wMatriz[wx,1],_wP_DESTROY,wValorNovo)
            Next
         ElseIf wObj_Tp = "FLT"
            wObj_Pai := wObjeto:oWnd
            If ValType(wObj_Pai)="O"
               wx    := wObj_Pai:nOption
               wxLen := Len(wObj_Pai:aPrompts)-1
               wObj_Pai:aPrompts := aDel( wObj_Pai:aPrompts , wx    )
               wObj_Pai:aPrompts := aSize( wObj_Pai:aPrompts, wxLen )
               wObjeto:bValid := {||.T.}
               wObjeto:End()
               wObj_Pai:aDialogs := aDel( wObj_Pai:aDialogs , wx    )
               wObj_Pai:aDialogs := aSize( wObj_Pai:aDialogs, wxLen )
               
               If ValType(wObj_Pai)<>"U"
                  wObj_Pai:Update()
                  If Len(wObj_Pai:aPrompts) = 0
                     wObj_Pai:Hide()
                     wObj_Pai:Refresh()
                     wObj_Pai:Destroy() 
                     wObj_Pai:= nil
                     SysRefresh()
                  Else
                     If wValorNovo=0
                        wObj_Pai:SetOption(1)
                        wObj_Pai:Refresh()
                     EndIf
                  EndIf
               EndIf
            EndIf

         // wMatriz := fCase_Folder_BuscaFLD(_wObj_Nome)
         // For wx := 01 To Len(wMatriz)
         //    cSuper(wMatriz[wx],_wP_DESTROY,wValorNovo)
         // Next
         ElseIf wObjeto:classname="TGET"     .Or.;
                wObjeto:classname="TCOMBOBOX" .Or.;
                wObjeto:classname="CHECKBOX" .Or.;
                wObjeto:classname="TRADMENU"

            If wObjeto:classname="TRADMENU"
               For wx := 01 To Len(wObjeto:aItems)
                  wObjeto:aItems[wx]:End()
                  wObjeto:aItems[wx]:=nil
               Next
            Else
               wObjeto:bValid := nil
               wObjeto:End() 
               wObjeto:Destroy() 
               wObjeto:= nil
            EndIf
            wObjetoAux := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
            If ValType(wObjetoAux)="O"
               wObjetoAux:End()
               wObjetoAux := nil
            EndIf
         ElseIf wObj_Tp = "DAT"
            wColuna := 1 //wColuna := cNvl(__wMCase_Obj[wFRM][wPosObj,__witemcab],1)
            If wColuna>0 .And. wColuna<=Len(wObjeto:aColSizes)
               wObjeto:aColSizes[wColuna] := 0
               wObjeto:Refresh()
            EndIf
         Else
            If wObj_Tp = "GRD"
               If ValType(wObjeto:cMsg)="A"
                  For wx := 01 To Len(wObjeto:cMsg)
                     If ValType(wObjeto:cMsg[wx])="O"
                        wObjeto:cMsg[wx]:End()
                     EndIf
                  Next
               EndIf

               wObjetoAux := wobjeto:Cargo
               If ValType(wObjetoAux)="O"
                  wObjetoAux:End()
                  wObjetoAux:Destroy()
                  wObjetoAux:= nil
               EndIf
            ElseIf wObj_Tp = "BTN"
               wObjetoAux := wObjeto:oWnd
               If ValType(wObjetoAux)="O"
                  wObjetoAux:Refresh()
                  wObjetoAux:UpDate()
                  ReleaseCapture()
               EndIf
            EndIf

            wObjeto:End()
            wObjeto:Destroy()
            wObjeto:= nil
         EndIf

         If wObj_Tp <> "FRM"
            __wMCase_Obj[wFRM][wPosObj,4] := nil
            If wValorNovo=0
					 __fCase_Del_Obj(_wObj_Nome,wObj_Tp) //_fSuper_Del_Obj(_wObj_Nome,wObj_Tp)
            EndIf
         EndIf
		EndIf

      If _wPrp_Nome == _wP_OPTION
         If wObj_Tp = "FLD"
            wObjeto:SetOption(wValorNovo)
            //fCase_Folder_Prp_Action(_wObj_Nome,_wPrp_Nome,1)
         EndIf
      EndIf

      If _wPrp_Nome == _wP_LOSTFOCUS
      EndIf

      If _wPrp_Nome == _wP_GO_FIRST
         If wObj_Tp = "GRD"
            fCase_Grid_GoTop(_wObj_Nome,wObjeto)
         EndIf
      EndIf

      If _wPrp_Nome == _wP_GO_PREVIOUS
         If wObj_Tp = "GRD"
            wObjeto:GoUp()
         EndIf
      EndIf

      If _wPrp_Nome == _wP_GO_NEXT
         If wObj_Tp = "GRD"
            wObjeto:GoDown()
         EndIf
      EndIf

      If _wPrp_Nome == _wP_GO_LAST
         If wObj_Tp = "GRD"
            fCase_Grid_GoBottom(_wObj_Nome,wObjeto)
         EndIf
      EndIf

      If _wPrp_Nome == _wP_FOCUS
         wnID := GetCtrlID(GetFocus())
         
         If wObj_Tp = "FRM"
            For wx = 01 To Len(__wMCase_Obj[wFRM])
               If ValType(__wMCase_Obj[wFRM][wx,__wobjeto]) = "O"
                  If __wMCase_Obj[wFRM][wx,__wObj_Tp] = "RAD"
                     For wy=1 To Len(__wMCase_Obj[wFRM][wx,__wobjeto]:aItems)
                        If __wMCase_Obj[wFRM][wx,__wobjeto]:aItems[wy]:nID = wnID
                           wValorAtual := __wMCase_Obj[wFRM][wx,__wObj_Nome]
                           Exit
                        EndIf
                     Next
                  Else
                     If __wMCase_Obj[wFRM][wx,__wobjeto]:nID = wnID
                        wValorAtual := __wMCase_Obj[wFRM][wx,__wObj_Nome]
                        Exit
                     EndIf
                  EndIf
               EndIf
            Next
         Else
            wValorAtual := .F.
            If wObjeto:classname="TRADMENU"
               For wy=1 To Len(wObjeto:aItems)
                  If wObjeto:aItems[wy]:nID = wnID
                     wValorAtual := .T.
                     Exit
                  EndIf
               Next
            Else
               If wnID == wObjeto:nID 
                  wValorAtual := .T.
               EndIf
            EndIf
         EndIf
      EndIf

      If _wPrp_Nome == _wP_SETFOCUS
         wObjeto:SetFocus()
      EndIf
      If _wPrp_Nome == _wP_CLICK
         wObjeto:Click()
      EndIf
      If _wPrp_Nome == _wP_HIDE
         wObjeto:Hide()
         wObjetoAux := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
         If ValType(wObjetoAux)="O"
            wObjetoAux:Hide()
         EndIf
      EndIf
      If _wPrp_Nome == _wP_SHOW
         wObjeto:Show()
         wObjetoAux := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
         If ValType(wObjetoAux)="O"
            wObjetoAux:Show()
         EndIf
      EndIf
   Else
      //wPosPrp := _fCase_Scan_Prp(_wPrp_Nome)
      
      If ValType(wValorNovo)="U"
         wValorAtual := fObj_Prp_Vlr(_wObj_Nome,_wPrp_Nome) //__wMCase_Obj[wFRM][wPosObj,wPosPrp]
         If ValType(wValorAtual)="C"
            wValorAtual := rTrim(wValorAtual)
         EndIf
         Return wValorAtual
      Else
         wUpdate := .T.
      EndIf
   EndIf

   If wUpdate
      //__wMCase_Obj[wFRM][wPosObj,wPosPrp] := wValorNovo
      If ValType(wObjeto)<>"O"
         Return wValorNovo
      EndIf

      If _wPrp_Nome == _wP_TITLE
         wValorNovo := AllTrim(cNvl(wValorNovo,""))
         If wObj_Tp = "FLT"
            wObj_Pai := wObjeto:oWnd
            For wx := 01 To Len(wObj_Pai:aPrompts)
               If wObjeto:cVarName = wx
                  wObj_Pai:aPrompts[wx] := wValorNovo
               EndIf
            Next
            wObj_Pai:Refresh()
         ElseIf wObj_Tp="GET" .And. wObjeto:classname<>"CHECKBOX"
            If wObj_Tp="RAD"
               wObjeto := wObjeto:aItems[1]
            EndIf
            cSay_Title_Update(wPosObj,wValorNovo,wObjeto:nTop,wObjeto:nLeft,wFRM)
         ElseIf wObj_Tp = "DAT"
            wColuna := 1   //__wMCase_Obj[wFRM][wPosObj,__witemcab] //cSuper(_wObj_Nome,_wP_ITEM_CAB)
            wColuna := iif(cEmpty(wColuna),1,wColuna)
            wObjeto:aHeaders[wColuna] := wValorNovo
            wObjeto:Refresh()
         ElseIf wObj_Tp = "CAM"
         Else
            wObjeto:SetText(wValorNovo)
         
            If wObjeto:classname="CHECKBOX"
               If cEmpty(wValorNovo)
                  wLargura := 0
               Else
                  wLargura := (GetTextWidth( , wValorNovo ) / 10) + 2
               EndIf
               fObj_Prp_Update(_wObj_Nome,_wP_LARGURA,wLargura)
            ElseIf wObj_Tp = "BTN" .And. wObj_Tp = "FME"
               wObjeto:Refresh()
            ElseIf wObj_Tp = "SAY"
               wObjeto:SetSize(GetTextWidth(,wValorNovo)*0.780,,.T.)
            EndIf
         EndIf
      EndIf

      If _wPrp_Nome == _wP_REQUERIDO
         If wObj_Tp="GET" .Or. wObjeto:classname="TCOMBOBOX"
            wObjeto := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
         EndIf
         If AllTrim(wValorNovo)="S"
            wObjeto:SetFont(oFontBold)
         Else
            wObjeto:SetFont(oFont)
         EndIf
         wObjeto:Refresh()
      EndIf

      If _wPrp_Nome == _wP_LINHA
			wObjeto:Move( wValorNovo*18 , wObjeto:nLeft, wObjeto:nWidth, wObjeto:nHeight,.T.)
         wObjeto:Refresh()

         If wObj_Tp="GET"
            wObjetoAux := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
            wObjetoAux:Move( wObjeto:nTop-14 , wObjetoAux:nLeft, wObjetoAux:nWidth, wObjetoAux:nHeight,.T.)
         EndIf
      EndIf

      If _wPrp_Nome == _wP_COLUNA
			wObjeto:Move( wObjeto:nTop , wValorNovo*7 , wObjeto:nWidth, wObjeto:nHeight,.T.)
         wObjeto:Refresh()

         If wObj_Tp="GET"
            wObjetoAux := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
            wObjetoAux:Move( wObjetoAux:nTop , wObjeto:nLeft, wObjetoAux:nWidth, wObjetoAux:nHeight,.T.)
         EndIf
      EndIf

      If _wPrp_Nome == _wP_LARGURA
       //If wObj_Tp="GET" .Or. wObjeto:classname="TCOMBOBOX"
       //   wObjeto := __wMCase_Obj[wFRM][wPosObj,__wobjsay]
       //EndIf
			wObjeto:Move( wObjeto:nTop, wObjeto:nLeft,wValorNovo*7, wObjeto:nHeight,.T.)
         wObjeto:Refresh()
      EndIf

      If _wPrp_Nome == _wP_DOMINIO
         If wObjeto:classname="TCOMBOBOX"

            If ValType(wValorNovo)="C"
               wValorNovo := cDominio(wValorNovo)
            EndIf

            wObjeto:SetItems(wValorNovo)
            wxLen  := Len(wValorNovo)
            If wxLen < 6
               wAltura := wxLen * 26
            Else
               wAltura := 6 * 26
            EndIf
            wObjeto:SetSize(wObjeto:nWidth,wAltura,.T.)
            wObjeto:nAt := 1
            wObjeto:Select(1)
         EndIf
      EndIf

      If wObj_Tp = "FRM"
         If _wPrp_Nome == _wP_CENTER
            If wValorNovo = "N"
               wObjeto:Move( wObjeto:nTop, wObjeto:nLeft )
            Else
               WndCenter( wObjeto:hWnd )
            EndIf
         ElseIf _wPrp_Nome == _wP_ACAO
            wObjeto:aEvalWhen()
         EndIf
      ElseIf wObj_Tp = "BTN"
         If _wPrp_Nome == _wP_TOOLTIP
            wObjeto:cToolTip := wValorNovo
         EndIf
      ElseIf wObjeto:classname="TGET"
         If _wPrp_Nome == _wP_PICTURE
            wObjeto:cPicture     := wValorNovo
            wObjeto:oGet:Picture := wValorNovo
            wObjeto:Refresh()
         ElseIf _wPrp_Nome == _wP_CRIPTOGRAFADO
            wObjeto:lPassWord := iIf(wValorNovo="S",.T.,.F.)
            wObjeto:Refresh()
         EndIf
      ElseIf wObjeto:classname="TCOMBOBOX"
      ElseIf wObjeto:classname="CHECKBOX"
      ElseIf wObjeto:classname="TRADMENU"
      ElseIf wObj_Tp = "SAY"
      ElseIf wObj_Tp = "GRD"
         If _wPrp_Nome == _wP_ACAO .Or. _wPrp_Nome == _wP_ACTION
            If wValorNovo <= Len(wObjeto:cMsg)
               wValorAtual := Eval(wObjeto:cMsg[wValorNovo]:bAction)
            EndIf
         EndIf
      ElseIf wObj_Tp = "DAT"
      EndIf
   EndIf

Return wValorAtual
*Fim da Function cSuper(_wObj_Nome,_wPrp_Nome)

Function _fCase_Scan_Frm(_wObj_Nome)
********************************************************************************
*     Funcao para Verificar se o Objeto/Propriedadedo estão Cadastrados        *
********************************************************************************
Local wLenFrm,wFRM,wPosFRM,wx_frm,wObj_FRM

   wLenFrm := Len(__wMCase_FRM)

   If wLenFrm=1
      wFRM := 1
   Else
      wPosFRM := At(".",_wObj_Nome)
      If wPosFRM>0
         wObj_FRM := SubStr(_wObj_Nome,1,wPosFRM-1)
      Else
         wObj_FRM := _wObj_Nome
      EndIf

      For wx_frm := 01 To wLenFrm
         If __wMCase_FRM[wx_frm,1] == wObj_FRM
            wFRM := __wMCase_FRM[wx_frm,2]
            Exit
         EndIf
      Next
   EndIf

Return wFRM
*Fim da Function _fCase_Scan_Frm()

Function fCase_Grid_GoTop(_wObj_Nome,wObjeto)
********************************************************************************
*                  Funcao o cursor do Grid p/ a 1º posicao                     *
********************************************************************************

   If Len(cNvl(cSuper(_wObj_Nome,_wP_CONTEUDO),{}))=0
      Return Nil
   EndIf

   wObjeto:nAt        := 01
   wObjeto:lHitTop    := .T.
   wObjeto:lHitBottom := .F.
   wObjeto:nRowPos    := 01
   wObjeto:Refresh(.f.)
   If wObjeto:oVScroll <> nil
      wObjeto:VGoTop()
   EndIf

return nil
*fim da Function fCase_Grid_GoTop(wObjeto)

Function fCase_Grid_GoBottom(_wObj_Nome,wObjeto)
********************************************************************************
*                  Funcao o cursor do Grid p/ a última posicao                 *
********************************************************************************
Local wSkip,wLinha,wx,wMatriz

   wLinha  := wObjeto:nRowCount()
   wMatriz := cNvl(cSuper(_wObj_Nome,_wP_CONTEUDO),{})

   If Len(wMatriz)=0
      return nil
   endif

   if .Not. wObjeto:lHitBottom
      wObjeto:lHitBottom := .T.
      wObjeto:lHitTop    := .F.

      wObjeto:nAt := Len(wMatriz)
      wSkip := wObjeto:Skip(-(wLinha-1))
      wObjeto:nRowPos := 1-wSkip
      wObjeto:GetDC()
      For wx := 1 to -wSkip
          wObjeto:DrawLine(wx)
          wObjeto:Skip(1)
      Next
      wObjeto:DrawSelect()
      wObjeto:ReleaseDC()
      if wObjeto:oVScroll<>nil
         wObjeto:nLen := Len(wMatriz)
         if wObjeto:VGetMax() <> wObjeto:nLen
            wObjeto:VSetRange()
         endif
         wObjeto:VGoBottom()
      EndIf
   EndIf

return nil
*fim da Function fCase_Grid_GoBottom(_wObj_Nome,wObjeto)

//Function fGRD_GoUp(wGrid)
//********************************************************************************
//*          Funcao para movimentar o cursor do Grid uma posicao acima           *
//********************************************************************************
//Local wLinha,wx,wGridAtual
//
//   if Len(wM_Grid[__wc_FRM,wGrid])=0
//      return nil
//   endif
//
//   if .Not. wObjeto:lHitTop
//      wGridAtual := m->wM_Grid_Seq[wG_Atual]
//      m->wM_Grid_Seq[wG_Atual] := wGrid
//      oM_Brw[wGrid]:DrawLine()
//      if oM_Brw[wGrid]:Skip( -1 ) == -1
//         oM_Brw[wGrid]:lHitBottom := .f.
//         if oM_Brw[wGrid]:nRowPos > 1
//            oM_Brw[wGrid]:nRowPos --
//         else
//            WBrwScroll( oM_Brw[wGrid]:hWnd, -1, If( oM_Brw[wGrid]:oFont <> nil, oM_Brw[wGrid]:oFont:hFont, 0 ) )
//         endif
//      else
//         oM_Brw[wGrid]:lHitTop := .T.
//      endif
//      oM_Brw[wGrid]:DrawSelect()
//      if oM_Brw[wGrid]:oVScroll <> nil
//         oM_Brw[wGrid]:VGoUp()
//      endif
//      if oM_Brw[wGrid]:bChange <> nil
//         fCaseAtrib(wGrid)
//         fCaseRefresh(wGrid)
//      endif
//      m->wM_Grid_Seq[wG_Atual] := wGridAtual
//   endif
//
//return nil
//*fim da Function fGRD_GoUp(wGrid)
//
//Function fGRD_GoDown(wGrid)
//********************************************************************************
//*          Funcao para movimentar o cursor do Grid uma posicao abaixo          *
//********************************************************************************
//Local wLinha,wx,wGridAtual 
//
//   wLinha := oM_Brw[wGrid]:nRowCount()
//
//   if Len(wM_Grid[__wc_FRM,wGrid])=0
//      return nil
//   endif
//
//   if .Not. oM_Brw[wGrid]:lHitBottom
//      wGridAtual := m->wM_Grid_Seq[wG_Atual]
//      m->wM_Grid_Seq[wG_Atual] := wGrid
//      oM_Brw[wGrid]:DrawLine()
//      if oM_Brw[wGrid]:Skip( 1 ) == 1
//         oM_Brw[wGrid]:lHitTop = .F.
//         if oM_Brw[wGrid]:nRowPos < wLinha
//            oM_Brw[wGrid]:nRowPos++
//         else
//            WBrwScroll( oM_Brw[wGrid]:hWnd, 1, If( oM_Brw[wGrid]:oFont <> nil, oM_Brw[wGrid]:oFont:hFont, 0 ) )
//         endif
//      else
//         oM_Brw[wGrid]:lHitBottom := .T.
//      endif
//      oM_Brw[wGrid]:DrawSelect()
//      if oM_Brw[wGrid]:oVScroll <> nil
//         oM_Brw[wGrid]:VGoDown()
//      endif
//      if oM_Brw[wGrid]:bChange <> nil
//         fCaseAtrib(wGrid)
//         fCaseRefresh(wGrid)
//      endif
//      m->wM_Grid_Seq[wG_Atual] := wGridAtual 
//   endif
//
//return nil
//*fim da Function fGRD_GoDown(wGrid)

Function cSuper_Obj_Pai(wObj_Nome,wParm_Obj_Tp)
*************************************************************************************************
*                Busca Nivel Anterior do Objeto ( Objeto Pai )                                  *
*************************************************************************************************
Local wx,wMatriz,wObj_Pai,wPonto,wNivel,wBusca,wPos,wxObjPai,wObj_Tp,wPosObj,wPosPai,wObj_FLT
                                    	
   wObj_FLT  := Space(00)
   wObj_Pai  := Space(00)
   wObj_Nome := Lower(AllTrim(wObj_Nome))
   wMatriz   := cSuperEstru(wObj_Nome)
   wPonto    := wMatriz[1]
   wNivel    := wMatriz[2]

   If .Not.cEmpty(wParm_Obj_Tp)
     If wParm_Obj_Tp="FRM" .Or. wParm_Obj_Tp = "MNU"
        wObj_Pai := wNivel[1]
     ElseIf wParm_Obj_Tp="FLT" .Or. wParm_Obj_Tp="FLD"
        For wx := 01 To wPonto
           wObj_Pai := wObj_Pai + iIf(wx=1,"",".") + wNivel[wx]
         //If cSuper_Obj_Tp(wObj_Pai)="FLT"
         //   wObj_FLT := wObj_Pai
         //EndIf
        Next
        wObj_Pai := wObj_FLT

        If cEmpty(wObj_Pai) .And. wParm_Obj_Tp="FLD"
           wObj_Pai := wNivel[1]
        EndIf
     EndIf
   Else
      For wx := 01 To wPonto
         wObj_Pai := wObj_Pai + iIf(wx=1,"",".") + wNivel[wx]
      Next
   EndIf

Return wObj_Pai
*Fim da Function cSuper_Obj_Pai(wObj_Nome,wParm_Obj_Tp)

Function cSay_Title_New(wPosObj,_wObj_Tp,wTitle,wFrame,wLinha,wColuna,wAltura,wLargura,wObj_Ref,wPosicao_Texto,wFator,wRequerido,wRAD_Len,wVertical)
*******************************************************************************
*             funcao para montar a funcao cSay                                *
*******************************************************************************
Local oSay_Cabeca,wnLinha,wnColuna,wnAltura,wnLargura,wObjFont

   If wPosObj>0
      wFator    := cNvl(wFator,1)
      wTitle    := AllTrim(cNvl(wTitle,""))
      wnLinha   := cNvl(wLinha  ,0)
      wnColuna  := cNvl(wColuna ,0)
      wnAltura  := cNvl(wAltura ,0)
      wnLargura := cNvl(wLargura,0)

      If wFrame
         If _wObj_Tp="RAD"
            wnLinha   := wnLinha  - (08*wFator)
            wnColuna  := wnColuna - (01*wFator)

            wVertical := cNvl(wVertical,.T.)
            wRAD_Len  := cNvl(wRAD_Len,2)
            If wVertical
               wnAltura  := (wnAltura*wRAD_Len)+8
               wnLargura := wnLargura+(10*wFator)
            Else
               wnAltura  := 21*wFator
               wnLargura := (wnLargura*wRAD_Len)+(wRAD_Len*5*wFator)
            EndIf
         Else
            wnLinha   := wnLinha  - (08*wFator)
            wnColuna  := wnColuna - (04*wFator)
            wnAltura  := wnAltura + (11*wFator)
            wnLargura := wnLargura+ (07*wFator)
         EndIf

         If wRequerido
            wObjFont := oFontBold
         Else
            wObjFont := oFont
         EndIf
         oSay_Cabeca := TGroup():New(wnLinha,wnColuna,wnAltura+wnLinha,wnLargura+wnColuna,wTitle,wObj_Ref,,,.T.,,wObjFont,.T.)
      Else
         wnAltura  := 7*wFator
         wnLargura := GetTextWidth(,StrTran(wTitle," ",chr(255)))

         If wRequerido
            wObjFont  := oFontBold
            wnLargura := wnLargura*(0.50*wFator)
         Else
            wObjFont  := oFont
            wnLargura := wnLargura*(0.4*wFator)
         EndIf

         If wPosicao_Texto = 2      // Esquerda
             wnLinha  := wnLinha + (1.9*wFator)
             wnColuna := wnColuna - wnLargura
         Else                       // Superior
             wnLinha  := wnLinha - (7*wFator)
             wnColuna := wnColuna
         EndIf

         oSay_Cabeca := TSay():New( wnLinha, wnColuna , {|| wTitle}, wObj_Ref,,wObjFont,.F.      ,.F.    , .F.    , .T.    ,         ,         ,wnLargura,wnAltura,.F.     ,.T.     ,.F.     ,.F. ,.F. )
                        //     New( nRow   , nCol     , bText      , oWnd    ,,oFont   ,lCentered, lRight, lBorder, lPixels, nClrText, nClrBack,nWidth   ,nHeight , lDesign, lUpdate, lShaded,lBox, lRaised ) CONSTRUCTOR
      EndIf
      __wMCase_Obj[__wc_FRM][wPosObj,__wobjsay] := oSay_Cabeca
   EndIf

Return .t.
*fim da Function cSay_Title_New(wPosObj,wTitle,wLinha,wColuna,wObj_Ref,wPosicao_Texto)

Function cSay_Title_Update(_wObj_Nome,wTitle,wLinha,wColuna,wFRM)
*******************************************************************************
*             funcao para montar a funcao cSay                                *
*******************************************************************************
Local oSay_Cabeca,wLargura,wPosicao,wObjeto,wPosObj

   If ValType(_wObj_Nome)="N"
	   wPosObj := _wObj_Nome
	Else
		If cEmpty(wFRM)
	   	wFRM := _fCase_Scan_Frm(_wObj_Nome)
	   EndIf
	   wPosObj := cScan(__wMCase_Obj[wFRM],_wObj_Nome)
	EndIf
   oSay_Cabeca := __wMCase_Obj[wFRM][wPosObj,__wobjsay]

   If ValType(oSay_Cabeca)="O"
      If ValType(wTitle)="C"
         wTitle := AllTrim(wTitle)
         oSay_Cabeca:VarPut(wTitle)

         If __wMCase_Obj[wFRM][wPosObj,__wrequerido]="S"
            oSay_Cabeca:SetFont(oFontBold)
            wLargura := 1
         Else
            oSay_Cabeca:SetFont(oFont)
            wLargura := 0
         EndIf
         wLargura := GetTextWidth(,wTitle)*0.9
         oSay_Cabeca:SetSize( wLargura ,,.T.)
      Else
         wLargura := oSay_Cabeca:nWidth
      EndIf

   // wObjeto  := __wMCase_Obj[wFRM][wPosObj,__wobjeto]
   // wPosicao := __wMCase_Obj[wFRM][wPosObj,__wposicao]
   // If wPosicao=2
   //    wLinha  := iif(ValType(wLinha) ="N",wLinha+3.8      ,oSay_Cabeca:nTop )
   //    wColuna := iif(ValType(wColuna)="N",wColuna-wLargura,oSay_Cabeca:nLeft)
   // Else
   //    wLinha  := iif(ValType(wLinha) ="N",wLinha-14       ,oSay_Cabeca:nTop )
   //    wColuna := iif(ValType(wColuna)="N",wColuna         ,oSay_Cabeca:nLeft)
   // EndIf
   //
   // oSay_Cabeca:Move( wLinha , wColuna ,,,.T.)
      oSay_Cabeca:Refresh()
   EndIf

Return .t.
*fim da Function cSay_Title_Update(_wObj_Nome,wTitle,wLinha,wColuna)

Function cSay_Pixel(wTexto,wBold)
*******************************************************************************
*                 funcao para calular o Pixel de um texto                     *
*******************************************************************************
Local wpix := 0 , wx := 0 , wVar

   wTexto := cNvl(wTexto,"")
   For wx = 01 To Len(wTexto)       // calcula o comprimento do pixel
       wVar := SubStr(wTexto,wx,1)

      If     wvar $ "iIjl!.ºí"
         wpix := wpix + 1
      ElseIf wvar $ "trf= "
         wpix := wpix + 2
      ElseIf wvar $ "yzxqaLbcdZenopFghsTuJkv0123456789çãê ˆ%óáéú>" + CHR(63)
         wpix := wpix + 3
      ElseIf wvar $ "ODPYENCBAGQHRSUVKXÓÉ"
         wpix := wpix + 4
      ElseIf wvar $ "mw"
         wpix := wpix + 5
      ElseIf wvar $ "WM"
         wpix := wpix + 6
      Else
         wpix := wpix + 3
      EndIf
   Next                   
   wPix := (wPix+(len(wtexto)/2))

   If ValType(wBold)="L"
      If wBold
         wPix := wPix * 1.20  
      EndIf
   EndIf

Return wPix
*fim da Function cSay_Pixel()



*----------------------------Funções para Internet----------------------------------*
DLL32 FUNCTION InternetOpen( cApp as LPSTR, n1 AS DWORD, n2 AS LPSTR, n3 AS LPSTR,   n4 AS DWORD ) AS LONG PASCAL    FROM "InternetOpenA" LIB hWinINet
DLL32 FUNCTION InternetConnect( hSession AS LONG, cHost AS LPSTR, nPort AS LONG,      cUserName AS LPSTR, cPassword AS LPSTR, n4 AS LONG, n5 AS LONG,      n6 AS LONG ) AS LONG PASCAL       FROM "InternetConnectA" LIB hWinINet
DLL32 FUNCTION InternetCloseHandle( hSession AS LONG ) AS BOOL PASCAL LIB hWinINet
DLL32 FUNCTION FtpPutFile( hFTP AS LONG, cFileName AS LPSTR, cDestFile AS LPSTR,      n1 AS LONG, n2 AS LONG ) AS BOOL PASCAL  FROM "FtpPutFileA" LIB hWinINet
DLL32 FUNCTION FtpGetFile( hFTP AS LONG, cRemoteFile AS LPSTR, cLocalFile AS LPSTR,      lOverWrite AS LONG, n1 AS LONG, n2 AS LONG, n3 AS LONG )  AS BOOL PASCAL FROM "FtpGetFileA" LIB hWinINet
DLL32 FUNCTION FtpOpenFile( hFTP AS LONG, cRemoteFile AS LPSTR, n1 AS LONG,  n2 AS LONG, n3 AS LONG ) AS LONG PASCAL   FROM "FtpOpenFileA" LIB hWinINet
DLL32 FUNCTION InternetWriteFile( hFile AS LONG, cBuffer AS LPSTR, lSize AS LONG,        @nSize AS PTR ) AS BOOL PASCAL LIB hWinINet
DLL32 FUNCTION InternetReadFile( hFile AS LONG, cBuffer AS LPSTR, lSize AS LONG,        @nSize AS PTR ) AS BOOL PASCAL LIB hWinINet
DLL32 FUNCTION FtpCreateDirectory( hFTP AS LONG, cDirName AS LPSTR ) AS BOOL PASCAL     FROM "FtpCreateDirectoryA" LIB hWinINet
DLL32 FUNCTION FtpFindFirstFile( hFTP AS LONG, cMask AS LPSTR,       @cWin32DataInfo AS LPSTR, n1 AS LONG, n2 AS LONG )        AS LONG PASCAL FROM "FtpFindFirstFileA" LIB hWinINet
DLL32 FUNCTION FtpDeleteFile( hFTP AS LONG, cFileName AS LPSTR ) AS BOOL PASCAL     FROM "FtpDeleteFileA" LIB hWinINet
DLL32 FUNCTION InternetFindNextFile( hFTPDir AS LONG, @cWin32DataInfo AS LPSTR )    AS BOOL PASCAL FROM "InternetFindNextFileA" LIB hWinINet
DLL32 FUNCTION InternetSetFilePointer( hFile AS LONG, nPos AS LONG,        n1 AS LONG, nFrom AS LONG, n2 AS LONG )    AS BOOL PASCAL LIB hWinINet
DLL32 FUNCTION InternetAt(  Dwreserve AS LONG)       AS LONG PASCAL FROM "InternetAttemptConnect" LIB hWinINet
DLL32 FUNCTION InternetGo( Lpurl AS LPSTR, Hwnd AS LONG, dwreserve AS LONG)      AS BOOL PASCAL FROM "InternetGoOnline" LIB hWinInet
DLL32 FUNCTION InternetAu( Dwflags AS LONG, Hwnd AS WORD)       AS BOOL PASCAL FROM "InternetAutoDial" LIB hWinInet
DLL32 FUNCTION Internetdi( Hwnd AS LONG, Cconnect AS LPSTR, Dwflag AS LONG,       @Dwconnect AS PTR , Dwreserve AS LONG) AS DWORD       PASCAL FROM "InternetDial" LIB hWinInet
DLL32 FUNCTION Internetha( dwconnect AS LONG, Dwreserve AS LONG) AS DWORD       PASCAL FROM "InternetHangUp" LIB hWinInet
DLL32 FUNCTION Interautha( Dwreserve AS LONG) AS BOOL PASCAL FROM       "InternetAutodialHangup" LIB hWinInet
DLL32 FUNCTION InternetSt( @LpDwflags AS PTR, Dwreserve AS LONG) AS BOOL       PASCAL FROM "InternetGetConnectedState" LIB hWinInet
DLL32 Function IntRespinf( @Lpdwerror AS PTR,Lpzbuffer AS LPSTR, @Lplen AS PTR)       AS BOOL PASCAL FROM "InternetGetLastResponseInfoA"       LIB hWininet
Dll32 Function InternetOpenUrl(hInternetSession As 7, lpszUrl As 8, lpszHeaders As 8, dwHeadersLength As 7, dwFlags As 7, dwContext As 7) As 7 FROM "InternetOpenUrlA" PASCAL Lib hWinINet

/*
  InternetGetConnectedState

  If interState return .T. a connection is already establish 
  Lpwflags will give you this additionnal information
  lpdwFlags
  Address of an unsigned long integer variable where the connection description
  should be returned. This can be a combination of the following values:
  INTERNET_CONNECTION_LAN = 2
  Local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_MODEM = 1
  Local system uses a modem to connect to the Internet.
  INTERNET_CONNECTION_MODEM_BUSY = 8
  No longer used.
  INTERNET_CONNECTION_OFFLINE = 32
  Local system is in offline mode.
  INTERNET_CONNECTION_PROXY = 4
  Local system uses a proxy server to connect to the Internet.
  INTERNET_RAS_INSTALLED = 16 0X10
  Local system has RAS installed.
  INTERNET_CONNECTION_OFFLINE = 32        0x20
  INTERNET_CONNECTION_CONFIGURED = 64     0x40

  Minimum availability Internet Explorer 4.0
*/
*-----------------------------------------------------------------------------------*

