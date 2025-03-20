REPORT z_alv_clientes.

* Declaração da tela de seleção
PARAMETERS: p_kunnr TYPE kunnr OBLIGATORY.
SELECT-OPTIONS: s_date FOR sy-datum.

* Declaração da estrutura e tabela interna para armazenar os dados
TYPES: BEGIN OF ty_sales,
          vbeln TYPE vbak-vbeln,
          kunnr TYPE vbak-kunnr,
          erdat TYPE vbak-erdat,
       END OF ty_sales.

DATA: lt_sales TYPE TABLE OF ty_sales,
      wa_sales TYPE ty_sales.

* Seleção de dados na tabela VBAK (documentos de vendas)
SELECT vbeln, kunnr, erdat
  FROM vbak
  INTO TABLE lt_sales
  WHERE kunnr = p_kunnr
    AND erdat BETWEEN s_date-low AND s_date-high.

* Exibição dos dados no ALV
DATA: gr_table TYPE REF TO cl_salv_table.
TRY.
    cl_salv_table=>factory( IMPORTING r_salv_table = gr_table
                            CHANGING  t_table      = lt_sales ).
    gr_table->display( ).
  CATCH cx_salv_msg INTO DATA(lx_msg).
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.
