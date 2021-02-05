class SongsController < ApplicationController

    def show
        find_song
        @genre = @song.genre
        @artist = @song.artist
        
    end

    def index
        @songs = Song.all
    end
    
    def edit
        find_song
    end
    
    def new
        @song = Song.new
    end
    
    def update
        find_song
        if @song.update(post_params(:name, :artist_id, :genre_id))
            redirect_to song_path(@song), notice: "song Saved"
        else
            redirect_to songs_path, notice: "Save failed"
        end
    end

    def create
        @song = Song.new(post_params(:name, :artist_id, :genre_id))
        if @song.save
            redirect_to song_path(@song), notice: "song Saved"
        else
            redirect_to songs_path, notice: "Save failed"
        end
    end

    private

	def post_params(*args)
		params.require(:song).permit(*args)
    end
    def find_song
        @song = Song.find_by(id: params[:id])
    end
end
