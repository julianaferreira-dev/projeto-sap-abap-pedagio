FUNCTION Z_BUSCA_TARIFA.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(IV_CATEGORIA) TYPE  ZVEICULO_CATEGORIA
*"  EXPORTING
*"     REFERENCE(EV_VALOR) TYPE  Z_VALOR_TARIFA
*"  EXCEPTIONS
*"      CATEGORIA_INVALIDA
*"----------------------------------------------------------------------

SELECT SINGLE valor FROM ztarifas_ped
  INTO ev_valor
  WHERE categoria = iv_categoria.

IF sy-subrc <> 0.
  RAISE categoria_invalida.
ENDIF.

ENDFUNCTION.
