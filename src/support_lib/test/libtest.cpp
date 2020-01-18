#define CATCH_CONFIG_MAIN 1
#include <catch2/catch.hpp>

TEST_CASE("Smoke", "[smoke]" ) {

    REQUIRE( 1 == 1 );
}
