osql -E  -i "C:\Documents and Settings\kevin_vlahos\Desktop\clearAll.sql" 

rem start http://localhost:8500/selenium/TestRunner.html?"test=../tests/TestSuite.html&auto=on


rem start c:\coldfusion8\wwwroot\selenium\TestRunner.hta test=../tests/TestSuite.html



@echo Run TestRunner from the shared directory, but output to the local test directory
c:\coldfusion8\wwwroot\selenium\TestRunner.hta "auto=true&test=../tests/TestSuite.html&save=true&resultsUrl=%CD%\results.html&multiWindow=true&close=true"