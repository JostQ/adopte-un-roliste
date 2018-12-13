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
