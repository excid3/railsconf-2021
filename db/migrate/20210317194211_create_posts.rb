class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :conversation, null: false, foreign_key: true
      t.belongs_to :author, polymorphic: true
      t.string :message_id

      t.timestamps
    end
  end
end
