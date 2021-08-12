gift = Product.new( title: 'Gift', description: 'New Year gift' )
prod = Product.new( title: 'Some prod', description: 'Some description' )
ball = Product.new( title: 'Ball', description: 'To play football' )

new_year_bundle = Bundle.new( name: 'New year bundle', price: 345.00 )
birthday_bundle = Bundle.new( name: 'Birthday bundle', price: 1500.00 )
sport_bundle = Bundle.new( name: 'Sport bundle', price: 31900.00 )

gift.bundles << new_year_bundle
prod.bundles << new_year_bundle
prod.bundles << birthday_bundle
ball.bundles << sport_bundle

products = [gift, prod, ball, new_year_bundle, birthday_bundle, sport_bundle]
products.each do |prod|
  prod.save
end