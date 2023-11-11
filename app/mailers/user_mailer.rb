class UserMailer < ApplicationMailer
  
   def send_verification_code(user, code)
     @code = code
     mail(to: "#{user.uni}@columbia.edu", subject: 'Verification Code for Your Registration')
   end
end  
  