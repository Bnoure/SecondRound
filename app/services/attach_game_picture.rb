require "open-uri"
class AttachGamePicture
  def initialize(attributes = {})
    @game = attributes[:game]
    @api_key = ENV.fetch("GIANT_BOMB_API_KEY")
  end

  def call
    img = search_game(@game.english_title)
    file = URI.open(img)
    @game.picture.attach(io: file, filename: "#{@game.title}.jpg", content_type: "image/jpg")
  end

  private

  def search_game(name)
    url = "https://www.giantbomb.com/api/search/?api_key=#{@api_key}&format=json&query=#{name}&resources=game"
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    data.dig("results", 0, "image", "medium_url")
  end
end
