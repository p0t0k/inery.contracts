add_contract(inery.token inery.token ${CMAKE_CURRENT_SOURCE_DIR}/src/inery.token.cpp)

target_include_directories(inery.token
   PUBLIC
   ${CMAKE_CURRENT_SOURCE_DIR}/include
   ${CMAKE_CURRENT_SOURCE_DIR}/../inery.system/include)

set_target_properties(inery.token
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/ricardian/inery.token.contracts.md.in ${CMAKE_CURRENT_BINARY_DIR}/ricardian/inery.token.contracts.md @ONLY )

target_compile_options( inery.token PUBLIC -R${CMAKE_CURRENT_SOURCE_DIR}/ricardian -R${CMAKE_CURRENT_BINARY_DIR}/ricardian )
