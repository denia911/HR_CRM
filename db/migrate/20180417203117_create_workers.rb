class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.text :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end