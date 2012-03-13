class MoviesController < ApplicationController

   #attr_accessor :all_ratings
 # attr_accessor :selected_ratings

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @selected_ratings = Array.new
    need_redirect = false
    if params[:ratings] == nil
      if (session[:ratings] != nil)
        params[:ratings] = session[:ratings]
        need_redirect = true
      end
    else
      session[:ratings] = params[:ratings]
    end
    if (params[:filter] == nil)
      if (session[:filter] != nil)
        params[:filter] = session[:filter]
        need_redirect = true
      end
    else
      session[:filter] = params[:filter]
    end
    if (need_redirect)
      redirect_to movies_path(params.merge(:filter => params[:filter], :ratings => params[:ratings]))
    end
    if params.has_key?('filter')
        puts 'Yes'
        self.sort    
    else
        @movies = Movie.all
    end
    if params.has_key?('ratings')
       @selected_ratings = params['ratings'].keys
       @movies = @movies.select { |x| @selected_ratings.include? (x.rating)}
    end 
    @all_ratings = Movie.get_all_ratings
    logger.debug @all_ratings[1]
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def sort
    sort_by = params['filter']
    @movies = Movie.find(:all, :order => sort_by)
    if params[:class] == 'title'
        @title = 'hilite'
    else
        @date = 'hilite'
    end
  end
end
