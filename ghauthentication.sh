echo "Get a github personal access token for github.com/chrispvm and paste it here. See https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token.
\nWhat is your personal access token?"

read;
echo "${REPLY}" | gh auth login --with-token


