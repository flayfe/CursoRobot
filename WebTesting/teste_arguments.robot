*** Settings ***
Documentation   Tarefa de keyword com argumentos e retorno
Library         String

*** Variable ***
&{PESSOA}       nome=Flavia    sobrenome=Santos    domininio_do_email=@testerobot.com

*** Test Cases ***
Caso de teste de exemplo
    Keyword que gera novo e-mail

*** Keywords ***
Keyword que gera novo e-mail
    ${EMAIL_GERADO}         Uma subkeyword com retorno   ${PESSOA.nome}   ${PESSOA.sobrenome}
    Log                     ${EMAIL_GERADO}

Uma subkeyword com retorno
    [Arguments]            ${NOME_USUARIO}   ${SOBRENOME_USUARIO}
    ${VARIAVEL_DO_EMAIL}    Generate Random String     8     [UPPER][LETTERS][NUMBERS]
    ${EMAIL_GERADO}        Set Variable    ${NOME_USUARIO}${SOBRENOME_USUARIO}${VARIAVEL_DO_EMAIL}${PESSOA.domininio_do_email}
    [Return]               ${EMAIL_GERADO}
    

