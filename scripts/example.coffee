child_process = require 'child_process'
module.exports = (robot) ->
  bot_name = 'post_twitter'
  robot.hear ///#{bot_name}.*///i, (res) ->
    shift_num = bot_name.length + 1
    msg = res.message.text[shift_num..(140+shift_num)]
    return if msg.match(///.*because.*///i)
    console.log("----\n#{res.message.user.name}\n#{msg}\n----")
    child_process.exec "ruby ./scripts/post.rb '#{msg}'", (error, stdout, stderr) ->
      return res.emote "stderr: \n#{stderr}" if stderr
      return res.emote "error:  \n#{error}"  if error
      return res.emote "output: \n#{stdout}" if stdout
