class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [ 512, 512 ]

  def extensions_allowlist
    %w[jpg jpeg gif png svg svgz]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("avatars/default_avatar.svg")
  end
end
