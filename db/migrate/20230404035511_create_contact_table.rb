class CreateContactTable < ActiveRecord::Migration[7.0]
  def change
    create_table :agile_crm_contacts do |t|

      t.timestamps
    end
  end
end
