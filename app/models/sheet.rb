class Sheet < ActiveRecord::Base
  belongs_to :campaign
  
  mount_uploader :spreadsheet, SpreadsheetUploader
end
