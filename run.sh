# ------- Preparation -------------------------
# Default command:
#
# ./run.sh CHECK=1 SUITESPARSE=0 CUDA=0
export CHECK=1
export SUITESPARSE=0
export CUDA=1

# Parse arguments:
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done
echo "Compiling with the following arguments..."
echo "SUITESPARSE: ${SUITESPARSE}"
echo "CHECK: ${CHECK}"

# Specify some root directories.
export RIM_ROOT=$PWD
export RIM_BUILD_ROOT=$PWD/build
mkdir -p build

# # Compile pbrt.
# cd $RIM_BUILD_ROOT
# mkdir -p pbrt-v3
# cd pbrt-v3
# cmake ../../external/pbrt-v3
# RET=$?
# if [ $RET != 0 ]; then
#     echo "$(tput setaf 1)cmake in pbrt-v3 failed. Please check the output."
#     exit
# fi
# make -j$(nproc)
# RET=$?
# if [ $RET != 0 ]; then
#     echo "$(tput setaf 1)make in pbrt-v3 failed. Please check the output."
#     exit
# fi

# -------- Compile our codebase ----------------
cd $RIM_BUILD_ROOT
mkdir -p Concept
cd Concept

# Configure the options for cmake.
CMAKE_OPTIONS="-DRIM_ROOT=${RIM_ROOT}"
if [ $CHECK != 0 ]; then
    CMAKE_OPTIONS="${CMAKE_OPTIONS} -DRIM_CHECK=ON"
else
    CMAKE_OPTIONS="${CMAKE_OPTIONS} -DRIM_CHECK=OFF"
fi
if [ $CUDA != 0 ]; then
    CMAKE_OPTIONS="${CMAKE_OPTIONS} -DRIM_CUDA=ON"
else
    CMAKE_OPTIONS="${CMAKE_OPTIONS} -DRIM_CUDA=OFF"
fi
cmake ${CMAKE_OPTIONS} ../../

RET=$?
if [ $RET != 0 ]; then
    echo "$(tput setaf 1)cmake in Concept failed. Please check the output."
    exit
fi

make -j$(nproc)
RET=$?
if [ $RET != 0 ]; then
    echo "$(tput setaf 1)make in Concept failed. Please check the output."
    exit
fi