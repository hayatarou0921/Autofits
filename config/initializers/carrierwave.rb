CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAZGW7YQFZRUMBQHR7',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'autfits'
  config.cache_storage = :fog
end
