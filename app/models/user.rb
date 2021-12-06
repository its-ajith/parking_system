# frozen_string_literal: true

class User < ApplicationRecord
  has_one :park_system
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true, length: { minimum: 6, maximum: 15 }
  validates :confirmation_password, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  before_create :confirm_password

  def hash_passwords
    self.password = Digest::SHA1.hexdigest(password)
    self.confirmation_password = Digest::SHA1.hexdigest(password)
  end

  def confirm_password
    if password == confirmation_password
      User.create
      hash_passwords
    else
      error.message("Password doesn't match")
    end
  end
end
