#Current User (for file source reference)
$env:UserName

#Set the Execution Policy to "Allow" script

Set-ExecutionPolicy Unrestricted -Force

# Main File Source
$getFiles = Get-ChildItem -Path "C:\Users\$env:UserName\AppData\LocalLow\Wizards Of The Coast\MTGA" -Recurse | ? {$_.BaseName -eq "output_log"}



# Get Player Name // Handle Information
$GetplayerName = $getFiles | Get-Content | ? {$_ -like '*"PlayerScreenName"*'} | select -First 1

$playerNameTrim = ($GetplayerName.Split(':"'))[27]
$playerNameFinal = $playerNameTrim.Split('#')[0]
$playerNameFinal



# Main Menu Function 

function Show-Menu
{
    Clear-Host

    Write-Host "================ " -NoNewline
    Write-Host "M " -ForegroundColor White -NoNewline
    Write-Host "T " -ForegroundColor Blue -NoNewline
    Write-Host "G " -ForegroundColor Black -NoNewline
    Write-Host "A " -ForegroundColor Red -NoNewline
    Write-Host "T " -ForegroundColor Green -NoNewline
    Write-Host " ================"

    (Get-Date).DateTime

    Write-Host `n

    Write-Host "Welcome" -NoNewline
    Write-Host " $playerNameFinal!" -ForegroundColor Cyan -NoNewline
    Write-Host " I am" -NoNewline
    Write-Host " The Nexus." -ForegroundColor Cyan -NoNewline
    Write-Host " Think of me as your personal 'Stat Tracker'. How may I help you?"

    Write-Host `n
    
    Write-Host "1: Press" -NoNewline
    Write-Host " '1'" -NoNewline -ForegroundColor Green
    Write-Host " for your" -NoNewline
    Write-Host " Constructed" -NoNewline -ForegroundColor Magenta
    Write-Host " Information."
    Write-Host "2: Press" -NoNewline
    Write-Host " '2'" -NoNewline -ForegroundColor Green
    Write-Host " for your" -NoNewline
    Write-Host " Limited" -NoNewline -ForegroundColor Magenta
    Write-Host " Information."
    #Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press" -NoNewline
    Write-Host " 'Q'" -NoNewline -ForegroundColor Red
    Write-Host " to quit."
}



# This is the start of the script! Enjoy!

do
{

    Show-Menu

    Write-Host `n

    $mtgaSelection = Read-Host "Please make a selection!"

    switch($mtgaSelection)
        {

            '1'
                {

                $getFiles = Get-ChildItem -Path "C:\Users\$env:UserName\AppData\LocalLow\Wizards Of The Coast\MTGA" -Recurse | ? {$_.BaseName -eq "output_log"}

                cls

                Write-Host `n

                Write-Host "~ Please wait while I gather your " -NoNewline
                Write-Host "M" -ForegroundColor White -BackgroundColor Gray -NoNewline
                Write-Host "T" -ForegroundColor Blue -BackgroundColor Gray -NoNewline
                Write-Host "G" -ForegroundColor Black -BackgroundColor Gray -NoNewline
                Write-Host "A" -ForegroundColor Red -BackgroundColor Gray -NoNewline
                Write-Host "T" -ForegroundColor Green -BackgroundColor Gray -NoNewline
                Write-Host " Constructed" -ForegroundColor Magenta -NoNewline
                Write-Host " information! Thanks for your patience! ~"
                Write-Host "----------"

                $constructedWonTotal = $getFiles | Get-Content | ? {$_ -like "*constructedMatchesWon*"}

                $constructedLostTotal = $getFiles | Get-Content | ? {$_ -like "*constructedMatchesLost*"}

                $conWonFinal = ($constructedWonTotal -split ': ')[-1].Trim(',')
                $conWonInt = [int]$conWonFinal

                Write-Host `n

                Write-Host "You currently have" -NoNewline
                Write-Host " $conWonInt" -ForegroundColor Magenta -NoNewline
                Write-Host " Constucted Wins"

                Write-Host `n

                $conLostFinal = ($constructedLostTotal -split ': ')[-1].Trim(',')
                $conLostInt = [int]$conLostFinal

                Write-Host "You currently have" -NoNewline 
                Write-Host " $conLostInt" -ForegroundColor Magenta -NoNewline
                Write-Host " Constucted Losses"

                Write-Host `n


                $conWinLossRatio = ($conWonInt + $conLostInt) / $conWonInt

                $conWLRatio = [math]::Round($conWinLossRatio,2)

                Write-Host "Therefore, your Constructed Win/Loss Ratio is currently" -NoNewline
                Write-Host " $conWLRatio" -ForegroundColor Magenta

                Write-Host `n

                $constructedClass = $getFiles | Get-Content | ? {$_ -like "*constructedClass*"}

                $constructedLevel = $getFiles | Get-Content | ? {$_ -like "*constructedLevel*"}

                $constructedStep = $getFiles | Get-Content | ? {$_ -like "*constructedStep*"}



                $constructedClassFinal = ($constructedClass -split ': ')[3].Trim(',')
                $constructedLevelFinal = ($constructedLevel -split ': ')[3].Trim(',')
                $constructedStepFinal = ($constructedStep -split ': ')[3].Trim(',')

                Write-Host "Your current Constructed Status is..."
                Write-Host `n
                Write-Host "Class --" -NoNewline
                Write-Host " $constructedClassFinal" -ForegroundColor Magenta -NoNewline
                Write-Host " Level --" -NoNewline
                Write-Host " $constructedLevelFinal" -ForegroundColor Magenta -NoNewline
                Write-Host " Step --" -NoNewline
                Write-Host " $constructedStepFinal" -ForegroundColor Magenta
                Write-Host `n
                Write-Host "Congrats! Keep it up!"

                Write-Host `n

                Pause

                }

            '2'
                {

                $getFiles = Get-ChildItem -Path "C:\Users\$env:UserName\AppData\LocalLow\Wizards Of The Coast\MTGA" -Recurse | ? {$_.BaseName -eq "output_log"}

                cls

                Write-Host `n

                Write-Host "~ Please wait while I gather your " -NoNewline
                Write-Host "M" -ForegroundColor White -BackgroundColor Gray -NoNewline
                Write-Host "T" -ForegroundColor Blue -BackgroundColor Gray -NoNewline
                Write-Host "G" -ForegroundColor Black -BackgroundColor Gray -NoNewline
                Write-Host "A" -ForegroundColor Red -BackgroundColor Gray -NoNewline
                Write-Host "T" -ForegroundColor Green -BackgroundColor Gray -NoNewline
                Write-Host " Limited" -ForegroundColor Magenta -NoNewline
                Write-Host " information! Thanks for your patience! ~"
                Write-Host "----------"

                $limitedWonTotal = $getFiles | Get-Content | ? {$_ -like "*limitedMatchesWon*"}

                $limitedLostTotal = $getFiles | Get-Content | ? {$_ -like "*limitedMatchesLost*"}

                $limWonFinal = ($limitedWonTotal -split ': ')[-1].Trim(',')
                $limWonInt = [int]$limWonFinal

                Write-Host `n

                Write-Host "You currently have" -NoNewline
                Write-Host " $limWonInt" -ForegroundColor Magenta -NoNewline
                Write-Host " Limited Wins"

                Write-Host `n

                $limLostFinal = ($limitedLostTotal -split ': ')[-1].Trim(',')
                $limLostInt = [int]$limLostFinal

                Write-Host "You currently have" -NoNewline 
                Write-Host " $limLostInt" -ForegroundColor Magenta -NoNewline
                Write-Host " Limited Losses"

                Write-Host `n

                if($limWonInt -eq '0' -and $limLostInt -eq '0' -or $limWonInt -eq '0')
                    {

                    Write-Host "Looks like you either haven't played any Ranked Limited OR haven't won a Limited Ranked match yet. Your current Limited WLR is" -NoNewline
                    Write-Host " 0" -ForegroundColor Magenta -NoNewline
                    Write-Host "!"

                    }

                else
                    {


                    $limWinLossRatio = ($limWonInt + $limLostInt) / $limWonInt

                    $limWLRatio = [math]::Round($limWinLossRatio,2)

                    Write-Host "Therefore, your Limited Win/Loss Ratio is currently" -NoNewline
                    Write-Host " $limWLRatio" -ForegroundColor Magenta

                    }

                Write-Host `n

                $limitedClass = $getFiles | Get-Content | ? {$_ -like "*limitedClass*"}

                $limitedLevel = $getFiles | Get-Content | ? {$_ -like "*limitedLevel*"}

                $limitedStep = $getFiles | Get-Content | ? {$_ -like "*limitedStep*"}



                $limitedClassFinal = ($limitedClass -split ': ')[3].Trim(',')
                $limitedLevelFinal = ($limitedLevel -split ': ')[3].Trim(',')
                $limitedStepFinal = ($limitedStep -split ': ')[3].Trim(',')

                Write-Host "Your current Limited Status is..."
                Write-Host `n
                Write-Host "Class --" -NoNewline
                Write-Host " $limitedClassFinal" -ForegroundColor Magenta -NoNewline
                Write-Host " Level --" -NoNewline
                Write-Host " $limitedLevelFinal" -ForegroundColor Magenta -NoNewline
                Write-Host " Step --" -NoNewline
                Write-Host " $limitedStepFinal" -ForegroundColor Magenta
                Write-Host `n
                Write-Host "Congrats! Keep it up!"

                Write-Host `n

                Pause

                }

            'q'
                {

                return

                }
        }

}until($mtgaSelection -eq 'q')