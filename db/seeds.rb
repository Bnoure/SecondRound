User.destroy_all
Store.destroy_all
Game.destroy_all
Console.destroy_all


nour = User.create!(first_name: 'Nour', last_name: 'Eddine', role: 1, email: 'test@test.com', password: 123456)
xavier = User.create!(first_name: 'Xavier', last_name: 'Lefaou', role: 0, email: 'test2@test.com', password: 123456)
emma = User.create!(first_name: 'Emma', last_name: 'Puget', role: 1, email: 'test3@test.com', password: 123456)
puts '3 users created'

superthor = Store.create!(name: 'superThor', city: 'Toulouse', address: '36 chemin du vallon, Toulouse', user_id: nour.id, open_hour: 9 , close_hour: 22)
tekkenstore = Store.create!(name: 'TekkenStore', city: 'Strasbourg', address: '3 rue Sarrelouis, Strasbourg', user_id: emma.id, open_hour: 8, close_hour: 18)
storetoulouse = Store.create!(name: 'StoreToulouse', city: 'Toulouse', address: '8 impasse Bonnet, Toulouse ', user_id: nour.id, open_hour: 8, close_hour: 18)
puts '3 stores created'

url = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/201px-Playstation_logo_colour.svg.png"
file =  URI.open(url)

ps1 = Console.create!(name: 'PS1')
ps1.picture.purge if ps1.picture.attached?
ps1.picture.attach(io: file, filename: "PS1.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Master_System_Logo.svg/345px-Master_System_Logo.svg.png"
file =  URI.open(url)

master_system = Console.create!(name: 'master system')
master_system.picture.purge if master_system.picture.attached?
master_system.picture.attach(io: file, filename: "master_system.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Nintendo_DS_Logo.svg/1127px-Nintendo_DS_Logo.svg.png"
file =  URI.open(url)

ds = Console.create!(name: 'DS')
ds.picture.purge if ds.picture.attached?
ds.picture.attach(io: file, filename: "DS.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/2048px-Xbox_one_logo.svg.png"
file =  URI.open(url)

xbox = Console.create!(name: 'Xbox')
xbox.picture.purge if xbox.picture.attached?
xbox.picture.attach(io: file, filename: "Xbox.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Nintendo_switch_logo.png/640px-Nintendo_switch_logo.png"
file =  URI.open(url)

switch = Console.create!(name: 'Switch')
switch.picture.purge if switch.picture.attached?
switch.picture.attach(io: file, filename: "Switch.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Game_Boy_Color_Logo.svg/1280px-Game_Boy_Color_Logo.svg.png"
file =  URI.open(url)

gameboy_color = Console.create!(name: 'Gameboy Color')
gameboy_color.picture.purge if gameboy_color.picture.attached?
gameboy_color.picture.attach(io: file, filename: "Gameboy_color.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/GC_Logo.svg/1200px-GC_Logo.svg.png"
file =  URI.open(url)

gamecube = Console.create!(name: 'Game Cube')
gamecube.picture.purge if gamecube.picture.attached?
gamecube.picture.attach(io: file, filename: "Game_cube.jpg", content_type: "image/png")


# url = ""
# file =  URI.open(url)

# ps1 = Console.create!(name: '')
# ps1.picture.purge if ps1.picture.attached?
# ps1.picture.attach(io: file, filename: ".jpg", content_type: "image/png")

puts '7 consoles created'




Game.create!(title: 'Alex kidd', category: 'Plateforme', price: 16, console: master_system, description: 'trop cool', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Tekken 3', category: 'Parking', price: 13, console: ps1, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1998, condition: 'vieux', store_id: superthor.id)
Game.create!(title: 'Rocket league', category: 'Course', price: 15, console: switch, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Dark soul', category: 'Jeu de bonhomme', price: 136, console: xbox, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Final fantasy', category: 'RPG', price: 257, console: xbox, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Minecraft', category: 'Aventure cubique', price: 25, console: gameboy_color, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Pokemon', category: 'Aventure', price: 23, console: ds, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Soul calibur', category: 'Bagarre', price: 87, console: gamecube, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Barbie fait la vaisselle', category: 'simlutaion réaliste', price: 55, console: switch, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Animal crossing', category: 'jeu de meufs', price: 23, console: switch, description: 'Meilleur jeu ever', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'ninten dogs', category: 'Jeu', price: 56, console: master_system, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Mario kart', category: 'Course', price: 32, console: ds, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: storetoulouse.id)
puts '12 games created'
