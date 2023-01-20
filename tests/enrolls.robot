*** Settings ***
Documentation    Suite de testes de matriculas de alunos    

Resource    ../resources/base.resource
Resource    ../resources/Database.resource
Library     JSONLibrary


*** Test Cases ***

Deve matricular um aluno   

    ${admin}    Get Fixture    admin

    ${student}    Get Fixture    student
    Reset Student Enroll     ${student}[email]
    Do Login   ${admin}         
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]     
    Select Plan       ${student}[enroll][plan]  
    Fill Start Date    
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso