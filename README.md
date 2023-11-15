# CUDiningPair
Group project for Engineering SaaS Fall 2023

### Github Link
https://github.com/LeyiCui-Angel/CUDiningPair

## Team members
Ha Yeon Kim (hk3060)
Qijian Zhang (qz2507)
Zining Yin (zy2605)
Leyi Cui (lc3542)

## Instructions to run CUDiningPair

### Heroku Link
https://cudiningpair-1-9c6393863cd3.herokuapp.com/

### Run locally
1. Clone the repo
2. bundle install
3. bundle exec rake db:migrate
4. bundle exec rake db:seed
5. rails server
6. open 'localhost:3000'

Available credentials in seed db for login:
UNI: ab123
Password: ab123

### Functions
Currently for iteration2, we added two functions: edit user profile and __.

1. First loading the app, you will be directed to the login page. There, you can click “Sign up here” and move on to the registration page.(assuming that you don't have an account already).

2. To register, you will write your uni and password(twice for confirmation) to sign up. You click “Sign up” and if the password matches you are signed up! (we will be adding verification method for iter2)

3. Successfully verified user will be redirected to the login page. To start using our app, you can login. If you already have an account with our app, simply log in.

4. After logging in user will be on welcome page. On the right top corner you can click "UNI: your_uni" where you can edit user profile.

5. There you can edit name, gender, and mbti. More options will be added later.

6. [start explain restaurant new function]they can click “restaurant” to move onto restaurant information. In restaurant page, user can add restaurant data and filter their view.

5. You can see name, location, rating for each of the uploaded restaurant in the list together with the restaurant's cuisine, like hot spicy or not.

6. Of course you can filter the restaurant with ratings and cuisine by simply click the corresponding button at top of the list.


## Instructions to test CUDiningPair
Overall test coverage score: 94

### Test locally
1. Clone the repo
2. bundle install
3. bundle exec rake db:migrate
4. bundle exec rake db:seed
(Skip step 1-4 if you've ran them before)
5. bundle exec rake db:test:prepare
6. bundle exec cucumber