class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :from
      t.string :to
      t.decimal :buy, :precision => 5, :scale => 2
      t.decimal :sell, :precision => 5, :scale => 2

      t.timestamps
    end
  end
end
