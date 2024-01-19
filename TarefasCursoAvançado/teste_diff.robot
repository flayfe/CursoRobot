*** Settings ***
Documentation   Tarefa utilizando a library DiffLibrary
Library         DiffLibrary
Library         OperatingSystem

*** Test Cases ***
Cenário 01 - Comparar se há diferença entre dois arquivos
    Cria dois arquivos com conteúdos diferentes
    Compara os dois arquivos criados com conteúdos diferentes
    Deleta os arquivos criados

*** Keywords ***
Cria dois arquivos com conteúdos diferentes
    Create File    ARQUIVO 01.docx    CONTEUDO DO ARQUIVO.
    Create File    ARQUIVO 02.docx    CONTEUDO DO ARQUIVO.\n Este é diferente.

Compara os dois arquivos criados com conteúdos diferentes
    ${RETORNO}    Run Keyword And Warn On Failure   Diff Files
    ...    file1=ARQUIVO 01.docx
    ...    file2=ARQUIVO 02.docx
    Log To Console    ${RETORNO}
    
Deleta os arquivos criados
    Remove File    ARQUIVO 01.docx
    Remove File    ARQUIVO 02.docx
