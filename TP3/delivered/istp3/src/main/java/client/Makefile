all:
	@javac -cp ../lib/*: *.java

crawler:
	@java -cp ../lib/*: IMDBCrawler

clean:
	@rm -rf *.class

clean-out:
	@rm -rf ../output/*.xml
	@rm -rf ../output/log*.txt

clean-all: clean-out clean

help:
	@echo 'Help Menu!'
	@echo 'Usage: make [flag]'
	@echo 'Flags:'
	@echo '  -crawler: launch IMDBCrawler'
	@echo '  -clean: removes .class files'
	@echo '  -clean-out: removes output files'
	@echo '  -clean-all: removes all output and .class files'
	@echo '  -help: shows this menu'

.DEFAULT: 
	@make help
