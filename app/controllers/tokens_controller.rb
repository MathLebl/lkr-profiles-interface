class TokensController < ApplicationController
  before_action :set_token, only: %i[destroy edit update]

  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    @token.save!
  end

  def edit
  end

  def update
    @token.update(token_params)
  end

  def destroy
    @token.destroy
  end

  private

  def token_params
    params.require(:token).permit(:content, :user_id)
  end

  def set_token
    @token = Token.find(params[:id])
  end
end
