# Slack2Twitter

Slack2TwitterはHubotフレームワークでつくったSlack用のボットです。
SlackのメッセージをTwitterに投稿します。

### 実行手順

### 必要なモジュール

    % npm install -g hubot coffee-script yo generator-hubot
    % npm install hubot-slack --save

こちらで、ボットをローカルで実行できます。XXXXはSlackのApp Integration でHubotから取得してください。
    % HUBOT_SLACK_TOKEN=XXXX bin/hubot --adapter slack

正常に動いた時、次のように表示されます。
    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    Slack2Twitter>

### 使い方

#### 取得
SlackでBotのダイレクトメッセージを開き、**アンダースコア**を送信

#### 送信（ツイート）
SlackでBotのダイレクトメッセージを開き、**ツイート本文**を送信

### 編集とカスタマイズ

`scripts/example.coffee`をみてください。カスタマイズにはこちらを修正します。
ドキュメントはこちらです
[scripting-docs]: https://github.com/github/hubot/blob/master/docs/scripting.md
