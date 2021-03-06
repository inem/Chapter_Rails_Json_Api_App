# frozen_string_literal: true

##
# Api/Users
class Api::UsersController < ApiController
  include Api::UsersDoc
  resource_description { short 'Api/Users endpoints' }

  def index
    @items = Searcher.new(User.all, search_params).call
  end

  def show
    @item = User.find(params[:id])
  end
end
