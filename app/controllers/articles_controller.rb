class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))  # white listing
        @article.save
        redirect_to @article  # Where we want it to go after saving to DB.
    end

end