	awk '
			/chenile-parent/ {parent = 1}
	    /version/ && parent {print; parent = 0}
			' pom.xml
