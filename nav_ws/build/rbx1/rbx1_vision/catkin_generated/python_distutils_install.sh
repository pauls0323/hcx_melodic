#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ss/hcx/nav_ws/src/rbx1/rbx1_vision"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ss/hcx/nav_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ss/hcx/nav_ws/install/lib/python2.7/dist-packages:/home/ss/hcx/nav_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ss/hcx/nav_ws/build" \
    "/usr/bin/python2" \
    "/home/ss/hcx/nav_ws/src/rbx1/rbx1_vision/setup.py" \
    build --build-base "/home/ss/hcx/nav_ws/build/rbx1/rbx1_vision" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ss/hcx/nav_ws/install" --install-scripts="/home/ss/hcx/nav_ws/install/bin"
