class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]
  def index
    @docs=Doc.all
  end

  def show
  end

  def new
    @doc=Doc.new
  end

  def create
    @doc=Doc.new(doc_params)
    if @doc.save
      redirect_to docs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if Doc.update
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private
    def find_doc
      @doc=Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end
end
