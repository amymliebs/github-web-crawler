class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :language, default: 'NA'
      t.string :contributors, null: false
      t.timestamps
    end
  end
end
