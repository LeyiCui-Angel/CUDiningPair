# CUDiningPair
Group project for Engineering SaaS Fall 2023, Final submission: final branch

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

### Demo Video Link
https://youtu.be/G3090tlTq5Q

### Run locally
1. Clone the repo
2. bundle install
3. bundle exec rake db:drop
4. bundle exec rake db:migrate
5. bundle exec rake db:seed
6. rails server
7. open 'localhost:3000'

Available credentials in seed db for login:
UNI: ab123
Password: ab123

### Functions
For the final iteration, we 1) changed UI, 2) added user verification to ensure CU-exclusiveness, 3) added subscribe function which allows an user to get update emails when there is new pairing initiations in the restaurant that the user subscribed, and 4) restaurant reviews function. 

We were able to implement all main functions from our proposal except for the no-show policy. Our initial no-show policy was letting user report other users who did not show up. However, we thought some users can abuse this reporting system to intentionally report others, so we ended up changing. Instead, for now we just added a warning so that people can't undo pairing once they decide to join.

Following are the instructions for our main functions:

1. First loading the app, you will be directed to the login page. There, you can click “Sign up here” and move on to the registration page (assuming that you don't have an account already).

2. To register, you will write your uni and password (twice for confirmation) to sign up. You click “Sign up” and if the password matches you will be redirected to the verification page and receive a 6-digit verification code in your uni@columbia.edu email account!

3. If you enter the correct 6-digit verification code, you are successfully verified.

4. Successfully verified user will be redirected to the login page. To start using our app, you can login. If you already have an account with our app, simply log in.

5. After logging in user will be on welcome page. On the right top corner you can click "UNI: your_uni" where you can edit user profile.

6. There you can edit name, gender, and mbti. More options will be added later.

7. Going back to the welcome/index page, you can click on “Restaurants” to access restaurant informations. In restaurants page, user can add restaurant data and filter restaurants based on preference.

8. You can see name, location, rating for each of the uploaded restaurant in the list together with the restaurant's cuisine style, like hot spicy or not. By clicking the more info of each restaurant, you can see reviews of the users, including comments and ratings. Also, you can add your own review about this restaurant.

9. You can filter the restaurant with ratings and cuisine by simply click the corresponding button at top of the list and click on "Filter".

10. When you click subscribe button on the right side of the restaruant row, you will be emailed regarding any updates on the new restaurant pairing initiations.

11. Going back to the welcome/index page, once you click the "Pairings", you will enter the All pairings table with all existing pairings.

12. You can add new pairing by click the button at the top left of the page. Once you select the target restaurant, target number of people and target meeting time (at least one hour later than current time), you then press the button below of creating pair. You will be redirected to the all pairings page with your new pairing added.

13. You cannot enter the same pairing twice but you can enter different pairings as many as you want. Once the pairing is full, user cannot join this specific pairing anymore.

14. If you want to know more info about pairing, you can click that corresponding button and see who is inside of this pairing. You can also edit the info if you would like to.

## Instructions to test CUDiningPair
Overall test coverage score: 91.63

### Test locally
1. Clone the repo
2. bundle install
3. bundle exec rake db:migrate
4. bundle exec rake db:seed
(Skip step 1-4 if you've ran them before)
5. bundle exec rake db:test:prepare
6. bundle exec cucumber
