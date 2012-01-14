class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :title
      t.string :contact_email
      t.string :contact_phone
      
      t.text :description
      
      t.boolean :wanted, :default => false
      
      t.references :address
      t.references :ad_status
      t.references :college
      t.references :community
      t.references :creator
      t.references :preferred_gender
      
      t.integer :available_bedrooms
      t.integer :total_bedrooms
      t.integer :price_per_month
      
      t.date :available_on
      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
