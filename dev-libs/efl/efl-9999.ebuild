# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/efl/efl-1.10.1.ebuild,v 1.1 2014/06/29 14:15:32 tommy Exp $

EAPI="5"

MY_P=${P/_/-}

if [[ "${PV}" == "9999" ]] ; then
	EGIT_SUB_PROJECT="core"
	EGIT_URI_APPEND="${PN}"
elif [[ *"${PV}" == *"_pre"* ]] ; then
	MY_P=${P%%_*}
	SRC_URI="http://download.enlightenment.org/pre-releases/${MY_P}.tar.xz"
	EKEY_STATE="snap"
	KEYWORDS="~amd64 ~arm ~x86"
else
	SRC_URI="http://download.enlightenment.org/rel/libs/${PN}/${MY_P}.tar.xz"
	EKEY_STATE="snap"
	KEYWORDS="~amd64 ~arm ~x86"
fi

inherit enlightenment

DESCRIPTION="Enlightenment Foundation Libraries all-in-one package"

LICENSE="BSD-2 GPL-2 LGPL-2.1 ZLIB"

IUSE="+bmp debug drm +eet egl fbcon +fontconfig fribidi gif gles glib gnutls gstreamer harfbuzz +ico ibus jp2k +jpeg oldlua opengl ssl +physics pixman +png +ppm +psd pulseaudio scim sdl sound systemd tga tiff tslib v4l2 wayland webp X xim xine xpm"

REQUIRED_USE="
	pulseaudio?	( sound )
	opengl?		( || ( X sdl wayland ) )
	gles?		( || ( X wayland ) )
	gles?		( !sdl )
	gles?		( egl )
	sdl?		( opengl )
	wayland?	( egl !opengl gles )
	xim?		( X )
"

RDEPEND="
	dev-libs/check
	debug? ( dev-util/valgrind )
	fontconfig? ( media-libs/fontconfig )
	fribidi? ( dev-libs/fribidi )
	gif? ( media-libs/giflib )
	glib? ( dev-libs/glib )
	gnutls? ( net-libs/gnutls )
	!gnutls? ( ssl? ( dev-libs/openssl ) )
	gstreamer? (
		=media-libs/gstreamer-0.10*
		=media-libs/gst-plugins-good-0.10*
		=media-plugins/gst-plugins-ffmpeg-0.10*
	)
	harfbuzz? ( media-libs/harfbuzz )
	ibus? ( app-i18n/ibus )
	jp2k? ( media-libs/openjpeg )
	jpeg? ( virtual/jpeg )
	!oldlua? ( >=dev-lang/luajit-2.0.0 )
	oldlua? ( dev-lang/lua )
	physics? ( >=sci-physics/bullet-2.80 )
	pixman? ( x11-libs/pixman )
	png? ( media-libs/libpng:0= )
	pulseaudio? ( media-sound/pulseaudio )
	scim?	( app-i18n/scim )
	sdl? (
		media-libs/libsdl2
		virtual/opengl
	)
	sound? ( media-libs/libsndfile )
	systemd? ( sys-apps/systemd )
	tiff? ( media-libs/tiff )
	tslib? ( x11-libs/tslib )
	wayland? (
		>=dev-libs/wayland-1.3.0
		>=x11-libs/libxkbcommon-0.3.1
		media-libs/mesa[gles2,wayland]
	)
	webp? ( media-libs/libwebp )
	X? (
		x11-libs/libXcursor
		x11-libs/libX11
		x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXinerama
		x11-libs/libXp
		x11-libs/libXrandr
		x11-libs/libXrender
		x11-libs/libXtst
		x11-libs/libXScrnSaver

		opengl? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
		)

		gles? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
		)
	)
	xine? ( >=media-libs/xine-lib-1.1.1 )
	xpm? ( x11-libs/libXpm )

	sys-apps/dbus
	>=sys-apps/util-linux-2.20.0
	sys-libs/zlib

	!dev-libs/ecore
	!dev-libs/edbus
	!dev-libs/eet
	!dev-libs/eeze
	!dev-libs/efreet
	!dev-libs/eina
	!dev-libs/eio
	!dev-libs/embryo
	!dev-libs/eobj
	!dev-libs/ephysics
	!media-libs/edje
	!media-libs/emotion
	!media-libs/ethumb
	!media-libs/evas
"

#soft blockers added above for binpkg users
#hard blocks are needed for building
CORE_EFL_CONFLICTS="
	!!dev-libs/ecore
	!!dev-libs/edbus
	!!dev-libs/eet
	!!dev-libs/eeze
	!!dev-libs/efreet
	!!dev-libs/eina
	!!dev-libs/eio
	!!dev-libs/embryo
	!!dev-libs/eobj
	!!dev-libs/ephysics
	!!media-libs/edje
	!!media-libs/emotion
	!!media-libs/ethumb
	!!media-libs/evas
"

DEPEND="
	${CORE_EFL_CONFLICTS}

	${RDEPEND}
	doc? ( app-doc/doxygen )
"

S=${WORKDIR}/${MY_P}

src_configure() {
	local MY_ECONF
	MY_ECONF="--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba"
	MY_ECONF+=" --disable-c++11"
	enlightenment_src_configure
}

#src_install() {
#	MAKEOPTS+=" -j1"
#
#	enlightenment_src_install
#}
