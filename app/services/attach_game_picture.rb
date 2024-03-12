require "open-uri"
class AttachGamePicture
#   def initialize(attributes = {})
#     @client = OpenAI::Client.new
#     @game = attributes[:game]
#   end

#   def call
#     get_game_picture
#   end

#   private

#   def get_game_picture
#     response = @client.images.generate(parameters: {
#                                          prompt: "Retournes moi la pochette exacte de #{@game.title} sur #{@game.console.name}",
#                                          size: "512x512"
#                                        })

#     url = response["data"][0]["url"]
#     file = URI.open(url)

#     @game.picture.attach(io: file, filename: "#{@game.title}_image.jpg", content_type: "image/png")
#   end
# end
