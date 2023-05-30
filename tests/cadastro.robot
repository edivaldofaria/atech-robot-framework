*** Settings ***
Resource    ../resources/base.robot


*** Test Cases ***
Deve cadastrar um novo usuario
    &{user}   Create Dictionary            name=Edivaldo Faria           email=edi@bol.com.br         password=123456

    Remove User By Email                   ${user}[email]


    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Boas vindas ao Mark85, o seu gerenciador de tarefas.    css=.notice p
     
Usuario duplicado
    [Tags]                                 dup

    &{user}   Create Dictionary            name=Jean Gray                email=fenix@xmen.com.br      password=123456

    Remove User By Email                   ${user}[email]

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Boas vindas ao Mark85, o seu gerenciador de tarefas.    css=.notice p
    Register user                          ${user}
    Notice Should be                       Oops! Já existe um cadastro com e-mail informado.       css=.notice p

Nome deve ser obrigatorio
    [Tags]    Nome em branco
    &{user}   Create Dictionary            name=${EMPTY}                email=tricolor@spfc.com.br      password=123456

    
    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Informe seu nome completo    css=.alert-error   
  
E-mail deve ser obrigatorio
    [Tags]    E-mail em branco
    &{user}   Create Dictionary            name=tricolor                email=${EMPTY}      password=123456

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Informe seu e-email    css=.alert-error   

Senha dever ser obrigatoria
    [Tags]    Senha em branco
    &{user}   Create Dictionary            name=tricolor                email=tricolor@spfc.com.br      password=${EMPTY}

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Informe uma senha com pelo menos 6 digitos    css=.alert-error   

Todos os campos de cadastro devem ser obrigatorios 
    [Tags]    Todos os campos em branco
    &{user}   Create Dictionary            name=${EMPTY}                email=${EMPTY}      password=${EMPTY}

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Informe seu nome completo                     xpath=//*[@id="root"]/div/div[2]/div/form/div[2]/div[2]/small
    Notice Should be                       Informe seu e-email                           xpath=//*[@id="root"]/div/div[2]/div/form/div[3]/div[2]/small
    Notice Should be                       Informe uma senha com pelo menos 6 digitos    xpath=//*[@id="root"]/div/div[2]/div/form/div[4]/div[2]/small
