*** Settings ***
Resource         ../../resources/base.robot 

*** Test Cases ***
Deve cadastrar um novo usuario
    &{user}   Create Dictionary            name=Edivaldo Faria           email=edi@bol.com.br           password=123456

    Remove User By Email                   ${user}[email]

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                css=.notice p                Boas vindas ao Mark85, o seu gerenciador de tarefas.        
     
Usuario duplicado
    [Tags]                                 dup

    &{user}   Create Dictionary            name=Jean Gray                email=fenix@xmen.com.br        password=123456

    Create new user                        ${user}

    Start Session
    Go to signup
    Register user                          ${user}
    Notice Should be                css=.notice p            Oops! Já existe um cadastro com e-mail informado.


Nome deve ser obrigatorio
    [Tags]    Nome em branco
    &{user}   Create Dictionary            name=${EMPTY}                email=tricolor@spfc.com.br      password=123456
    
    Start Session
    Go to signup
    Register user                          ${user}
    Alert Should be                        css=.alert-error       Informe seu nome completo
  
E-mail deve ser obrigatorio
    [Tags]    E-mail em branco
    &{user}   Create Dictionary            name=tricolor                email=${EMPTY}                  password=123456

    Start Session
    Go to signup
    Register user                          ${user}
    Alert Should be                        css=.alert-error             Informe seu e-email

Senha dever ser obrigatoria
    [Tags]    Senha em branco
    &{user}   Create Dictionary            name=tricolor                email=tricolor@spfc.com.br      password=${EMPTY}

    Start Session
    Go to signup
    Register user                          ${user}
    Alert Should be                        css=.alert-error             Informe uma senha com pelo menos 6 digitos

Todos os campos de cadastro devem ser obrigatorios 
    [Tags]    Todos os campos em branco
    &{user}   Create Dictionary            name=${EMPTY}               email=${EMPTY}                   password=${EMPTY}

    Start Session
    Go to signup
    Register user                          ${user}
    Alert Should be                        xpath=//*[@id="root"]/div/div[2]/div/form/div[2]/div[2]/small             Informe seu nome completo
    Alert Should be                        xpath=//*[@id="root"]/div/div[2]/div/form/div[3]/div[2]/small             Informe seu e-email
    Alert Should be                        xpath=//*[@id="root"]/div/div[2]/div/form/div[4]/div[2]/small             Informe uma senha com pelo menos 6 digitos     

