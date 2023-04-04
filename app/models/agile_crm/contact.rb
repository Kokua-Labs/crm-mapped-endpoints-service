module AgileCrm
  class Contact < ApplicationRecord
    self.table_name = 'agile_crm_contacts'

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
      message: "Formato no válido" }
  end
end