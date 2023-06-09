*** Settings ***
Documentation            Página de gestão de tarefas
Library                  Browser


*** Keywords ***
Go to task form   
  Click                      css=a[href$=create]
  
  Wait For Elements State    css=h1 >> text=Cadastrar Tarefa       visible        5


Submit task form 
  [Arguments]        ${task}

  Fill Text          input[placeholder$=tarefa]     ${task}[name]


  FOR    ${tag}    IN    @{task}[tags]
     Fill Text          input[placeholder$=tags]      ${tag}
     Keyboard Key        press    Enter 
      
  END

  Click    css=button[type=submit] >> text=Cadastrar            

Task should be registered
    [Arguments]    ${task_name}

    Wait For Elements State     css=.task-item >> text=${task_name}        visible        5


Task should not exist
    [Arguments]    ${task_name}

   Wait For Elements State     css=.task-item >> text=${task_name}        detached        5

Task should be completed
    [Arguments]    ${task_name}
  
    Wait For Elements State     xpath=//button[@class="item-toggle-selected"]      visible           5
    Wait For Elements State     xpath=//strong[text()="${task_name}"]              visible           5
 
Task Completed
   [Arguments]     ${task_name}
   
   Click           xpath=//strong[text()="${task_name}"]/../button[@class="item-toggle"]   
   
Remove task
   [Arguments]     ${task_name}
   
   Click           xpath=//strong[text()="${task_name}"]/../button[@class="task-remove"]    