*** Settings ***
Documentation    Tudo começa aqui 

Resource      components/nav.resource    
Resource      components/toast.resource
Resource      pages/login.resource
Resource      pages/enroll.resource
Resource      database.resource
Library       JSONLibrary

*** Keywords ***
Do Login   
    [Arguments]    ${user}
    Go to Login Page
    Fill Credenciais    ${user}[email]    ${user}[pass]
    Submit Credenciais
    User Should Be Logged In    ${user}[name] 

Get Fixture
    [Arguments]   ${fixture_file}

    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_file}.json    encoding=UTF-8
    [return]    ${fixture}