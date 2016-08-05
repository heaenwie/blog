class ArticlesController < ApplicationController
  def new #inicjuje stworzenie artykułu
    @article = Article.new
  end

  def create #wrzuca to do bazy danych
    @article = Article.new(params[:article])

    if @article.save
      redirect_to(action: :index)
    else
    #  flash.now[:error] = "This is error"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.author = params[:article][:author]
    @article.content = params[:article][:content]
    @article.save
    redirect_to(action: :index)
  end

  def destroy
    Article.delete(params[:id])
    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end
end
