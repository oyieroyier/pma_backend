class UserController < ApplicationController


     # read JSON body
  before do
    begin
      @user = user_data
    rescue
      @user = nil
    end
  end

#  registers a new user to the data base
  post '/auth/register' do
    begin
      users = User.create(@user)
      users.to_json
    rescue => e
        { error: e.message }.to_json
    end
  end

  # logs in user using email and password
  post '/auth/login' do
    begin
      user_data = User.find_by(email: @user['email'])
      if user_data.passwordHash == @user['passwordHash']
        json_response(code: 200, data: {
          id: user_data.id,
          email: user_data.email
        })
      else
        json_response(code: 422, data: { message: "Your email/password combination is not correct" })
      end
    rescue => e
        { error: e.message }.to_json
    end
  end

#    displays all users
  get '/users' do
    user = User.all
    user.to_json
  end

    #gets all projects a user has

    get '/user/projects/:id' do

        user = User.find_by(id: params[:id])
        projects = user.projects
        projects.to_json

    end
   


  private

  # @helper: parse user JSON data
  def user_data
    JSON.parse(request.body.read)
  end

  def json_response(code: 200, data: nil)
    status = [200, 201].include?(code) ? "SUCCESS" : "FAILED"
    headers['Content-Type'] = 'application/json'
    if data
      [ code, { data: data, message: status }.to_json ]
    end
  end




end