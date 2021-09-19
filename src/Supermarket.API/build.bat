set /p id="Build Number? : "

msbuild Supermarket.API.sln /t:restore
SL.DotNet config --appName "SuperMarketAPI" --branchName "master" --buildName %id% --includeNamespace * --buildSessionIdFile buildSessionId.txt
SL.DotNet.exe prepareForMsBuild --buildSessionIdFile buildSessionId.txt --baseDir .
msbuild Supermarket.API.sln /t:rebuild