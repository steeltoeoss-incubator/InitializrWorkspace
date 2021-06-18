#!/usr/bin/env pwsh

<#
.SYNOPSIS
Initializes the Initializr workspace.

.DESCRIPTION
Initializes the workspace by creating soft links to the Initializr projects.
If a project path already exists, that project is skipped.
#>

$baseDir = "$PSScriptRoot"
$projects = "NetCoreToolTemplates", "NetCoreToolService", "InitializrConfig", "InitializrConfigServer", "InitializrApi", "InitializrWeb"

Foreach ($project in $projects) {
    $projectPath = Join-Path -Path $baseDir -ChildPath $project
    if (Test-Path -Path $projectPath) {
        "skipping $project"
        continue
    }
    "linking $project"
    New-Item -ItemType SymbolicLink -Path "$projectPath" -Target "../$project" | Out-Null
}
