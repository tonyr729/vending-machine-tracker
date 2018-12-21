class CreateSnackMachine < ActiveRecord::Migration[5.1]
  def change
    create_table :snack_machines do |t|
      t.references :snack
      t.references :machine
    end
  end
end
