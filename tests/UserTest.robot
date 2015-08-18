*** Settings ***
Documentation     The test suite tests User login
Suite Setup       Open Login Page UI    ${CMP_LOGIN_URL}         ${WEB_BROWSER}
Suite Teardown    Close browser UI
Library           UserAPILib
Library           UserLib
Resource          ../services/UI/UserUILib.robot
Resource          ../services/API/UserServiceAPI.robot
Resource          ../conf/Common.robot


*** Test Cases ***
Test case 1 - Valid user is creted and able to login with no errors
    Create valid user   \      8765GFRFFC   Katya   Yunakh  0   katya@epam.com  true    true    false   false   Clarabridge     QA  12312141    jhkh jkh jugg   hjgjhg  US  \   23456   jhgjg   true    20
    Login and check an error UI     No error
    Logout UI
Test case 2 - User with invalid password gets an error while login
    Create invalid credentials      ${user.login}          jhgjftrd56
    Login and check an error UI     Incorrect login or password.    ${invalidUser}
Test case 2 - User with invalid login gets an error while login
    Create invalid credentials      BVYMMOfddgf   ${user.password}
    Login and check an error UI     Incorrect login or password.    ${invalidUser}
Test case 3 - Deleted user is not able to login
    Delete user
    Login and check an error UI     Incorrect login or password.

