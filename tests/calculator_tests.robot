*** Settings ***
Documentation     Test suite for Calculator module
Library           BuiltIn

*** Variables ***
${FIRST_NUMBER}    10
${SECOND_NUMBER}   5

*** Keywords ***
Calculate Addition
    [Arguments]    ${a}    ${b}
    ${result}=    Evaluate    ${a} + ${b}
    [Return]    ${result}

Calculate Subtraction
    [Arguments]    ${a}    ${b}
    ${result}=    Evaluate    ${a} - ${b}
    [Return]    ${result}

Calculate Multiplication
    [Arguments]    ${a}    ${b}
    ${result}=    Evaluate    ${a} * ${b}
    [Return]    ${result}

Calculate Division
    [Arguments]    ${a}    ${b}
    Run Keyword If    ${b} == 0    Fail    ZeroDivisionError: Cannot divide by zero
    ${result}=    Evaluate    ${a} / ${b}
    [Return]    ${result}

*** Test Cases ***
Test Addition
    ${result}=    Calculate Addition    ${FIRST_NUMBER}    ${SECOND_NUMBER}
    Should Be Equal As Numbers    ${result}    15
    Log    Addition test passed: ${FIRST_NUMBER} + ${SECOND_NUMBER} = ${result}

Test Subtraction
    ${result}=    Calculate Subtraction    ${FIRST_NUMBER}    ${SECOND_NUMBER}
    Should Be Equal As Numbers    ${result}    5
    Log    Subtraction test passed: ${FIRST_NUMBER} - ${SECOND_NUMBER} = ${result}

Test Multiplication
    ${result}=    Calculate Multiplication    ${FIRST_NUMBER}    ${SECOND_NUMBER}
    Should Be Equal As Numbers    ${result}    50
    Log    Multiplication test passed: ${FIRST_NUMBER} * ${SECOND_NUMBER} = ${result}

Test Division
    ${result}=    Calculate Division    ${FIRST_NUMBER}    ${SECOND_NUMBER}
    Should Be Equal As Numbers    ${result}    2
    Log    Division test passed: ${FIRST_NUMBER} / ${SECOND_NUMBER} = ${result}

Test Division By Zero
    Run Keyword And Expect Error    ZeroDivisionError: Cannot divide by zero    Calculate Division    ${FIRST_NUMBER}    0
    Log    Division by zero test passed: Error was correctly raised
