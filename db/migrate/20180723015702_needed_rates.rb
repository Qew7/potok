class NeededRates < ActiveRecord::Migration[5.1]
  def change
    create_table :needed_rates do |t|
      t.string :from
      t.string :to
    end
  end
end
