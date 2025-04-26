function grabVersion() {
	awk '/version/' pom.xml
}
git add .
git commit -m "Bump up version to $(grep version pom.xml)"
git push origin main
