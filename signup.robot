*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Library    Browser

*** Test Cases ***
Deve poder cadastrar um novo dog walker 
    
    ${name}               Set Variable     Luciana Rosa
    ${email}              Set Variable     lucianamendesrosa@hotmail.com 
    ${cpf}                Set Variable     00002233665
    ${cep}                Set Variable     08663080
    ${addressNumber}      Set Variable     500
    ${addressDetails}     Set Variable     Apto 24
    
    New Browser    browser=chromium    headless=False 
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1   visible   5000  
    Get Text    form h1   equal    Faça seu cadastro 

    Fill Text    css=input[name=name]                ${name}
    Fill Text    css=input[name=email]               ${email}
    Fill Text    css=input[name=cpf]                ${cpf}
    Fill Text    css=input[name=cep]                ${cep}

    Click        css=input[type=button][value$=CEP]
    Fill Text    css=input[name=addressNumber]       ${addressNumber}
    Fill Text    css=input[name=addressDetails]      ${addressDetails}
    
    
    Sleep   10
