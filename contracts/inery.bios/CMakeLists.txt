add_contract(inery.bios inery.bios ${CMAKE_CURRENT_SOURCE_DIR}/src/inery.bios.cpp)

target_include_directories(inery.bios
   PUBLIC
   ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(inery.bios
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/ricardian/inery.bios.contracts.md.in ${CMAKE_CURRENT_BINARY_DIR}/ricardian/inery.bios.contracts.md @ONLY )

target_compile_options( inery.bios PUBLIC -R${CMAKE_CURRENT_SOURCE_DIR}/ricardian -R${CMAKE_CURRENT_BINARY_DIR}/ricardian )
