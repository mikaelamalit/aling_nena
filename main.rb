require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR CUSTOMER SECTION

get '/' do
  @show = Item.all
  @products = @show.to_a.shuffle
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/products' do
  @products = Item.all
  erb :products
end

get '/purchase_form/:id' do
  @product = Item.find(params[:id])
  erb :purchase_form
end

post '/purchase/:id' do
  @product = Item.find(params[:id])
  @sold = params[:quantity]
  @product.update_attributes!(
    quantity: @product.quantity.to_i - @sold.to_i,
    sold: @product.sold.to_i + @sold.to_i,
  )
  @total = @product.price.to_i * @sold.to_i
  @payment = MoneyCalculator.new(
    params[:ones].to_i, 
    params[:fives].to_i,
    params[:tens].to_i, 
    params[:twenties].to_i, 
    params[:fifties].to_i, 
    params[:hundreds].to_i, 
    params[:five_hundreds].to_i, 
    params[:thousands].to_i,
    @total.to_i
    )
  erb :purchase
end

# END OF ROUTES FOR CUSTOMER SECTION

# ROUTES FOR ADMIN SECTION

get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# END ROUTES FOR ADMIN SECTION
