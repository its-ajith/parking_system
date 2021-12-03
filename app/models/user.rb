class User < ApplicationRecord
    has_one :park_system
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, uniqueness: true, length: { minimum: 2, maximum: 15}
    validates :confirmation_password, presence: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    before_create :confirmation_password, :hash_password



    def hash_password
    
        self.password = Digest::SHA1.hexdigest(password)
    end

    def confirm_password
        if self.password == self.confirmation_password
            User.create
        else
            error.message("Password doesn't match")
        end             
    end

end
