*** Settings ***
Documentation    Suite de testes de autenticação    

Resource    ../resources/base.resource


*** Test Cases ***
Login do Administrador
    Go to Login Page
    Fill Credenciais    admin@smartbit.com    qacademy
    #Click    xpath=//button[text()="Entrar no sistema"]
    #Click    text=Entrar no sistema
    Submit Credenciais
    User Should Be Logged In    Admin 
    Sleep    10

Email não cadastrado
    Go to Login Page 
    Fill Credenciais    404@smartbit.com    qacademy
    Submit Credenciais
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!
    Sleep    5

Senha inválida 
    Go to Login Page 
    Fill Credenciais    admin@smartbit.com    abc123
    Submit Credenciais
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!
    Sleep    5

Email no formato incorreto
    Go to Login Page 
    Fill Credenciais    @.com.br    abc123
    Submit Credenciais
    Field Type Should Be Email
    Sleep    2 
    
Senha em branco
    Go to Login Page
    Fill Credenciais    admin@smartbit.com    ${EMPTY}
    Submit Credenciais
    Alert Text Should Be    password    A senha é obrigatória


Email em branco 
    Go to Login Page
    Fill Credenciais    ${EMPTY}    qacademy
    Submit Credenciais
    Alert Text Should Be    email    O e-mail é obrigatório

Email e senha são obrigatórios 
    [Tags]    temp
    Go to Login Page
    Submit Credenciais
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória
    Sleep    2
