class Ticket < ApplicationRecord
	belongs_to :user
	belongs_to :bus
	has_many :passengers
	accepts_nested_attributes_for :passengers, allow_destroy: true
end
# reject_if: :all_blank, 