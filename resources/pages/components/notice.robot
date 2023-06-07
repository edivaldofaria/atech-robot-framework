*** Settings ***
Documentation           Componente de notificação
Library            Browser

*** Keywords ***

Notice Should be 
    [Arguments]     ${notice}     ${message}   
        
    Wait For Elements State                ${notice}                     visible                      5
    Get Text                               ${notice}                     equal                        ${message}        