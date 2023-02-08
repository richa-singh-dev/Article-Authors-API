class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token
    def home
        render html: "Successful"
    end
    def create
        article = Article.create(title: params[ :title],
            author: params[ :author],
            category: params[ :category],
            body: params[ :body],
            date: params[ :date]
        )

        render json: article
    end

    def show
        if params[:page_number] 
            if params[:page_number] <= 0
                render json: {"mesaage": "Invalid page number"}
            else
                offset_value = (params[:page_number] - 1) * params[:articles_per_page]
                limit_value = params[:articles_per_page]
                articles =Article.limit(limit_value).offset(offset_value)
            end
        else 
            articles = Article.all
        end

        render json: articles
    end

    def update
        article = Article.find_by(id:params[:id])
        if params[:title] != nil
            article.title = params[:title]
        end

        if params[:author] != nil
            article.author = params[:author]
        end

        if params[:category] != nil
            article.category = params[:category]
        end

        if params[:body] != nil
            article.body = params[:body]
        end

        if params[:date] != nil
            article.date = params[:date]
        end

        article.save
        render json: article
    end

    def delete
        article = Article.find_by(id:params[:id])
        if article != nil
            article.destroy
        end

        render json: Article.all
    end

    def find 
        if params[:id]
            article = Article.find_by(id:params[:id])
            render json: article
        elsif params[:category]
            articles = Article.where(category:params[:category])
            render json: articles
        elsif params[:author]
            articles = Article.where(author:params[:author])
            render json: articles
        elsif params[:title]
            articles = Article.where("title LIKE ?", "%" +
                Article.sanitize_sql_like(params[:title]) + "%")
            render json: articles
        elsif params[:start_date] && params[:end_date]
            articles = Article.where(date: params[:start_date]..params[:end_date])
            render json: articles
        end
    end

end
