class User < ApplicationRecord
  rolify
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :contact, numericality: {message: "Please Enter numerical value"},length: { minimum: 10, maximum:12 }
  validates :age, numericality: { message: "%{value} seems wrong" }
  validates :gender, presence: true
  validates :role_id, presence: true
  # validates :status, presence: true
  after_create :add_user_role
  has_many :tickets


  private
  def add_user_role
    role = Role.find_by(id: role_id)
    self.add_role role.name.to_sym
  end
end

