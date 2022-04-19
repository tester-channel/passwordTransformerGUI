Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(400,150)
$Form.text                       = "Main Password Generator Window"
$Form.TopMost                    = $false
$Form.BackColor                  = "#808080"


$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 150
$Panel1.width                    = 400
$Panel1.Anchor                   = 'top,right,left'
$Panel1.location                 = New-Object System.Drawing.Point(4,4)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Fake Generate Password Button"
$Button1.width                   = 90
$Button1.height                  = 70
$Button1.location                = New-Object System.Drawing.Point(140,10)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Form.controls.AddRange(@($Panel1))
$Panel1.controls.AddRange(@($Groupbox1, $Button1))
#$Groupbox1.controls.AddRange(@($CheckBox1,$Label1, $Button1))

#$Button1.Add_Click({ Get-TransformedText 'G2tu74#&lZCk7EgQ' })
$Button1.Add_Click({ Create-PW-GUI })

[void]$Form.ShowDialog()

function Create-PW-GUI {

$Form2                           = New-Object system.Windows.Forms.Form
$Form2.ClientSize                = New-Object System.Drawing.Point(756,400)
$Form2.text                      = "Form"
$Form2.TopMost                   = $false
$Form2.width                     = 1080
$Form2.BackColor                 = "#808080"

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 256
$Panel2.width                    = 1080
$Panel2.Anchor                   = 'top,right,left'
$Panel2.location                 = New-Object System.Drawing.Point(4,4)

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "OK"
$Button2.width                   = 60
$Button2.height                  = 30
$Button2.location                = New-Object System.Drawing.Point(10,10)
$Button2.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Form2.controls.AddRange(@($Panel2))
$Panel2.controls.AddRange(@($Button2))

Get-TransformedText((Get-FakePassword))

[void]$Form2.ShowDialog()

}

function Get-FakePassword {
    return 'G2tu74#&lZCk7EgQ'
}

function Write-PhoneticString([string]$stringToPhoneticString) {

<#
  .SYNOPSIS
    Enables functionality to transform a string of characters into its phonetic representation
  .DESCRIPTION
    Uses an input string that has been broken into an array
    and performs regex operations on each character of that array
    to determine the phonetic representation of that character 
    with a hashtable that contains all US Keyboard characters.
    Once the phonetic representation is determined, it is written
    to the output.

    ################################################
    # Write-PhoneticString Conversions
    ################################################
    # Alphabetic Conversions
    # "a" = "alfa"
    # "b" = "bravo"
    # "c" = "charlie"
    # "d" = "delta"
    # "e" = "echo"
    # "f" = "foxtrot"
    # "g" = "golf"
    # "h" = "hotel"
    # "i" = "india"
    # "j" = "juliett"
    # "k" = "kilo"
    # "l" = "lima"
    # "m" = "mike"
    # "n" = "november"
    # "o" = "oscar"
    # "p" = "papa"
    # "q" = "quebec"
    # "r" = "romeo"
    # "s" = "sierra"
    # "t" = "tango"
    # "u" = "uniform"
    # "v" = "victor"
    # "w" = "whiskey"
    # "x" = "x-ray"
    # "y" = "yankee"
    # "z" = "zulu"

    # Numeric Conversions
    # "0"="Zero"
    # "1"="One"
    # "2"="Two"
    # "3"="Three"
    # "4"="Four"
    # "5"="Five"
    # "6"="Six"
    # "7"="Seven"
    # "8"="Eight"
    # "9"="Nine"

    # Symobolic Conversions
    # "!" = "Exclamation Point"
    # '"' = "Double Quote"
    # "#" = "Pound"
    # "$" = "Dollar"
    # "%" = "Percent"
    # "&" = "Ampersand"
    # "'" = "Single Quote"
    # "(" = "Left Parenthesis"
    # ")" = "Right Parenthesis"
    # "*" = "Asterisk"
    # "+" = "Plus"
    # "," = "Comma"
    # "-" = "Minus"
    # "." = "Period"
    # "/" = "Forward Slash"
    # ":" = "Colon"
    # ";" = "Semicolon"
    # "<" = "Less Than"
    # "=" = "Equal"
    # ">" = "Greater Than"
    # "?" = "Question Mark"
    # "@" = "At Sign"
    # "[" = "Left Square Bracket"
    # "\" = "Backslash"
    # "]" = "Right Square Bracket"
    # "^" = "Caret"
    # "_" = "Underscore"
    # '`' = "Grave"
    # "{" = "Left Curly Bracket"
    # "|" = "Vertical Bar"
    # "}" = "Right Curly Bracket"
    # "~" = "Tilde"
    ################################################
  .PARAMETER $stringToPhoneticString
    Mandatory. String to be phonetically transformed
  .INPUTS
    [string]$stringToPhoneticString
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Get-PhoneticString 'G2tu74#&lZCk7EgQ'
#>
    
    process {
        # Phonetic Map of all Standard US Keyboard Characters
        $phoneticCharacterMap = @{

            # Alphabetic Conversions
            "a" = "alfa"
            "b" = "bravo"
            "c" = "charlie"
            "d" = "delta"
            "e" = "echo"
            "f" = "foxtrot"
            "g" = "golf"
            "h" = "hotel"
            "i" = "india"
            "j" = "juliett"
            "k" = "kilo"
            "l" = "lima"
            "m" = "mike"
            "n" = "november"
            "o" = "oscar"
            "p" = "papa"
            "q" = "quebec"
            "r" = "romeo"
            "s" = "sierra"
            "t" = "tango"
            "u" = "uniform"
            "v" = "victor"
            "w" = "whiskey"
            "x" = "x-ray"
            "y" = "yankee"
            "z" = "zulu"

            # Numeric Conversions
            "0"="Zero"
            "1"="One"
            "2"="Two"
            "3"="Three"
            "4"="Four"
            "5"="Five"
            "6"="Six"
            "7"="Seven"
            "8"="Eight"
            "9"="Nine"

            # Symobolic Conversions
            "!" = "Exclamation Point"
            '"' = "Double Quote"
            "#" = "Number Sign"
            "$" = "Dollar"
            "%" = "Percent"
            "&" = "Ampersand"
            "'" = "Single Quote"
            "(" = "Left Parenthesis"
            ")" = "Right Parenthesis"
            "*" = "Asterisk"
            "+" = "Plus"
            "," = "Comma"
            "-" = "Minus"
            "." = "Period"
            "/" = "Forward Slash"
            ":" = "Colon"
            ";" = "Semicolon"
            "<" = "Less Than"
            "=" = "Equal"
            ">" = "Greater Than"
            "?" = "Question Mark"
            "@" = "At Sign"
            "[" = "Left Square Bracket"
            "\" = "Backslash"
            "]" = "Right Square Bracket"
            "^" = "Caret"
            "_" = "Underscore"
            '`' = "Grave"
            "{" = "Left Curly Bracket"
            "|" = "Vertical Bar"
            "}" = "Right Curly Bracket"
            "~" = "Tilde"
        }

        # For each individual character, find its phonetic equivilent in the singular hashtable
        function Rename-PhoneticCharacterMapper($char) {
            if ($phoneticCharacterMap.Contains($char)) {
                $result = $phoneticCharacterMap[$char]
            }
            else {
                throw "Invalid '$char'. Please Contact Support and reference this character."    
            }

            # In order to provide clarity with each output, this statement capitalizes
            # the phonetic string output if the original character was uppercase
            if ((Get-CharacterType($char)) -eq "uppercase") {
                $result = $result.ToUpper()
            }

            $result
        }

        # Convert this string into a character array and calls the mapper funciton to map each character
        [string[]]$translatedCharacters = $stringToPhoneticString.ToCharArray() |  ForEach-Object {
            Rename-PhoneticCharacterMapper $_.ToString()
        }

        Create-Labels(($translatedCharacters -join "$delimiter" ))

    }  

}

function Write-Clr([string]$stringToColorizedString)
{
<#
  .SYNOPSIS
    Enables support to write multiple color text on a single line
  .DESCRIPTION
    Users color codes to enable support to write multiple color text on a single line
    ################################################
    # Write-Color Color Codes
    ################################################
    # ^cn = Normal Output Color
    # ^ck = Black
    # ^cb = Blue
    # ^cc = Cyan
    # ^ce = Gray
    # ^cg = Green
    # ^cm = Magenta
    # ^cr = Red
    # ^cw = White
    # ^cy = Yellow
    # ^cB = DarkBlue
    # ^cC = DarkCyan
    # ^cE = DarkGray
    # ^cG = DarkGreen
    # ^cM = DarkMagenta
    # ^cR = DarkRed
    ################################################
  .PARAMETER text
    Mandatory. Line of text to write
  .INPUTS
    [string]$stringToColorizedString
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Write-Color "The ^cbBlue Kracken roams under the ^crRed sky!"
#>

    # We cannot assume the colorizer will be used in conjunction with functions such as "Add-ClrCodeCharacters"
    # that ensure that there will be the "^cx" pattern in the string.
    # Due to this, we must perform a check ff $stringToColorizedString contains any color codes.
    # If no color codes are found just Write-Host as normal to save resources.
    if (-not $stringToColorizedString.Contains("^c")) {
        Write-Host "$($stringToColorizedString)"
        return
    }

    # Checks to ensure the string starts with a color code to prevent empty/null value errors
    [boolean]$startsWithColor = $false
    if ($stringToColorizedString.StartsWith("^c")) { 
        $startsWithColor = $true 
    }
 
    # Split the array based on our color code delimeter
    [string[]]$colorCodedArray = $stringToColorizedString -split "\^c"


    # Counter used to keep track of the current position in the array
    [int]$count = 1

    # Increment used to moved the adhoc labels horizontally
    [int]$xOffset = 0

    # Increment used to moved the adhoc labels vertically
    [int]$yOffset = 20

    # Itterates over each object in the string array
    # Reads the color coding array and writes based off that information
    $colorCodedArray | ForEach-Object {

        if ($count -eq 1 -and $startsWithColor -eq $false) {
            Write-Host $_ -NoNewline
            $count++
        }
        elseif ($_.Length -eq 0)
        {
            $count++
        }
        else
        {


            $char = $_.Substring(0,1)
            $color = ""
            switch -CaseSensitive ($char) {
                "b" { $color = "Blue"; break }
                "B" { $color = "DarkBlue"; break }
                "c" { $color = "Cyan"; break }
                "C" { $color = "DarkCyan"; break }
                "e" { $color = "Gray"; break }
                "E" { $color = "DarkGray"; break }
                "g" { $color = "Green"; break }
                "G" { $color = "DarkGreen"; break }
                "k" { $color = "Black"; break }
                "m" { $color = "Magenta"; break }
                "M" { $color = "DarkMagenta"; break }
                "r" { $color = "Red"; break }
                "R" { $color = "DarkRed"; break }
                "w" { $color = "White"; break }
                "y" { $color = "Yellow"; break }
            }

            # If there is no color stated for whatever reason, write a normal line.
            # Otherwise, write the line with the given color without making a new line.
            if ($color -eq "") {
                Write-Host $_.Substring(1) -NoNewline
            }
            else {
                Create-Labels($_.Substring(1))
                #Write-Host $_.Substring(1) -NoNewline -ForegroundColor $color
            }

            # Once the string array has been finished, a new line will be written
            if ($count -eq $colorCodedArray.Count) {
                Write-Host ""
            }
            $count++
            $xOffset += 15
        }
    }
}

function Create-Labels([string]$char){

    $CharLabels                          = New-Object system.Windows.Forms.Label
    $CharLabels.UseMnemonic              = $false
    $CharLabels.text                     = $char
    $CharLabels.AutoSize                 = $true
    $CharLabels.width                    = 10
    $CharLabels.height                   = 10
    $CharLabels.location                 = New-Object System.Drawing.Point((33+$xOffset),(84+$yOffset))
    $CharLabels.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
    $CharLabels.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("$color")
    $Panel2.controls.AddRange(@($CharLabels))


}


# Takes in a single string "$char" character and performs various regex operations to determine
# what type of character it is.
# Returns a "$charType" string indication the character type 
function Get-CharacterType([string]$char) {

    [string]$charType = ''

    switch ($char) {
        {$char -cmatch "^[A-Z]$"} { $charType = "uppercase"; break } # Uppercase Check
        {$char -cmatch "^[a-z]$"} { $charType = "lowercase"; break } # Lowercase Check
        {$char -cmatch "^[0-9]$"} { $charType = "numeric"; break } # Numeric Check
        {$char -match '[^a-zA-Z0-9]'} { $charType = "special"; break } # Special Character Check
        default { throw "Invalid '$char'. Please Contact Enterprise Support Center and reference this character."  }
    }


    return $charType

}

function Add-CaretPrefex([string]$char)
{
    [string]$prefix = '^c'

    # Passes the current character into a helper function that determines the character's type and
    # Appends the propper color to the string.
    switch (Get-CharacterType($char)) {
        "uppercase" { $result = -join($prefix, 'c', $char); break }
        "lowercase" { $result = -join($prefix, 'g', $char); break }
        "numeric" { $result = -join($prefix, 'y', $char); break }
        "special" { $result = -join($prefix, 'r', $char); break }
        default { throw "Invalid '$char'. Please Contact Enterprise Support Center and reference this character." }
     }


    return $result
}

# Appends a '^c' and the appropriate color code (c, g, y, r, etc) to the
# beginning of the current character for later color processing.
# Write-Clr function uses '^cg' to determine how to color the text.
# For example, the above '^cg' would represent 'green'
# Returns the modified combined string
function Add-ClrCodeCharacters([string]$stringToSplit)
{

    [string[]]$appendedCharacters = $stringToSplit.ToCharArray() |  ForEach-Object {
        Add-CaretPrefex $_.ToString()
    }

    return $appendedCharacters -join "".ToString()
}

Function Get-TransformedText([string]$stringToSplit, [string]$delimiter = ' - ') {

<#
  .SYNOPSIS
    Enables functionality to transform a string of characters into both a 
    colorized and phonetic representation for ease of readability
  .DESCRIPTION
    Uses an input string and performs various comparisons and
    reges operations to determine the type of character and what
    character it is. Using that that information, two outputs
    (colorized and phonetic) are created. 
  .PARAMETER $stringToSplit
    ValueFromPipeLine.
    Mandatory.
    String to be transformed
  .PARAMETER $Demimiter
    ValueFromPipeLine.
    Mandatory.
    Defaults to " - "
    Determines how the phonetic output will be separated.
  .INPUTS
    [string]$stringToSplit
    [string]$delimiter
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Get-TransformedText 'G2tu74#&lZCk7EgQ'
#>


    # Original String
    $yOffset = 0
    Create-Labels($stringToSplit)

    # Colorized String
    Write-Clr(Add-ClrCodeCharacters($stringToSplit))


    # Phonetic String
    $yOffset = 45
    Write-PhoneticString($stringToSplit)

}

