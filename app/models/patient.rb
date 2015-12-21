class Patient < ActiveRecord::Base
  has_many :appointements

  def name
    "#{first_name} #{last_name}"
  end
end
