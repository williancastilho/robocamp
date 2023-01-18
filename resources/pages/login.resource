*** Settings ***
Library    Browser


*** Keywords ***

Fill Credenciais
    [Arguments]    ${email}    ${pass}
    Fill Text    css=input[name=email]    ${email} 
    Fill Text    css=input[name=password]    ${pass}    

Submit Credenciais
    Click    css=button >> text=Entrar no sistema

Go to Login Page
    New Browser    headless=False    browser=chromium
    New Page    http://localhost:3000 

Field Type Should Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]    type    equal    email

Alert Text Should Be
    [Arguments]    ${field}    ${expected_text}
    #Wait For Elements State    css=span >> text=${expected_text}    visible    5
    Get Text    xpath=//input[@type="${field}"]/..//span    equal    ${expected_text}