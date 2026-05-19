# Set identification from install inputs
if [[ -n ${ARCALOS_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$ARCALOS_USER_NAME"
fi

if [[ -n ${ARCALOS_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$ARCALOS_USER_EMAIL"
fi
