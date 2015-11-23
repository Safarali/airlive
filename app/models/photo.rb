class Photo < ActiveRecord::Base
  belongs_to :room

  has_attached_file :image, 
                          :styles => { medium: "300x300>", thumb: "100x100>" }
                          :storage => :s3,
                          :bucket => S3_BUCKET_NAME,
                          :s3_credentials => S3_CREDENTIALS
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
