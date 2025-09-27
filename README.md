# Projeto SAP ABAP – Sistema de Gestão de Pedágio

Este projeto foi desenvolvido em ABAP como um sistema de controle de pedágio para registrar a passagem de veículos, gerar um recibo e criar um relatório ALV no SAP ERP com o histório de todos os veículos registrados.

## Funcionalidades

- Registro de passagens em pedágio, armazenando data, hora, categoria, placa, operador e forma de pagamento.
- Emissão de recibos fiscais e integração com tabela de tarifas de veículos.
- Consulta e exibição de dados em relatório ALV interativo.
- Estrutura modular, utilizando programas, includes e tabelas transparentes no SAP.

## Tecnologias

- SAP ERP
- ABAP
- ALV (ABAP List Viwer)
- Modularização de Código
- Tabelas Z (transparentes)

## Estrutura do Projeto

projeto-sap-abap-pedagio/  
├── src/  
│ ├── programas/  
│ │   ├── ZEXIBE_RELATORIO  
│ │   └── ZPRACA_PEDAGIO  
│ ├── includes/  
│ │   ├── ZPRACA_PEDAGIO_F01  
│ │   └── ZPRACA_PEDAGIO_S01  
│ ├── functions/  
│ │   └── ZBUSCA_TARIFA  
├── screenshots/  
│ ├── ZRECIBO_FISCAL.png  
│ ├── ZTARIFAS_PED.png  
│ └── RELATORIO_ALV.png  
├── README.md

## Estrutura das Tabelas

A estrutura das tabelas Z utilizadas pode ser vista abaixo:

### Tabela ZRECIBO_FISCAL

Tabela para armazenar informações de cada veículo que passou pelo pedágio.

![Tabela ZRECIBO_FISCAL](./screenshots/ZRECIBO_FISCAL.png)

### 🧾 Tabela ZTARIFAS_PED

Tabela com os valores aplicados por tipo de veículo.

![Tabela ZTARIFAS_PED](./screenshots/ZTARIFAS_PED.png)

## 📋 Relatório ALV

Relatório customizado exibido em ALV para armazenar o histórico de cada veículo registrado:

![Relatório ALV](./screenshots/relatorio_alv.png)

## Código-Fonte

Todo o código ABAP está na pasta `/src`, organizado por tipo:

- `/programas` – Programa principal com dados em entrada no sistema de pedágio e programa de exibição do relatório
- `/includes` – Includes com lógicas auxiliares do programa principal
- `/functions` – Funções auxiliares 

## Autor

Desenvolvido por [Juliana Ferreira] como projeto pessoal de estudo e prática com ABAP.
