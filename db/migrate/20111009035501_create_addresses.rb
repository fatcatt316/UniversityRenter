class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string     :subject_type
      t.integer    :subject_id
      t.string     :line1
      t.string     :city
      t.references :state
      t.string     :zip
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
