*&---------------------------------------------------------------------*
*& Report ZALV_REPORT_SK16_INTERACTIVE
*&---------------------------------------------------------------------*
REPORT ZALV_REPORT_SK16_INTERACTIVE.

TABLES:VBAK,VBAP.

TYPES: BEGIN OF STR_VBAK,
         VBELN TYPE VBAK-VBELN,
         ERDAT TYPE VBAK-ERDAT,
         ERNAM TYPE VBAK-ERNAM,
         AUART TYPE VBAK-AUART,
         VKORG TYPE VBAK-VKORG,
       END OF STR_VBAK.

TYPES: BEGIN OF STR_VBAP,
         VBELN TYPE VBAP-VBELN,
         POSNR TYPE VBAP-POSNR,
         MATNR TYPE VBAP-MATNR,
         MATKL TYPE VBAP-MATKL,
         POSAR TYPE VBAP-POSAR,
       END OF STR_VBAP.


DATA:IT_VBAK  TYPE TABLE OF STR_VBAK,
     WA_VBAK  TYPE STR_VBAK,
     IT_VBAP  TYPE TABLE OF STR_VBAP,
     WA_VBAP  TYPE  STR_VBAP,
     IT_FCAT  TYPE SLIS_T_FIELDCAT_ALV,
     IT_FCAT1 TYPE SLIS_T_FIELDCAT_ALV,
     WA_FCAT  TYPE SLIS_FIELDCAT_ALV.

SELECT-OPTIONS:P_VBELN FOR VBAK-VBELN.

START-OF-SELECTION.
  SELECT
    VBELN
    ERDAT
    ERNAM
    AUART
    VKORG
    FROM VBAK INTO TABLE IT_VBAK
    WHERE VBELN IN P_VBELN.

  WA_FCAT-FIELDNAME =  'VBELN'.
  WA_FCAT-COL_POS =  '1'.
  WA_FCAT-SELTEXT_L =  'SALS ORDER'.
  APPEND WA_FCAT TO IT_FCAT.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  'ERDAT'.
  WA_FCAT-COL_POS =  '2'.
  WA_FCAT-SELTEXT_L =  'Date on Which Record Was Created'.
  APPEND WA_FCAT TO IT_FCAT.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  'ERNAM'.
  WA_FCAT-COL_POS =  '3'.
  WA_FCAT-SELTEXT_L =  'Name of Person Who Created the Object'.
  APPEND WA_FCAT TO IT_FCAT.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  'AUART'.
  WA_FCAT-COL_POS =  '4'.
  WA_FCAT-SELTEXT_L =  'Sales Document Type'.
  APPEND WA_FCAT TO IT_FCAT.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  'VKORG'.
  WA_FCAT-COL_POS =  '5'.
  WA_FCAT-SELTEXT_L =  'Sales Organization'.
  APPEND WA_FCAT TO IT_FCAT.
  CLEAR:WA_FCAT.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     I_BYPASSING_BUFFER      = ' '
*     I_BUFFER_ACTIVE         = ' '
      I_CALLBACK_PROGRAM      = SY-REPID
*     I_CALLBACK_PF_STATUS_SET          = ' '
      I_CALLBACK_USER_COMMAND = 'SALE_ITEM'
*     I_CALLBACK_TOP_OF_PAGE  = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME        =
*     I_BACKGROUND_ID         = ' '
      I_GRID_TITLE            = 'SALE HEADER DATA'
*     I_GRID_SETTINGS         =
*     IS_LAYOUT               =
      IT_FIELDCAT             = IT_FCAT
*     IT_EXCLUDING            =
*     IT_SPECIAL_GROUPS       =
*     IT_SORT                 =
*     IT_FILTER               =
*     IS_SEL_HIDE             =
*     I_DEFAULT               = 'X'
*     I_SAVE                  = ' '
*     IS_VARIANT              =
*     IT_EVENTS               =
*     IT_EVENT_EXIT           =
*     IS_PRINT                =
*     IS_REPREP_ID            =
*     I_SCREEN_START_COLUMN   = 0
*     I_SCREEN_START_LINE     = 0
*     I_SCREEN_END_COLUMN     = 0
*     I_SCREEN_END_LINE       = 0
*     I_HTML_HEIGHT_TOP       = 0
*     I_HTML_HEIGHT_END       = 0
*     IT_ALV_GRAPHICS         =
*     IT_HYPERLINK            =
*     IT_ADD_FIELDCAT         =
*     IT_EXCEPT_QINFO         =
*     IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER =
*     ES_EXIT_CAUSED_BY_USER  =
    TABLES
      T_OUTTAB                = IT_VBAK
* EXCEPTIONS
*     PROGRAM_ERROR           = 1
*     OTHERS                  = 2
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

FORM SALE_ITEM USING RCOMM TYPE SY-UCOMM SELFIELD TYPE SLIS_SELFIELD.

  READ TABLE IT_VBAP INTO WA_VBAP INDEX SELFIELD-TABINDEX.
  SELECT
    VBELN
    POSNR
    MATNR
    MATKL
    POSAR
    FROM VBAP INTO TABLE IT_VBAP
    WHERE VBELN = SELFIELD-VALUE.

  WA_FCAT-FIELDNAME =  'VBELN'.
  WA_FCAT-COL_POS =  '1'.
  WA_FCAT-SELTEXT_L =  'SALS ORDER'.
  APPEND WA_FCAT TO IT_FCAT1.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  'POSNR'.
  WA_FCAT-COL_POS =  '2'.
  WA_FCAT-SELTEXT_L =  'Sales Document Item'.
  APPEND WA_FCAT TO IT_FCAT1.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  ' MATNR'.
  WA_FCAT-COL_POS =  '3'.
  WA_FCAT-SELTEXT_L =  'Material Number'.
  APPEND WA_FCAT TO IT_FCAT1.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  '  MATKL'.
  WA_FCAT-COL_POS =  '4'.
  WA_FCAT-SELTEXT_L =  'Material Group'.
  APPEND WA_FCAT TO IT_FCAT1.
  CLEAR:WA_FCAT.

  WA_FCAT-FIELDNAME =  ' POSAR'.
  WA_FCAT-COL_POS =  '5'.
  WA_FCAT-SELTEXT_L =  'Item type'.
  APPEND WA_FCAT TO IT_FCAT1.
  CLEAR:WA_FCAT.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     I_BYPASSING_BUFFER = ' '
*     I_BUFFER_ACTIVE    = ' '
      I_CALLBACK_PROGRAM = 'SY-REPID'
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME   =
*     I_BACKGROUND_ID    = ' '
      I_GRID_TITLE       = 'SALE ITEM DATA'
*     I_GRID_SETTINGS    =
*     IS_LAYOUT          =
      IT_FIELDCAT        = IT_FCAT1
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
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      T_OUTTAB           = IT_VBAP
* EXCEPTIONS
*     PROGRAM_ERROR      = 1
*     OTHERS             = 2
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.



ENDFORM.