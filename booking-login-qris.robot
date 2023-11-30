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
${EMAIL_ADDRESS_TEXT}    mavalu@mailinator.com
${PASSWORD_TEXT}    P!3sriders
${LOGIN_BUTTON_SANTIKA}    //div[@class="v-toolbar__items align-right valign-middle"]/h4/i
${LOGIN_NAME_FIELD}    //input[@name="email"]
${LOGIN_PASSWORD_FIELD}    //input[@name="password"]
${LOGIN_BUTTON}    //form[@class="v-form"]/button

${SEARCH_BAR_TEXTBOX}    //div[@id="search-home"]/div/div/div/div/input
${FIRST_SEARCH_SUGGESTION}    xpath://html/body/div[1]/div/div/div[2]/div/div/div[2]/a
${SEARCH_BUTTON}    //button[contains(concat(" ", normalize-space(@class), " "), "button-search")]
${LOWEST_RATE_BUTTON}   //div[contains(concat(" ", normalize-space(@class), " "), "layout hotel-gallery")]/button
${FIRST_ROOM_RATE}    //div[contains(concat(" ", normalize-space(@class), " "), "booking-section")]/div/button
${RESERVATION_BUTTON}    //div[contains(concat(" ", normalize-space(@class), " "), "card-price-detail")]/div[5]/button
${BOOKING_MYSELF}    //div[contains(concat(" ", normalize-space(@class), " "), "v-input--selection-controls__input")]/div
${CONTACT_DETAIL_ACCORDION}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]
${REVIEW_RESERVATION}    //div[@class="layout mx-0 pa-3 row flat"]/button
${CONTINUE_PAYMENT}    //div[@class="layout action-wrapper mx-0 pa-3 row flat"]/button
${PRIVACY}    //div[contains(concat(" ", normalize-space(@class), " "), "tnc-pay-checkbox")]/div/div/div
${BOOKING_BUTTON}    //button[@class="custom v-btn v-btn--block v-btn--flat theme--dark"]
${BOOKING_SUCCESS}    //div[@class="v-card__actions align-center v-card-button"]/button
${BOOKING_TRANSFER_TO}    //div[@class="payment-instruction-channel-title"]
${QRIS}    //input[contains(@aria-label, 'QRIS')]/..

*** Test Cases ***
Sample test
    [Documentation]    Test booking login with QRIS
    Set Window Size    1500    1000
    Wait Until Element Is Enabled    ${LOGIN_BUTTON_SANTIKA}
    Click Element    ${LOGIN_BUTTON_SANTIKA}
    Wait Until Element Is Visible    ${LOGIN_NAME_FIELD}
    Input Text    ${LOGIN_NAME_FIELD}    ${EMAIL_ADDRESS_TEXT}    
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${PASSWORD_TEXT}
    Click Button    ${LOGIN_BUTTON}
    Sleep    10
    Wait Until Element Is Enabled    ${SEARCH_BAR_TEXTBOX}
    Input Text    ${SEARCH_BAR_TEXTBOX}    ${SEARCH_TEXT}
    Wait Until Element Is Enabled    ${FIRST_SEARCH_SUGGESTION}
    Click Element    ${FIRST_SEARCH_SUGGESTION}
    Click Button    ${SEARCH_BUTTON}
    Sleep    5
    Wait Until Element Is Enabled    ${LOWEST_RATE_BUTTON}
    Click Button    ${LOWEST_RATE_BUTTON}
    Wait Until Element Is Enabled    ${FIRST_ROOM_RATE}
    Click Button    ${FIRST_ROOM_RATE}
    Wait Until Element Is Enabled    ${RESERVATION_BUTTON}
    Click Button    ${RESERVATION_BUTTON}
    Sleep    5
    Click Button    ${REVIEW_RESERVATION}
    Sleep    5
    Wait Until Element Is Visible    ${CONTINUE_PAYMENT}
    Click Button    ${CONTINUE_PAYMENT}
    Sleep    5
    Click Element    ${QRIS}
    Click Element    ${PRIVACY}
    Click Button    ${BOOKING_BUTTON}
    Sleep    5
    Click Button    ${BOOKING_SUCCESS}
    Sleep    5
    Element Text Should Be    ${BOOKING_TRANSFER_TO}    Please Transfer to
    Sleep    5