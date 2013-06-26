class Keyword < ActiveRecord::Base
  belongs_to :campaign
  
  validates :name, presence: true
  validates :cost_per_click, presence: true
  validates :clicks_per_day, presence: true
  validates :campaign_id, presence: true
end
