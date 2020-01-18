function (add_test_target test_name file_name)

    add_executable("${test_name}" "${file_name}")
    target_compile_definitions("${test_name}" PRIVATE "fsanitize=address,undefined" "fno-omit-frame-pointer")
    target_link_libraries("${test_name}" -fsanitize=address,undefined Catch2::Catch2)

    if (${ARGC} EQUAL 3)
        add_executable("${test_name}-threadsan" "${file_name}")
        target_compile_definitions("${test_name}-threadsan" PUBLIC "fsanitize=thread")
        target_link_libraries("${test_name}-threadsan" -fsanitize=thread Catch2::Catch2)
        catch_discover_tests("${test_name}-threadsan" TEST_SUFFIX "THREADSAN")
        catch_discover_tests("${test_name}" TEST_SUFFIX "ASAN/UBSAN")

    else()
        catch_discover_tests("${test_name}")
    endif()

endfunction()
