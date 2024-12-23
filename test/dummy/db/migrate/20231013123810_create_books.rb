# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.integer :category_id

      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
