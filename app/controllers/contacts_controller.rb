class ContactsController < ApplicationController
  def create_contact
    Contacts::CreateService.call(contact_emailx)
  end

  private

  def permitted_params
    params.permit(:contact_email)
  end

  def contact_email
    permitted_params.fetch(:contact_email)
  end
end
