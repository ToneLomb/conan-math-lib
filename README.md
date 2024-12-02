## conan-math-lib

#### This project shows how to build a simple conan package, and test it

This can then be published on jfrog artifactory for example

## How to build and upload the package containing the math library :

Clone the project

``` 
git clone https://github.com/ToneLomb/conan-math-lib.git
cd conan-math-lib
```

Create a python environement and install conan

``` 
python -m venv venv 
pip install conan
```

Build the conan package

```
cd mathlib
conan create .
```

If everything is good, the test package should be automaticly executed with no errors

You can check that the package is in the local cache with the following command :

```
conan list mathlib
```

If everything is correct, there should be no error message displayed.

Then, feel free to publish it on a repository like jfrog artifactory. You can use a docker or a free domain that jfrog provides for trial.

For example with docker :

```
sudo docker run --name artifactory -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-cpp-ce:7.63.12
```

Go to http://localhost:8081, follow the instructions. Create a repository and check for your repository key

Add your repository and login into it :

``` 
conan remote add <repository_name> http://localhost:8081/artifactory/api/conan/<repository_key>
conan remote login <repository_name>
```

After successfully login you should see something like : 

**_Changed user of remote 'artifactory' from 'None' (anonymous) to 'admin' (authenticated)_**

Then upload the package with: 

```
conan upload mathlib/<your_version> -r <repository_name>
```

In this project the version is 1.0.1

Now the package is uploaded, you should be able to see it with :

```
conan search mathlib
conan search -r <repository_name> #to specify with repository to look on
```

You can also verify that the lib is correctly uploaded on the docker UI in the artifacts tab.

## Consuming the package on another project

After creating a python venv and configuring the conan remote repository create your project and include the library.

```cpp
#include <mathlib/mathlib.h> #This depends on what you put in the CMakeLists.txt
```

You will find in the consuming folder an example of a project consuming a package.

After creating the conanfile.py and the CMakeLists.txt, follow these commands:

```
conan install . --build=missing
cd build/Release
source ./generators/conanbuild.sh
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=generators/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build .
```

Then you can test your executable, here it is :

```
./test_conan 
```