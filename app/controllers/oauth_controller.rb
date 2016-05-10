class OauthController < ApplicationController



def new
  @client = Songkick::OAuth2::Model::Client.new
end

def create
  @client = Songkick::OAuth2::Model::Client.new(params)
  @client.save
  redirect_to root_path
end
end
