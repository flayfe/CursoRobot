*** Settings ***
Documentation       Tarefa utilizando a API do Github
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ./variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URL}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues

*** Test Cases ***
Exercício 01: Cria comentário em uma issue  
    Conectar na API do GitHub sem autenticação
    Criar um comentário na issue de número "12"

Exercício 02: Consulta comentário em uma issue
    Conectar na API do GitHub sem autenticação
    Pesquisar comentários e organizá-los por "updated" e na direção "desc" na issue "12"

*** Keywords ***
Conectar na API do GitHub sem autenticação
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Criar um comentário na issue de número "${ISSUE_NUMBER}"
    ${HEADERS}      Create Dictionary   Accept=application/vnd.github+json
    ${BODY}         Format String       ${CURDIR}/data/input/post_comment.json
    ${MY_COMMENT}   POST On Session     alias=mygithubAuth   url=${ISSUES_URL}/${ISSUE_NUMBER}/comments
    ...                                 data=${BODY}    headers=${HEADERS}
    Confere sucesso na requisição       ${MY_COMMENT}

Confere sucesso na requisição
    [Arguments]       ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...               msg=Erro na requisição! Verifique: ${RESPONSE}

Pesquisar comentários e organizá-los por "${SORT}" e na direção "${DIRECTION}" na issue "${ISSUE_NUMBER}"
    &{PARAMS}       Create Dictionary      sort=${SORT}      labels=${DIRECTION}
    ${MY_COMMENTS}  GET On Session         alias=mygithubAuth       url=${ISSUES_URL}/${ISSUE_NUMBER}/comments
    ...                                    params=${PARAMS}    expected_status=any
    Log             Lista de Comentários da Issues ${ISSUE_NUMBER}: ${MY_COMMENTS.json()}
    Confere sucesso na requisição          ${MY_COMMENTS}