class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/new'
    end 
  end

  private

  def user_params
    {  name: params[:name], email: params[:email], username: params[:username],
       password: params[:password], password_confirmation: params[:password_confirmation] }
  end
end
