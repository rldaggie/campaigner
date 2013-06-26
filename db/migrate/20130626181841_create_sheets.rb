class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :spreadsheet
      t.integer :campaign_id

      t.timestamps
    end
    add_index :sheets, :campaign_id
  end
end
