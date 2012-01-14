class CreateColleges < ActiveRecord::Migration
  def self.up
    create_table :colleges do |t|
      t.string :name 
      t.string :short_name
      t.string :mascot
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :colleges
  end
end
