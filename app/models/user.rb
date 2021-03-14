class User < ApplicationRecord
  has_one :token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def after_database_authentication
    @user = self
    @token = @user.token
    Auth.call(@user, @token)
  end
end
