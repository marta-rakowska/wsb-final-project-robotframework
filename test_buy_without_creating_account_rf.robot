*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for generic shop website

*** Variables ***
${PAGE URL}    https://skleptest.pl/
${BROWSER}    Chrome
${MOSTWANTEDBUTTON}     xpath=//*[contains(text(),'Most')]
${FITTBELTSCARTBUTTON}      xpath=//*/div[2]/div/ul/li[1]/a[2]
${MAGNOLIADRESSCARTBUTTON}      xpath=//*/div[2]/div/ul/li[2]/a[2]
${ROCADIJEANSCARTBUTTON}    xpath=//*/div[2]/div/ul/li[3]/a[2]
${MYCARTBUTTON}     xpath=//*[contains(text(),'My Cart')]
${PROCEEDTOCHECKOUTBUTTON}  xpath=//*[contains(text(),'Proceed')]
${FIRSTNAMEINPUT}   xpath=//*[@id='billing_first_name']
${LASTNAMEINPUT}    xpath=//*[@id='billing_last_name']
${STREETINPUT}  xpath=//*[@id='billing_address_1']
${POSTCODEINPUT}    xpath=//*[@id='billing_postcode']
${CITYINPUT}    xpath=//*[@id='billing_city']
${PHONEINPUT}   xpath=//*[@id='billing_phone']
${EMAILADDRESSINPUT}    xpath=//*[@id='billing_email']
${CHECKPAYMENTSBUTTON}      xpath=//*[@id='payment_method_cheque']
${PLACEORDERBUTTON}     xpath=//*[@id='place_order']
${ORDERRECEIVED}    xpath=//*/div[1]/div/header/h1
${ORDERDETAILS}    xpath=//div[2]/div/section[1]/h2

*** Test Cases ***
Buy With Existing Account
    Open Page Url
    Click On Most Wanted Button
    Click On Fitt Belts Cart Button
    Click On Magnolia Dress Cart Button
    Click On Rocadi Jeans Cart Button
    Click On My Cart Button
    Click On Proceed To Checkout Button
    Type In First Name
    Type In Last Name
    Type In Street
    Type In Postcode
    Type In City
    Type In Phone
    Type In Email
    Click On Check Payments Button
    Click On Place Order Button
    Assert Order Received
    [Teardown]    Close Browser

*** Keywords ***
Open Page Url
    Open Browser    ${PAGE URL}     ${BROWSER}
    Title Should Be    Generic Shop – Just another web shop
Click On Most Wanted Button
    Click Element   ${MOSTWANTEDBUTTON}
Click On Fitt Belts Cart Button
    Wait Until Element Is Enabled    ${FITTBELTSCARTBUTTON}
    Click Element   ${FITTBELTSCARTBUTTON}
Click On Magnolia Dress Cart Button
    Wait Until Element Is Enabled    ${MAGNOLIADRESSCARTBUTTON}
    Click Element   ${MAGNOLIADRESSCARTBUTTON}
Click On Rocadi Jeans Cart Button
    Wait Until Element Is Enabled    ${ROCADIJEANSCARTBUTTON}
    Click Element   ${ROCADIJEANSCARTBUTTON}
Click On My Cart Button
    Click Element   ${MYCARTBUTTON}
Click On Proceed To Checkout Button
    Click Element   ${PROCEEDTOCHECKOUTBUTTON}
Type In First Name
    Wait Until Element Is Enabled   ${FIRSTNAMEINPUT}
    Input Text    ${FIRSTNAMEINPUT}      Selenium
Type In Last Name
    Input Text    ${LASTNAMEINPUT}      Webdriver
Type In Street
    Input Text    ${STREETINPUT}    Testowa 1
Type In Postcode
    Input Text    ${POSTCODEINPUT}      11-111
Type In City
    Input Text    ${CITYINPUT}      WSB
Type In Phone
    Input Text    ${PHONEINPUT}     987654321
Type In Email
    Input Text    ${EMAILADDRESSINPUT}      selenium@webdriver.pl
Click On Check Payments Button
    Scroll Element Into View    ${CHECKPAYMENTSBUTTON}
    Click Element   ${CHECKPAYMENTSBUTTON}
Click On Place Order Button
    Click Element   ${PLACEORDERBUTTON}
Assert Order Received
    Wait Until Element Is Visible      ${ORDERDETAILS}
    Element Should Be Visible    ${ORDERRECEIVED}
    Capture Page Screenshot    alert.png