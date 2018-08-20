class AddingTimestampsToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :created_at, :datetime, default: Time.zone.now, null: false
    add_column :stocks, :updated_at, :datetime, default: Time.zone.now, null: false
  end
end
