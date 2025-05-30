include(CompilerRTCompile)

include_directories(..)

set(RTSAN_UNITTEST_CFLAGS
  ${COMPILER_RT_UNITTEST_CFLAGS}
  ${COMPILER_RT_GTEST_CFLAGS}
  ${COMPILER_RT_GMOCK_CFLAGS}
  ${SANITIZER_TEST_CXX_CFLAGS}
  -I${COMPILER_RT_SOURCE_DIR}/lib/
  -I${COMPILER_RT_SOURCE_DIR}/include/
  -I${COMPILER_RT_SOURCE_DIR}/lib/rtsan
  -I${COMPILER_RT_SOURCE_DIR}/lib/sanitizer_common/tests
  -DSANITIZER_COMMON_NO_REDEFINE_BUILTINS
  -O2)

set(RTSAN_INST_TEST_SOURCES
    rtsan_test_functional.cpp
    rtsan_test_interceptors_posix.cpp
    rtsan_test_main.cpp)

set(RTSAN_NOINST_TEST_SOURCES
    ../rtsan_preinit.cpp
    rtsan_test_assertions.cpp
    rtsan_test_context.cpp
    rtsan_test_main.cpp)

set(RTSAN_UNITTEST_HEADERS
    rtsan_test_utilities.h)

add_custom_target(RtsanUnitTests)
set_target_properties(RtsanUnitTests PROPERTIES FOLDER "Compiler-RT Tests")

set(RTSAN_UNITTEST_LINK_FLAGS
  ${COMPILER_RT_UNITTEST_LINK_FLAGS}
  ${COMPILER_RT_UNWINDER_LINK_LIBS}
  ${SANITIZER_TEST_CXX_LIBRARIES}
  -no-pie)

if (COMPILER_RT_USE_ATOMIC_LIBRARY)
  list(APPEND RTSAN_UNITTEST_LINK_FLAGS ${COMPILER_RT_ATOMIC_LIBRARY})
  if (NOT WIN32)
    get_filename_component(atomic_dir ${COMPILER_RT_ATOMIC_LIBRARY} DIRECTORY)
    list(APPEND RTSAN_UNITTEST_LINK_FLAGS "-Wl,-rpath,${atomic_dir}")
  endif()
else()
  append_list_if(COMPILER_RT_HAS_LIBATOMIC -latomic RTSAN_UNITTEST_LINK_FLAGS)
endif()
append_list_if(COMPILER_RT_HAS_LIBDL -ldl RTSAN_UNITTEST_LINK_FLAGS)
append_list_if(COMPILER_RT_HAS_LIBRT -lrt RTSAN_UNITTEST_LINK_FLAGS)
append_list_if(COMPILER_RT_HAS_LIBM -lm RTSAN_UNITTEST_LINK_FLAGS)
append_list_if(COMPILER_RT_HAS_LIBPTHREAD -pthread RTSAN_UNITTEST_LINK_FLAGS)
append_list_if(COMPILER_RT_HAS_LIBLOG -llog RTSAN_UNITTEST_LINK_FLAGS)

if (APPLE)
  add_weak_symbols("sanitizer_common" WEAK_SYMBOL_LINK_FLAGS)
  list(APPEND RTSAN_UNITTEST_LINK_FLAGS ${WEAK_SYMBOL_LINK_FLAGS})
  list(APPEND RTSAN_UNITTEST_LINK_FLAGS ${DARWIN_osx_LINK_FLAGS})
  list(APPEND RTSAN_UNITTEST_CFLAGS ${DARWIN_osx_CFLAGS})
endif()

set(COMPILER_RT_GOOGLETEST_SOURCES ${COMPILER_RT_GTEST_SOURCE} ${COMPILER_RT_GMOCK_SOURCE})

set(RTSAN_TEST_ARCH ${RTSAN_SUPPORTED_ARCH})
if(APPLE)
  darwin_filter_host_archs(RTSAN_SUPPORTED_ARCH RTSAN_TEST_ARCH)
endif()

foreach(arch ${RTSAN_TEST_ARCH})
  set(RtsanTestObjects)

  generate_compiler_rt_tests(RtsanTestObjects
    RtsanUnitTests "Rtsan-${arch}-Test" ${arch}
    COMPILE_DEPS ${RTSAN_UNITTEST_HEADERS}
    SOURCES ${RTSAN_INST_TEST_SOURCES} ${COMPILER_RT_GOOGLETEST_SOURCES}
    DEPS rtsan
    CFLAGS ${RTSAN_UNITTEST_CFLAGS} -fsanitize=realtime
    LINK_FLAGS ${RTSAN_UNITTEST_LINK_FLAGS} -fsanitize=realtime)

  check_symbol_exists(__GLIBC__ stdio.h RTSAN_USING_GLIBC)
  if (RTSAN_USING_GLIBC)
    set(RtsanTestObjects_FileOffset64)
    generate_compiler_rt_tests(RtsanTestObjects_FileOffset64
      RtsanUnitTests "Rtsan-${arch}-FileOffset64-Test" ${arch}
      COMPILE_DEPS ${RTSAN_UNITTEST_HEADERS}
      SOURCES ${RTSAN_INST_TEST_SOURCES} ${COMPILER_RT_GOOGLETEST_SOURCES}
      DEPS rtsan
      CFLAGS ${RTSAN_UNITTEST_CFLAGS} -D_FILE_OFFSET_BITS=64 -fsanitize=realtime
      LINK_FLAGS ${RTSAN_UNITTEST_LINK_FLAGS} -fsanitize=realtime)
  endif()

  set(RTSAN_TEST_RUNTIME RTRtsanTest.${arch})
  if(APPLE)
    set(RTSAN_TEST_RUNTIME_OBJECTS
      $<TARGET_OBJECTS:RTRtsan.osx>
      $<TARGET_OBJECTS:RTInterception.osx>
      $<TARGET_OBJECTS:RTSanitizerCommon.osx>
      $<TARGET_OBJECTS:RTSanitizerCommonLibc.osx>
      $<TARGET_OBJECTS:RTSanitizerCommonCoverage.osx>
      $<TARGET_OBJECTS:RTSanitizerCommonSymbolizer.osx>)
  else()
    set(RTSAN_TEST_RUNTIME_OBJECTS
      $<TARGET_OBJECTS:RTRtsan.${arch}>
      $<TARGET_OBJECTS:RTInterception.${arch}>
      $<TARGET_OBJECTS:RTSanitizerCommon.${arch}>
      $<TARGET_OBJECTS:RTSanitizerCommonLibc.${arch}>
      $<TARGET_OBJECTS:RTSanitizerCommonCoverage.${arch}>
      $<TARGET_OBJECTS:RTSanitizerCommonSymbolizer.${arch}>
      $<TARGET_OBJECTS:RTSanitizerCommonSymbolizerInternal.${arch}>)
  endif()
  add_library(${RTSAN_TEST_RUNTIME} STATIC ${RTSAN_TEST_RUNTIME_OBJECTS})
  set_target_properties(${RTSAN_TEST_RUNTIME} PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      FOLDER "Compiler-RT Runtime tests")

  set(RtsanNoInstTestObjects)
  generate_compiler_rt_tests(RtsanNoInstTestObjects
    RtsanUnitTests "Rtsan-${arch}-NoInstTest" ${arch}
    COMPILE_DEPS ${RTSAN_UNITTEST_HEADERS}
    SOURCES ${RTSAN_NOINST_TEST_SOURCES}
            ${COMPILER_RT_GOOGLETEST_SOURCES}
    CFLAGS ${RTSAN_UNITTEST_CFLAGS}
    LINK_FLAGS ${RTSAN_UNITTEST_LINK_FLAGS}
    RUNTIME ${RTSAN_TEST_RUNTIME})
  set_target_properties(RtsanUnitTests PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
endforeach()
