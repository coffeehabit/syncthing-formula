{% for user, device, args in pillar.get('synced_devices', {}).items() %}
/home/{{user}}/.config/syncthing/config.xml:
  file.replace:
    - pattern: {{ '<device id="{{args.device-id}}"' | regex_escape }}
    - repl: | 
      <device id="{{args.device-id}}" name="{{device}}" compression="metadata" introducer="false" skipIntroductionRemovals="false" introducedBy="">
          <address>{{args.device-address}}:{{args.device-port}}</address>
          <paused>false</paused>
          <autoAcceptFolders>false</autoAcceptFolders>
      </device>
    - append_if_not_found: True
{% endfor %}

{% for user in pillar.get('synced_devices', {}).items() %}
/home/{{user}}/.config/syncthing/config.xml:
# Sync directories
{% for dir, folder-id in pillar.get('synced_dirs', {}).items() %}
  file.replace:
    - pattern: {{ '<folder id="{{folder-id}}' | regex_escape }}
    - repl: |
      <folder id="{{folder-id}}" label="{{dir}}" path="/home/{{user}}/{{dir}}" type="readwrite" rescanIntervalS="120" fsWatcherEnabled="false" fsWatcherDelayS="10" ignorePerms="false" autoNormalize="true">
        <filesystemType>basic</filesystemType>
        {% for device-id in pillar.get('synced_devices', {}).items() %}
        <device id="{{device-id}}" introducedBy=""></device>
        {% endfor %}
        <minDiskFree unit="%">1</minDiskFree>
        <versioning></versioning>
        <copiers>0</copiers>
        <pullers>0</pullers>
        <hashers>0</hashers>
        <order>oldestFirst</order>
        <ignoreDelete>false</ignoreDelete>
        <scanProgressIntervalS>0</scanProgressIntervalS>
        <pullerPauseS>0</pullerPauseS>
        <maxConflicts>10</maxConflicts>
        <disableSparseFiles>false</disableSparseFiles>
        <disableTempIndexes>false</disableTempIndexes>
        <paused>false</paused>
        <weakHashThresholdPct>25</weakHashThresholdPct>
        <markerName>.stfolder</markerName>
    </folder>

{% endfor %}
{% endfor %}
