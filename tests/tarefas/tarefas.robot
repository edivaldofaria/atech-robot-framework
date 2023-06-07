*** Settings ***
Documentation            Testes de cadastro de tarefas

Resource                 ../../resources/base.robot

Library                   JSONLibrary

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
   #${data}                Load Json From File          resources/fixtures/tasks.json     encoding=utf-8
   #${data}    Get fixture   tasks    create 

#    Create new user        ${data}[user]
#    Login Session          ${data}[user]

#    Go to task form   
#    Submit task form                ${data}[task]
#    Task should be registered       ${data}[task][name]
    
   ${data}                Load Json From File          resources/fixtures/tasks.json     encoding=utf-8
   Create new user        ${data}[create][user]
   Login Session          ${data}[create][user]

   Go to task form   
   Submit task form                ${data}[create][task]
   Task should be registered       ${data}[create][task][name]
 

Deve remover uma tarefa indesejada
   
   # ${data}    Get fixture   tasks    remove 

   # Create new user        ${data}[user]
   # Login Session          ${data}[user]

   # Go to task form   
   # Submit task form                ${data}[task]
   # Task should be registered       ${data}[task][name]
   # Remove task                     ${data}[task][name]
   # Task should not exist           ${data}[task][name]
   
   ${data}                Load Json From File          resources/fixtures/tasks.json     encoding=utf-8
   Create new user        ${data}[remove][user]
   Login Session          ${data}[remove][user]

   Go to task form   
   Submit task form                ${data}[remove][task]
   Task should be registered       ${data}[remove][task][name]
   Remove task                     ${data}[remove][task][name]
   Task should not exist           ${data}[remove][task][name]
   #Sleep   10s
 

Deve marcar a tarefa como concluida
   ${data}                Load Json From File          resources/fixtures/tasks.json     encoding=utf-8
   Create new user        ${data}[completed][user]
   Login Session          ${data}[completed][user]

   Go to task form   
   Submit task form                ${data}[completed][task]
   Task should be registered       ${data}[completed][task][name]
   Task Completed                  ${data}[completed][task][name]
   Task should be completed        ${data}[completed][task][name]
   #Sleep   10s  
