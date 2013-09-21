module SpamSniffer
  extend ActiveSupport::Concern
  
  included do
    validate :check_spamminess, on: :create
  end
  
  attr_accessor :full_name

  def spammy?
    full_name.present?
  end
  
  def check_spamminess
    errors.add(:base, "Are you a spam bot?") if spammy?
  end
end