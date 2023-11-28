*** Settings ***
Documentation     Basic Web testing
Library           Screenshot
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers


*** Variables ***
${URL}            https://web.santikadev.com/
${BROWSER}        Chrome
${SEARCH_TEXT}    ambon
${EMAIL_ADDRESS_TEXT}    a@a.com
${PHONE_NUMBER_TEXT}    81808320269
${FIRST_NAME_TEXT}    a
${SEARCH_BAR_TEXTBOX}    xpath://html/body/div[1]/div/div/div[9]/main/div/div/div/div[2]/div/div[1]/div[2]/div/div/div[1]/div/div/div[1]/div/div/div/div/div[1]/input
${FIRST_SEARCH_SUGGESTION}    xpath://html/body/div[1]/div/div/div[2]/div/div/div[2]/a
${SEARCH_BUTTON}    xpath:/html/body/div[1]/div/div/div[9]/main/div/div/div/div[2]/div/div[1]/div[2]/div/div/div[2]/div[3]/button
${LOWEST_RATE_BUTTON}   //div[contains(concat(" ", normalize-space(@class), " "), "layout hotel-gallery")]/button
${FIRST_ROOM_RATE}    //div[contains(concat(" ", normalize-space(@class), " "), "booking-section")]/div/button
${RESERVATION_BUTTON}    //div[contains(concat(" ", normalize-space(@class), " "), "card-price-detail")]/div[5]/button
${BOOKING_MYSELF}    //div[contains(concat(" ", normalize-space(@class), " "), "v-input--selection-controls__input")]/div
${CONTACT_DETAIL_ACCORDION}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]
${EMAIL_ADDRESS}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]/div[2]/div/form/div[1]/div/div[1]/div/input
${FIRST_NAME}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]/div[2]/div/form/div[2]/div[1]/div/div/div[1]/div/input
${PHONE_NUMBER}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]/div[2]/div/form/div[3]/div/div/input
${REVIEW_RESERVATION}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/div[3]/button
${CONTINUE_PAYMENT}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[2]/div/div/div[3]/button
${VA}    xpath://html/body/div[1]/div/div/div[13]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[3]/div/div/div[3]/div/div/div/div[2]/div[1]/div/div
${PRIVACY}    xpath://html/body/div[1]/div/div/div[13]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[3]/div/div/div[5]/div[1]/div/div/div/div[1]/div/div
${BOOKING_BUTTON}    xpath://html/body/div[1]/div/div/div[13]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[3]/div/div/div[5]/div[2]/button

*** Test Cases ***
Sample test
    [Documentation]    This test opens up epoch converter UI
    ...    asserts texts
    Set Window Size    10000    8000
    Wait Until Element Is Enabled    ${SEARCH_BAR_TEXTBOX}
    Input Text    ${SEARCH_BAR_TEXTBOX}    ${SEARCH_TEXT}
    Wait Until Element Is Enabled    ${FIRST_SEARCH_SUGGESTION}
    Click Element    ${FIRST_SEARCH_SUGGESTION}
    Click Button    ${SEARCH_BUTTON}
    Wait Until Element Is Enabled    ${LOWEST_RATE_BUTTON}
    Click Button    ${LOWEST_RATE_BUTTON}
    Wait Until Element Is Enabled    ${FIRST_ROOM_RATE}
    Click Button    ${FIRST_ROOM_RATE}
    Wait Until Element Is Enabled    ${RESERVATION_BUTTON}
    Click Button    ${RESERVATION_BUTTON}
    Sleep    5
    Click Element    ${BOOKING_MYSELF}
    Wait Until Element Is Enabled    ${CONTACT_DETAIL_ACCORDION}
    Click Element    ${CONTACT_DETAIL_ACCORDION}
    Wait Until Element Is Visible    ${EMAIL_ADDRESS}
    Wait Until Element Is Enabled    ${EMAIL_ADDRESS}
    Input Text    ${EMAIL_ADDRESS}    ${EMAIL_ADDRESS_TEXT}    
    Input Text    ${FIRST_NAME}    ${FIRST_NAME_TEXT}
    Input Text    ${PHONE_NUMBER}    ${PHONE_NUMBER_TEXT}
    Click Button    ${REVIEW_RESERVATION}
    Wait Until Element Is Visible    ${CONTINUE_PAYMENT}
    Click Button    ${CONTINUE_PAYMENT}
    Sleep    5
    Click Element    ${VA}
    Click Element    ${PRIVACY}
    Click Button    ${BOOKING_BUTTON}
    Sleep    5
    Should Be Equal As Strings    xpath://html/body/div[1]/div/div/div[2]/div/div/div[2]/div/div[1]/h3    Your Booking is waiting for Payment
    Sleep    5