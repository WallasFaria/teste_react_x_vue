# frozen_string_literal: true

class Produto < ApplicationRecord
  has_many_attached :imagens
end
