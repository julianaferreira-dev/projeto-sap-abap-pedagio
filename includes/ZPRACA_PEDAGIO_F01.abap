*&---------------------------------------------------------------------*
*& Include          ZPRACA_PEDAGIO_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_grava_informacoes
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_grava_informacoes.

  SELECT SINGLE valor FROM ztarifas_ped
      INTO s_pedagio-valor
      WHERE categoria EQ p_cat.

  s_pedagio-data = sy-datum.
  s_pedagio-hora = sy-uzeit.
  s_pedagio-operador = p_ope.
  s_pedagio-categoria = p_cat.
  s_pedagio-f_pagamento = p_FPagto.
  s_pedagio-e_suspenso = p_eixo.
  s_pedagio-cat_orig = p_catO.
  s_pedagio-placa = p_placa.

  "Função para buscar a tarifa.
  CALL FUNCTION 'Z_BUSCA_TARIFA'
    EXPORTING
      iv_categoria = p_cat
    IMPORTING
      ev_valor     = s_pedagio-valor
                     EXCEPTIONS
                     categoria_invalida =1.

  "Função para gerar o número do recibo.
  CALL FUNCTION 'NUMBER_GET_NEXT'
    EXPORTING
      nr_range_nr             = '01'
      object                  = 'ZNRECIBO'
    IMPORTING
      number                  = s_pedagio-n_recibo
    EXCEPTIONS
      interval_not_found      = 1
      number_range_not_intern = 2
      object_not_found        = 3
      quantity_is_0           = 4
      quantity_is_not_1       = 5
      interval_overflow       = 6
      buffer_overflow         = 7
      OTHERS                  = 8.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  "Insere registro com sucesso.
  INSERT zrecibo_fiscal FROM s_pedagio.

  IF sy-subrc = 0.
    MESSAGE 'Registro inserido' TYPE 'S'.
  ELSE.
    MESSAGE 'Não Registrado' TYPE 'E'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form F_EXIBE_RECIBO
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM  f_exibe_recibo.

  WRITE: / 'DOC. FISCAL EQUIVALENTE IN1731/17 Art. 2',
         / 'AUTOPISTA LITORAL SUL S/A',
         / '09.313.969/0001-97',
         / 'SÃO JOSÉ DOS PINHAIS KM 635+300 VIA:19 N',
         / s_pedagio-data, s_pedagio-hora, 'Recibo:', s_pedagio-n_recibo,
         / 'Operador:', s_pedagio-operador, 'Cat.:', s_pedagio-categoria,
         / 'Valor Pago: R$', s_pedagio-valor LEFT-JUSTIFIED, 'F. Pgto:', to_mixed( s_pedagio-f_pagamento ),
         / 'E. SUSP:', s_pedagio-e_suspenso, '(LEI 13.103/15)', 'CAT. ORIG:', s_pedagio-cat_orig,
         / 'PLACA:', s_pedagio-placa,
         / 'Valor aprx. de trib. 18,24% (fonte: IBPT)',
         / 'Para incluir placa/CPF/CNPJ acesse até',
         / '7 dias https://dfe.arteris.com.br'.
ENDFORM.
