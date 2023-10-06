cmd.exe /c "start chrome"

$wsh = New-Object -ComObject WScript.Shell
$wsh.SendKeys("^m")

Get-Clipboard | Out-File -FilePath C:\__apex__\programs\auto-yt-dlp\links.txt -Append -NoNewLine
$red = Get-Content -Path C:\__apex__\programs\auto-yt-dlp\links.txt
$links = $red.Split(';')

for (($i = 0); $i -lt $links.Length; $i++)
{
	if($links[$i] -match '.*music.youtube.com\/watch.*')
	{
		$tes = "yt-dlp --yes-playlist --embed-thumbnail --audio-quality 0 -o C:\__apex__\art\%(title)s " +  '"' + $links[$i] + '"'
		echo $tes
		cmd.exe /c ("yt-dlp --yes-playlist --embed-thumbnail --audio-quality 0 -o C:\__apex__\art\%(title)s " +  '"' + $links[$i] + '"')
	}
	else
	{
		cmd.exe /c ("yt-dlp -x --no-playlist -o C:\__apex__\art\%(title)s " +  '"' + $links[$i] +'"')
		cmd.exe /c ("echo " + $links[$i])
	}
}
cmd.exe /c "del C:\__apex__\programs\auto-yt-dlp\links.txt"

