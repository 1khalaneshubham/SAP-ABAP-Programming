*&---------------------------------------------------------------------*
*& Report ZALV_REPORT_MARA_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZALV_REPORT_MARA_2.

TABLES: MARA.

TYPES: BEGIN OF SD_MARA,
         MATNR TYPE MARA-MATNR,
         ERNAM TYPE MARA-ERNAM,
         MTART TYPE MARA-MTART,
         MBRSH TYPE MARA-MBRSH,
         MATKL TYPE MARA-MATKL,
         MEINS TYPE MARA-MEINS,
       END OF SD_MARA.

DATA: IT_MARA TYPE TABLE OF SD_MARA,
      WA_MARA TYPE SD_MARA,
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
FROM MARA INTO TABLE IT_MARA
WHERE MATNR IN P_MATNR.

  WA_FCAT-COL_POS = '1'.
  WA_FCAT-SELTEXT_L = 'Material Number'.
  WA_FCAT-FIELDNAME = 'MATNR'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.

  WA_FCAT-COL_POS = '2'.
  WA_FCAT-SELTEXT_L = 'Name of Person Who Created the Object'.
  WA_FCAT-FIELDNAME = 'ERNAM'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.

  WA_FCAT-COL_POS = '3'.
  WA_FCAT-SELTEXT_L = 'Material Group'.
  WA_FCAT-FIELDNAME = 'MATKL'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.

  WA_FCAT-COL_POS = '4'.
  WA_FCAT-SELTEXT_L = 'Material Type'.
  WA_FCAT-FIELDNAME = 'MTART'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.

  WA_FCAT-COL_POS = '5'.
  WA_FCAT-SELTEXT_L = 'Industry Sector'.
  WA_FCAT-FIELDNAME = 'MBRSH'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.

  WA_FCAT-COL_POS = '6'.
  WA_FCAT-SELTEXT_L = 'Base Unit of Measure'.
  WA_FCAT-FIELDNAME = 'MEINS'.
  APPEND: WA_FCAT TO IT_FCAT.
  CLEAR: WA_FCAT.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     I_BYPASSING_BUFFER = ' '
*     I_BUFFER_ACTIVE    = ' '
      I_CALLBACK_PROGRAM = 'ZALV_REPORT_MARA_2'
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME   =
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
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      T_OUTTAB           = IT_MARA
* EXCEPTIONS
*     PROGRAM_ERROR      = 1
*     OTHERS             = 2
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.