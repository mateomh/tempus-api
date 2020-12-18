class Task < ApplicationRecord
  validates :desc, presence: true
  validates :time, numericality: true

  belongs_to :user
  belongs_to :category
end
