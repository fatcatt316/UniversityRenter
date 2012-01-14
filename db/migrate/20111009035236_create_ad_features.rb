class CreateAdFeatures < ActiveRecord::Migration
  def self.up
    create_table :ad_features do |t|
      t.integer :subject_id
      t.string :subject_type
      t.references :feature
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ad_features
  end
end
