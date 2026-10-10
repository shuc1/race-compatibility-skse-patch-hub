#!/usr/bin/env bash
set -euo pipefail

results=${1:?Usage: sync-nexus-issues.sh <results.json>}
issues=$(gh issue list --state all --limit 1000 --json number,state,body)
normalize() { sed -E 's/(\.0)+$//' <<<"$1"; }

while read -r mod; do
    id=$(jq -r '.id' <<<"$mod")
    name=$(jq -r '.name' <<<"$mod")
    verified=$(jq -r '.version' <<<"$mod")
    status=$(jq -r '.status' <<<"$mod")
    latest=$(jq -r '.upstream_version // empty' <<<"$mod")

    marker="<!-- nexus-watch:$id -->"
    issue=$(jq -c --arg marker "$marker" \
        '[.[] | select((.body // "") | contains($marker))] | max_by(.number) // {}' <<<"$issues")
    number=$(jq -r '.number // empty' <<<"$issue")
    state=$(jq -r '.state // empty' <<<"$issue")

    if [[ "$status" == ok && "$(normalize "$verified")" == "$(normalize "$latest")" ]]; then
        echo "OK $id: $verified"
        [[ "$state" != OPEN ]] || gh issue close "$number" --comment 'Patch version matches Nexus Mods.'
        continue
    fi

    if [[ "$status" == review ]]; then
        title="[Nexus Mods] Check file match: $name"
        details=$(jq -r '
            "File: `\(.file_name)`\n" +
            (if (.candidates | length) == 0 then "No matching active file"
             else .candidates | map("- File #\(.file_id): `\(.version)` (\(.category_name))") | join("\n") end)
        ' <<<"$mod")
        observed=$(jq -cS '{status,candidates}' <<<"$mod" | sha256sum | cut -c1-16)
    else
        title="[Nexus Mods update] $name: $latest"
        details="Upstream version: \`$latest\`"
        observed="version:$latest"
    fi

    body=$(printf '%s\n<!-- nexus-observed:%s -->\n\n**Check patch compatibility**\n\n- Mod: **%s**\n- Verified: `%s`\n- Nexus Mods: https://www.nexusmods.com/skyrimspecialedition/mods/%s\n\n%s\n' \
        "$marker" "$observed" "$name" "$verified" "$(jq -r '.nexus_id' <<<"$mod")" "$details")

    if [[ -z "$number" ]]; then
        gh issue create --title "$title" --body "$body"
    elif [[ "$state" == OPEN ]]; then
        [[ "$(jq -r '.body' <<<"$issue")" == "$body" ]] || \
            gh issue edit "$number" --title "$title" --body "$body"
    elif ! jq -e --arg marker "<!-- nexus-observed:$observed -->" \
        '(.body // "") | contains($marker)' <<<"$issue" >/dev/null; then
        gh issue reopen "$number"
        gh issue edit "$number" --title "$title" --body "$body"
    fi
done < <(jq -c '.[]' "$results")
