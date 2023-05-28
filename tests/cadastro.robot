*** Settings ***
Resource    ../resources/base.robot


*** Test Cases ***
Deve cadastrar um novo usuario
    &{user}   Create Dictionary            name=Edivaldo Faria           email=edi@bol.com.br         password=123456

    Remove User By Email                   ${user}[email]


    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Boas vindas ao Mark85, o seu gerenciador de tarefas.
     
Usuario duplicado
    [Tags]                                 dup

    &{user}   Create Dictionary            name=Jean Gray                email=fenix@xmen.com.br      password=123456

    Remove User By Email                   ${user}[email]

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                       Boas vindas ao Mark85, o seu gerenciador de tarefas.
    Register user                          ${user}
    Notice Should be                       Oops! Já existe um cadastro com e-mail informado.

# Nome deve ser obrigatorio

# Email deve ser obrigatorio

# Senha dever ser obrigatoria

