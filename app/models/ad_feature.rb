class AdFeature < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :feature
end
