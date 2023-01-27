$version = Read-Host -Prompt "Package version"

#java
$mvn_version = "-Dversion=${version}"

cd .\java
mvn clean deploy $mvn_version
cd ..

#dotnet
$nuget_url = "http://localhost:8081/repository/nuget-hosted/"
$nuget_api_key = "6e87ef10-5c63-3366-bc47-b48a3df687be"

cd .\dotnet
dotnet pack -c Release -o .\nupkg -p:Version=${version}
cd .\nupkg
dotnet nuget push corp.bi.go.id.rpc.interface.${version}.nupkg --api-key $nuget_api_key --source $nuget_url
cd ..\..

Read-Host -Prompt "Press enter to exit"