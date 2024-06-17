class SearchTweetsService
  def self.search(keyword)
    if keyword.present?
      Tweet.where("content LIKE ?", "%#{keyword}%")
    else
      Tweet.all
    end
  end
end