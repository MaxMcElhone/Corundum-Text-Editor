class EditorController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    #this just outputs the properties of the object passed by the view as text.
    #render plain: params[:document].inspect
    @document = Document.new(document_params)

    #save the object
    if(@document.save)
      #redirect to that page
      redirect_to action: "show", id: @document.id
    else
      render 'new'
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])

    if(@document.update(document_params))

      redirect_to action: "show", id: @document.id
    else
      render 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])

    @document.destroy

    redirect_to home_path
  end

  def fileupload

    myfilename = params[:post]
    #filetitle  = File.basename(myfilename)
    if myfilename.respond_to?(:read)
      filebody     = File.read(myfilename)
    elsif myfilename.respond_to?(:path)
      filebody = File.read(myfilename.path)
    else
      render plain: myfilename.inspect
    end

    #@document = Document.new(:title => filetitle, :boby => filebody)

    # if(@document.save)
    #   #redirect to that page
    #   redirect_to action: "show", id: @document.id
    # else
    #   render 'new'
    # end
  end

  #method to say what paramaters are needed to create the object
  private def document_params
    params.require(:document).permit(:title, :body)
  end
end
