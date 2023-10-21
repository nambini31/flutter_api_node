const isProduction = false;
const clientId = "e894c9aa4f884fb3883ff65a5caf7b69";
const clientSecret = "jubB2MkB72aSZgiggJEWClTgU6cG5wHwbs9b7Vz1B1RbMF0WzK4Zxlw2OY1MGkrv";
const baseURL = isProduction ? '' : 'https://api.bridgeapi.io/v2/';
const loginURL = '${baseURL}authenticate';
const registerURL = '${baseURL}users';
const logoutURL = '${baseURL}logout';
const connectBridgeURL = '${baseURL}connect/items/add';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';


