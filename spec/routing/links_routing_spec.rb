# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksController, type: :routing do
  describe 'routing' do
    it 'routes to #redirect_to_url' do
      expect(get: '/google').to route_to('links#redirect_to_url', slug: 'google')
    end

    it 'routes to #index' do
      expect(get: '/links').to route_to('links#index')
    end

    it 'routes to #show' do
      expect(get: '/links/1').to route_to('links#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/links').to route_to('links#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/links/1').to route_to('links#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/links/1').to route_to('links#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/links/1').to route_to('links#destroy', id: '1')
    end
  end
end
