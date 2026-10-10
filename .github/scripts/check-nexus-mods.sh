#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."

jq -c 'to_entries[] | select(.value.monitor != false and .value.version != null)' mods.json |
while read -r entry; do
    id=$(jq -r '.key' <<<"$entry")
    mod=$(jq -c '.value' <<<"$entry")
    nexus_id=$(jq -r '.nexus_id' <<<"$mod")
    file_name=$(jq -r '.file_name // empty' <<<"$mod")

    url="https://api.nexusmods.com/v1/games/skyrimspecialedition/mods/$nexus_id"
    [[ -n "$file_name" ]] && url+='/files.json' || url+='.json'
    response=$(curl -fsSL --retry 3 -H "apikey: $NEXUSMODS_API_KEY" "$url")

    if [[ -n "$file_name" ]]; then
        observed=$(jq -c --arg name "$file_name" '
            [.files[] | select(.name == $name and
              (.category_name | IN("MAIN", "UPDATE", "OPTIONAL", "MISCELLANEOUS")))]
            | if length == 1 then
                {status:"ok", version:.[0].version, file_id:.[0].file_id}
              else
                {status:"review", candidates:map({file_id,version,category_name})}
              end
        ' <<<"$response")
    else
        observed=$(jq -c '{status:"ok", version:.version}' <<<"$response")
    fi

    jq -cn --arg id "$id" --argjson mod "$mod" --argjson observed "$observed" \
        '$mod + ($observed | if has("version") then .upstream_version = .version | del(.version) else . end) + {id:$id}'
done | jq -s '.'
