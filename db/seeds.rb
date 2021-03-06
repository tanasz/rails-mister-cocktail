# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Cocktail.destroy_all
  # Ingredient.destroy_all
  # Dose.destroy_all

  # ingredients = [
  # 'Angostura Bitter',
  # 'Bacardi Superior Rum',
  # 'Banana',
  # 'Beer',
  # 'Bitter Lemon',
  # 'Blackcurrant Cordial',
  # 'Blackcurrant Juice',
  # 'Brandy',
  # 'Brown Sugar',
  # 'Butter',
  # 'Champagne',
  # 'Chocolate',
  # 'Cider',
  # 'Cinnamon',
  # 'Cocoa Powder',
  # 'Coffee',
  # 'Cointreau',
  # 'Coke',
  # 'Cranberry Juice',
  # 'Cream',
  # 'Dark Rum',
  # 'Diet Coke',
  # 'Double Cream',
  # 'Egg white',
  # 'Gin',
  # 'Ginger Ale',
  # 'Grenadine',
  # 'Honey',
  # 'Hot Chocolate',
  # 'Lemon',
  # 'Lemon Juice',
  # 'Lemonade',
  # 'Lime',
  # 'Lime Juice',
  # 'Marmalade',
  # 'Milk',
  # 'Nutmeg',
  # 'Orange Juice',
  # 'Pepper',
  # 'Red Wine',
  # 'Rum',
  # 'Salt',
  # 'Sherry Sweet',
  # 'Soda Water',
  # 'Sparkling Water',
  # 'Sugar',
  # 'Sugar Syrup',
  # 'Sweet Vermouth',
  # 'Tabasco Sauce',
  # 'Tequila',
  # 'Tonic Water',
  # 'Triple Sec',
  # 'Vermouth',
  # 'Vodka',
  # 'Whisky',
  # 'White Rum',
  # 'White Wine',
  # 'Worcestershire Sauce'
  # ]
  # ingredients.each { |ingredient| Ingredient.create(name: ingredient) }
  # puts "ingredients créés !"

require 'cloudinary'
# Rack::Test::UploadedFile.new("me.jpg", "image/jpeg")
def get_ids
  public_ids = Cloudinary::Api.resources(
    type: :upload,
    cloud_name: ENV['cloud_name'],
    api_key: ENV['api_key'],
    api_secret: ENV['api_secret']
  )['resources'].map { |h| h['public_id']}
end


  def destroy_all #=> :environment do
    public_ids = get_ids
    until public_ids.size <= 1
      #public_ids = get_ids
      result = Cloudinary::Api.delete_resources(
        public_ids,
        cloud_name: ENV['cloud_name'],
        api_key: ENV['api_key'],
        api_secret: ENV['api_secret']
      )
      # puts result
      # puts "true"
    end
    puts "=" * 40
    puts "Cloudinary is cleaned up."
    unless public_ids.size <= 1
      puts "-" * 40
      puts "Deleted resources:"
      public_ids.each { |id| puts id }
    end
    puts "=" * 40
  end

  destroy_all

  seed_imgs = []
  failed_imgs = []
  img_file = File.readlines('./db/images.txt')
  img_file.each do |url|
    url = pwd + url.chomp
      begin
        puts url
        seed_imgs.push(Cloudinary::Uploader.upload(url, cloud_name: ENV['cloud_name'],
                                                          public_id: ENV['public_id'],
                                                          api_key: ENV['api_key'],
                                                          api_secret: ENV['api_secret']))
      rescue CloudinaryException
          failed_imgs.push(url)
          next
      end
  end

  seed_imgs.each do |img|
    puts "#{img}=> euh ?"
      Album.first.pictures.create(picture_url: img['url'], public_id: img['public_id'])
  end

  Album.first.update(cover_picture_url: seed_imgs[0]['url'])

  puts "=" * 40
  puts "#{failed_imgs.size} failed to be uploaded."
  puts "-" * 40
  puts "Upload failed images:"
  failed_imgs.each { |img| puts "- " + img }
  puts "=" * 40




















  # cocktails = [
  #   {
  #     name: "Old Fashioned",
  #     description: "The Old Fashioned cocktail is old-school but never out of fashion.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Daiquiri",
  #     description: "It’s easy to see why the dark rum-based Daiquiri is a classic. The perfectly balanced combination of sweet, sour and spirit is refreshing and tangy, but also quite simple to make at home. Try making the recipe below and add this fool-proof drink to your bartending arsenal.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Margarita",
  #     description: "While the Margarita is one of the most popular cocktails in North America, its origins are shrouded in mystery. There are almost as many stories about who invented the margarita as there are margarita recipes. Some like them blended, others with a sweetener, but many argue the best margarita recipe is this classic one. Memorize it and you’ll never fail to impress.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Sidecar",
  #     description: "This is one ride you’ll gladly give up the wheel for.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "French 75",
  #     description: "Possibly named for a World War I field gun, this classic drink packs a wallop.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Bloody Mary",
  #     description: "While the origin of this popular brunch cocktail is debatable, the Bloody Mary’s staying power leaves no question. The Bloody Mary is a vodka-soaked nutritional breakfast and hangover cure all in one. What else can you want?",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Irish Coffee",
  #     description: "The secrets to making a great Irish Coffee are really so simple that they are often overlooked. This hot, creamy, classic Irish Coffee recipe from legendary bartender Dale DeGroff has all the right ingredients and will warm you to the bone.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Jack Rose",
  #     description: "The Jack Rose is smooth and sweetish - and deeply deceptive. Sipping it, you can't tell it contains liquor of any kind, let alone applejack. Ironic, that. The one classic cocktail to use New Jersey's indigenous firewater, and you can't even taste it.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Negroni",
  #     description: "The Negroni Cocktail is a classic Italian drink. Order a Negroni and you’ll be sure to Impress your bartender.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Boulevardier",
  #     description: "Swap out the gin in a Negroni for rye whiskey and you get the delicious Boulevardier. It’s equally complex as its gin-based predecessor, but the whiskey adds warmth, making it perfect for autumn and winter drinking.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Sazerac",
  #     description: "Forget the Hurricane. The Sazerac is what you should drink in New Orleans. One of America’s earliest cocktails, the Sazerac is a homegrown New Orleans specialty. Peychaud’s Bitters are a key element and were created by Antoine Peychaud, a French Quarter pharmacist, who invented the cocktail in the 1830s. The Sazerac was originally made with cognac, but an insect epidemic destroyed many French vineyards and resulted in the lasting switch to rye whiskey.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Vieux Carré",
  #     description: "The cognac-and-rye classic Vieux Carré cocktail was invented at New Orleans’ famed Carousel Bar.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Ramos Gin Fizz",
  #     description: "Love the Tom Collins? Try its frothy, bubbly cousin, the Gin Fizz. The secret to creating the perfect creaminess and froth is to shake, shake, shake—and then shake some more.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Mint Julep",
  #     description: "Celebrate Derby Day year-round with the Mint Julep, a classic bourbon refresher.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Whiskey Sour",
  #     description: "The Whiskey Sour is one classic cocktail that won’t make you sour.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Mai Tai",
  #     description: "The Mai Tai is an original tiki classic that is neither neon-colored nor overly sweet. In Tahitian, “Mai Tai” means “The best—out of this world,” as exclaimed by the first person to taste Trader Vic’s original version. The iconic tiki drink was created to showcase the flavor of good quality rum, and should never be neon-colored or overly sweet. A proper Mai Tai is a deep amber hue and allows the rum to shine through.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Planter's Punch",
  #     description: "The Planter’s Punch is a classic but highly variable refresher that’ll have your mouth watering in seconds.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Pisco Sour",
  #     description: "Both Chile and Peru claim the classic Pisco Sour as their own.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Cosmopolitan",
  #     description: "The original Cosmopolitan was created by a South Beach bartender named Cheryl Cook. Eager to invent a new cocktail for the Martini glass, Cheryl riffed on the classic Kamikaze using a newly introduced citrus-flavored vodka plus a splash of cranberry juice. The rest is rose-hued history.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Tom Collins",
  #     description: "The Tom Collins is essentially a sparkling lemonade spiked with a healthy dose of the juniper spirit. While there is a debate which side of the pond this drink was born, this cocktail lives up to his classic status with every sip.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #     },
  #   {
  #     name: "Last Word",
  #     description: "This complex, herbal cocktail will win any argument.",
  #     photo: "image/upload/v1471129579/askjmoocu10z3bmqnola.jpg"
  #   }
  # ]
  # cocktails.each { |cocktail| Cocktail.create(cocktail) }
  # puts "cocktails créés !"

  # frigo = Ingredient.all
  # bar = Cocktail.all
  # puts "frigo & bar créés !"

  # 100.times do
  #   dose = Dose.new(
  #     description: "#{rand(2..4)} #{['cc', 'hints', 'molecules', 'drops', 'dashes', 'teaspoons', 'bottles', 'crates', 'barrels'].sample} of ",
  #     )
  #   dose.ingredient = frigo.sample
  #   dose.cocktail = bar.sample
  #   dose.save
  # end
  # puts "doses créées !"

  # # 50.times do
  # #   ingredient = Ingredient.create(
  # #     name: Faker::Hipster.words(3).join(' ').capitalize
  # #   )
  # # end

  # # 50.times do
  # #   cocktail = Cocktail.create(
  # #     name: Faker::Beer.name
  # #   )
  # # end
