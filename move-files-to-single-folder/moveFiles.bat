REM Set your root source folders containing sub folders. E.g
REM C:\mySource
REM C:\mySource\selfie.jpg
REM C:\mySource\family.jpeg
REM C:\mySource\myFavourite.gif
REM and all the above matching file types will be moved to the C:\myDestination
SET stagingFolder="C:\mySource"
SET sortedFolder="C:\myDestination"
FOR /R %stagingFolder% %i IN (*.jpg) DO MOVE "%i" %sortedFolder%
FOR /R %stagingFolder% %i IN (*.jpeg) DO MOVE "%i" %sortedFolder%
FOR /R %stagingFolder% %i IN (*.gif) DO DEL "%i"
REM Remove "REM" in below lines if you want to delete the source folder and re-create it as an empty folder. Any remaining files will be deleted.
REM ROBOCOPY %stagingFolder% %sortedFolder% /S /MOVE
REM mkdir %stagingFolder%
