REPORT z_alv_clientes.

*-------------------------------------------------------------*
* Declaração da tela de seleção                               *
*-------------------------------------------------------------*
* Define um parâmetro obrigatório para selecionar um cliente *
PARAMETERS: p_kunnr TYPE kunnr OBLIGATORY.

* Define um intervalo de seleção para a data do documento de venda *
SELECT-OPTIONS: s_date FOR sy-datum.

*-------------------------------------------------------------*
* Declaração da estrutura e tabela interna para armazenar os dados *
*-------------------------------------------------------------*
TYPES: BEGIN OF ty_sales,     " Estrutura para armazenar os dados das vendas
          vbeln TYPE vbak-vbeln,  " Número do documento de venda
          kunnr TYPE vbak-kunnr,  " Código do cliente
          erdat TYPE vbak-erdat,  " Data de criação do documento
       END OF ty_sales.

* Declaração da tabela interna e work area baseada na estrutura definida *
DATA: lt_sales TYPE TABLE OF ty_sales,  " Tabela interna para armazenar os dados
      wa_sales TYPE ty_sales.           " Work area para manipulação dos dados

*-------------------------------------------------------------*
* Seleção de dados na tabela VBAK (documentos de vendas)      *
*-------------------------------------------------------------*
SELECT vbeln, kunnr, erdat
  FROM vbak
  INTO TABLE lt_sales
  WHERE kunnr = p_kunnr                    " Filtra pelo código do cliente informado
    AND erdat BETWEEN s_date-low AND s_date-high. " Filtra pelo intervalo de datas informado

*-------------------------------------------------------------*
* Exibição dos dados no ALV                                   *
*-------------------------------------------------------------*
* Declaração do objeto para exibição do ALV *
DATA: gr_table TYPE REF TO cl_salv_table.

TRY.
    " Criação do ALV a partir da tabela interna
    cl_salv_table=>factory( IMPORTING r_salv_table = gr_table
                            CHANGING  t_table      = lt_sales ).

    " Exibir os dados no ALV
    gr_table->display( ).

  CATCH cx_salv_msg INTO DATA(lx_msg).
    " Tratamento de erro caso ocorra uma exceção ao gerar o ALV
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.
