# Until we get some of these modules into the upstream packages, put them here
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_INSTALL_PREFIX}/share/CMake")

include(ExternalProject)
find_package( PkgConfig QUIET )

find_package( IlmBase COMPONENTS Half QUIET )
if(IlmBase_FOUND)
  message( STATUS "Found IlmBase, version ${IlmBase_VERSION}" )
  include_directories( ${IlmBase_INCLUDE_DIRS} )
  link_directories( ${IlmBase_LIBRARY_DIRS} )
  set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${IlmBase_CFLAGS}" )
  set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${IlmBase_CFLAGS}" )
  set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${IlmBase_LDFLAGS}" )
  set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${IlmBase_LDFLAGS}" )
  set( CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${IlmBase_LDFLAGS}" )
else()
  message( STATUS "IlmBase not found, you can brew it" )
endif()

find_package( AcesContainer QUIET )
if (AcesContainer_FOUND)
  message( STATUS "Found AcesContainer, version ${AcesContainer_VERSION}" )
else()
  message( STATUS "AcesContainer not found, you can brew it" )
endif()

find_package( libraw QUIET )
if (libraw_FOUND)
  message( STATUS "Found LibRaw, version ${libraw_VERSION}" )
else()
  message( STATUS "libraw not found, you can brew it" )
endif()

find_package( Ceres QUIET )
if ( NOT Ceres_FOUND )
  message( STATUS "Ceres not found, you can brew it" )
endif()

find_package( Boost QUIET )
if ( Boost_FOUND )
  message( STATUS "Found Boost_FOUND, version ${Boost_VERSION}" )
else ()
  message( STATUS "Boost not found, you can brew it" )
endif()