class EditorController < ApplicationController
  def index

  end

  def new

  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    #this just outputs the properties of the object passed by the view as text.
    #render plain: params[:document].inspect
    @document = Document.new(document_params)

    #save the object
    @document.save

    #redirect to that page
    redirect_to action: "show", id: @document.id
  end
  #method to say what paramaters are needed to create the object
  private def document_params
    params.require(:document).permit(:title, :body)
  end
end