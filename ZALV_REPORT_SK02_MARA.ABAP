*&---------------------------------------------------------------------*
*& Report ZALV_REPORT_MARA_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZALV_REPORT_MARA_1.

TABLES: MARA.
* WAY:1
*TYPES: BEGIN OF SK_MARA,
*         MATNR TYPE MARA-MATNR,
*         ERNAM TYPE MARA-ERNAM,
*         MTART TYPE MARA-MTART,
*         MBRSH TYPE MARA-MBRSH,
*         MATKL TYPE MARA-MATKL,
*         MEINS TYPE MARA-MEINS,
*       END OF SK_MARA.

*DATA: IT_MARA TYPE TABLE OF SK_MARA,
*      WA_MARA TYPE SK_MARA,
*      IT_FCAT TYPE SLIS_T_FIELDCAT_ALV,
*      WA_FCAT TYPE SLIS_FIELDCAT_ALV.   "yat T replace kela ki tabel che structure create hot & WA bcz IT_fact direct data send nahi karu shkat"


*WAY:2
DATA:IT_MARA TYPE TABLE OF ZALV_STR1,
     WA_MARA TYPE ZALV_STR1,
     IT_FCAT TYPE SLIS_T_FIELDCAT_ALV,
     WA_FCAT TYPE SLIS_FIELDCAT_ALV.

SELECT-OPTIONS: P_MATNR FOR MARA-MATNR.

START-OF-SELECTION.
  SELECT
    MATNR
    ERNAM
    MTART
    MBRSH
    MATKL
    MEINS
  FROM MARA INTO TABLE IT_MARA    " NOT Undstud"
  WHERE MATNR IN P_MATNR.         " NOT Undstud"

*WAY:1
*    WA_FCAT-COL_POS = '1'.
*    WA_FCAT-SELTEXT_L = 'MATERIAL NO'.
*    WA_FCAT-FIELDNAME = 'MATNR'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.
*
*     WA_FCAT-COL_POS = '6'.
*    WA_FCAT-SELTEXT_L = 'USER NO'.
*    WA_FCAT-FIELDNAME = 'ERNAM'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.
*
*     WA_FCAT-COL_POS = '2'.
*    WA_FCAT-SELTEXT_L = 'MATERIAL TYPE'.
*    WA_FCAT-FIELDNAME = 'MTART'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.
*
*     WA_FCAT-COL_POS = '3'.
*    WA_FCAT-SELTEXT_L = 'IND SECTOR'.
*    WA_FCAT-FIELDNAME = 'MBRSH'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.
*
*     WA_FCAT-COL_POS = '4'.
*    WA_FCAT-SELTEXT_L = 'MATERIAL GURP'.
*    WA_FCAT-FIELDNAME = 'MATKL'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.
*
*     WA_FCAT-COL_POS = '5'.
*    WA_FCAT-SELTEXT_L = 'UNIT'.
*    WA_FCAT-FIELDNAME = 'MEINS'.
*    APPEND: WA_FCAT TO IT_FCAT.
*    CLEAR: WA_FCAT.

*WAY2:
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     I_BYPASSING_BUFFER = ' '
*     I_BUFFER_ACTIVE    = ' '
      I_CALLBACK_PROGRAM = SY-REPID  " yat aapn program name or system viralbe input gheu shkto"
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
      I_STRUCTURE_NAME   = 'ZALV_STR1'
*     I_BACKGROUND_ID    = ' '
*     I_GRID_TITLE       =
*     I_GRID_SETTINGS    =
*     IS_LAYOUT          =
      IT_FIELDCAT        = IT_FCAT
*     IT_EXCLUDING       =
*     IT_SPECIAL_GROUPS  =
*     IT_SORT            =
*     IT_FILTER          =
*     IS_SEL_HIDE        =
*     I_DEFAULT          = 'X'
*     I_SAVE             = ' '
*     IS_VARIANT         =
*     IT_EVENTS          =
*     IT_EVENT_EXIT      =
*     IS_PRINT           =
*     IS_REPREP_ID       =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE  = 0
*     I_HTML_HEIGHT_TOP  = 0
*     I_HTML_HEIGHT_END  = 0
*     IT_ALV_GRAPHICS    =
*     IT_HYPERLINK       =
*     IT_ADD_FIELDCAT    =
*     IT_EXCEPT_QINFO    =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      T_OUTTAB           = IT_MARA
*     EXCEPTIONS
*     PROGRAM_ERROR      = 1
*     OTHERS             = 2
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.