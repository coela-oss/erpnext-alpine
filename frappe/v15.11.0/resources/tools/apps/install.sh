#!/bin/sh -e

WORK_DIR="/home/frappe"
REPOS_FILE="$WORK_DIR/tools/apps/repos.txt"
OUTPUT_FILE="$WORK_DIR/sites/apps.txt"

while IFS=, read -r repo branch dir method
do
  git clone --depth 1 --branch "$branch" "https://github.com/$repo" "$WORK_DIR/$dir"
done < "$REPOS_FILE"

while IFS=, read -r repo branch dir method
do
  if [[ $method == "pipx" ]]; then
    if [[ $repo == "frappe" ]]; then
      pipx install --include-deps "$WORK_DIR/$dir"
    else
      pipx inject --include-deps --include-apps frappe "$WORK_DIR/$dir"
    fi
  elif [[ $method == "pip" ]]; then
    python -m pip install "$dir"
  fi
  repo_name=$(echo "$dir" | cut -d '/' -f 2)
  echo "$repo_name" >> "$OUTPUT_FILE"  
done < "$REPOS_FILE"
