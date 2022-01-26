# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_url_of(:url) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  describe 'on create' do
    let(:link) { create(:link) }

    it { expect(link).to be_valid }

    it 'creates slug' do
      expect(link.slug).to be_present
    end
  end

  describe '#generate_slug' do
    let(:link) { build(:link) }

    subject { link.generate_slug }

    it { is_expected.to be_present }
  end
end
