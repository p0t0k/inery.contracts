add_contract(inery.wrap inery.wrap ${CMAKE_CURRENT_SOURCE_DIR}/src/inery.wrap.cpp)

target_include_directories(inery.wrap
   PUBLIC
   ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(inery.wrap
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/ricardian/inery.wrap.contracts.md.in ${CMAKE_CURRENT_BINARY_DIR}/ricardian/inery.wrap.contracts.md @ONLY )

target_compile_options( inery.wrap PUBLIC -R${CMAKE_CURRENT_SOURCE_DIR}/ricardian -R${CMAKE_CURRENT_BINARY_DIR}/ricardian )
