class AvatarUploader < CarrierWave::Uploader::Base
 
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("user.png")
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end
