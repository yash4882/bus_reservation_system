class Bus < ApplicationRecord
  paginates_per 5

  validates :manager_id, presence: true
  validates :bus_number, presence: true, uniqueness: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :bus_type, presence: true
  # validates :price, presence: true
  has_many :tickets
end
