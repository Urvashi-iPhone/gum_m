//
//  Constant.h
//  Runmileapp
//
//  Created by Tecksky Techonologies on 9/2/16.
//  Copyright © 2016 Tecksky Techonologies. All rights reserved.
//

#import "ProgressHUD.h"
#ifndef Constant_h
#define Constant_h


#define REGEX_NAME_EXPRESS @"^[\\p{L} .'-]+$"
#define REGEX_EMAIL_EXPRESS @"^[A-Za-z0-9]+([\\.\\-_]{1}[A-Za-z0-9]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+){0,1}(\\.[A-Za-z]{2,4})$"
//#define REGEX_PASSWORD_LIMIT @"[A-Za-z0-9]{6,20}"
//#define REGEX_TEXTVIEW @"[\\S ]{3,}"
#define REGEX_MOBILE_EXPRESS @"^[+]?[0-9]{10,13}$"
#define REGEX_IND_ZIP_EXPRESS @"^[0-9]{6}$"


//Default Base URL

#define BASE_URL @"http://clientwebdata.com/demo/corephp/getumoney/api/v1/api.php"


//Nsuser Default Store
#define DEF_IS_LOGIN @"def_is_login"
#define DEF_RUPEE @"\u20B9"
#define DEF_DEFAULT_RESPONSE @"def_default_response"
#define API_ID @"96c40418eba017a9b15cb5a0d530b412"
#define APP_SECRET @"9dd399cdd2e5ef9c2c51580d9463ed72"

#define DEF_USERNAME @"def_user_name"
#define DEF_EMAIL @"def_email"
#define DEF_MEM_NAME @"def_mem_name"
#define DEF_MEM_ID @"def_member_id"
#define DEF_MOBILE @"def_mobile"
#define DEF_PASSWORD @"def_password"
#define DEF_POSTED @"def_posted"
//#define DEF_REF_CODE @"def_ref_code"
#define DEF_REF_ID @"def_ref_id"
#define DEF_REF_PAID @"def_ref_paid"
#define DEF_STATUS @"def_status"
#define DEF_PROFILE_PICTURE @"def_profile"

#define DEF_PREFERENCE @"def_preference"
#define DEF_LATITUDE @"def_lat"
#define DEF_LONGITUDE @"def_long"
#define DEF_CURRENT_CITY @"def_current_city"
#define DEF_NEXTTIME @"def_nexttime"
#define DEF_REFERAL_PERCENTAGE @"def_referalPercentage"

#define DEF_APP_OPEN @"def_is_open"
#define DEF_BILL_HOME @"def_is_home"
#define DEF_APP_OPEN_OTHERS @"def_is_open_others"
#define DEF_PAY @"def_pay"
#define DEF_FCM_TOKEN @"def_fcm_token"

#define DEF_LOCATION_POSITION @"def_location"


//Register
#define WS_REGISTER @"signup_user"

//Login
#define WS_LOGIN @"login_user"

//Social Login
#define WS_SOCIAL_LOGIN @"login_with_social_sites"

//Social Login
#define WS_SOCIAL_LOGIN @"login_with_social_sites"

//Forgot Password
#define WS_FORGOT_PASSWORD @"forgot_password"

//Change Password
#define WS_CHANGE_PASSWORD @"change_password"

//Update Profile
#define WS_UPDATE_PROFILE @"update_user_profile"

//Banner
#define WS_BANNER @"get_home_banner"

//Top Store
#define WS_TOPSTORE @"top_stores"

//Top Store Offer
#define WS_TOPSTORE_OFFER @"top_stores_offeres"

//Categorey
#define WS_CATEGOREY @"get_menu"

//contact us
#define WS_CONTACT_US @"contact_us"

//Deals By Categorey
#define WS_DEALS_BY_CATEGOREY @"get_deals_by_category"


//Get PathLab
#define WS_PATHLAB @"get_pathlab"

//Get PathLab Details
#define WS_PATHLAB_DETAILS @"pathlab_details"

//Get State
#define WS_STATE @"get_state"

//Get Default Api
#define WS_DEFAULT_API @"default_api"

//Get Recharge Operator
#define WS_RECHARGE_OPERATOR @"recharge_operator"

//Get Recharge Deals
#define WS_RECHARGE_DEALS @"get_recharge_deals"

//Get Recharge category
#define WS_RECHARGE_CATEGORY @"get_recharge_category"

//Get Health Categorey
#define WS_HEALTH_CATEGOREY @"get_health_categories"

//Get Health Categorey Offer
#define WS_HEALTH_CATEGOREY_OFFER @"get_health_category_offers"

//Get Coupen Store
#define WS_COUPON_STORE @"get_coupon_stores"

//Get Coupen by Deals
#define WS_COUPON_BY_DEALS @"get_coupons_by_deals_ids"

//Get Wallet Amount
#define WS_WALLET_AMOUNT @"get_wallet_amount"

//Get Proceed Recharge
#define WS_PROCEED_RECHARGE @"proceed_recharge"

//Get Proceed Recharge Payment
#define WS_PROCEED_RECHARGE_PAYMENT @"proceed_recharge_payment"

//Get Overall Account Info
#define WS_OVERALL_ACCOUNT_INFO @"overall_account_info"

//Get payout Request
#define WS_PAYOUT_REQUEST @"payout_request"

//Get payout Request Neft
#define WS_PAYOUT_REQUEST_NEFT @"payout_request_neft"

//Get MY Cashback history
#define WS_MY_CASHBACK_HISTORY @"my_cashback_history"

//Get MY payment earning
#define WS_MY_PAYMENT_EARNING @"my_payment_earnings"

//Get MY refferal bonus
#define WS_MY_REFFERAL_BONUS @"my_referral_bonus"

//Get MY payment history
#define WS_MY_PAYMENT_HISTORY @"my_payment_history"

//Get MY missing cashback list
#define WS_MY_MISSING_CASHBACK_LIST @"my_missing_cashback_list"

//Get add_rating_pathlab
#define WS_ADD_RATING_PATHLAB @"add_rating_pathlab"

//Get UPLOAD_PATHLAB_BILL
#define WS_UPLOAD_PATHLAB_BILL @"upload_pathlab_bill"

//missing cashback submit
#define WS_MISSING_CASHBACK_SUBMIT @"missing_cashback_submit"

//PAYOUT_REQUEST_RECHARGE
#define WS_PAYOUT_REQUEST_RECHARGE @"payout_request_recharge"

//PAYOUT_REQUEST_WALLET
#define WS_PAYOUT_REQUEST_WALLET @"payout_request_wallet"

//UPDATE_BANK_ACCOUNT
#define WS_UPDATE_BANK_ACCOUNT @"update_bank_account"

//UPDATE_WALLET_ACCOUNT
#define WS_UPDATE_WALLET_ACCOUNT @"update_wallet_account"

//GET_ACCOUNT_DETAIL
#define WS_GET_ACCOUNT_DETAIL @"get_account_details"

//WS_MISSING_CASHBACK_DETAILS
#define WS_MISSING_CASHBACK_DETAILS @"my_missing_caskback_details"

//WS_MISSING_CASHBACK_REPLY
#define WS_MISSING_CASHBACK_REPLY @"my_missing_caskback_reply"

//GET_Other service
#define WS_GET_OTHER_SERVICE @"get_other_services"

//GET_Other service data
#define WS_GET_OTHER_SERVICE_DATA @"get_other_services_data"

//GET_Other service offer
#define WS_GET_OTHER_SERVICE_OFFER @"get_other_services_offers"


//WS_ADD_RATING_OTHER_SERVICE
#define WS_ADD_RATING_OTHER_SERVICE @"add_rating_other_service"

//WS_GET_OTHER_SERVICE_RATING_DETAILS
#define WS_GET_OTHER_SERVICE_RATING_DETAILS @"get_other_service_rating_details"


//WS_UPLOAD_OTHER_SERVICE_DATA_BILL
#define WS_UPLOAD_OTHER_SERVICE_DATA_BILL @"upload_other_service_data_bill"

//WS_GET_WEEKLY_DRAW_BANNERS
#define WS_GET_WEEKLY_DRAW_BANNERS @"get_weekly_draw_banners"

//WS_GET_MY_THIS_WEEK_TICKETS
#define WS_GET_MY_THIS_WEEK_TICKETS @"get_my_this_week_tickets"

//WS_GET_THIS_WEEK_ALL_TICKETS
#define WS_GET_THIS_WEEK_ALL_TICKETS @"get_this_week_all_tickets"

//WS_GET_THIS_WEEK_WINNERS
#define WS_GET_THIS_WEEK_WINNERS @"get_this_week_winners"

//WS_GET_LAST_WEEK_WINNERS
#define WS_GET_LAST_WEEK_WINNERS @"get_last_week_winners"

//WS_GET_CURRENT_WEEK_WINNERS
#define WS_GET_CURRENT_WEEK_WINNERS @"get_current_week_winners"

//WS_CLAIM_WINNER
#define WS_CLAIM_WINNER @"claim_winner"

//WS_search data
#define WS_SEARCH_DATA @"search_data"

// WS_APPLY_REFERRAL
#define WS_APPLY_REFERRAL @"apply_referral"


//WS_PAY_OYHER_SERVICE_DATA_BILL
#define WS_PAY_OYHER_SERVICE_DATA_BILL @"pay_other_service_data_bill"

//WS_SUBMIT_PAY_OTHER_SERVICE_DATA_BILL_SUCCESS
#define WS_SUBMIT_PAY_OTHER_SERVICE_DATA_BILL_SUCCESS @"submit_pay_other_service_data_bill_success"

//WS_GRAB_DEAL_SMS
#define WS_GRAB_DEAL_SMS @"greab_deal_sms"

//promocode
#define WS_PROMOCODE @"check_promocode"

//WS_MY_REFERRAL_NETWORK
#define WS_MY_REFERRAL_NETWORK @"my_referral_network"

//Payment Gateway
#define PAYMENT_MERCHANT_ID @"18177"
#define PAYMENT_LOGIN_ID @"18177"
#define PAYMENT_PASSWORD @"LETS@1234"
#define PAYMENT_PRODUCT_ID @"LETS"
#define PAYMENT_CURRENCY @"INR"
#define PAYMENT_CLIENT_CODE @"007"
#define PAYMENT_CUST_ACC @"1234567890"
#define PAYMENT_RU @"https://paynetzuat.atomtech.in/paynetz/param"

#endif
