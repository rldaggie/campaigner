module KeywordsHelper
  def status_text(boolean)
    return 'N/A' if boolean.nil?
    boolean ? 'Accepted' : 'Rejected'
  end
end
