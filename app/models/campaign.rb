class Campaign < ActiveRecord::Base
  has_many :keywords, dependent: :destroy
  
  validates :name, presence: true
end
