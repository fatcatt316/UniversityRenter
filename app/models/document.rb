class Document < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :user
  validates_uniqueness_of :primary, :scope => [:owner_id, :owner_type], :if => :primary?
  
  has_attached_file :doc, 
    :styles => { :medium => "200x200>", :thumb => "70x70#" }, # use # to make it at least that size
    :default_style => :medium
  #  :url  => "/avatars/:id/:style/:basename.:extension", #place in public
  #  :default_url => "missing.png"#,
    #:path => ":rails_root/public/avatars/:id/:style/:basename.:extension"
  validates_attachment_presence :doc
  validates_attachment_size :doc, :less_than => 5.megabytes
  validates_attachment_content_type :doc, :content_type => ['image/jpeg', 'image/png', 'image/gif',
    'image/pjpeg', 'image/x-png'], 
    :message => "must be one of these image types: JPG, PNG, or GIF"    
  
  before_post_process :image?

  
  def to_s
    return title ? title : doc_file_name
  end
  
  
  def image?
    !(doc_content_type.to_s =~ /^image.*/).nil?
  end
  
  
  def thumbnail_url
    return image? ? doc.url(:thumb) : "document_50x50.gif"
  end
  
  def normal_url
    return image? ? doc.url(:medium) : "document_100x100.gif"
  end
end
