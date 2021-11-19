ChildItem -Directory | ForEach-Object {cmd /c mklink /J "$env:XDG_CONFIG_HOME\$($_)" "$($_.FullName)"}
