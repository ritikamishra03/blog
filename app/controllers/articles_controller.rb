class ArticlesController < ApplicationController
    def index
        @user=User.find(params[:user_id])
        @articles=@user.articles
    end
    def show
        @user=User.find(params[:user_id])
        @article=@user.articles.find(params[:id])
        # @article=Article.find(params[:id])
    end
    def new
        @user=User.find(params[:user_id])
        @articles=@user.articles.new 
    end
    def create
        @user=User.find(params[:user_id])
        @article=@user.articles.create(article_params)
        redirect_to user_path(@user)
    end
    def destroy
        # debugger
        @user=User.find(params[:user_id])
        @article=@user.articles.find(params[:id])
        # @article=Article.find(params[:id])
        @article.destroy
        

        redirect_to user_articles_path(@user), status: :see_other
    end

    private
    def article_params
        params.require(:article).permit(:article, :body,:file)
    end
end
