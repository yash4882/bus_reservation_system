class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  has_many :passengers, dependent: :delete_all
  has_many :reviews
  # has_many :passengers, -> { order(name: :desc) }
  
  # it is use for cocoon gem
  accepts_nested_attributes_for :passengers, allow_destroy: true
  
  after_create :seat_allocated

  def seat_allocated 
    return puts "There is no seat available" if bus.allocated_seat == bus.total_seat
    seats = ['0','1','2','3','4']
    all_seats = []
    ('A'..'O').each do |i|
      (1..seats.length-1).each do |j|
        all_seats.push(i+seats[j])
      end
    end
    allocated_seats = self.bus.tickets.map {|t| t.passengers.pluck(:seat)}.flatten.compact 
    passengers.each do |passenger|
      passenger.seat = get_seat(all_seats, allocated_seats)
      passenger.save
      allocated_seats.push(passenger.seat)
      bus.allocated_seat += 1
      bus.save
    end
  end

  def get_seat(seats, assigned)
    available_seat = seats.sample
    while assigned.include?(available_seat)
      available_seat = seats.sample
    end
    return available_seat
  end
end

