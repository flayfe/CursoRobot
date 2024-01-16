*** Settings ***
Documentation   Tarefa de For e If
Library    SeleniumLibrary

*** Variables ***
@{NUMEROS}   1    2    3    4    5    6    7    8    9    10

*** Test Case ***
Teste de FOR com IF
    Imprimindo valores da lista

*** Keywords ***
Imprimindo valores da lista
    Log To Console    ${\n}
    FOR  ${NUMEROS}   IN  @{NUMEROS}
        IF        ${NUMEROS} == 5
            Log To Console    Eu sou o número 5!
        ELSE IF   ${NUMEROS} == 10
            Log To Console    Eu sou o número 10!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        No Operation
        END
    END