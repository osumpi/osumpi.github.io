# osumpi.github.io

## Deploy

```sh
git clone https://github.com/osumpi/osumpi.github.io.git
cd osumpi.github.io
flutter pub get
flutter build web --web-renderer html
mv build/web ../temp/
git checkout live
cd ../temp/
mv|cp . ../osumpi.github.io/
cd ../osumpi.github.io/
git add .
git commit -m "Deploy ${timestamp}"
git checkout main
```
