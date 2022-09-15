add_contract(inery.msig inery.msig ${CMAKE_CURRENT_SOURCE_DIR}/src/inery.msig.cpp)

target_include_directories(inery.msig
   PUBLIC
   ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(inery.msig
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/ricardian/inery.msig.contracts.md.in ${CMAKE_CURRENT_BINARY_DIR}/ricardian/inery.msig.contracts.md @ONLY )

target_compile_options( inery.msig PUBLIC -R${CMAKE_CURRENT_SOURCE_DIR}/ricardian -R${CMAKE_CURRENT_BINARY_DIR}/ricardian )
