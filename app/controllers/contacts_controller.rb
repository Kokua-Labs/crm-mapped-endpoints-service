class ContactsController < ApplicationController
  def create
    Contacts::CreateService.call(email: contact_email)
  end

  private

  def permitted_params
    params.permit(:contact_email)
  end

  def contact_email
    permitted_params.fetch(:contact_email)
  end
end
