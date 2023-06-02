*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for generic shop website

*** Variables ***
${PAGE URL}    https://skleptest.pl/
${BROWSER}    Chrome
${NEWSLETTERNAME}    xpath=//*[@id='es_txt_name']
${NEWSLETTEREMAIL}    xpath=//*[@id='es_txt_email']
${NEWSLETTERSUBSCRIBEBUTTON}    xpath=//*[@id='es_txt_button']
${SUCCESSFULLYSUBSCRIBED}   xpath=//*[@id='es_msg']
${CATEGORIESBUTTON}    xpath=//*[@id='menu-item-123']
${ALLBUTTON}    xpath=//*[text()='All']
${ALLPAGEURL}   https://skleptest.pl/shop/
${ALLPAGEHEADER}    xpath=//*/div/div[2]/div/h1
${SEARCHINPUT}    xpath=//*[@id='search-field-top-bar']

*** Test Cases ***
Newsletter Subscription
    Open Page Url
    Type In Newsletter Name
    Type In Newsletter Email
    Click On Newsletter Subscribe Button
    Assert Successful Subscription
    [Teardown]    Close Browser

Search
    Open Page Url
    Click On Search Input
    Type In Search
    Press Enter
    Assert Search Result Page
    [Teardown]    Close Browser

Show All Categories
    Open Page Url
    Hover Over Categories Button
    Click On All
    Assert All Categories Page
    [Teardown]    Close Browser


*** Keywords ***
Open Page Url
    Open Browser    ${PAGE URL}     ${BROWSER}
    Title Should Be    Generic Shop – Just another web shop

Type In Newsletter Name
    Scroll Element Into View    ${NEWSLETTERNAME}
    Input Text    ${NEWSLETTERNAME}     Python
Type In Newsletter Email
    Input Text    ${NEWSLETTEREMAIL}    finalproject@finalproject.pl
Click On Newsletter Subscribe Button
    Click Element   ${NEWSLETTERSUBSCRIBEBUTTON}
Assert Successful Subscription
    Wait Until Element Is Visible    ${SUCCESSFULLYSUBSCRIBED}
    Element Text Should Be    ${SUCCESSFULLYSUBSCRIBED}     Successfully Subscribed.
    Capture Page Screenshot    alert.png

Click On Search Input
    Click Element   ${SEARCHINPUT}
Type In Search
    Input Text   ${SEARCHINPUT}     Magnolia Dress
Press Enter
    Press Keys      ${SEARCHINPUT}      ENTER
Assert Search Result Page
    Wait Until Location Is Not      https://skleptest.pl/
    Location Should Be      https://skleptest.pl/?s=Magnolia+Dress
    Capture Page Screenshot    alert.png

Hover Over Categories Button
    Mouse Over    ${CATEGORIESBUTTON}
Click On All
    Click Element    ${ALLBUTTON}
Assert All Categories Page
    Wait Until Location Is Not      https://skleptest.pl/
    Location Should Be      https://skleptest.pl/shop/
    Capture Page Screenshot    alert.png