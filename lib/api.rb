require 'twitter'
require 'open-uri'

class API
  def initialize
    @client = Twitter::Client.new do |config|
      config.consumer_key = ' ivmzp1qwBYs6iVxKRm5X71Lld'
      config.consumer_secret = ' FMEgUMiShr0iptmhurxJvfeGkz8XYyJYiXg6vMWIzNM77mcyVl'
      config.access_token = ' 1368890304586203136-vdbS7PR1lkbD3So5LAiLk49vaU0VuA'
      config.access_token_secret = ' EsluKXSpgQij2bDeM6nyoWB5Gtn1nzqOOA2VkQ0DTFFVj '
    end
  end

  def post_meme(meme)
    title = meme[0].to_s
    link = meme[1].to_s
    link = link.delete('["]')
    if link.include?('https')
      URI.open(link) do |image|
        File.open('./meme.jpg', 'wb') do |file|
          file.write(image.read)
        end
      end
      @client.update_with_media(title.to_s, File.open('./meme.jpg', 'r+'))
      true
    else
      'Argument provided is not a link'
    end
  end
end
