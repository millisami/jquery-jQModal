class ArticlesController < ApplicationController
    def index
        @articles = Article.find(:all)
    end
  
    def show
        @article = Article.find(params[:id])
    end
  
    def new
        @article = Article.new
        render :layout => false
    end
  
    def create
        @article = Article.new(params[:article])
        if @article.save
            flash[:notice] = "Successfully created article."
            respond_to do |format|
                format.html { redirect_to @article }
                format.js
            end
        else
            respond_to do |format|
                format.html {render :action => 'new'}
                format.js
            end
        end
    end
  
    def edit
        @article = Article.find(params[:id])
    end
  
    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(params[:article])
            flash[:notice] = "Successfully updated article."
            redirect_to @article
        else
            render :action => 'edit'
        end
    end
  
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Successfully destroyed article."
        redirect_to articles_url
    end
end
