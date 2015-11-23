if Rails.env.production?
  AWSSDK.configure do |config|
    config.paperclip_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.paperclip_directory     =  ENV['S3_BUCKET']
  end
end