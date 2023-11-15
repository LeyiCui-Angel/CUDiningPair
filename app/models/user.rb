class User < ApplicationRecord
    has_and_belongs_to_many :pairings
    
    has_secure_password

    validates :uni, uniqueness: true 
    validates :password, confirmation: true
    validates :password_confirmation, presence: true

    #{ case_sensitive: true }

    # Generate a random verification code before creating the user
    before_create :generate_verification_code
  
    private
  
    def generate_verification_code
      self.verification_code = SecureRandom.hex(3) # generates a 6 character long code
    end
  end  
