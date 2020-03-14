echo ''
echo 'This script will automatically remove the default Github labels and create new labels for the repo you define. You will need a personal access token to access private repos, head to https://github.com/settings/tokens to get one!'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. johndoe/my-cool-repo): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# delete default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix


# labels: helpers
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Bug","color":"EF5350","description":"something is broken or not working."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Bug: development","color":"EF5350","description":"something is broken or not working in a development environment."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Bug: production","color":"EF5350","description":"something is broken or not working in a production environment."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Feature","color":"66BB6A","description":"A new feature or change."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# labels: frameworks/technology
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"CSS","color":"42A5F5","description":"CSS, styling, design."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"SCSS","color":"42A5F5","description":"SCSS, styling, design."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"SASS","color":"42A5F5","description":"SASS, styling, design."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"JS","color":"FFCA28","description":"Javascript related."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"TypeScript","color":"42A5F5","description":"TypeScript related."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"jQuery","color":"42A5F5","description":"jQuery related."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"PHP","color":"AB47BC","description":"PHP related."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# labels: workflow/teams
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Dependencies","color":"1E88E5","description":"A dependency change, update or edit."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Test: unit","color":"00897B","description":"Related to unit test."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Test: e2e","color":"00897B","description":"Related to e2e (end to end) test."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Chore","color":"000000","description":"Something generic, cleanup etc."}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Chore: requires testing","color":"000000","description":"Requires testing"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
