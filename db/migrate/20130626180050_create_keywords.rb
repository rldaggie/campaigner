class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :name
      t.decimal :cost_per_click, precision: 8, scale: 2
      t.decimal :clicks_per_day, precision: 8, scale: 2
      t.integer :campaign_id

      t.timestamps
    end
    add_index :keywords, :campaign_id
  end
end
