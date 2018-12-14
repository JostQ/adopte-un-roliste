# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

donjon_et_dragon = Roleplay.create(name: "Donjon et Dragons", description: "C'est un univers merveilleux, avec des peuples et animaux fabuleux, une magie qui permet de vaincre les lois de la nature, des dieux qui interagissent avec le monde ne serait-ce qu'en accordant des pouvoirs à leurs prêtres, des dimensions parallèles où vivent les dieux les démons et de manière générale les extérieurs auxquels on peut accéder par des sorts et un niveau technologique de type médiéval.", image_url: "https://i.servimg.com/u/f47/14/77/66/61/donjon10.jpg")

naheulbeuk = Roleplay.create(name: "Naheulbeuk", description: "Bon, alors, vous en avez marre des jeux où tout est formaté sérieux ? Des héros qui sentent bon ? Des compagnies aux cheveux bien peignés ? Le jeu de rôle 'Donjon de Naheulbeuk' est un jeu de rôle 'sur papier' gratuit, pour ceux qui veulent découvrir cette activité ou qui désirent vivre des aventures pas comme les autres...", image_url: "https://www.naheulbeuk.com/pix/JDRNAHEULBEUK-logorond-WEB.png")

shadowrun = Roleplay.create(name: "Shadowrun", description: "Shadowrun se passe dans un univers futuriste uchronique et cyberpunk. Il s'agit d'une projection futuriste du monde des années 1990 et non d'un univers totalement imaginaire. L'action de la première édition se déroulait en 2050, mais la trame temporelle a évolué au fil des suppléments et des éditions, et la 4e édition se déroule ainsi en 2070. L'univers est d'ailleurs doté d'un historique fouillé alliant économie et politique expliquant la succession d’événements qui ont eu lieu entre 1990 et 2070.", image_url: "https://images-na.ssl-images-amazon.com/images/I/914y5GhPeEL.jpg")

user1 = User.create(:pseudo => 'Hittar', :email => 'yossi.capelluto@gmail.com', :password => 'password', :password_confirmation => 'password')

user2 = User.create(:pseudo => 'Spliit', :email => 'mcuville@gmail.com', :password => 'password', :password_confirmation => 'password')

user2 = User.create(:pseudo => 'Dremsis', :email => 'dremsis64@hotmail.fr', :password => 'password', :password_confirmation => 'password')

game1 = GameSession.create(title: 'Le gouffre', description: 'Histoire dans les profondeurs', creator_id: 1, roleplay_id: 1, date: '16:30:00 17/12/2018', city: 'Bruxelles', players_limit:  5)

game2 = GameSession.create(title: 'Les Yvelines', description:  'Forets maudites et massacres sanglant', creator_id:  2, roleplay_id:  2, date:  "16:30:00 17/12/2018", city:  "Bordeaux", players_limit:  4)

game3 = GameSession.create(title: 'Croisière draconique', description: 'Essayer de ne pas tomber à l eau', creator_id: 3, roleplay_id: 3, date: "16:30:00 17/12/2018", city: "Merignac", players_limit: 3)

role1 = Role.create(game_master:  "true", user_id:  1, game_session_id:  1)

role2 = Role.create(game_master:  "true", user_id:  2, game_session_id:  2)

role3 = Role.create(game_master:  "f", user_id:  1, game_session_id:  2)

role4 = Role.create(game_master:  "f", user_id:  2, game_session_id:  1)

role5 = Role.create(game_master:  "true", user_id:  3, game_session_id:  3)

role6 = Role.create(game_master:  "f", user_id:  3, game_session_id:  1)

char1 = Character.create(pseudo:  "Meumeu", level:  7, user_id:  1, roleplay_id:  2, game_session_id:  2, description:  "Vache-Garou" )

char2 = Character.create(pseudo:  "Coincoin", level:  7, user_id:  2, roleplay_id:  1, game_session_id:  1, description:  "Canard-Garou" )

char3 = Character.create(pseudo:  "Pirou piou", level:  99, user_id:  3, roleplay_id:  1, game_session_id:  1, description:  "Un poussin de 30m vous trouvez ca habituel?" )

prim1 = PrimarySpec.create(name:  "Vie", value: 50, character_id:  1)

prim2 = PrimarySpec.create(name:  "Vie", value: 50, character_id:  2)

prim3 = PrimarySpec.create(name:  "Vie", value: 50, character_id:  3)

sec1 = SecondarySpec.create(name:  "Force", value:  10, character_id:  1)

sec2 = SecondarySpec.create(name:  "Force", value:  10, character_id:  2)

sec3 = SecondarySpec.create(name:  "Force", value:  10, character_id:  3)

inv1 = Inventory.create(name:  "Hache", character_id:  1)

inv2 = Inventory.create(name:  "Hache", character_id:  2)

inv3 = Inventory.create(name:  "Hache", character_id:  3)
