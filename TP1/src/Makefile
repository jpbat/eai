all:
	@javac -cp ../lib/*: *.java

crawler:
	@java -cp ../lib/*: IMDBCrawler

stats:
	@java -cp ../lib/*: StatsProducer

html:
	@java -cp ../lib/*: HTMLSummaryCreator

clean:
	@rm -rf *.class

clean-out:
	@rm -rf ../output/out*.xml
	@rm -rf ../output/IMDBCrawler*.html
	@rm -rf ../output/log.txt

jboss:
	@cp ../config.xml ../jboss/standalone/configuration
	@./../jboss/bin/standalone.sh --server-config=config.xml

help:
	@echo 'Help Menu!'
	@echo 'Usage: make [flag]'
	@echo 'Flags:'
	@echo '  -crawler: launch IMDBCrawler'
	@echo '  -stats: launch StatsProducer'
	@echo '  -clean: removes .class files'
	@echo '  -clean-out: removes output files'
	@echo '  -jboss: starts jboss with the correct configuration'
	@echo '  -help: shows this menu'

.DEFAULT: 
	@make help
