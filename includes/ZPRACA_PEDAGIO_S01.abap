*&---------------------------------------------------------------------*
*& Include          ZPRACA_PEDAGIO_S01
*&---------------------------------------------------------------------*

TABLES: sscrfields.

DATA: s_pedagio TYPE zrecibo_fiscal,
      t_tarifas TYPE TABLE OF ztarifas_ped.

SELECTION-SCREEN BEGIN OF BLOCK b1.

  PARAMETERS:
    p_data   TYPE zrecibo_fiscal-data,
    p_hora   TYPE zrecibo_fiscal-hora,
    p_ope    TYPE zrecibo_fiscal-operador,
    p_cat    TYPE zrecibo_fiscal-categoria,
    p_FPagto TYPE zrecibo_fiscal-f_pagamento,
    p_eixo   TYPE zrecibo_fiscal-e_suspenso,
    p_CatO   TYPE zrecibo_fiscal-cat_orig,
    p_placa  TYPE zrecibo_fiscal-placa.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN FUNCTION KEY 1.
