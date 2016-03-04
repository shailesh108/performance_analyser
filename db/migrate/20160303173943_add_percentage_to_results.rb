class AddPercentageToResults < ActiveRecord::Migration
  def change
    add_column :results, :percentage, :integer
  end
end
