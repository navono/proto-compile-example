set -e

[ -z "${NUM_CPUS}" ] && NUM_CPUS=`grep -c ^processor /proc/cpuinfo`

# Create a fake home. Python site libs tries to do getpwuid(3) if we don't and
# the CI Docker image gets confused as it has no passwd entry when running
# non-root unless we do this.
FAKE_HOME=/tmp/fake_home
mkdir -p "${FAKE_HOME}"
export HOME="${FAKE_HOME}"
export PYTHONUSERBASE="${FAKE_HOME}"

BAZEL_OPTIONS="--package_path %workspace%:/source"
export BAZEL_QUERY_OPTIONS="${BAZEL_OPTIONS}"
export BAZEL_BUILD_OPTIONS="--strategy=Genrule=standalone --spawn_strategy=standalone \
  --verbose_failures ${BAZEL_OPTIONS} --jobs=${NUM_CPUS} \
  --action_env=HOME --action_env=PYTHONUSERBASE"
