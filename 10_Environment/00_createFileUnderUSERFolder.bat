REM  ユーザーフォルダにVim用ファイルを作成する
REM  Vimを最初にインストールした場合は、このバッチを実行する

echo ユーザーフォルダにVim用ファイルを作成を開始します。。

mkdir %USERPROFILE%\_vim\backUp
mkdir %USERPROFILE%\_vim\swp
mkdir %USERPROFILE%\_vim\undo
mkdir %USERPROFILE%\_vim\viminfo

echo ユーザーフォルダにVim用ファイルを作成が完了しました。
pause
