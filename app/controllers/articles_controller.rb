class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :destroy, :update]
    before_action :render_status, only: [:update, :destroy]

    def index
       @pagy, @articles = pagy(Article.all.order(published_at: :desc))
       render json: @articles
    end

    def show
        render json: @article, status: :ok
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            render json: @article, status: :created
        else
            render json: {errors: @article.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy

    end

    def update

    end


    private

    def article_params
        params.require(:article).permit(:title, :content, :author, :category, :published_at)
    end

    def render_status
        render json: {response: "Not allowed to modify #{@article.title} by #{@article.author}"}, status: :method_not_allowed
    end

    def set_article
        begin
            @article = Article.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
            render json: {response: e }, status: :not_found
        end
    end

end
