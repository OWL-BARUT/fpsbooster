@echo off

:: Disk Temizliği
echo Disk temizliği başlatılıyor...
cleanmgr /sagerun:1
echo Disk temizliği tamamlandı.

:: Dosya Düzenleme
echo Dosya düzenlemesi başlatılıyor...
%windir%\System32\cleanmgr.exe /DC Drive /AUTOCLEAN /LOWDISK
echo Dosya düzenlemesi tamamlandı.

:: Bozuk Sistem Dosyalarını Onarma
echo Sistem dosyaları kontrol ediliyor...
sfc /scannow
echo Sistem dosyaları kontrolü tamamlandı.

:: Disk İyileştirme
echo Disk iyileştirmesi başlatılıyor... 
defrag c: /O
echo Disk iyileştirmesi tamamlandı.

:: Kayıt Defteri Temizleme
echo Kayıt defteri temizleniyor...
regedit /E "%USERPROFILE%\Desktop\registrybackup.reg"
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Program Adı" /f
echo Kayıt defteri temizlendi.

:: Yeniden Başlatma
echo Bilgisayar yeniden başlatılıyor...
shutdown /r /t 0
