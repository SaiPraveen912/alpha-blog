class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        # Save article to DB and then can view on articles listing page. 
        @article = Article.new(params.require(:article).permit(:title, :description))  # white listing
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article  # Where we want it to go after saving to DB.
        else
            render 'new'
        end
    end

end