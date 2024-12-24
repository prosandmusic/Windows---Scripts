function Switch-JavaVersion {
    param (
        [string]$version
    )

    $javaPath = "C:\Program Files\Java"
    $newJavaHome = ""

    switch ($version) {
        "8" { $newJavaHome = "$javaPath\jdk1.8.0_latest" }
        "11" { $newJavaHome = "$javaPath\jdk-11.0.latest" }
        "17" { $newJavaHome = "$javaPath\jdk-17.0.latest" }
        "21" { $newJavaHome = "$javaPath\jdk-21.0.latest" }
        default { Write-Host "Unsupported Java version. Please specify 8, 11, 17, or 21."; return }
    }

    if (Test-Path $newJavaHome) {
        $env:JAVA_HOME = $newJavaHome
        $env:Path = "$newJavaHome\bin;" + $env:Path

        Write-Host "Switched to Java $version"
        java -version
    } else {
        Write-Host "Java $version is not installed at $newJavaHome"
    }
}

# Usage: Switch-JavaVersion 11
