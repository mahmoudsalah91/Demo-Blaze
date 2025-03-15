*** Settings ***
Library     SeleniumLibrary
Library    JSONLibrary
Library    OperatingSystem


*** Variables ***
${BaseUrl}
${Browser}

${JSON_FILE}     ${execdir}/Resources/TestData/test_data.json
*** Keywords ***
open my browser
    open browser    ${BaseUrl}  ${Browser}
    maximize browser window

teardown all browsers
    close all browsers


Load JSON Data
    ${json_data}=    Load JSON From File    ${JSON_FILE}
    Set Suite Variable    ${json_data}
    RETURN    ${json_data}