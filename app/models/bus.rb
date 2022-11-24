class Bus < ApplicationRecord
  validates :manager_id, presence: true
  validates :bus_number, presence: true, uniqueness: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :bus_type, presence: true
  has_many :tickets
end
