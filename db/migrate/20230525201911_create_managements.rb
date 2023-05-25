class CreateManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :managements do |t|
      t.date :date
      t.text :time
      t.text :description
      t.text :owner
      t.text :category
      t.date :due_date
      t.text :status
      t.text :notes

      t.timestamps
    end
  end
end
