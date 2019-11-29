class RepositoriesController < ApiController
  def index
    @repositories = Repository.all
  end
end
