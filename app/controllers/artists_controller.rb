class ArtistsController < ApplicationController

    def show
        find_artist
        
    end

    def index
        @artists = Artist.all
    end
    
    def edit
        find_artist
    end
    
    def new
        @artist = Artist.new
    end
    
    def update
        find_artist
        if @artist.update(post_params(:name, :bio))
            redirect_to artist_path(@artist), notice: "Artist Saved"
        else
            redirect_to artists_path, notice: "Save failed"
        end
    end

    def create
        @artist = Artist.new(post_params(:name, :bio))
        if @artist.save
            redirect_to artist_path(@artist), notice: "Artist Saved"
        else
            redirect_to artists_path, notice: "Save failed"
        end
    end

    private

	def post_params(*args)
		params.require(:artist).permit(*args)
    end
    def find_artist
        @artist = Artist.find_by(id: params[:id])
    end

end
