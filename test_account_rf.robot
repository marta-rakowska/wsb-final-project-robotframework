*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for generic shop website

*** Variables ***
${PAGE URL}    https://skleptest.pl/
${BROWSER}    Chrome
${ACCOUNTBUTTON}    xpath=//*[contains(text(),'Account')]
${REGISTRATIONEMAILINPUT}    xpath=//*[@id='reg_email']
${REGISTRATIONPASSWORDINPUT}    xpath=//*[@id='reg_password']
${REGISTERBUTTON}    xpath=//*[@name='register']
${MYACCOUNTDASHBOARD}   xpath=//*/nav/ul/li[1]/a
${MYACCOUNTORDERS}    xpath=//*/nav/ul/li[2]/a
${USERNAMEINPUT}    xpath=//*[@id='username']
${PASSWORDINPUT}    xpath=//*[@id='password']
${LOGINBUTTON}    xpath=//*[@name='login']
${LOGOUTBUTTON}    xpath=//*[contains(text(),'Logout')]
${CONFIRMLOGOUTBUTTON}    xpath=//*[contains(text(),'Confirm')]
${LOSTYOURPASSWORDBUTTON}    xpath=//*[contains(text(),'Lost')]
${USRENAMEOREMAILINPUT}    xpath=//*[@id='user_login']
${RESETPASSWORDBUTTON}    xpath=//*/form/p[3]/input[2]

*** Test Cases ***
Create Account
    Open Page Url
    Click On Account Button
    Type In Registration Email
    Type In Registration Password
    Click On Register Button
    Assert Registration
    [Teardown]    Close Browser

Account Logout
    Open Page Url
    Click On Account Button
    Type In Username
    Type In Password
    Click On Login Button
    Click On Logout Button
    Click On Confirm Logout Button
    Assert Main Page
    [Teardown]    Close Browser

Reset Password
    Open Page Url
    Click On Account Button
    Click On Lost Your Password Button
    Type In Username Or Email
    Click On Reset Password Button
    Assert Sent Email Page
    [Teardown]    Close Browser

*** Keywords ***
Open Page Url
    Open Browser    ${PAGE URL}     ${BROWSER}
    Title Should Be    Generic Shop – Just another web shop
Click On Account Button
    Click Element   ${ACCOUNTBUTTON}

Type In Registration Email
    Wait Until Element Is Enabled   ${REGISTRATIONEMAILINPUT}
    Input Text    ${REGISTRATIONEMAILINPUT}     finalproject@finalproject.pl
Type In Registration Password
    Wait Until Element Is Enabled    ${REGISTRATIONPASSWORDINPUT}
    Input Text    ${REGISTRATIONPASSWORDINPUT}     Finalproject1234
Click On Register Button
    Click Element   ${REGISTERBUTTON}
Assert Registration
    Wait Until Element Is Visible    ${MYACCOUNTDASHBOARD}
    Element Should Be Enabled    ${MYACCOUNTORDERS}
    Capture Page Screenshot    alert.png

Type In Username
    Wait Until Element Is Visible        ${USERNAMEINPUT}
    Input Text    ${USERNAMEINPUT}      finalproject@finalproject.pl
Type In Password
    Wait Until Element Is Visible    ${PASSWORDINPUT}
    Input Text    ${PASSWORDINPUT}     Finalproject1234
Click On Login Button
    Click Element   ${LOGINBUTTON}
Click On Logout Button
    Click Element   ${LOGOUTBUTTON}
Click On Confirm Logout Button
    Click Element   ${CONFIRMLOGOUTBUTTON}
Assert Main Page
    Wait Until Element Is Visible    ${ACCOUNTBUTTON}
    Title Should Be    Generic Shop – Just another web shop
    Capture Page Screenshot    alert.png

Click On Lost Your Password Button
    Click Element   ${LOSTYOURPASSWORDBUTTON}
Type In Username Or Email
    Input Text   ${USRENAMEOREMAILINPUT}     finalproject@finalproject.pl
Click On Reset Password Button
    Click Element   ${RESETPASSWORDBUTTON}
Assert Sent Email Page
    Wait Until Location Is Not      https://skleptest.pl/my-account/lost-password/
    Location Should Be      https://skleptest.pl/my-account/lost-password/?reset-link-sent=true
    Capture Page Screenshot    alert.png