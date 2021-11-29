class User < ApplicationRecord
    has_one :parkingsystem
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, uniqueness: true, confirmation: true, length: { minimum: 2, maximum: 15}
    validates :password_confirmation, presence: true

    before_create :confirm_password, :hash_password



    def hash_password
    
        self.password = Digest::SHA1.hexdigest(password)
    end

    def confirm_password
        if self.password == self.password_confirmation
            User.create
        else
            error.message("Password doesn't match")
        end             
    end

end
