class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show  
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit   
    end


    def create
        # Save article to DB and then can view on articles listing page. 
        @article = Article.new(article_params)  # white listing
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article  # Where we want it to go after saving to DB.
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)  # whitelisting it
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path       # Redirecting to articles index page
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end