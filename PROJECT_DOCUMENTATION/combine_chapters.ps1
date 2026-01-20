# ========================================
# COMBINE ALL CHAPTERS - POWERSHELL SCRIPT
# ========================================
# This script combines all markdown files into one complete document

Write-Host "Combining all documentation chapters..." -ForegroundColor Green

# Define the output file
$outputFile = "COMPLETE_PROJECT_DOCUMENTATION.md"

# Define the files in order
$files = @(
    "Complete_Project_Report.md",
    "Chapter_1_Introduction.md",
    "Chapter_2_System_Analysis.md",
    "Chapter_3_Screens.md",
    "Chapter_4_Testing.md",
    "Chapter_5_Software_Environment.md",
    "Chapter_6_Conclusion_Future_Work.md",
    "Chapter_7_References.md"
)

# Remove output file if it exists
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Combine all files
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Adding $file..." -ForegroundColor Cyan
        Get-Content $file | Out-File -Append -Encoding UTF8 $outputFile
        # Add page break between chapters
        "`r`n`r`n---`r`n`r`n" | Out-File -Append -Encoding UTF8 $outputFile
    } else {
        Write-Host "Warning: $file not found!" -ForegroundColor Yellow
    }
}

Write-Host "`nDone! Combined file created: $outputFile" -ForegroundColor Green
Write-Host "Total size: $((Get-Item $outputFile).Length / 1KB) KB" -ForegroundColor Green
