class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.references :parent
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
