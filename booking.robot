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
${SEARCH_BAR_TEXTBOX}    //div[@id="search-home"]/div/div/div/div/input
${FIRST_SEARCH_SUGGESTION}    xpath://html/body/div[1]/div/div/div[2]/div/div/div[2]/a
${SEARCH_BUTTON}    //button[contains(concat(" ", normalize-space(@class), " "), "button-search")]
${LOWEST_RATE_BUTTON}   //div[contains(concat(" ", normalize-space(@class), " "), "layout hotel-gallery")]/button
${FIRST_ROOM_RATE}    //div[contains(concat(" ", normalize-space(@class), " "), "booking-section")]/div/button
${RESERVATION_BUTTON}    //div[contains(concat(" ", normalize-space(@class), " "), "card-price-detail")]/div[5]/button
${BOOKING_MYSELF}    //div[contains(concat(" ", normalize-space(@class), " "), "v-input--selection-controls__input")]/div
${CONTACT_DETAIL_ACCORDION}    xpath://html/body/div[1]/div/div/div[12]/main/div/div/div/div[1]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/ul/li[1]
${EMAIL_ADDRESS}    //input[@aria-label="Email Address"]
${FIRST_NAME}    //input[@aria-label="First Name"]
${PHONE_NUMBER}    //input[@placeholder="Phone Number"]
${REVIEW_RESERVATION}    //div[@class="layout mx-0 pa-3 row flat"]/button
${CONTINUE_PAYMENT}    //div[@class="layout action-wrapper mx-0 pa-3 row flat"]/button
${VA}    //input[contains(@aria-label, 'BCA Transfer')]/..
${PRIVACY}    //div[contains(concat(" ", normalize-space(@class), " "), "tnc-pay-checkbox")]/div/div/div
${BOOKING_BUTTON}    //button[@class="custom v-btn v-btn--block v-btn--flat theme--dark"]
${BOOKING_SUCCESS}    //div[@class="v-card__actions align-center v-card-button"]/button

*** Test Cases ***
Sample test
    [Documentation]    This test create non login booking
    Set Window Size    1500    1000
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
    Click Element    ${BOOKING_MYSELF}
    Wait Until Element Is Enabled    ${CONTACT_DETAIL_ACCORDION}
    Click Element    ${CONTACT_DETAIL_ACCORDION}
    Wait Until Element Is Visible    ${EMAIL_ADDRESS}
    Wait Until Element Is Enabled    ${EMAIL_ADDRESS}
    Input Text    ${EMAIL_ADDRESS}    ${EMAIL_ADDRESS_TEXT}    
    Input Text    ${FIRST_NAME}    ${FIRST_NAME_TEXT}
    Input Text    ${PHONE_NUMBER}    ${PHONE_NUMBER_TEXT}
    Click Button    ${REVIEW_RESERVATION}
    Sleep    5
    Wait Until Element Is Visible    ${CONTINUE_PAYMENT}
    Click Button    ${CONTINUE_PAYMENT}
    Sleep    5
    Click Element    ${VA}
    Click Element    ${PRIVACY}
    Click Button    ${BOOKING_BUTTON}
    Sleep    5
    Click Button    ${BOOKING_SUCCESS}
    Sleep    5