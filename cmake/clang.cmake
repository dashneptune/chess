# find clang-tidy-9
find_program(
    CLANG_TIDY_EXE
    NAMES "clang-tidy-9"
    DOC "Path to clang tidy"
    )

if(NOT CLANG_TIDY_EXE)
    message(FATAL_ERROR "clang-tidy-9 not found.")
else()
    message(STATUS "clang-tidy-9: ${CLANG_TIDY_EXE}")
endif()

set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
set(CMAKE_C_CLANG_TIDY "${CLANG_TIDY_EXE}")

find_program(CLANG_FORMAT clang-format-9)
if(NOT CLANG_FORMAT)
	message(STATUS "Did not find clang-format, target format is disabled.")
else()
	message(STATUS "Found clang-format, use \"make format\" to run it.")
	
	add_custom_target(format
		COMMAND find . -iname "*.h" -o -iname "*.tpp" -o -iname "*.cpp" | xargs ${CLANG_FORMAT} -style=file -i -verbose
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src/
	)
endif()
