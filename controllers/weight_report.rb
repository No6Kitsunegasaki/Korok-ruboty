class WeightReportController < AbstractController
  def execute
    nowWeight = @fitbit.user_info["user"]["weight"]
    startWeight = @fitbit.body_weight_goal["goal"]["startWeight"]
    goalWeight = @fitbit.body_weight_goal["goal"]["weight"]
    diff = (nowWeight - startWeight).round(1)
    rest = (nowWeight - goalWeight).round(1)
    impression = generateImpression(diff, rest)
    message = "@No6 おもさは%skg！はじめてからは%skgになった！%s" % [nowWeight, diff, impression]
    post(message)
  end

  def generateImpression(diff, rest)
    return "ふえてるんじゃないか！でぶ！" if diff > 0

    imps = [
      "やっときましたね。おめでとう。このゲームをかちぬいたのはきみたちがはじめてです。",
      "ここまできたのか！あとすこしだぞ！",
      "なんだと！",
      "やんのかやんのか！",
      "まじか！",
      "へいへい！",
      "うおー！",
      "みょーん！",
      "ゆだんすんな！",
      "がんばれがんばれ！",
      "いいぞ！でぶ！",
      "そのちょうしだでぶ！",
      "まだでぶ！",
      "ごさ！",
      "やるきあんのか！でぶ！",
      ]
    rest = rest.floor
    rest = 0 if rest <= 0
    imps[rest]
  end
end
