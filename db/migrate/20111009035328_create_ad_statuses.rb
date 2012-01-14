class CreateAdStatuses < ActiveRecord::Migration
  def self.up
    create_table :ad_statuses do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :ad_statuses
  end
end
