class Event < ApplicationRecord
  belongs_to :locality

  has_many :category_events
  has_many :categories, through: :category_events

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  belongs_to :promoter, class_name:'User'
end
