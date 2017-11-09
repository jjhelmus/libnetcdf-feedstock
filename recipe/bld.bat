mkdir %SRC_DIR%\build
cd %SRC_DIR%\build

cmake -G "NMake Makefiles" ^
<<<<<<< HEAD
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
=======
      -D CMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
>>>>>>> remove vc features (use run_exports vc pkg instead)
      -D BUILD_SHARED_LIBS=ON ^
      -D ENABLE_TESTS=OFF ^
      -D ENABLE_HDF4=ON ^
      -D CMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
      -D ZLIB_LIBRARY="%LIBRARY_LIB%\zlib.lib" ^
      -D ZLIB_INCLUDE_DIR="%LIBRARY_INC%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D ENABLE_CDF5=ON ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

ctest
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
