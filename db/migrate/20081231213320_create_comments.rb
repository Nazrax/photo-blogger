class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commentable_type
      t.references :commentable
      t.text :content
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
