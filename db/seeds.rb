puts 'Cleaning database...'
User.destroy_all
Store.destroy_all
Game.destroy_all
Console.destroy_all
puts 'Database cleaned'

puts 'Creating users...'
nour = User.create!(first_name: 'Nour', last_name: 'Eddine', role: 1, email: 'test@test.com', password: 123456)
xavier = User.create!(first_name: 'Xavier', last_name: 'Lefaou', role: 0, email: 'test2@test.com', password: 123456)
emma = User.create!(first_name: 'Emma', last_name: 'Puget', role: 1, email: 'test3@test.com', password: 123456)
puts '3 users created'

puts 'Creating stores...'
url = "https://lh3.googleusercontent.com/p/AF1QipMQZqGJFf6q7lrYqf4ITA1EcMMQoA6TkG8l9NPF=s1360-w1360-h1020"
file = URI.open(url)
oldschool = Store.create!(name: 'Old School Games', city: 'Toulouse', address: "11 avenue de l'U.R.S.S, Toulouse", user_id: nour.id, open_hour: 8, close_hour: 18)
oldschool.picture.purge if oldschool.picture.attached?
oldschool.picture.attach(io: file, filename: "oldschool.jpg", content_type: "image/jpg")

url = "https://lh3.googleusercontent.com/p/AF1QipMKYKGwBxprlsjBv1gW4HNVKYb8GuFxb_o5i_bU=s1360-w1360-h1020"
file = URI.open(url)
monde = Store.create!(name: 'Monde Meilleur', city: 'Toulouse', address: '7 rue des Lois, Toulouse', user_id: nour.id, open_hour: 8, close_hour: 19)
monde.picture.purge if monde.picture.attached?
monde.picture.attach(io: file, filename: "monde.jpg", content_type: "image/jpg")

url = "https://lh3.googleusercontent.com/p/AF1QipPYhkzcKbj9LriS-s3YVnE61ItyWOoYn3Y1pNU=s1360-w1360-h1020"
file = URI.open(url)
micromania = Store.create!(name: 'Micromania', city: 'Toulouse', address: '5 rue Saint-Rome, Toulouse', user_id: nour.id, open_hour: 10, close_hour: 20)
micromania.picture.purge if micromania.picture.attached?
micromania.picture.attach(io: file, filename: "micromania.jpg", content_type: "image/jpg")

url = "https://lh5.googleusercontent.com/p/AF1QipNktckhnkVJh0zvunTjTkim3eFV8TCllZtvL7U9=w135-h135-n-k-no"
file = URI.open(url)
superthor = Store.create!(name: 'superThor', city: 'Toulouse', address: '36 chemin du vallon, Toulouse', user_id: nour.id, open_hour: 9 , close_hour: 22)
superthor.picture.purge if superthor.picture.attached?
superthor.picture.attach(io: file, filename: "superthor.jpg", content_type: "image/jpg")

url = "https://lh5.googleusercontent.com/p/AF1QipMVjQM3sZjh8CC5LQ49Gyyohmd3Qw3KyoVtu641=w135-h135-n-k-no"
file = URI.open(url)
tekkenstore = Store.create!(name: 'TekkenStore', city: 'Toulouse', address: '77 Rue Pargaminières, Toulouse', user_id: emma.id, open_hour: 8, close_hour: 19)
tekkenstore.picture.purge if tekkenstore.picture.attached?
tekkenstore.picture.attach(io: file, filename: "tekkenstore.jpg", content_type: "image/jpg")

url = "https://lh5.googleusercontent.com/p/AF1QipOMGrqibOYIvMr0d083aYZL9Po7q9HeGafahLpc=w260-h175-n-k-no"
file = URI.open(url)
storetoulouse = Store.create!(name: 'StoreToulouse', city: 'Toulouse', address: '8 impasse Bonnet, Toulouse ', user_id: nour.id, open_hour: 8, close_hour: 18)
storetoulouse.picture.purge if storetoulouse.picture.attached?
storetoulouse.picture.attach(io: file, filename: "storetoulouse.jpg", content_type: "image/jpg")

puts '6 stores created'

stores = [oldschool, monde, micromania, superthor, tekkenstore, storetoulouse]

puts 'Creating consoles...'

url = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/201px-Playstation_logo_colour.svg.png"
file =  URI.open(url)

ps1 = Console.create!(name: 'PS1')
ps1.picture.purge if ps1.picture.attached?
ps1.picture.attach(io: file, filename: "PS1.jpg", content_type: "image/png")


url = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Master_System_Logo.svg/345px-Master_System_Logo.svg.png"
file =  URI.open(url)

master_system = Console.create!(name: 'Master System')
master_system.picture.purge if master_system.picture.attached?
master_system.picture.attach(io: file, filename: "Master_system.jpg", content_type: "image/png")


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

puts 'Creating games...'

url = "https://image.jeuxvideo.com/medias-sm/162314/1623141873-7316-jaquette-avant.jpg"
file = URI.open(url)
alex = Game.create!(title: 'Alex kidd in miracle world DX', category: 'Plateforme', price: 16, console: switch , description: "Alex Kidd revient ici avec Alex Kidd in Miracle World DX, une nouvelle version du jeu de plateforme en sorti en 1986. Ce nouveau titre apportera de nouveaux graphismes, des niveaux inédits ainsi que des modes de jeu spéciaux pour l'occasion..", year: 2021, condition: Game::CONDITIONS.sample, store_id: superthor.id)
alex.picture.purge if alex.picture.attached?
alex.picture.attach(io: file, filename: "alex.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/ps/f/i/fif7ps0f.jpg"
file = URI.open(url)
final = Game.create!(title: 'Final fantasy 7', category: 'RPG', price: 257, console: ps1, description: "Il s'agit du premier volet de la série à voir le jour sur une console Sony. Ancien SOLDAT et membre du groupe Avalanche, Cloud tentera d'enrayer les plans de la Shinra et devra lutter contre Sephiroth, bouleversé par la découverte de ses origines.", year: 1997, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
final.picture.purge if final.picture.attached?
final.picture.attach(io: file, filename: "final.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00028908/jaquette-barbie-gameboy-g-boy-cover-avant-g.jpg"
file = URI.open(url)
barbie = Game.create!(title: 'Barbie fait la vaisselle', category: 'simlutaion réaliste', price: 55, console: gameboy_color, description: "La poupée Barbie doit se préparer pour son rendez-vous avec Ken. Mais ses habits préférés sont tous éparpillés dans différents niveaux.", year: 1980, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
barbie.picture.purge if barbie.picture.attached?
barbie.picture.attach(io: file, filename: "barbie.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00021333/jaquette-tekken-3-playstation-3-ps3-cover-avant-g.jpg"
file = URI.open(url)
teken3 = Game.create!(title: 'Tekken 3', category: 'Parking', price: 13, console: ps1, description: "Fin du King of Iron Fist Tournament 2. Heihachi a vaincu Kazuya et reprend la tête de Mishima Zaibatsu. Un jour, il entend parler d'un ancien dieu mexicain, Ogre, qui serait attiré par les âmes fortes. Pour l'appâter, Heihachi décide de lancer la troisième édition du tournoi mondialement connu afin que les combattants servent de leurres.", year: 1998, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
teken3.picture.purge if teken3.picture.attached?
teken3.picture.attach(io: file, filename: "teken3.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/163707/1637067503-1899-jaquette-avant.png"
file = URI.open(url)
rocket = Game.create!(title: 'Rocket league', category: 'Course', price: 15, console: switch, description: "Jeu de d'action et de sport, Rocket League vous plonge dans dans des matchs d'arène où votre but sera de marquer des buts. Vous pourrez mettre au point différentes tactiques, soit éviter les attaques des joueurs ennemis pour aller marquer, soit démolir la défense.", year: 2015, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
rocket.picture.purge if rocket.picture.attached?
rocket.picture.attach(io: file, filename: "rocket.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00038463/jaquette-dark-souls-xbox-360-cover-avant-g-1316683581.jpg"
file = URI.open(url)
darksouls = Game.create!(title: 'Dark souls', category: 'Jeu de bonhomme', price: 136, console: xbox, description: " Dans la peau d'un mort-vivant, le joueur doit se battre contre de nombreux types d'ennemis et de boss pour avoir une chance de retourner dans le monde des hommes.", year: 2011, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
darksouls.picture.purge if darksouls.picture.attached?
darksouls.picture.attach(io: file, filename: "darksouls.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/151602/1516023143-3236-jaquette-avant.jpg"
file = URI.open(url)
minecraft = Game.create!(title: 'Minecraft', category: 'Aventure cubique', price: 25, console: switch, description: "Minecraft est un dit 'jeu bac à sable' sur switch, qui permet à l'utilisateur de façonner l'univers qui l'entoure dans les seules limites de son imagination. La version bêta actuelle parachute le joueur dans un monde généré aléatoirement et dynamiquement, où il doit survivre en exploitant les ressources environnantes.", year: 2017, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
minecraft.picture.purge if minecraft.picture.attached?
minecraft.picture.attach(io: file, filename: "minecraft.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/148294/1482936485-1230-jaquette-avant.jpg"
file = URI.open(url)
pokemonjaune = Game.create!(title: 'Pokemon jaune', category: 'Aventure', price: 23, console: gameboy_color, description: "Pokémon Jaune est une version qui complète les deux versions sorties précédemment : Pokémon Rouge et Bleu. C'est la première « troisième version ». Pokémon Jaune est une version intermédiaire entre l'animé et les jeux : plusieurs éléments inspirés de l'animé ont été inclus dans cette version, par exemple le Trio Rocket qui apparaît à certains endroits au détriment de quelques Sbires Rocket.", year: 2000, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
pokemonjaune.picture.purge if pokemonjaune.picture.attached?
pokemonjaune.picture.attach(io: file, filename: "pokemonjaune.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/p2/s/o/soc3p20f.jpg"
file = URI.open(url)
soulcalibur3 = Game.create!(title: 'Soul calibur 3', category: 'Bagarre', price: 87, console: ps1, description: "Les combattants sont tous dotés d'une arme blanche spécifique. Le jeu propose de nombreux modes : une histoire aux multiples embranchements pour chaque personnage, un éditeur de combattant, et un mode Chroniques de l'épée mêlant stratégie et combat dans lequel vous dirigez une petite équipe.", year: 2005, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
soulcalibur3.picture.purge if soulcalibur3.picture.attached?
soulcalibur3.picture.attach(io: file, filename: "soulcalibur3.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/165295/1652946497-8592-jaquette-avant.jpg"
file = URI.open(url)
fable = Game.create!(title: 'Fable', category: 'RPG', price: 20, console: xbox, description: "Fable est un jeu de rôle sur Xbox. Vous incarnez un jeune héros qui doit sauver le royaume d'Albion de la menace des Ténèbres. Pour cela, vous devez traverser de vastes étendues, explorer des donjons et combattre des ennemis variés. Le titre propose un système de choix moraux qui influent sur le déroulement de l'aventure.", year: 2004, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
fable.picture.purge if fable.picture.attached?
fable.picture.attach(io: file, filename: "fable.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/xb/h/l/hlo2xb0f.jpg"
file = URI.open(url)
halo2 = Game.create!(title: 'Halo 2', category: 'FPS', price: 20, console: xbox, description: "Halo 2 est un jeu de tir à la première personne sur Xbox. Vous incarnez le Master Chief, un soldat d'élite de l'UNSC, qui doit repousser l'invasion des Covenants sur Terre. Le jeu propose un mode solo et un mode multijoueur.", year: 2004, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
halo2.picture.purge if halo2.picture.attached?
halo2.picture.attach(io: file, filename: "halo2.jpg", content_type: "image/jpg")

url = "https://upload.wikimedia.org/wikipedia/en/9/99/Sonic_Adventure_2_cover.png"
file = URI.open(url)
sonicadvanture2 = Game.create!(title: 'Sonic Adventure 2', category: 'Plateforme', price: 20, console: gamecube, description: "Sonic Adventure 2 est un jeu de plates-formes sur Gamecube. Vous pouvez incarner Sonic, Tails ou Knuckles dans une aventure qui vous emmènera dans l'espace et sur Terre. Le titre propose de nombreux niveaux et des combats contre des boss.", year: 2002, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
sonicadvanture2.picture.purge if sonicadvanture2.picture.attached?
sonicadvanture2.picture.attach(io: file, filename: "sonicadvanture2.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/ds/m/6/m644ds0f.jpg"
file = URI.open(url)
supermario64 = Game.create!(title: 'Super Mario 64', category: 'Plateforme', price: 25, console: ds, description: "Super Mario 64 est un jeu de plates-formes sur Gamecube. Vous incarnez Mario et devez sauver la princesse Peach des griffes de Bowser. Le jeu propose de nombreux niveaux et des combats contre des boss.", year: 1996, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
supermario64.picture.purge if supermario64.picture.attached?
supermario64.picture.attach(io: file, filename: "supermario64.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/152891/1528906153-7510-jaquette-avant.jpg"
file = URI.open(url)
supersmashbrosultimate = Game.create!(title: 'Super Smash Bros. Ultimate', category: 'Combat', price: 50, console: switch, description: "Super Smash Bros. Ultimate est un jeu de combat sur Switch. Vous pouvez incarner l'un des 74 personnages du jeu, chacun ayant son propre style de combat et son propre arsenal. Le titre propose un mode solo et un mode multijoueur.", year: 2018, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
supersmashbrosultimate.picture.purge if supersmashbrosultimate.picture.attached?
supersmashbrosultimate.picture.attach(io: file, filename: "supersmashbrosultimate.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/149432/1494322310-8900-jaquette-avant.jpg"
file = URI.open(url)
zeldabotw = Game.create!(title: 'The Legend of Zelda : Breath of the Wild', category: 'Action, Aventure', price: 50, console: switch, description: "The Legend of Zelda : Breath of the Wild est un jeu d'action-aventure sur Switch. Vous incarnez Link, un jeune garçon qui doit sauver le royaume d'Hyrule de la menace de Ganon. Pour cela, il doit traverser de vastes étendues et explorer des donjons. Le titre propose une réalisation graphique en cel-shading et un univers coloré.", year: 2017, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
zeldabotw.picture.purge if zeldabotw.picture.attached?
zeldabotw.picture.attach(io: file, filename: "zeldabotw.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/143559/1435587434-3431-jaquette-avant.jpg"
file = URI.open(url)
zeldaot = Game.create!(title: 'The Legend of Zelda : Ocarina of Time', category: 'Action, Aventure', price: 30, console: gamecube, description: "The Legend of Zelda : Ocarina of Time est un jeu d'action-aventure sur Gamecube. Vous incarnez Link, un jeune garçon qui doit sauver le royaume d'Hyrule de la menace de Ganon. Pour cela, il doit traverser de vastes étendues et explorer des donjons. Le titre propose une réalisation graphique en cel-shading et un univers coloré.", year: 1998, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
zeldaot.picture.purge if zeldaot.picture.attached?
zeldaot.picture.attach(io: file, filename: "zeldaot.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/p3/s/o/soc4p30f.jpg"
file = URI.open(url)
soulcalibur4 = Game.create!(title: 'Soul Calibur IV', category: 'Combat', price: 20, console: xbox, description: "SoulCalibur IV commence là où le III s'est arrêté : Siegfried et Nightmare survivent à leur chute et sont prêts à se battre de nouveau pour le contrôle des deux épées légendaires : Soul Edge et SoulCalibur.", year: 2008, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
soulcalibur4.picture.purge if soulcalibur4.picture.attached?
soulcalibur4.picture.attach(io: file, filename: "soulcalibur4.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/149391/1493907906-4936-jaquette-avant.jpg"
file = URI.open(url)
mariokart8 = Game.create!(title: 'Mario Kart 8 Deluxe', category: 'Course', price: 45, console: switch, description: "Mario Kart 8 Deluxe est un jeu de course sur Nintendo Switch. Il s'agit de la version améliorée du jeu sorti sur Wii U. Le titre reprend l'ensemble des circuits et des personnages de Mario Kart 8 en y ajoutant de nouveaux pilotes, de nouveaux véhicules et un mode Battle revisité.", year: 2017, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
mariokart8.picture.purge if mariokart8.picture.attached?
mariokart8.picture.attach(io: file, filename: "mariokart8.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00045131/jaquette-mini-ninjas-adventures-xbox-360-cover-avant-g-1339767249.jpg"
file = URI.open(url)
minininja = Game.create!(title: 'Mini Ninjas', category: 'Action', price: 20, console: ds, description: "Mini Ninjas est un jeu d'action sur DS. Vous incarnez Hiro, un jeune ninja qui doit sauver le monde des griffes du sorcier maléfique Ashida. Pour cela, vous devez traverser de nombreux niveaux et combattre des ennemis variés.", year: 2009, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
minininja.picture.purge if minininja.picture.attached?
minininja.picture.attach(io: file, filename: "minininja.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/151603/1516028323-462-jaquette-avant.jpg"
file = URI.open(url)
zeldatww = Game.create!(title: 'The Legend of Zelda : The Wind Waker', category: 'Action, Aventure', price: 30, console: gamecube, description: "The Legend of Zelda : The Wind Waker est un jeu d'action-aventure sur Gamecube. Vous incarnez Link, un jeune garçon d'une île paisible qui doit combattre le mal pour sauver sa sœur. Pour cela, il doit voyager à travers de vastes étendues d'océan et explorer des îles mystérieuses. Le titre propose une réalisation graphique en cel-shading et un univers coloré.", year: 2003, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
zeldatww.picture.purge if zeldatww.picture.attached?
zeldatww.picture.attach(io: file, filename: "zeldatww.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00009206/jaquette-super-mario-sunshine-gamecube-ngc-cover-avant-g-1361810291.jpg"
file = URI.open(url)
supermariosunshine = Game.create!(title: 'Super Mario Sunshine', category: 'Plateforme', price: 25, console: gamecube, description: "Super Mario Sunshine est un jeu de plates-formes sur Gamecube. Mario débarque sur l'île Delfino pour des vacances bien méritées mais à peine arrivé, il est accusé d'avoir souillé l'île avec de la peinture et doit nettoyer les dégâts avec l'aide de FLUDD, un pistolet à eau parlant. Le jeu propose une grande variété de niveaux et de boss.", year: 2002, condition: Game::CONDITIONS.sample, store_id: tekkenstore.id)
supermariosunshine.picture.purge if supermariosunshine.picture.attached?
supermariosunshine.picture.attach(io: file, filename: "supermariosunshine.jpg", content_type: "image/jpg")


url = "https://image.jeuxvideo.com/images-sm/gc/s/m/smabgc0f.jpg"
file = URI.open(url)
supersmashbrosmelee = Game.create!(title: 'Super Smash Bros. Melee', category: 'Combat', price: 20, console: gamecube, description: "Super Smash Bros. Melee sur Gamecube est un jeu de combat dans lequel vous incarnez l'un des 25 personnages de l'univers de Nintendo, tels que Mario, Link, Pikachu ou encore Donkey Kong. Le titre propose de nombreux modes de jeu et un gameplay à la fois simple et profond.", year: 2002, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
supersmashbrosmelee.picture.purge if supersmashbrosmelee.picture.attached?
supersmashbrosmelee.picture.attach(io: file, filename: "supersmashbrosmelee.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/jaquettes/00043090/jaquette-tekken-tag-tournament-2-playstation-3-ps3-cover-avant-g-1347626798.jpg"
file = URI.open(url)
tekkentag = Game.create!(title: 'Tekken Tag Tournament 2', category: 'Combat', price: 15, console: ps1, description: "Tekken Tag Tournament 2 est un jeu de combat sur Playstation 2. Le titre propose un grand nombre de personnages et de modes de jeu. Vous pouvez jouer en solo ou à deux pour des combats en équipe.", year: 2012, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
tekkentag.picture.purge if tekkentag.picture.attached?
tekkentag.picture.attach(io: file, filename: "tekkentag.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/155361/1553613393-4699-jaquette-avant.jpg"
file = URI.open(url)
alexkidd = Game.create!(title: 'Alex Kidd in Miracle World', category: 'Plateforme', price: 15, console: master_system, description: "Alex Kidd in Miracle World est un jeu de plates-formes sur Master System. Vous incarnez Alex Kidd, un jeune garçon qui doit sauver le royaume de Radaxian en battant Janken, le roi du mal. Le jeu propose de nombreux niveaux et des combats contre des boss.", year: 1986, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
alexkidd.picture.purge if alexkidd.picture.attached?
alexkidd.picture.attach(io: file, filename: "alexkidd.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/images-sm/pc/s/a/sadcpc0f.jpg"
file = URI.open(url)
sonic1 = Game.create!(title: 'Sonic the Hedgehog', category: 'Plateforme', price: 15, console: master_system, description: "Sonic the Hedgehog est un jeu de plates-formes sur Master System. Vous incarnez Sonic, un hérisson bleu qui doit sauver ses amis animaux des griffes du Dr. Robotnik. Le jeu propose de nombreux niveaux et des combats contre des boss.", year: 1991, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
sonic1.picture.purge if sonic1.picture.attached?
sonic1.picture.attach(io: file, filename: "sonic1.jpg", content_type: "image/jpg")

url = "https://upload.wikimedia.org/wikipedia/en/9/99/Sonic_Adventure_2_cover.png"
file = URI.open(url)
sonic2 = Game.create!(title: 'Sonic the Hedgehog 2', category: 'Plateforme', price: 15, console: master_system, description: "Sonic the Hedgehog 2 est un jeu de plates-formes sur Master System. Vous incarnez Sonic, un hérisson bleu qui doit sauver ses amis animaux des griffes du Dr. Robotnik. Le jeu propose de nombreux niveaux et des combats contre des boss.", year: 1992, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
sonic2.picture.purge if sonic2.picture.attached?
sonic2.picture.attach(io: file, filename: "sonic2.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/163636/1636358617-6769-jaquette-avant.gif"
file = URI.open(url)
animalcrossing = Game.create!(title: 'Animal Crossing : New Horizons', category: 'Simulation de vie', price: 40, console: switch, description: "Animal Crossing : New Horizons est un jeu de simulation de vie sur Switch. Vous vous retrouvez sur une île déserte que vous devez aménager pour en faire un lieu de vie agréable. Vous pouvez pêcher, jardiner, décorer votre maison et même inviter des amis à visiter votre île.", year: 2020, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
animalcrossing.picture.purge if animalcrossing.picture.attached?
animalcrossing.picture.attach(io: file, filename: "animalcrossing.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/166671/1666707428-6189-jaquette-avant.jpg"
file = URI.open(url)
bayonetta3 = Game.create!(title: "Bayonet 3", category: "Action", price: 25, console: switch, description: "Bayonetta 3 est un jeu d'action sur Switch. Vous incarnez Bayonetta, une sorcière qui doit combattre des anges et des démons pour sauver le monde. Le titre propose un gameplay nerveux et des combats spectaculaires.", year: 2022, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
bayonetta3.picture.purge if bayonetta3.picture.attached?
bayonetta3.picture.attach(io: file, filename: "bayonetta3.jpg", content_type: "image/jpg")


url = "https://image.jeuxvideo.com/medias-sm/163247/1632474948-9368-jaquette-avant.jpg"
file = URI.open(url)
disco = Game.create!(title: "Disco Elysium", category: "RPG", price: 28, console: switch, description: "Disco Elysium est un jeu de rôle sur Switch. Vous incarnez un détective amnésique qui doit résoudre une affaire de meurtre dans une ville en proie à la corruption. Le titre propose un gameplay basé sur les dialogues et des choix moraux qui influent sur le déroulement de l'aventure.", year: 2019, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
disco.picture.purge if disco.picture.attached?
disco.picture.attach(io: file, filename: "disco.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/165287/1652867990-6703-jaquette-avant.jpg"
file = URI.open(url)
ori = Game.create!(title: "Ori and the blind forest", category: "Plateforme", price: 20, console: switch, description: "Ori and the Blind Forest est un jeu de plates-formes sur Switch. Vous incarnez Ori, une créature qui doit sauver la forêt de Nibel de la destruction. Le titre propose un gameplay basé sur l'exploration et des énigmes à résoudre.", year: 2015, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
ori.picture.purge if ori.picture.attached?
ori.picture.attach(io: file, filename: "ori.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/163058/1630582633-2607-jaquette-avant.jpg"
file = URI.open(url)
divinity = Game.create!(title: "Divinity : Original Sin 2", category: "RPG", price: 30, console: switch, description: "Divinity : Original Sin 2 est un jeu de rôle sur Switch. Vous incarnez un aventurier qui doit sauver le monde de Rivellon de la menace des Dieux. Le titre propose un gameplay basé sur les dialogues et des combats tactiques au tour par tour.", year: 2017, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
divinity.picture.purge if divinity.picture.attached?
divinity.picture.attach(io: file, filename: "divinity.jpg", content_type: "image/jpg")

url = "https://image.jeuxvideo.com/medias-sm/163058/1630582633-2607-jaquette-avant.jpg"
file = URI.open(url)
marioodyssey = Game.create!(title: "Super Mario Odyssey", category: "Plateforme", price: 40, console: switch, description: "Super Mario Odyssey est un jeu de plates-formes sur Switch. Mario doit parcourir différents royaumes pour sauver la princesse Peach des griffes de Bowser. Le titre propose un gameplay basé sur l'exploration et des énigmes à résoudre.", year: 2017, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
marioodyssey.picture.purge if marioodyssey.picture.attached?
marioodyssey.picture.attach(io: file, filename: "marioodyssey.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000016542243/300/wonder_boy_iii_the_dragon_s_trap.jpg"
file = URI.open(url)
wonderboy = Game.create!(title: "Wonder Boy III: The Dragon's Trap", category: "Plateforme", price: 20, console: master_system, description: "Reprenant l'aventure directement à la fin de Wonder Boy in Monster Land, le troisième volet sur SEGA MASTER SYSTEM de cette série mythique voit notre héros partir à la recherche de la Croix de la Salamandre. Cet artéfact est le seul moyen de faire lever la malédiction qui le transforme en diverses créatures.", year: 1989, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
wonderboy.picture.purge if wonderboy.picture.attached?
wonderboy.picture.attach(io: file, filename: "wonderboy.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000006884835/300/phantasy_star.jpg"
file = URI.open(url)
phantasy_star = Game.create!(title: "Phantasy Star", category: "RPG", price: 20, console: master_system, description: "Phantasy Star est un jeu de rôle sur Master System. Vous incarnez Alis, une jeune femme qui doit sauver le monde d'Algol de la menace de Dark Falz. Le titre propose un gameplay basé sur l'exploration et des combats au tour par tour.", year: 1987, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
phantasy_star.picture.purge if phantasy_star.picture.attached?
phantasy_star.picture.attach(io: file, filename: "phantasy_star.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000020707024/300/psycho_fox.png"
file = URI.open(url)
psycho_fox = Game.create!(title: "Psycho Fox", category: "Plateforme", price: 20, console: master_system, description: "Psycho Fox est un jeu de plates-formes sur Master System. Vous incarnez Psycho Fox, un renard qui doit sauver le monde de la menace de Madfox. Le titre propose un gameplay basé sur l'exploration et des énigmes à résoudre.", year: 1989, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
psycho_fox.picture.purge if psycho_fox.picture.attached?
psycho_fox.picture.attach(io: file, filename: "psycho_fox.jpg", content_type: "image/jpg")


url = "https://media.senscritique.com/media/000004546349/300/lemmings.jpg"
file = URI.open(url)
lemmings = Game.create!(title: "Lemmings", category: "Puzzle", price: 20, console: master_system, description: "Lemmings est un jeu de réflexion sur Master System. Vous devez guider des lemmings à travers des niveaux en leur assignant des tâches pour les sauver. Le titre propose un gameplay basé sur la résolution d'énigmes.", year: 1991, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
lemmings.picture.purge if lemmings.picture.attached?
lemmings.picture.attach(io: file, filename: "lemmings.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000019915094/300/outrun.jpg"
file = URI.open(url)
outrun = Game.create!(title: "Out Run", category: "Course", price: 20, console: master_system, description: "Out Run est un jeu de course sur Master System. Vous devez parcourir des circuits à bord de votre voiture pour atteindre la ligne d'arrivée. Le titre propose un gameplay basé sur la vitesse et la précision.", year: 1987, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
outrun.picture.purge if outrun.picture.attached?
outrun.picture.attach(io: file, filename: "outrun.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000000053726/300/time_soldiers.jpg"
file = URI.open(url)
time_soldiers = Game.create!(title: "Time Soldiers", category: "Action", price: 20, console: master_system, description: "Time Soldiers est un jeu d'action sur Master System. Vous incarnez un soldat qui doit voyager à travers différentes époques pour sauver le monde. Le titre propose un gameplay basé sur l'action et la précision.", year: 1987, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
time_soldiers.picture.purge if time_soldiers.picture.attached?
time_soldiers.picture.attach(io: file, filename: "time_soldiers.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000000069411/300/golden_axe_warrior.jpg"
file = URI.open(url)
golden_axe_warrior = Game.create!(title: "Golden Axe Warrior", category: "Action, Aventure", price: 20, console: master_system, description: "Golden Axe Warrior est un jeu d'action-aventure sur Master System. Vous incarnez un guerrier qui doit sauver le monde de la menace de Death Adder. Le titre propose un gameplay basé sur l'exploration et des combats au tour par tour.", year: 1991, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
golden_axe_warrior.picture.purge if golden_axe_warrior.picture.attached?
golden_axe_warrior.picture.attach(io: file, filename: "golden_axe_warrior.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000021494492/300/r_c_grand_prix.webp"
file = URI.open(url)
r_c_grand_prix = Game.create!(title: "R.C. Grand Prix", category: "Course", price: 20, console: master_system, description: "R.C. Grand Prix est un jeu de course sur Master System. Vous devez parcourir des circuits à bord de votre voiture pour atteindre la ligne d'arrivée. Le titre propose un gameplay basé sur la vitesse et la précision.", year: 1988, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
r_c_grand_prix.picture.purge if r_c_grand_prix.picture.attached?
r_c_grand_prix.picture.attach(io: file, filename: "r_c_grand_prix.jpg", content_type: "image/jpg")

url = "https://media.senscritique.com/media/000019084754/300/populous.png"
file = URI.open(url)
populous = Game.create!(title: "Populous", category: "Stratégie temps réel", price: 25, console: master_system, description: "Populous sur est un jeu de stratégie qui vous propose de vous mettre dans la peau du Créateur. Commandez une civilisation et venez à bout des populations sous la joute de dieux adverses.", year: 1989, condition: Game::CONDITIONS.sample, store_id: stores.sample.id)
populous.picture.purge if r_c_grand_prix.picture.attached?
populous.picture.attach(io: file, filename: "populous.png", content_type: "image/jpg")


puts "games created"
