*** Settings ***
Documentation    Suite de testes de autenticação

Library    Browser

*** Keywords ***

User Should Be Logged In
    [Arguments]    ${user_name} 
    ${logger_user}    Set Variable    css=aside strong
    Wait For Elements State    ${logger_user}    visible    5
    Get Text    ${logger_user}    equal    ${user_name}