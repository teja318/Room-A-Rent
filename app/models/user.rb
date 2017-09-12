class User < ActiveRecord::Base
	belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

      # before_create :assign_role


      # private
      # def assign_role
      # 	self.role_id = role.last
      #  end
end
