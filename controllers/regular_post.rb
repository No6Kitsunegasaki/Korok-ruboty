class RegularPostController < AbstractController
  def execute
    post(CutiePostModel.choice)
  end
end
