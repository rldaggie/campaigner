class Campaign < ActiveRecord::Base
  has_many :keywords, dependent: :destroy
  has_many :sheets, dependent: :destroy
  
  validates :name, presence: true
end
