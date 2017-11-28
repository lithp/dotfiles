#! /usr/bin/env bash

# This exports AUTH_TOKEN and USER
# More on AUTH_TOKEN here: http://api.beeminder.com/#beeminder-api-reference
source ~/.i3/beeminder-auth.sh

goals=$(curl -s https://www.beeminder.com/api/v1/users/$USER/goals.json?auth_token=$AUTH_TOKEN)

IFS=$'\n'
# some day you might also want: curval, safebump, yaw, pledge
filtered=( $(jq -c 'sort_by(-.losedate) | .[] | {slug, limsum}' <<<$goals) )

emit_goal ()
{
  slug=$(jq -r '.slug' <<<$1)
  limsum=$(jq -r '.limsum' <<<$1)
  printf '%s %s' $slug $limsum
}

emit_goal "${filtered[-2]}"

for goal in "${filtered[@]: -1}"
do
  printf ' | '
  emit_goal "$goal"
done

printf '\n'
