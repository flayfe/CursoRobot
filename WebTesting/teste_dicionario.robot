*** Settings ***
Documentation   Tarefa de variável do tipo LISTAS

*** Variable ***
&{QTD_DIAS_MES}    Janeiro=31   Fevereiro=28 ou 29   Março=31   Abril=30   Maio=31   Junho=30   Julho=31   Agosto=31   Setembro=30   Outubro=31   Novembro=30   Dezembro=31

*** Test Cases ***
Caso de teste da terefa de variável do tipo Dicionário
    Uma keyword qualquer

*** Keywords ***
Uma keyword qualquer
    Log To Console   Janeiro tem: ${QTD_DIAS_MES.Janeiro} dias
    Log To Console   Fevereiro tem: ${QTD_DIAS_MES.Fevereiro} dias
    Log To Console   Março tem: ${QTD_DIAS_MES.Março} dias
    Log To Console   Abril tem: ${QTD_DIAS_MES.Abril} dias
    Log To Console   Maio tem: ${QTD_DIAS_MES.Maio} dias
    Log To Console   Junho tem: ${QTD_DIAS_MES.Junho} dias
    Log To Console   Julho tem: ${QTD_DIAS_MES.Julho} dias
    Log To Console   Agosto tem: ${QTD_DIAS_MES.Agosto} dias
    Log To Console   Setembro tem: ${QTD_DIAS_MES.Setembro} dias
    Log To Console   Outubro tem: ${QTD_DIAS_MES.Outubro} dias
    Log To Console   Novembro tem: ${QTD_DIAS_MES.Novembro} dias
    Log To Console   Dezembro tem: ${QTD_DIAS_MES.Dezembro} dias