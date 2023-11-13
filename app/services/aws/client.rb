module Aws
  class Client

    def initialize
      @client = Aws::S3::Client.new(
        region: 'us-east-1',
        access_key_id: ENV['AWS_ACTIVE_STORAGE_ACCESS_KEY'],
        secret_access_key: ENV['AWS_ACTIVE_STORAGE_SECRET_KEY']
      )
    end

    def get_file(file_path, bucket_name, key)
      @client.get_object(
        response_target: file_path,
        bucket: bucket_name,
        key: key
      )
    end
  end
end