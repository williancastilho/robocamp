*** Settings ***
Documentation    Tudo começa aqui 

Resource      components/nav.resource    
Resource      components/toast.resource
Resource      pages/login.resource
Resource      pages/enroll.resource

*** Keywords ***
Do Login   
    [Arguments]    ${user}
    Go to Login Page
    Fill Credenciais    ${user}[email]    ${user}[pass]
    Submit Credenciais
    User Should Be Logged In    ${user}[name] 