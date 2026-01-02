
# Pre-requisites for running this Makefile
# Make sure that git is installed
# install maven (mvn)
# install java (of course)

# In this makefile all the goals need to be documented with a line above that
# should start with 2 #s. Internal goals must have only one # so that they
# dont show up in the help below.
# A PHONY fake goal is required to make sure that Make does not expect a file
# with the name of the goal in the file system

.DEFAULT_GOAL := javadoc


## javadoc: Build the aggregated javadocs web site 
.PHONY: javadoc
javadoc: clean
	mvn   javadoc:aggregate

## clean: Cleans the target folder
.PHONY: clean
clean:
	mvn  clean

## test-javadoc: Build the aggregated javadocs web site for Test classes
.PHONY: test-javadoc
test-javadoc:
	mvn  javadoc:test-aggregate

	
## help: type for getting this help
.PHONY: help
help: Makefile
	@echo
	@echo " Choose a command to run :"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
