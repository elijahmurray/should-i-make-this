class Product < ApplicationRecord
  TYPES = %w(mobile_app, website, browser_extension, physical_product, voice app)
  STAGES = [
    "Idea", 
    "Wireframes",
    "Mockups", 
    "Clickable Prototype",
    "Development in Progress",
    "Launch Ready",
    "Launched"
    ]
end
