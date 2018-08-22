class EditorController < ApplicationController
  def index

  end

  def new

  end
  def create
    render plain: params[:document].inspect
  end
end
