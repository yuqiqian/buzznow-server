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
