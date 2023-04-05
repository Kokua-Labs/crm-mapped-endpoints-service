class AddColumnToModelAgileCrmContact < ActiveRecord::Migration[7.0]
  def change
    add_column :agile_crm_contacts, :crm_contact_id, :sring
  end
end
