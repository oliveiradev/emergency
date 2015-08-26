class User < ActiveRecord::Base
  validates :name , :cpf , :birth , :password , presence: true
  validates :cpf , uniqueness: true

  has_many :occurrences
end
