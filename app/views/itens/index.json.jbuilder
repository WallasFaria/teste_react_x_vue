# frozen_string_literal: true

json.array! @itens, partial: 'itens/item', as: :item
