# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :user, optional: true

  validates :url, url: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, if: -> { slug.blank? }

  def generate_slug
    self.slug = SecureRandom.alphanumeric(8)
  end
end
