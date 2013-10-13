all:
	@javac -cp ../lib/*: *.java

crawler:
	@java -cp ../lib/*: IMDBCrawler

stats:
	@java -cp ../lib/*: StatsProducer

clean:
	@rm -rf *.class

help:
	@echo 'Help Menu!'
	@echo 'Usage: make [flag]'
	@echo 'Flags:'
	@echo '  -crawler: launch IMDBCrawler'
	@echo '  -stats: launch StatsProducer'
	@echo '  -clean: removes .class files'
	@echo '  -help: shows this menu'

.DEFAULT: 
	@make help