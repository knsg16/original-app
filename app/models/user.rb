class User < ActiveRecord::Base
  validates :username,  presence: true, length: { maximum: 50 }
  validates :authority, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :trackable
         
  def is_administrator?
    self.authority == 1
  end
end
