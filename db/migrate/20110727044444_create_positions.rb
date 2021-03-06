class CreatePositions < ActiveRecord::Migration

  def self.up
    create_table :positions do |t|
      t.date    :date_open
      t.date    :date_closed
      t.boolean :active
      t.string  :ticker
      t.string  :price
      t.string  :change
      t.string  :percent
      t.string  :direction
      t.decimal :start_price, :precision => 10, :scale => 4
      t.decimal :max_price, :precision => 10, :scale => 4 # @@@@@ Entered or calculatd???
      t.decimal :scale_in_low_price, :precision => 10, :scale => 4
      t.decimal :scale_in_high_price, :precision => 10, :scale => 4
      t.decimal :scale_out_price, :precision => 10, :scale => 4
      t.string  :report_url

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end

end
