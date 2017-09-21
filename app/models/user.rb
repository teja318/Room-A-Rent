class User < ActiveRecord::Base
  has_many :reviews
  has_many :rooms
  has_many :bookings
	belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

      before_create :assign_role
      
      def role?(role)
        self.role.name == role
      end  
      private
      def assign_role
      	self.role_id = Role.last.id
       end
end
