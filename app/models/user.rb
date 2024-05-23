class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+\z/.freeze()
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze()
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { 
    with: VALID_EMAIL_REGEX
  }
  
  has_secure_password validations: false
  validates :password, format: {
    with: VALID_PASSWORD_REGEX, 
    message: "パスワードは半角英字と半角数字それぞれ1文字以上含める必要があります。", 
  }
  validates_length_of :password, in: 8..32, message: "パスワードは8文字以上32文字以下に設定してください。"
  validates_confirmation_of :password, allow_blank: true
  
end
