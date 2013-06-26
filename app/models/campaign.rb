class Campaign < ActiveRecord::Base
  has_many :keywords, dependent: :destroy
  has_many :sheets, dependent: :destroy
  
  validates :name, presence: true
  
  def total_clicks_per_day
    keywords.where(accepted: true).pluck(:clicks_per_day).sum.to_i
  end
end
