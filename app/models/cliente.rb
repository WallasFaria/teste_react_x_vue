# frozen_string_literal: true

class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :enderecos
  has_many :pedidos

  with_options presence: true do
    validates :nome
    validates :sobrenome
    validates :email, uniqueness: true
    validates :password, on: :create
    validates :cpf, uniqueness: true
    validates :telefone
  end
end
