class User < ApplicationRecord
    before_save { self.email = email.downcase }
    
    validates :name, presence: true, length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    # test "password should be present (nonblank)" do
    #     @user.password = @user.password_confirmation = " " * 6
    #     assert_not @user.valid?
    #     end
    #     test "password should have a minimum length" do
    #     @user.password = @user.password_confirmation = "a" * 5
    #     assert_not @user.valid?
    #     end
     
end
