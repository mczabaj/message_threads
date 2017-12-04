class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :author
      t.string :content
      t.references :message_thread, foreign_key: true
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
