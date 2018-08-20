class RemoveFromStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :timestamps
  end
end
