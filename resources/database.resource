*** Settings ***
Documentation    Grerenciando a massa de teste através do banco de dados
Library    DatabaseLibrary


*** Keywords ***
Connect to Postgres
    Connect To Database    psycopg2
    ...                    wvlpgffk
    ...                    wvlpgffk
    ...                    y4JaBPmTjGakEsIgDIVlNM6t9XPai_LG
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where email
    [Arguments]    ${email}
    ${query}    Set Variable    SELECT * FROM public.students WHERE email = '${email}';
    ${result}    Query    ${query} 

    [return]    ${result}[0]

Delete Enroll By Email
    [Arguments]    ${email}
    ${user}    Select Student Where email    ${email}
    
    ${query}    Set Variable   DELETE FROM public.enrollments WHERE student_id='${user}[0]';

    Execute SQL String    ${query}

Reset Student Enroll 
    [Arguments]    ${email}
    Connect to Postgres
    Delete Enroll By Email    ${email}
    Disconnect from Database 
