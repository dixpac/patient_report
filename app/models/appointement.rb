class Appointement < ActiveRecord::Base
  belongs_to :patient
  has_many :appointement_indicators

  validates :patient_id, presence: true

  accepts_nested_attributes_for :appointement_indicators
end
