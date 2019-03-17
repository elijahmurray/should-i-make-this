class Product < ApplicationRecord
  acts_as_votable

  belongs_to :user
  has_many :comments
  TYPES = %w(mobile_app website browser_extension physical_product voice_app)
  STAGES = %w(
    Idea
    Wireframes
    Mockups
    Clickable_Prototype
    Development_in_Progress
    Launch_Ready
    Launched
  )
end
