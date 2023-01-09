class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendees
  has_many :attendees, through: :event_attendees, source: :user

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now ) }

  

  validates :title, :body, :location, :date, presence: true
  validates :title, length: { maximum: 50 }
  validates :location, length: { maximum: 50 }
  validates :body, length: { maximum: 5000 }
end