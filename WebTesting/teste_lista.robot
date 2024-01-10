*** Settings ***
Documentation   Tarefa de variável do tipo LISTAS

*** Variable ***
@{MESES}    Janeiro   Fevereiro   Março   Abril   Maio   Junho   Julho   Agosto   Setembro   Outubro   Novembro   Dezembro

*** Test Cases ***
Caso de teste da terefa de variável do tipo lista
    Uma keyword qualquer

*** Keywords ***
Uma keyword qualquer
    Log To Console   O primeiro mês do ano é: ${MESES[0]}. O segundo mês do ano é: ${MESES[1]}. O terceiro mês do ano é: ${MESES[2]}. O quarto mês do ano é: ${MESES[3]}. O quinto mês do ano é: ${MESES[4]}. O sexto mês do ano é: ${MESES[5]}. O sétimo mês do ano é: ${MESES[6]}. O oitavo mês do ano é: ${MESES[7]}. O nono mês do ano é: ${MESES[8]}. O décimo mês do ano é: ${MESES[9]}. O décimo primeiro mês do ano é: ${MESES[10]}. O décimo segundo mês do ano é: ${MESES[11]}.