*&---------------------------------------------------------------------*
*& Report ZPRACA_PEDAGIO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpraca_pedagio.

INCLUDE zpraca_pedagio_s01.

INCLUDE zpraca_pedagio_f01.

INITIALIZATION.

  p_data = sy-datum.
  p_hora = sy-uzeit.
  p_ope = sy-uname.
  p_FPagto = 'Dinheiro'.

  "Cria o botão "Relatório".
  MOVE 'Relatório' TO sscrfields-functxt_01.

  "Reporta erro caso haja campos vazios
  IF p_cat IS INITIAL.
    MESSAGE 'Preencher campo "Categoria do Veículo"' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ELSEIF p_eixo IS INITIAL.
    MESSAGE 'Preencher campo "Eixos Suspensos"' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ELSEIF p_catO IS INITIAL.
    MESSAGE 'Preencher campo "Categoria Original do Veículo"' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ELSEIF p_placa IS INITIAL.
    MESSAGE 'Preencher campo "Placa"' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

AT SELECTION-SCREEN.

  "Ativa a exibição do relatório.
  IF sy-ucomm = 'FC01'.
    SUBMIT zexibe_relatorio VIA SELECTION-SCREEN.
  ENDIF.

START-OF-SELECTION.

  PERFORM f_grava_informacoes.
  PERFORM f_exibe_recibo.
