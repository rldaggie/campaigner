require 'csv'

class Sheet < ActiveRecord::Base
  belongs_to :campaign
  
  mount_uploader :spreadsheet, SpreadsheetUploader
  
  after_create :generate_keywords!
  
  def generate_keywords!
    keyword_names = campaign.keywords.pluck(:name)
    CSV.foreach(spreadsheet.current_path, headers: true) do |row|
      if can_add_row?(row, keyword_names)
        campaign.keywords.create(name: row['Keyword'], cost_per_click: row['Average CPC'].to_f, clicks_per_day: row['Clicks'].to_f)
      end
    end
  end
  
  def can_add_row?(row, keyword_names)
    return false unless row['Keyword'].present? && !keyword_names.include?(row['Keyword'])
    return false unless row['Average CPC'].to_f <= 2
    return false unless row['Clicks'].to_f > 0
    true
  end
end
