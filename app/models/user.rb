class User < ApplicationRecord
    has_secure_password

    # validates :uni, uniqueness: true 
    validates :password, confirmation: true, if: :password_digest_changed?
    validates :password_confirmation, presence: true, if: :password_digest_changed?

    #{ case_sensitive: true }

    # Generate a random verification code before creating the user
    before_create :generate_verification_code

    enum gender: [:woman, :man, :transgender, :non_binary, :prefer_not_to_respond]
    enum mbti: [:enfp, :enfj, :estj, :istj]

    def self.gender_keys
      genders.keys
    end

    def self.mbti_keys
      mbtis.keys
    end
  
    private
  
    def generate_verification_code
      self.verification_code = SecureRandom.hex(3) # generates a 6 character long code
    end
  end  
