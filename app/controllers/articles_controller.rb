# frozen_string_literal: false

class ArticlesController < ApplicationController
  include ArticlesHelper

  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show, :new]

  def index
    helpers.time_ago_in_words(Time.now)
    @articles = Article.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @articles }
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      # , notice: "#{my_helper(@article.title)} is now updated"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'You have successfully Deleted.'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
