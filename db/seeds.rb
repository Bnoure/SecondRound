User.destroy_all
Store.destroy_all
Game.destroy_all


nour = User.create!(first_name: 'Nour', last_name: 'Eddine', role: 1, email: 'test@test.com', password: 123456)
xavier = User.create!(first_name: 'Xavier', last_name: 'Lefaou', role: 0, email: 'test2@test.com', password: 123456)
emma = User.create!(first_name: 'Emma', last_name: 'Puget', role: 1, email: 'test3@test.com', password: 123456)
puts '3 users created'

superthor = Store.create!(name: 'superThor', city: 'Toulouse', address: '36 chemin du vallon, Toulouse', user_id: nour.id, open_hour: 9 , close_hour: 22)
tekkenstore = Store.create!(name: 'TekkenStore', city: 'Strasbourg', address: '3 rue Sarrelouis, Strasbourg', user_id: emma.id, open_hour: 8, close_hour: 18)
storetoulouse = Store.create!(name: 'StoreToulouse', city: 'Toulouse', address: '8 impasse Bonnet, Toulouse ', user_id: nour.id, open_hour: 8, close_hour: 18)
puts '3 stores created'

Game.create!(title: 'Alex kidd', category: 'plateforme', price: 16, console: 'master system', description: 'trop cool', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Tekken 3', category: 'combat', price: 13, console: 'ps1', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1998, condition: 'vieux', store_id: superthor.id)
Game.create!(title: 'Rocket league', category: 'course', price: 56, console: 'switch', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Dark soul', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Fonal fantasy', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Minecraft', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: superthor.id)
Game.create!(title: 'Pokemon', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Soul calibur', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Barbie', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Animal crossing', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'ninten dogs', category: 'plateforme', price: 16, console: 'master system', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: tekkenstore.id)
Game.create!(title: 'Mario kart', category: 'plateforme', price: 16, console: 'ds', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', year: 1980, condition: 'neuf', store_id: storetoulouse.id)
puts '12 games created'
