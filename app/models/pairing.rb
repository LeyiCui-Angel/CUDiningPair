class Pairing < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :users
  validates :target_number_of_people, numericality: { only_integer: true, greater_than_or_equal_to: 2 }, presence: true
  def update_current_number_of_people
    update_column(
      :current_number_of_people,
      users.count
    )
  end

  validate :meeting_time_at_least_one_hour_later_than_current, on: [:create, :update]
  private

  def meeting_time_at_least_one_hour_later_than_current
    return unless meeting_time
  
    if meeting_time <= Time.current + 59.minutes
      errors.add(:meeting_time, "must be at least one hour later than the current time")
    end
  
  end
end