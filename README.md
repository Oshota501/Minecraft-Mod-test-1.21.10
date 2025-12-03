# 環境構築

sdkmanのインストール

~~jdk 17 ? jdk 21 ?　把握していない~~

jdk 21 を sdkman 経由でインストール デフォルトにするか聞かれるので y を押す。

gradle もインストール。製作者本人はgradleのバージョン6を使用しているがおそらく最新でも問題ない。(こちらもsdkman経由でインストール可能)

下記は使っているエディターに合わせてください。（理由は知らん）

https://docs.minecraftforge.net/en/1.21.x/gettingstarted/

```sh
./gradrew genVSCodeRuns
```

# ビルド

いちいちMODフォルダに移動するのは手間なのでよかったら`build.sh`を使ってください。一応下記の方法で手動で可能です。

## build.sh

[`build.sh`](./build.sh) の上の方にある次の部分に移動先のパスを指定してください。

多くの場合`PATH_TO_MODS_FOLDER`を編集するだけで大丈夫です。

```sh
BUILD_DIR="./forge-1.21.10-60.1.0-mdk"
OUTPUT_DIR="PATH_TO_MODS_FOLDER"
```

次のコマンドを実行してください。

```sh
sh build.sh
```

## 手動ビルド

```sh
./gradlew build 
```

`build/libs` の中に Exsamplenなんとか.jar があるのでそれをマイクラのMODに適用。

# ForgeMDKからの修正点

LWJGLのmacos用のjarファイルがリモートリポジトリに存在自体はしているが、パスがおかしかったのでそれを強制的に変更するようにbuild.gradleを編集。

