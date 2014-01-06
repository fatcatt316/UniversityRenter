class Document < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :user
  validates_uniqueness_of :primary, scope: [:owner_id, :owner_type], if: :primary?
  
  has_attached_file :doc,
    # storage: :s3,
    #     s3_credentials: {
    #       :bucket => ENV['AWS_BUCKET'],
    #       :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    #       :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    #     },
    path: '/:class/:attachment/:id_partition/:style/:filename',
    styles: { medium: "200x200>", thumb: "70x70#" }, # use # to make it at least that size
    default_style: :medium

  validates_attachment_presence :doc
  validates_attachment_size :doc, less_than: 5.megabytes
  validates_attachment_content_type :doc, content_type: ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg', 'image/x-png'],
    message: "must be one of these image types: JPG, PNG, or GIF"
  
  before_post_process :image?

  
  def to_s
    title ? title : doc_file_name
  end
  
  def image?
    !(doc_content_type.to_s =~ /^image.*/).nil?
  end
  
  def thumbnail_url
    image? ? doc.url(:thumb) : "document_50x50.gif"
  end
  
  def normal_url
    image? ? doc.url(:medium) : "document_100x100.gif"
  end
end
