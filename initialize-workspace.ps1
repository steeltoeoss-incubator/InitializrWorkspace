#!/usr/bin/env pwsh

<#
.SYNOPSIS
Initializes the Initializr workspace.

.DESCRIPTION
Initializes the workspace by creating paths to the Initializr projects.
For each project:
  * if a project path already exists, that project is skipped
  * if a project is found in the parent directory, a soft link to the project is created
  * otherwise, the project is cloned
#>

$baseDir = "$PSScriptRoot"
$projects = "NetCoreToolTemplates", "NetCoreToolService", "InitializrConfig", "InitializrConfigServer", "InitializrApi", "InitializrWeb"

Set-Location -Path $baseDir
Foreach ($project in $projects) {
    $projectPath = Join-Path -Path $baseDir -ChildPath $project
    if (Test-Path -Path $projectPath) {
        "skipping $project"
        continue
    }
    if (Test-Path -Path "../$project") {
        "linking $project"
        New-Item -ItemType SymbolicLink -Path "$projectPath" -Target "../$project" | Out-Null
        continue
    }
    "cloning $project"
    git clone https://github.com/SteeltoeOSS/$project 2>&1 | Out-Null
}
