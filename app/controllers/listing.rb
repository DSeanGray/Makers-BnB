class MakersBnB < Sinatra::Base

  get '/listing' do
    @listings = Listing.all
    erb :listing
  end

  get '/listing/new' do
    erb :new_listing
  end

  post '/listing/new' do
    listing = Listing.new(name: params[:name],
                    description: params[:description],
                    price: params[:price],
                    availablefrom: params[:availablefrom],
                    availableto: params[:availableto])

    listing.user = current_user

    if !listing.user
      flash[:errors] = ['You must be logged in to post listing']
      redirect '/'
    else
      listing.save
      redirect '/listing'
    end
  end

  get '/listing/:name' do
    @listing = current_listing
    erb :view_listing
  end
end
