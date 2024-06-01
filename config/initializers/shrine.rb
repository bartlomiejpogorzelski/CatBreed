require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
  bucket: ENV['WASABI_BUCKET'],
  region: ENV['WASABI_REGION'],
  access_key_id: ENV['WASABI_ACCESS_KEY_ID'],
  secret_access_key: ENV['WASABI_SECRET_ACCESS_KEY'],
  endpoint: 'https://s3.eu-central-2.wasabisys.com'
}

permanent_storage = if Rails.env.development? || Rails.env.test?
  Shrine::Storage::FileSystem.new("public", prefix: "uploads")
else
  Shrine::Storage::S3.new(**s3_options)
end

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: permanent_storage
}

Shrine.plugin :activerecord
Shrine.plugin :derivatives
Shrine.plugin :determine_mime_type
Shrine.plugin :validation_helpers
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
