set sh=CreateObject("WScript.Shell")
for each a in split("allusersdesktop,allusersprograms,allusersstartmenu,allusersstartup,desktop,favorites,fonts,mydocuments,nethood,printhood,programs,recent,sendto,startmenu,startup,templates",",")
WScript.Echo a
WScript.Echo sh.SpecialFolders(a)
next
