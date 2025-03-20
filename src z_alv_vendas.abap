REPORT z_alv_vendas.

TABLES: vbak, vbap.

DATA: gt_vendas TYPE TABLE OF vbap,
      gs_venda  TYPE vbap.

DATA: gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv.

DATA: gr_table TYPE REF TO cl_salv_table.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  " Seleciona os dados de vendas
  SELECT vbak~vbeln, vbap~posnr, vbap~matnr, vbap~kwmeng, vbap~netpr
    INTO TABLE gt_vendas
    FROM vbak
    INNER JOIN vbap ON vbak~vbeln = vbap~vbeln
    WHERE vbak~vbeln IN s_vbeln.

  IF gt_vendas IS INITIAL.
    MESSAGE 'Nenhuma venda encontrada' TYPE 'I'.
    RETURN.
  ENDIF.

  " Configura o ALV
  PERFORM build_field_catalog.
  PERFORM display_alv.

*&-----------------------
