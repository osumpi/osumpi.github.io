# osumpi.github.io

## Deploy

```sh
git clone https://github.com/osumpi/osumpi.github.io.git
cd osumpi.github.io
flutter pub get
flutter build web --web-renderer html
mv build/web ../temp/
git add .
git commit -m "gc"
git push
git checkout live
cd ../temp/
cp . ../osumpi.github.io/
cd ../osumpi.github.io/
rm -r .dart_tool/
rm -r build/
rm -r temp/
git add .
git commit -m "Deploy"
git push
git checkout main
```
