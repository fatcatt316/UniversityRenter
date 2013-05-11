class Listing < ActiveRecord::Base
  belongs_to :ad_status
  belongs_to :community
  belongs_to :college
  belongs_to :creator, :class_name => "User"
  belongs_to :preferred_gender, :class_name => "Gender"
  
  has_one :address, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :address, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  has_many :ad_features, :as => :subject, :dependent => :destroy
  has_many :features, :through => :ad_features
  
  has_many :documents, :as => :owner, :dependent => :destroy
  accepts_nested_attributes_for :documents, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  validates_presence_of :title, :college
  validates_presence_of :price_per_month, :address, :available_on, :if => :for_rent?
  validate :contact_email_or_contact_phone
  
  def to_s
    return title
  end
  
  def to_title
    "#{college} | #{self}"
  end
  
  
  def primary_document
    return documents.select{|d| d.primary}.first
  end
  
  
  def images(options={})
    pictures = self.documents.select(&:image?)
    pictures.sort!{|a,b| a.primary? <=> b.primary?} if options[:primary_first]
    return pictures
  end
  
  
  def approved?
    return "Approved" == ad_status.to_s
  end
  
  
  def editable?(user=nil)
    return self.new_record? || (user && (user.admin? || self.creator_id == user.id))
  end
  
  
  def destroyable?(user=nil)
    return (user && (user.admin? || self.creator_id == user))
  end
  
  
  def for_rent?
    return !self.wanted?
  end
  
  
  def has_feature?(feature)
    @ad_feature_ids = self.ad_features.map(&:feature_id)
    return @ad_feature_ids.include?(feature.id)
  end
  
  
  # TODO: Use accepts_nested_attributes instead of something like this
  def update_features(feature_ids=[])
    existing_ad_features = self.ad_features
    existing_ad_features.select{|ad_feature| !feature_ids.include?(ad_feature.feature_id)}.each &:destroy
    feature_ids.each do |feature_id|
      ad_feature = existing_ad_features.find_by_feature_id(feature_id)
      ad_feature ||= self.ad_features.create(:feature_id => feature_id)
    end
  end
  
  def self.search(options={})
    joins = []
    listing_search = self
    
    unless options[:show_all]
      listing_search = listing_search.where(ad_status_id: AdStatus.approved)
    end
    if options[:college_id]
      listing_search = listing_search.where(college_id: options[:college_id])
    end
    if options[:community_id]
      listing_search = listing_search.where(community_id: options[:community_id])
    end
    
    options[:order] ||= "created_at DESC"
    listing_search = listing_search.order(options[:order])
    
    return listing_search
  end
  
  
  private
  
  def contact_email_or_contact_phone
    if self.contact_email.blank? && self.contact_phone.blank?
      errors.add_to_base("Fill in an email or phone number where people can reach you, por favor")
    end
  end
end
