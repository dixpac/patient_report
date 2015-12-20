class Patient < ActiveRecord::Base
  has_many :appointements

end
