*** Settings ***
Documentation        Tudo começa aqui

Library              Browser
Library              libs/mongo.py

Resource             helpers.robot
Resource             pages/signup.robot   
Resource             pages/login.robot   
Resource             pages/components/nav.robot
Resource             pages/components/notice.robot
Resource             pages/tasks.robot   

*** Keywords ***
Start Session
    New Browser                  browser=chromium              headless=False   
    New Page                     http://localhost:3000/


Login Session
   [Arguments]                   ${user}
   
   Start Session  
   Go to Login page
   Submit Login Form             ${user}
   User should be Logged in      ${user}[name]

   