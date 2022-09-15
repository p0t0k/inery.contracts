# Ensures passed in version values are supported.
function check-version-numbers() {
  CHECK_VERSION_MAJOR=$1
  CHECK_VERSION_MINOR=$2

  if [[ $CHECK_VERSION_MAJOR -lt $INERY_MIN_VERSION_MAJOR ]]; then
    exit 1
  fi
  if [[ $CHECK_VERSION_MAJOR -gt $INERY_MAX_VERSION_MAJOR ]]; then
    exit 1
  fi
  if [[ $CHECK_VERSION_MAJOR -eq $INERY_MIN_VERSION_MAJOR ]]; then
    if [[ $CHECK_VERSION_MINOR -lt $INERY_MIN_VERSION_MINOR ]]; then
      exit 1
    fi
  fi
  if [[ $CHECK_VERSION_MAJOR -eq $INERY_MAX_VERSION_MAJOR ]]; then
    if [[ $CHECK_VERSION_MINOR -gt $INERY_MAX_VERSION_MINOR ]]; then
      exit 1
    fi
  fi
  exit 0
}


# Handles choosing which INERY directory to select when the default location is used.
function default-inery-directories() {
  REGEX='^[0-9]+([.][0-9]+)?$'
  ALL_INERY_SUBDIRS=()
  if [[ -d ${HOME}/inery ]]; then
    ALL_INERY_SUBDIRS=($(ls ${HOME}/inery | sort -V))
  fi
  for ITEM in "${ALL_INERY_SUBDIRS[@]}"; do
    if [[ "$ITEM" =~ $REGEX ]]; then
      DIR_MAJOR=$(echo $ITEM | cut -f1 -d '.')
      DIR_MINOR=$(echo $ITEM | cut -f2 -d '.')
      if $(check-version-numbers $DIR_MAJOR $DIR_MINOR); then
        PROMPT_INERY_DIRS+=($ITEM)
      fi
    fi
  done
  for ITEM in "${PROMPT_INERY_DIRS[@]}"; do
    if [[ "$ITEM" =~ $REGEX ]]; then
      INERY_VERSION=$ITEM
    fi
  done
}


# Prompts or sets default behavior for choosing INERY directory.
function inery-directory-prompt() {
  if [[ -z $INERY_DIR_PROMPT ]]; then
    default-inery-directories;
    echo 'No INERY location was specified.'
    while true; do
      if [[ $NONINTERACTIVE != true ]]; then
        if [[ -z $INERY_VERSION ]]; then
          echo "No default INERY installations detected..."
          PROCEED=n
        else
          printf "Is INERY installed in the default location: $HOME/inery/$INERY_VERSION (y/n)" && read -p " " PROCEED
        fi
      fi
      echo ""
      case $PROCEED in
        "" )
          echo "Is INERY installed in the default location?";;
        0 | true | [Yy]* )
          break;;
        1 | false | [Nn]* )
          if [[ $PROMPT_INERY_DIRS ]]; then
            echo "Found these compatible INERY versions in the default location."
            printf "$HOME/inery/%s\n" "${PROMPT_INERY_DIRS[@]}"
          fi
          printf "Enter the installation location of INERY:" && read -e -p " " INERY_DIR_PROMPT;
          INERY_DIR_PROMPT="${INERY_DIR_PROMPT/#\~/$HOME}"
          break;;
        * )
          echo "Please type 'y' for yes or 'n' for no.";;
      esac
    done
  fi
  export INERY_INSTALL_DIR="${INERY_DIR_PROMPT:-${HOME}/inery/${INERY_VERSION}}"
}


# Prompts or default behavior for choosing INERY.CDT directory.
function cdt-directory-prompt() {
  if [[ -z $CDT_DIR_PROMPT ]]; then
    echo 'No INERY.CDT location was specified.'
    while true; do
      if [[ $NONINTERACTIVE != true ]]; then
        printf "Is INERY.CDT installed in the default location? /usr/local/inery.cdt (y/n)" && read -p " " PROCEED
      fi
      echo ""
      case $PROCEED in
        "" )
          echo "Is INERY.CDT installed in the default location?";;
        0 | true | [Yy]* )
          break;;
        1 | false | [Nn]* )
          printf "Enter the installation location of INERY.CDT:" && read -e -p " " CDT_DIR_PROMPT;
          CDT_DIR_PROMPT="${CDT_DIR_PROMPT/#\~/$HOME}"
          break;;
        * )
          echo "Please type 'y' for yes or 'n' for no.";;
      esac
    done
  fi
  export CDT_INSTALL_DIR="${CDT_DIR_PROMPT:-/usr/local/inery.cdt}"
}


# Ensures INERY is installed and compatible via version listed in tests/CMakeLists.txt.
function nodine-version-check() {
  INSTALLED_VERSION=$(echo $($INERY_INSTALL_DIR/bin/nodine --version))
  INSTALLED_VERSION_MAJOR=$(echo $INSTALLED_VERSION | cut -f1 -d '.' | sed 's/v//g')
  INSTALLED_VERSION_MINOR=$(echo $INSTALLED_VERSION | cut -f2 -d '.' | sed 's/v//g')

  if [[ -z $INSTALLED_VERSION_MAJOR || -z $INSTALLED_VERSION_MINOR ]]; then
    echo "Could not determine INERY version. Exiting..."
    exit 1;
  fi

  if $(check-version-numbers $INSTALLED_VERSION_MAJOR $INSTALLED_VERSION_MINOR); then
    if [[ $INSTALLED_VERSION_MAJOR -gt $INERY_SOFT_MAX_MAJOR ]]; then
      echo "Detected INERY version is greater than recommended soft max: $INERY_SOFT_MAX_MAJOR.$INERY_SOFT_MAX_MINOR. Proceed with caution."
    fi
    if [[ $INSTALLED_VERSION_MAJOR -eq $INERY_SOFT_MAX_MAJOR && $INSTALLED_VERSION_MINOR -gt $INERY_SOFT_MAX_MINOR ]]; then
      echo "Detected INERY version is greater than recommended soft max: $INERY_SOFT_MAX_MAJOR.$INERY_SOFT_MAX_MINOR. Proceed with caution."
    fi
  else
    echo "Supported versions are: $INERY_MIN_VERSION_MAJOR.$INERY_MIN_VERSION_MINOR - $INERY_MAX_VERSION_MAJOR.$INERY_MAX_VERSION_MINOR"
    echo "Invalid INERY installation. Exiting..."
    exit 1;
  fi
}
