*** Settings ***
Documentation        Barra superior de nabvegação

Library    Browser
Library    String

*** Keywords ***
User should be Logged in  
  [Arguments]         ${name}

  @{splited_name}=           Split String        ${name}  
  ${element}                 Set Variable        css=header small
  Wait For Elements State    ${element}          visible              5 

  Get Text                   ${element}          equal                Olá, ${splited_name}[0]             

