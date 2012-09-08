class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.string :name
      t.references :college
      t.decimal :price_per_month, :precision => 7, :scale => 2
      t.text :description
      t.string :email
      t.string :phone
      t.string :fax
      t.string :external_url
      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end
end
