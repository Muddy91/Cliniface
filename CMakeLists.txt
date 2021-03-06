cmake_minimum_required(VERSION 3.12.2 FATAL_ERROR)

PROJECT( cliniface)

set( APP_NAME          "Cliniface")
set( EXE_NAME          "${PROJECT_NAME}")
set( APP_CONTACT_EMAIL "r.l.palmer@curtin.edu.au")
set( APP_AUTHOR_NAME   "Richard Palmer")
set( APP_ORGANISATION  "Spatial Information Systems Research Limited")
set( APP_DESCRIPTION   "3D Facial Image Visualisation and Analysis")
set( APP_WEBSITE       "https://${PROJECT_NAME}.org")
set( APP_SOURCE        "https://github.com/frontiersi/${PROJECT_NAME}/releases")

# Version code: A.B.C.D
# A: APP_VERSION_MAJOR - Significant feature additions or major changes to how the user works with the tool.
# B: APP_VERSION_MINOR - Some feature additions or significant changes to how existing features are implemented.
# C: APP_VERSION_PATCH - Bug fixes and/or minor changes to how existing features are implemented.
# D: APP_BUILD_DTSTAMP - Date-time stamp of build (coordinated universal time).
set( APP_VERSION_MAJOR 4)
set( APP_VERSION_MINOR 1)
set( APP_VERSION_PATCH 0)
string( TIMESTAMP APP_BUILD_DTSTAMP "%y%m%d" UTC)
set( APP_VERSION_STRING "${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_PATCH}.${APP_BUILD_DTSTAMP}")

set( _examples "examples")
set( _html "html")
set( _data "data")

set( _faceModelsDir "${_data}/facemodels")
set( _haar_cascades_models "${_faceModelsDir}/haarcascades")
set( _face_shape_landmarks "${_faceModelsDir}/shape_predictor_68_face_landmarks.dat")

# Set default locations required files for preferences.
# IDTF converter needed for U3D export and pdflatex required for report generation.
# On Linux, it is assumed that a viable texlive installation is available.
set( _u3dIntel "u3dIntel")
set( _pdflatex "/usr/bin/pdflatex")
set( _idtf_converter "${_u3dIntel}/bin/IDTFConverter")
set( _pdfreader "/usr/bin/evince")
set( _inkscape "/usr/bin/inkscape")
if ( WIN32)
    set( _pdflatex "texmfs/install/miktex/bin/pdflatex.exe")
    set( _u3dIntel "u3dIntelWin")
    set( _idtf_converter "${_u3dIntel}/IDTFConverter.exe")
    set( _pdfreader "C:/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe")
    set( _inkscape "C:/Program Files/Inkscape/inkscape.exe")
endif()

set( WITH_FACETOOLS TRUE)
include( "$ENV{DEV_PARENT_DIR}/libbuild/cmake/FindLibs.cmake")

set( INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")
set( SRC_DIR "${PROJECT_SOURCE_DIR}/src")
set( FORMS_DIR "${PROJECT_SOURCE_DIR}/forms")

# Configure application definitions
configure_file( "${INCLUDE_DIR}/${APP_NAME}_Config.h.in" "${APP_NAME}_Config.h")


set( FORMS
    "${FORMS_DIR}/${APP_NAME}Main.ui"
    "${FORMS_DIR}/AboutDialog.ui"
    "${FORMS_DIR}/PreferencesDialog.ui"
    )

set( QOBJECTS
    "${INCLUDE_DIR}/${APP_NAME}Main.h"
    "${INCLUDE_DIR}/AboutDialog.h"
    "${INCLUDE_DIR}/PreferencesDialog.h"
    "${INCLUDE_DIR}/${APP_NAME}PluginsLoader.h"
    )

set( INCLUDE_FILES
    ${QOBJECTS}
    "${INCLUDE_DIR}/Preferences.h"
    )

set( SRC_FILES
    ${SRC_DIR}/main
    ${SRC_DIR}/${APP_NAME}Main
    ${SRC_DIR}/AboutDialog
    ${SRC_DIR}/PreferencesDialog
    ${SRC_DIR}/${APP_NAME}PluginsLoader
    ${SRC_DIR}/Preferences
    )

set( RESOURCE_FILE "resources.qrc")
qt5_wrap_ui( FORM_HEADERS ${FORMS})
qt5_wrap_cpp( QOBJECT_MOCS ${QOBJECTS})
qt5_add_resources( RESOURCE_FILE ${RESOURCE_FILE})

# Resource file for exe icon (used by Windows)
set( ICON_RC "icon.rc")

include_directories( ${INCLUDE_DIR})
include_directories( ${PROJECT_BINARY_DIR})

add_executable( ${PROJECT_NAME}
    ${SRC_FILES}
    ${INCLUDE_FILES}
    ${FORMS}
    ${FORM_HEADERS}
    ${QOBJECT_MOCS}
    ${ICON_RC}
    ${RESOURCE_FILE}
    "${INCLUDE_DIR}/${APP_NAME}_Config.h.in"
    )

set_property( TARGET ${PROJECT_NAME} PROPERTY WIN32_EXECUTABLE true)

set( _bindir "${PROJECT_BINARY_DIR}/bin")
set_target_properties( ${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${_bindir}")
file( MAKE_DIRECTORY "${_bindir}/${_data}")

# On Windows, there's no RPATH so we must collect all the DLLs and place into the project binary dir.
# Note that ExeInstall.cmake does also include LinkTargets.cmake for UNIX!
include( "$ENV{DEV_PARENT_DIR}/libbuild/cmake/ExeInstall.cmake")

# Copy across license
file( COPY "${PROJECT_SOURCE_DIR}/LICENSE" DESTINATION "${_bindir}")

# Extract the examples archive into the build location.
if ( NOT EXISTS "${PROJECT_BINARY_DIR}/examples")
    message( STATUS "Extracting examples.tgz to ${PROJECT_BINARY_DIR}/examples")
    execute_process( COMMAND ${CMAKE_COMMAND} -E tar xzf "${PROJECT_SOURCE_DIR}/examples.tgz" WORKING_DIRECTORY "${PROJECT_BINARY_DIR}")
endif()

# Extract the IDTFConverter tool (for U3D export) into the build binary directory
if ( NOT EXISTS "${_bindir}/${_u3dIntel}")
    message( STATUS "Extracting ${_u3dIntel}.tgz to ${_bindir}/${_u3dIntel}")
    execute_process( COMMAND ${CMAKE_COMMAND} -E tar xzf "${PROJECT_SOURCE_DIR}/${_u3dIntel}.tgz" WORKING_DIRECTORY "${_bindir}")
endif()

# Extract the face detection models to the build binary data directory
if ( NOT EXISTS "${_bindir}/${_faceModelsDir}")
    message( STATUS "Extracting facemodels.tgz to ${_bindir}/${_faceModelsDir}")
    execute_process( COMMAND ${CMAKE_COMMAND} -E tar xzf "${PROJECT_SOURCE_DIR}/facemodels.tgz" WORKING_DIRECTORY "${_bindir}/${_data}")
endif()

# On Linux, we assume that there's a valid installation of pdflatex on the path (though extra packages may be needed at runtime).
if ( WIN32 AND NOT EXISTS "${_bindir}/texmfs")
    message( STATUS "Extracting texmfs.tgz to ${_bindir}/texmfs")
    execute_process( COMMAND ${CMAKE_COMMAND} -E tar xzf "${PROJECT_SOURCE_DIR}/texmfs.tgz" WORKING_DIRECTORY "${_bindir}")
endif()

# Copy over plugins to bin/plugins, and copy over data to bin/data
set( _pluginsDir "${PROJECT_BINARY_DIR}/../plugins/${CMAKE_BUILD_TYPE}/lib") # e.g. ~/lb/Cliniface/plugins/Release/lib
add_custom_target( a1 ALL COMMAND ${CMAKE_COMMAND} -E copy_directory ${_pluginsDir} ${_bindir}/plugins COMMENT "Copying over plugins to bin")
add_custom_target( a2 ALL COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_SOURCE_DIR}/${_data} ${_bindir}/${_data} COMMENT "Copying over data")

# Copy over the HTML directory
add_custom_target( a3 ALL COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_SOURCE_DIR}/${_html} ${PROJECT_BINARY_DIR}/${_html} COMMENT "Copying over html")


if ( WIN32)
    # On Windows, create package directories for QtInstallerFramework
    if ( NOT EXISTS "${QT_INF_BINARY_CREATOR}")
        message( WARNING "Cannot find QtInstallerFramework tools! Looked in ${QT_INSTALLER_FRAMEWORK}")
    else()
        set( APP_ADMIN_TARGET_DIR "@ApplicationsDirX64@/${APP_NAME}")
        set( APP_RUN_PROGRAM      "@TargetDir@/bin/${APP_NAME}")
        set( APP_TARGET_DIR       "@HomeDir@/${APP_NAME}")
        string( TIMESTAMP APP_RELEASE_DATE "%Y-%m-%d" UTC)

        set( _config "config")
        set( _packages "packages")
        set( _configXML "${_config}/config.xml")
        set( _packageRoot "${_packages}/org.cliniface.root")
        set( _rootPackageXML "${_packageRoot}/meta/package.xml")

        # Copy over the base directory structure for the config and packages folders from the source directory.
        install( DIRECTORY "install/windows/" DESTINATION "${CMAKE_INSTALL_PREFIX}" PATTERN "*.py" EXCLUDE PATTERN "*.xml.in" EXCLUDE)

        # Configure the required package installer configuration files
        configure_file( "install/windows/${_rootPackageXML}.in" "${CMAKE_INSTALL_PREFIX}/${_rootPackageXML}")
        configure_file( "install/windows/${_configXML}.in"      "${CMAKE_INSTALL_PREFIX}/${_configXML}")

        # The package directories to install into
        set( _packageRootData "${_packageRoot}/data")
        set( _packageHTMLData "${_packageRoot}.html/data")
        set( _packageTexmfsData "${_packageRoot}.texmfs/data/bin")
        set( _packagePluginsData "${_packageRoot}.plugins/data/bin")
        set( _packageExamplesData "${_packageRoot}.examples/data")

        # Install the package data (note initial exclusion of u3dIntel - this is because it has its own Plugins directory)
        install( DIRECTORY "${_bindir}"                     DESTINATION "${_packageRootData}" USE_SOURCE_PERMISSIONS
                                                                PATTERN "${_u3dIntel}" EXCLUDE
                                                                PATTERN "plugins/*" EXCLUDE
                                                                PATTERN "texmfs" EXCLUDE)
        install( DIRECTORY "${_bindir}/${_u3dIntel}"        DESTINATION "${_packageRootData}/bin" USE_SOURCE_PERMISSIONS)
        install( DIRECTORY "${_bindir}/plugins"             DESTINATION "${_packagePluginsData}" USE_SOURCE_PERMISSIONS)
        install( DIRECTORY "${PROJECT_BINARY_DIR}/examples" DESTINATION "${_packageExamplesData}" USE_SOURCE_PERMISSIONS)
        install( DIRECTORY "${PROJECT_BINARY_DIR}/${_html}" DESTINATION "${_packageHTMLData}" USE_SOURCE_PERMISSIONS)

        # Install texmfs
        install( DIRECTORY "${_bindir}/texmfs" DESTINATION "${_packageTexmfsData}" USE_SOURCE_PERMISSIONS)

        # Run the Qt installer framework binary generator tool
        set( _flags "-v --offline-only")
        set( _iname "${PROJECT_NAME}-${APP_VERSION_STRING}-win7-x64")
        install( CODE "execute_process( COMMAND ${QT_INF_BINARY_CREATOR} ${_flags} -c ${_configXML} -p ${_packages} ${_iname}
                                        WORKING_DIRECTORY ${CMAKE_INSTALL_PREFIX})")
    endif()
elseif(UNIX)
    # For some reason, the cliniface ELF needs libQt5X11Extras.so set as needed
    install( CODE "execute_process( COMMAND patchelf --add-needed libQt5X11Extras.so ${_bindir}/${PROJECT_NAME})")

    # Copy across the AppDir directory structure to the install directory
    install( DIRECTORY "${PROJECT_SOURCE_DIR}/install/linux/AppDir" DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)
    set( _appdir "${CMAKE_INSTALL_PREFIX}/AppDir")

    # Copy across the built binary directory.
    install( DIRECTORY ${_bindir} DESTINATION "${_appdir}/usr" USE_SOURCE_PERMISSIONS)
    # Copy across the examples directory.
    install( DIRECTORY "${PROJECT_BINARY_DIR}/examples" DESTINATION "${_appdir}/usr" USE_SOURCE_PERMISSIONS)
    # Copy across the html directory.
    install( DIRECTORY "${PROJECT_BINARY_DIR}/${_html}" DESTINATION "${_appdir}/usr" USE_SOURCE_PERMISSIONS)

    # Make an AppDir with all the Qt libraries
    # NB ENSURE THAT LD_LIBRARY_PATH IS SET CORRECTLY TO FIND ALL LIBRARIES NEEDED!
    set( _linuxdeployqt "linuxdeployqt-x86_64.AppImage")
    install( CODE "execute_process( COMMAND ${_linuxdeployqt}
                                            ${_appdir}/usr/share/applications/${PROJECT_NAME}.desktop
                                            -qmake=$ENV{QT5}/bin/qmake
                                            -bundle-non-qt-libs
                                            -no-translations
                                            -verbose=2
                                    WORKING_DIRECTORY ${CMAKE_INSTALL_PREFIX})")

    # The wrong user permissions are set on the AppDir by default!
    install( CODE "execute_process( COMMAND chmod -Rc 755 ${_appdir})")

    # Make the AppImage itself from the AppDir
    set( _appimagetool "appimagetool-x86_64.AppImage")
    install( CODE "execute_process( COMMAND ${_appimagetool} -n ${_appdir})")
endif()
