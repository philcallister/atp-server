class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.references :position
      t.date       :date
      t.string     :comment
      t.string     :action

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
