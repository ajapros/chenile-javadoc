function grabVersion() {
	awk '
	/chenile-parent/ { start=1 }
	/version/ && start { 
		 a= split($0,arr, ">")	;split (arr[2],arr1,"<"); print arr1[1]; start = 0;
	}' pom.xml
}
read -p "Comments:" comment
git add .
git commit -m "$comment: Bump up version to $(grabVersion)"
git push origin main
