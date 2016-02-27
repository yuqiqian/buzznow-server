Buzz Now Team Wiki
==================

 

BuzzNow Server Restful APIs
---------------------------

All APIs will return JSON, with a return code and a message to indicate whether
the request is successful

0 OK

001 authentication failed

002 parameters error check the input parameter

003 login required authentication again

040 API not found

041 please try other HTTP method

042 object requested not found

043 duplicated user, please login happen only when creating a new user

144 cart empty, failed to check out

145 address invalid

146 order state error

 

Authentication
--------------

### POST /auth/

Parameters: gtid, password

 

Response Example:

For success:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "msg": "OK",
    "user_id":1234,
    "ret": 0
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Failure:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "msg": "authentication failed",
    "ret": 001
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

User data
---------

### GET /user/:user
Get user detail.
Parameter in URL: @user is user_id
 

Response Example:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "msg":"OK",
    "ret":0,
    "user":{
    	"gt_id":"...",
    	"email":"...",
    	"first_name":"...",
    	"last_name":"..."
     }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### POST /user/
Create new user.
```
Parameters: gt_id, email, first_name, last_name
Parameters in URL:
```
Example:
```
POST localhost:3000/user/
Parameters:
    gt_id: test33
    email: test33@gatech.edu
    first_name: fname
    last_name: lname

Response:
{
    "msg":"OK",
    "user_id":1234,
    "ret":0
}
```


### POST /user/:user_id/
Change details for a certain user

```
Parameters: user_id, email, first_name, last_name
Parameters in URL: user_id
```

Example:
```
POST localhost:3000/user/1234
Parameters:
    user_id: 1234
    email: test33@gatech.edu
    first_name: fname
    last_name: lname

Response:
{
    "msg":"OK",
    "ret":0
}
```

### POST /user/resetpassword/
Send a reset password email for a certain user

```
Parameters: email
Parameters in URL: 
```

Example:
```
POST localhost:3000/user/resetpassword
Parameters:
    email: test33@gatech.edu

Response:
{
    "msg":"OK",
    "ret":0
}
```

## User Profiles

### GET /profile/:user_id
Get user profile for certain user
```
Parameters: 
Parameters in URL: user_id
```

Example:
```
POST localhost:3000/profile/1234
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "profile":{
        "userprofile_id":111,
        "user_id":1234,
        "address":"...",
        "password":"...",
        "profile_img_url":"...",
        "payment": "payment_id"
    }
}
```
### POST /profile/create/:user_id
create user profile for certain user
```
Parameters: address, password, profile_img_url, payment
Parameters in URL: user_id
```

Example:
```
POST localhost:3000/profile/1234
Parameters:
    address: ...
    password: ...
    profile_img_url: ...
    payment: ...

Response:
{
    "msg":"OK",
    "ret":0
}
```

### POST /profile/:user_id
Update user profile for certain user
```
Parameters: address, profile_img_url, payment
Parameters in URL: user_id
```

Example:
```
POST localhost:3000/profile/1234
Parameters:
    address: ...
    profile_img_url: ...
    payment: ...

Response:
{
    "msg":"OK",
    "ret":0
}
```


## Shoplist

### GET /shoplist/:shoplist_id
Get certain shoplist 
```
Parameters: 
Parameters in URL: shoplist_id
```

Example:
```
GET localhost:3000/shoplist/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "shoplist":{
        "Shoplist id": 1, 
        "requester_id": 8, 
        "helper_id": 4, 
        "supermarket": "Cookley", 
        "expire_time": "2016-01-18 05:19:17", 
        "total_price": #<BigDecimal:4d27c98,'0.6488E2',18(36)>, 
        "actual_price": #<BigDecimal:4d27978,'0.7634E2',18(36)>, 
        "status": "Complete", 
        "created_at": "2016-02-14 01:43:08", 
        "updated_at": "2016-02-14 01:43:08", 
        "receipt": "...",

    }
}
```

### POST /shoplist/
Create new shoplist
```
Parameters: requester_id, helper_id, supermarket, expire_time, total_price, actual_price, status, receipt

Parameters in URL: 
```
Example:
```
POST localhost:3000/shoplist/
Parameters:
    requester_id: ...
    helper_id: ...
    supermarket: ...
    expire_time: ...
    total_price: ...
    actual_price: ...
    status: ...
    receipt:...

Response:
{
    "msg":"OK",
    "shoplist_id":1,
    "ret":0
}
```

### POST /shoplist/:shoplist_id
Update certain shoplist.
```
Parameters: shoplist_id, requester_id, helper_id, supermarket, expire_time, total_price, actual_price, status, receipt

Parameters in URL: shoplist_id
```
Example:
```
POST localhost:3000/shoplist/1
Parameters:
    shoplist_id: ...
    requester_id: ...
    helper_id: ...
    supermarket: ...
    expire_time: ...
    total_price: ...
    actual_price: ...
    status: ...
    receipt:...

Response:
{
    "msg":"OK",
    "ret":0
}
```

## Product Items

### GET /product_item/:product_item_id
Get certain product item
```
Parameters: 
Parameters in URL: product_item_id
```

Example:
```
GET localhost:3000/product_item/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "product_item":{
        "product_item_id": 1, 
        "product_id": 68, 
        "quantity": #<BigDecimal:4cde3e0,'0.1E1',9(27)>, 
        "is_bought": true, 
        "shoplist_id": 1, 
        "created_at": "2016-02-14 01:43:08", 
        "updated_at": "2016-02-14 01:43:08",
    }
}
```

### POST /product_item/
Create new product item.
```
Parameters: product_id, quantity, is_bought, shoplist_id

Parameters in URL:
```
Example:
```
POST localhost:3000/product_item/
Parameters:
    product_id: 22
    quantity: 3
    is_bought: false 
    shoplist_id: 33

Response:
{
    "msg":"OK",
    "product_item_id": 123,
    "ret":0
}
``` 

### POST /product_item/:product_item_id
Update certain product item.
```
Parameters: product_item_id, product_id, quantity, is_bought, shoplist_id

Parameters in URL: product_item_id
```
Example:
```
POST localhost:3000/product_item/1
Parameters:
    product_item_id: 242
    product_id: 22
    quantity: 3
    is_bought: false 
    shoplist_id: 33

Response:
{
    "msg":"OK",
    "ret":0
}
```

## Product

### GET /product/:product_id
Get certain product
```
Parameters: 
Parameters in URL: product_id
```

Example:
```
GET localhost:3000/product/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "product":{
        "product_id": 1, 
        "name": "Mediocre Steel Gloves", 
        "product_img": "https://robohash.org/eosquodminima.png?size=300x30...", 
        "price": #<BigDecimal:4ba10b8,'0.423E2',18(36)>, 
        "created_at": "2016-02-14 01:43:08", 
        "updated_at": "2016-02-14 01:43:08"
    }
}
```
### POST /product/
Save certain product.
```
Parameters: name, product_img, price

Parameters in URL: 
```
Example:
```
POST localhost:3000/product_item/
Parameters:
    name: "my product" 
    product_img: "http://..." 
    price: 3.43

Response:
{
    "msg":"OK",
    "ret":0
}
```

### POST /product/:product_id
Update certain product.
```
Parameters: product_id, name, product_img, price

Parameters in URL: product_id
```
Example:
```
POST localhost:3000/product/1
Parameters:
    product_id: 1
    name,: "my product" 
    product_img: "http://..." 
    price: 3.43

Response:
{
    "msg":"OK",
    "ret":0
}
```
## Super Market

### GET /supermarket/:supermarket_id
Get certain supermarket
```
Parameters: 
Parameters in URL: supermarket_id
```

Example:
```
GET localhost:3000/supermarket/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "supermarket":{
        "supermarket_id": 1, 
        "name": "O'Kon, Heathcote and Konopelski", 
        "picture": nil, 
        "created_at": "2016-02-14 01:43:10", 
        "updated_at": "2016-02-14 01:43:10"
    }
}
```

### POST /supermarket/
Create new supermarket.
```
Parameters: name, picture

Parameters in URL: 
```
Example:
```
POST localhost:3000/supermarket/
Parameters:
    name: "my supermarket" 
    picture:"http://..."

Response:
{
    "msg":"OK",
    "ret":0
}
```

### POST /supermarket/:supermarket_id
Update certain supermarket.
```
Parameters: supermarket_id, name, picture

Parameters in URL: supermarket_id
```
Example:
```
POST localhost:3000/supermarket/1
Parameters:
    supermarket_id: 1 
    name: "my supermarket" 
    picture:"http://..."

Response:
{
    "msg":"OK",
    "ret":0
}
```

## Payment

### GET /payment/:payment_id
Get certain payment
```
Parameters: 
Parameters in URL: payment_id
```

Example:
```
GET localhost:3000/payment/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "payment":{
        "payment_id": 1, 
        "user_id": 1, 
        "card_last_four_digit": 3050, 
        "billing_address": "3829 Durgan ParksSouth FayeMaryland43316", 
        "created_at": "2016-02-14 01:43:08", 
        "updated_at": "2016-02-14 01:43:08"
    }
}
```

### POST /payment/
Creaet new payment.
```
Parameters: user_id, card_last_four_digit, billing_address

Parameters in URL: 
```
Example:
```
POST localhost:3000/payment/1
Parameters:
    user_id: 2 
    card_last_four_digit: 0000
    billing_address: "somewhere ..."

Response:
{
    "msg":"OK",
    "ret":0
}
```

### POST /payment/:payment_id
Update certain payment.
```
Parameters: payment_id, user_id, card_last_four_digit, billing_address

Parameters in URL: payment_id
```
Example:
```
POST localhost:3000/payment/1
Parameters:
    payment_id: 1 
    user_id: 2 
    card_last_four_digit: 0000
    billing_address: "somewhere ..."

Response:
{
    "msg":"OK",
    "ret":0
}
```

## Payment Transaction

### GET /payment_transaction/:payment_transaction_id
Get certain payment transaction
```
Parameters: 
Parameters in URL: payment_transaction_id
```

Example:
```
GET localhost:3000/payment_transaction/1
Parameters:

Response:
{
    "msg":"OK",
    "ret":0,
    "payment":{
        "paymenttransaction_id": 1, 
        "requester_id": 8, 
        "helper_id": 4, 
        "payment_time": "2016-02-13 00:37:07", 
        "amount": #<BigDecimal:492ade8,'0.1258E2',18(36)>, 
        "payment_method_id": nil, 
        "transaction_id": 5314, 
        "created_at": "2016-02-14 01:43:09", 
        "updated_at": "2016-02-14 01:43:09">
    }
}
```

### POST /payment_transaction/
Create new payment transaction.
```
Parameters: requester_id, helper_id, payment_time, amount, payment_method_id

Parameters in URL:
```
Example:
```
POST localhost:3000/payment_transaction/1
Parameters:
    requester_id: 2 
    helper_id: 3 
    payment_time: "2016-02-13 00:37:07" 
    amount: 321.0 
    payment_method_id: 1

Response:
{
    "msg":"OK",
    "ret":0
}
```


### POST /payment_transaction/:payment_transaction_id
Update certain payment transaction.
```
Parameters: paymenttransaction_id, requester_id, helper_id, payment_time, amount, payment_method_id

Parameters in URL: paymenttransaction_id
```
Example:
```
POST localhost:3000/payment_transaction/1
Parameters:
    paymenttransaction_id: 1 
    requester_id: 2 
    helper_id: 3 
    payment_time: "2016-02-13 00:37:07" 
    amount: 321.0 
    payment_method_id: 1 

Response:
{
    "msg":"OK",
    "ret":0
}
```
