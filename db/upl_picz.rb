require "curb"
picz=["http://www.seriouseats.com/images/2014/11/20141101-cognac-sidecar-carey-jones.jpg",
"http://www.seriouseats.com/images/2014/11/20141104-cocktail-party-old-fashioneds-holiday-vicky-wasik-3.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-robyn-lee-ramos-gin-fizz.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-boulevardier.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-cosmopolitan.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-daiquiri.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-french75.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-irish-coffee.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-jack-rose.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-last-word.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mai-tai.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-margarita.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mint-julep.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-negroni.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-pisco-sour.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-sazerac.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-tom-collins.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-vieux-carre.jpg",
"http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-whiskey-sour.jpg",
"http://www.seriouseats.com/images/2015/03/twase-20150320-21.jpg",
"http://www.seriouseats.com/images/2015/04/20150406-cocktails-planters-punch-robyn-lee-1.jpg"]
i = 1
response = ""

picz.each do |pic|
  c = Curl::Easy.new(pic)
  c.perform
  my_file = File.new("image" + i.to_s + ".jpg", "w+")
  my_file.puts(c.body_str)
  my_file.close
  i += 1
end
