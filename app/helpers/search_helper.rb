module SearchHelper
  def search_query
    params[:q].try(:fetch, :title_cont, nil)
  end
end