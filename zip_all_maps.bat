mkdir AllMaps
for /r Maps %%f in (*.map) do @copy %%f AllMaps
for /r Maps %%f in (*.mp2) do @copy %%f AllMaps
CScript zip.vbs AllMaps all_maps.zip
PAUSE