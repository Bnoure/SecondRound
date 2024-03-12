class GetGameInfos
  REGEX = /Nom: (?<title>[^\n]+)\s*Année de sortie en France: (?<year>[^\n]+)\s*Console: (?<console>[^\n]+)\s*Description courte: (?<description>[^\n]+)\s*Catégorie: (?<category>[^\n]+)/

  def initialize(attributes = {})
    @game_user_photo = attributes[:game_user_photo]
    @client = OpenAI::Client.new
  end

  def call
    get_game_infos
  end

  private

  def get_game_infos
    encoded_img = encode_img
    text = "Sous forme de clé valeur, retourne moi nom, année de sortie en France, console, description courte et catégorie du jeu présent sur cette photo"
    messages = [
      { type: "text", text: text},
      { type: "image_url",
        image_url: {
          url: "data:image/jpeg;base64,#{encoded_img}"
        } }
    ]
    response = @client.chat(
      parameters: {
        model: "gpt-4-vision-preview", # Required.
        messages: [{ role: "user", content: messages }],
        temperature: 0.1,
        max_tokens: 800 # Required.
      }
    )
    result = response.dig("choices", 0, "message", "content")
    sanitized_result = result.squish.gsub("\"", "")
    sanitized_result.match(REGEX)
    # => "The image depicts a serene natural landscape featuring a long wooden boardwalk extending straight ahead"
  end

  def encode_img
    file_content = File.read(@game_user_photo.tempfile)
    Base64.strict_encode64(file_content)
  end
end
