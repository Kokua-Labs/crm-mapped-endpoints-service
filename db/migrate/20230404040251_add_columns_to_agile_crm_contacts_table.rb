class AddColumnsToAgileCrmContactsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :agile_crm_contacts, :email, :sring
  end
end
