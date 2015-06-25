module.exports = (robot) ->
  robot.hear /[し知]らなかった/, (res) ->
    res.send 'http://s3-ap-northeast-1.amazonaws.com/shiranakatta/sonnano.jpg'

  robot.hear /ぬるぽ/, (res) ->
    res.send 'ｶﾞｯ'

  robot.hear /天気/, (res) ->
    req = res.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010').get()
    req (err, respond, body) ->
      json = JSON.parse body
      res.send "渋谷は、" + json['forecasts'][0]['telop'] + "です"

  robot.hear /お(つか|疲)れ/, (res) ->
    res.send '｡･ﾟ･(*´･Д･)ﾉ 乙です'

  robot.hear /(ｗｗｗ|www)$/, (res) ->
    res.send """
```
    ∧,,∧
　 (；`・ω・）　　,
　 /　ｏ={=}ｏ , ', ´　草刈っておきますねぇ
､､しー-Ｊミ(.@)ｗｗｗｗｗｗｗｗｗｗｗ
```
"""

  robot.hear /(っぽい|だろう|かも|そうそう)/, (res) ->
    res.send "(´・ω・｀) そっかー"

  robot.hear /redbull/, (res) ->
    res.send '(●　・∀・)つ⌒ 翼をさずけよう'

  robot.hear /忙し/, (res) ->
    res.send '(つ∀｀*)　気のせいだったらいいのに～！'

  robot.hear /ぐへへ/, (res) ->
    res.send '(〃ﾉωﾉ)ｲﾔﾝ'

  robot.hear /たい$/, (res) ->
    res.send 'd(´ー｀*) だねぇ'

  robot.hear /(腹|おなか|お腹).*(減|空|へっ|すい|すき)/, (res) ->
    res.send res.random [
      'カレーか？'
      'ラーメンだろ！'
      '粉モンがええなぁ'
      '米くいねぇ！'
      'たまには抜いてみたら？'
      '唐揚げだな'
      'トンカツなのか！？'
    ]

  robot.hear /爆発|ばくはつ(してく|しろ|しちゃえ)/, (res) ->
    res.send 'えっ'

  annoyIntervalId = null

  robot.respond /(鳴|泣)(いて|け))/, (res) ->
    if annoyIntervalId
      res.send "(；ﾟ(OO)ﾟ)ﾌﾞﾋｲｲｲｨｨ-"
      return

    annoyIntervalId = setInterval () ->
      res.send res.random [
        "( ´(00)`)ﾌﾞﾋ"
        "(；ﾟ(OO)ﾟ)ﾌﾞﾋｲｲｲｨｨ-"
        "Zzz…(*´(00)`)｡o○"
        "( ´(00)`)y-~~"
        "なんでやねん！"
      ]
    , 1000
