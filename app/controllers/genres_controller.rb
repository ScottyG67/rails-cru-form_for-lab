class GenresController < ApplicationController

    def show
        find_genre
    end

    def index
        @genres = Genre.all
    end
    
    def edit
        find_genre
    end
    
    def new
        @genre = Genre.new
    end
    
    def update
        find_genre
        if @genre.update(post_params(:name))
            redirect_to genre_path(@genre), notice: "genre Saved"
        else
            redirect_to genres_path, notice: "Save failed"
        end
    end

    def create
        @genre = Genre.new(post_params(:name))
        if @genre.save
            redirect_to genre_path(@genre), notice: "genre Saved"
        else
            redirect_to genres_path, notice: "Save failed"
        end
    end

    private

	def post_params(*args)
		params.require(:genre).permit(*args)
    end
    def find_genre
        @genre = Genre.find_by(id: params[:id])
    end
end
