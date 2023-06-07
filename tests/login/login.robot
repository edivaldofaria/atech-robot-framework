*** Settings ***
Documentation           Cenários de testes de Login

Resource                ../../resources/base.robot
Resource                ../../resources/pages/login.robot
*** Test Cases ***
Deve poder logar com sucesso
   [Tags]     smoke

   &{user}    Create Dictionary    name=Steve Woz    email=woz@apple.com   password=pwd123
   
   
   Create new user                 ${user}

   Start Session
   Go to Login page
   Submit Login Form               ${user}

   User should be Logged in        ${user}[name]

Não deve Logar com senha incorreta
   &{user1}    Create Dictionary    name=Steve Rogers    email=steve@marvel.com   password=pwd123
   Create new user                 ${user1}
   &{user2}    Create Dictionary    name=Steve Rogers    email=steve@marvel.com   password=abc123
   
   
   Start Session
   Go to Login page
   Submit Login Form               ${user2}

   Notice Should be                css=.notice p            Ocorreu um erro ao fazer login, verifique suas credenciais.