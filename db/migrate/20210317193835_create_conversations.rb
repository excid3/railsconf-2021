class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :subject
      t.belongs_to :contact

      t.timestamps
    end
  end
end
