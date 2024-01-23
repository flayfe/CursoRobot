*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${CADASTRO_CAMP_EMAIL}            id=email_create
${CADASTRO_BTN_CREATE_ACCOUNT}    id=SubmitCreate
${CADASTRO_ELEM_PAG_CADASTRO}     xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${CADASTRO_CAMP_GEN}              id=id_gender2
${CADASTRO_CAMP_NOME}             id=customer_firstname
${CADASTRO_NOME}                  May
${CADASTRO_CAMP_SOBRENOME}        id=customer_lastname
${CADASTRO_SOBRENOME}             Fernandes
${CADASTRO_CAMP_SENHA}            id=passwd  
${CADASTRO_SENHA}                 123456
${CADASTRO_CAMP_END}              id=address1
${CADASTRO_END}                   Rua Framework, Bairro Robot
${CADASTRO_CAMP_CIDADE}           id=city
${CADASTRO_CIDADE}                Floripa
${CADASTRO_CAMP_ESTADO}           id=id_state
${CADASTRO_ESTADO}                9
${CADASTRO_CAMP_CEP}              id=postcode
${CADASTRO_CEP}                   12345
${CADASTRO_CAMP_CEL}              id=phone_mobile
${CADASTRO_CEL}                   99988877
${CADASTRO_BTN_SUBMIT_ACCOUNT}    submitAccount
${CADASTRO_MENS_SUCESSO}          xpath=//*[@id="center_column"]/p
${CADASTRO_MENS_SUCESSO_TXT}      Welcome to your account. Here you can manage all of your personal information and orders.
${CADASTRO_NOME_CONF}             xpath=//*[@id="header"]/div[2]//div[1]/a/span

*** Keywords ***
#### Ações
Informar um e-mail válido
    Wait Until Element Is Visible   ${CADASTRO_CAMP_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${CADASTRO_CAMP_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button                    ${CADASTRO_BTN_CREATE_ACCOUNT}

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${CADASTRO_ELEM_PAG_CADASTRO}
    Click Element                   ${CADASTRO_CAMP_GEN}
    Input Text                      ${CADASTRO_CAMP_NOME}          ${CADASTRO_NOME}
    Input Text                      ${CADASTRO_CAMP_SOBRENOME}     ${CADASTRO_SOBRENOME}
    Input Text                      ${CADASTRO_CAMP_SENHA}         ${CADASTRO_SENHA}    
    Input Text                      ${CADASTRO_CAMP_END}           ${CADASTRO_END}  
    Input Text                      ${CADASTRO_CAMP_CIDADE}        ${CADASTRO_CIDADE}          
    Set Focus To Element            ${CADASTRO_CAMP_ESTADO}
    Wait Until Element Is Visible   ${CADASTRO_CAMP_ESTADO}
    Select From List By Index       ${CADASTRO_CAMP_ESTADO}        ${CADASTRO_ESTADO}
    Input Text                      ${CADASTRO_CAMP_CEP}           ${CADASTRO_CEP}
    Input Text                      ${CADASTRO_CAMP_CEL}           ${CADASTRO_CEL}

Submeter cadastro
    Click Button    submitAccount

### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${CADASTRO_MENS_SUCESSO}
    Element Text Should Be           ${CADASTRO_MENS_SUCESSO}
    ...                              ${CADASTRO_MENS_SUCESSO_TXT}
    Element Text Should Be           ${CADASTRO_NOME_CONF}            ${CADASTRO_NOME} ${CADASTRO_SOBRENOME}
