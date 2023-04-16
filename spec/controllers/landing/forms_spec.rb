require 'rails_helper'

RSpec.describe Landing::FormsController, type: :controller do
  describe '#data' do
    describe 'route' do
      it 'POST /landing/forms' do
        binding.pry
        expect(post: 'landing/forms').to route_to(
          controller: 'landing/forms',
          action: 'data'
        )
      end
    end

    it 'calls the Decider Service' do
      post :data
    end
  end
end
