class AppointementIndicator < ActiveRecord::Base
  belongs_to :appointement
  belongs_to :indicator
end
