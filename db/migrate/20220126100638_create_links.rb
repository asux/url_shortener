# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true
      t.string :url
      t.string :slug, unique: true
      t.integer :redirects, default: 0

      t.timestamps
    end

    add_index :links, :slug, unique: true
  end
end
