class AddAcceptedToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :accepted, :boolean, default: true
  end
end
