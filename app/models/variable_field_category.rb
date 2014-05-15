class VariableFieldCategory < ActiveRecord::Base
  belongs_to :user
  has_many :variable_fields

  scope :owned_by_user_or_public, ->(user_id) { where("is_global = 1 OR user_id = ?", user_id)}

  validates :name, presence: true
  validates :rgb, format: { with: /\A[0-9A-F]{0,6}\z/ }
end
