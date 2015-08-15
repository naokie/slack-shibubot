cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 19 * * 1-5', ->
    imgs = [
      'http://img.tiqav.com/p4.jpg'
      'http://tiqav.com/Xc.jpg'
      'http://tiqav.com/Kp.jpg'
      'http://tiqav.com/533.jpg'
      'http://tiqav.com/2xS.jpg'
      'http://tiqav.com/18x.jpg'
    ]
    index = Math.floor(Math.random() * imgs.length)
    robot.messageRoom '#shibuya', imgs[index]
  , null, true, "Asia/Tokyo"
