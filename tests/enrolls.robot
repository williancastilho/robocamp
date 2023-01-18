*** Settings ***
Documentation    Suite de testes de matriculas de alunos    

Resource    ../resources/base.resource


*** Test Cases ***
Deve matricular um aluno
    ${admin}    Create Dictionary    name=Admin    email=admin@smartbit.com    pass=qacademy 
    Do Login   ${admin}         
    Go To Enrolls
    Go To Enroll Form
    Select Student   Falcão    
    Select Plan    Smart  
    Fill Start Date    