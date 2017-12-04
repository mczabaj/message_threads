class CreateMessageThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :message_threads do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
