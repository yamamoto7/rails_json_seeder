# frozen_string_literal: true

class CreateUserBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
