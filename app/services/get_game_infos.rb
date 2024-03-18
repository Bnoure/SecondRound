class GetGameInfos
  REGEX = /Nom: (?<title>[^\n]+)\s*Nom du jeu en anglais: (?<english_title>[^\n]+)\s*Année de sortie en France: (?<year>[^\n]+)\s*Description courte: (?<description>[^\n]+)\s*Catégorie: (?<category>[^\n]+)/
  def initialize(attributes = {})
    @game_user_photo = attributes[:game_user_photo]
    @client = OpenAI::Client.new
  end

  def call
    get_game_infos
  end

  private

  def get_game_infos
    text = "Sous forme de clé valeur, retourne moi nom, nom du jeu en anglais, année de sortie en France, description courte et catégorie du jeu présent sur cette photo. Il faut une seule catégorie de jeu"
    messages = [
      { type: "text", text: text},
      { type: "image_url",
        image_url: {
          url: "data:image/jpeg;base64,#{@game_user_photo}"
        } }
    ]
    response = @client.chat(
      parameters: {
        model: "gpt-4-vision-preview",
        messages: [{ role: "user", content: messages }],
        temperature: 0.1,
        max_tokens: 800
      }
    )
    result = response.dig("choices", 0, "message", "content")
    sanitized_result = result.squish.gsub("\"", "")
    sanitized_result.match(REGEX)
  end
end
