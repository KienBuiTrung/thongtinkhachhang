class DeniedCustomer < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :name, presence: true
  validates :id_no, presence: true, uniqueness: true
  validates :cif, uniqueness: true
  validates :amount, presence: true
  validates :purpose, presence: true
  validates :explaination, presence: true
  validates :user_id, presence: true
  
end
