puts "chuis la"

namespace :cloudinary do
  puts "cloudiii"
  task :destroy_all => :environment do
    public_ids = get_ids
    until public_ids.size <= 1
      public_ids = get_ids
      result = Cloudinary::Api.delete_resources(
        public_ids,
        cloud_name: ENV['cloud_name'],
        api_key: ENV['api_key'],
        api_secret: ENV['api_secret']
      )
      # puts result
      # puts "true"
    end
    puts "=" * 40
    puts "Cloudinary is cleaned up."
    unless public_ids.size <= 1
      puts "-" * 40
      puts "Deleted resources:"
      public_ids.each { |id| puts id }
    end
    puts "=" * 40
  end

  task :count => :environment do
    puts "Cloudinary image count: #{get_ids.size - 1}"
  end

  def get_ids
    public_ids = Cloudinary::Api.resources(
      type: :upload,
      cloud_name: ENV['cloud_name'],
      api_key: ENV['api_key'],
      api_secret: ENV['api_secret']
    )['resources'].map { |h| h['public_id']}
  end
end
