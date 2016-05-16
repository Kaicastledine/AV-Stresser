##SYNOPSIS
Function used to trigger an antivirus alert.

##DESCRIPTION
Expirimental function that triggers an antivirus reaction using the 'EICAR test string'. Can be used for social engineering. Most commonly used as a tool to slow the reaction time of antivirus applications.

##Parameters
* PARAMETER Clean
> You should always clean up your messes, this is a default. Some antivirus may auto clean anyway, but again...no messes.

* PARAMETER Common
> A switch to specify the use of common infection points as a place to inject the test string.

* PARAMETER Limit
> An integer used to specify the maximum number of injections

* PARAMETER Min
> An integer used to specify the smallest number of seconds to wait between injections.

* PARAMETER Max
> An integer used to specify the largest number of seconds to wait between injections.

* PARAMETER Path
> A string specifying a directory to inject the test string to.

##CREDITS
LogoiLab (Chad Baxter)

##LINK
https://www.github.com/LogoiLab/AV-Stresser
