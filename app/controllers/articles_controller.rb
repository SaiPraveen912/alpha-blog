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

    def edit
        @article = Article.find(params[:id])
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

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))  # whitelisting it
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

end