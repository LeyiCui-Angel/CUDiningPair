class User < ApplicationRecord
    has_secure_password
  
    # Generate a random verification code before creating the user
    before_create :generate_verification_code
  
    private
  
    def generate_verification_code
      self.verification_code = SecureRandom.hex(3) # generates a 6 character long code
    end
  end  
