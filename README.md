# Slack2Twitter

SlackBotへのメッセージを、Twitterに投稿します。   

Slack2TwitterはHubotフレームワークでつくったSlack用のボットです。

## セットアップ

### 必要なモジュール

```bash
    % npm install -g hubot coffee-script yo generator-hubot
    % npm install hubot-slack --save
    % gem install twitter
```

こちらで、ボットをローカルで実行できます。XXXXはSlackのApp Integration でHubotから取得してください。

```bash
    % HUBOT_SLACK_TOKEN=XXXX bin/hubot --adapter slack
```

正常に動いた時、次のように表示されます。

```bash
    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379 Slack2Twitter>
```

## 使い方

### 取得
SlackでBotのダイレクトメッセージを開き、**アンダースコア**を送信

### 送信（ツイート）
SlackでBotのダイレクトメッセージを開き、**ツイート本文**を送信

## ボットのカスタマイズ

`scripts/example.coffee`をみてください。カスタマイズにはこちらを修正します。

ドキュメントはこちらです

[scripting-docs](https://github.com/github/hubot/blob/master/docs/scripting.md)
