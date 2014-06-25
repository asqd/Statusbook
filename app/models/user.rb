class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses, dependent: :destroy

  validates :first_name, presence: true

  validates :last_name, presence: true
  
  validates :profile_name, presence: true, 
                          uniqueness: true,
                          format: { with: /\A[a-zA-Z][a-zA-Z0-9_-]\z/, 
                          message: "must contains use only letters, '-' or '_'."}

  def full_name
  	"#{first_name} #{last_name}"  	
  end
end
