# osumpi.github.io

## Deploy

```sh
git clone git@github.com:osumpi/osumpi.github.io.git
cd osumpi.github.io
flutter pub get && flutter build web --web-renderer html
mv build/web ../temp/
git clean -df
git checkout live
cp -a ../temp/. .
rm -rf ../temp
rm -rf .dart_tool
git add .
git commit -m "Deploy on $(date)"
git push
git checkout main
```
