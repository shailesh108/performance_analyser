class AddTotalResultToResults < ActiveRecord::Migration
  def change
    add_column :results, :total_result, :integer
  end
end
