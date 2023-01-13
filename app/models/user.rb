class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # ,authentication_keys: [:username]
  rolify
  validates :name, presence: true
  # validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates :password, presence: true
  # validates :contact, numericality: {message: "Please Enter numerical value"},length: { minimum: 10, maximum:12 }
  # validates :age, numericality: { message: "%{value} seems wrong" }
  # validates :gender, presence: true
  # validates :role_id, presence: true
  # validates :status, presence: true
  after_create :add_user_role
  has_many :tickets
  has_many_attached :images
  STATUSES = ['Pending', 'Approved', 'Rejected']
  after_initialize :init


  def init
    self.status ||= STATUSES[0]
  end

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(contact) = :value OR lower(email) = :value",{ value: login.strip.downcase}]).first
  end

  private
  def add_user_role
    role = Role.find_by(id: role_id)
    self.add_role role.name.to_sym
  end
end

