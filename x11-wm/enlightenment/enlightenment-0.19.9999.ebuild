# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P=${P/_/-}

if [[ ${PV} == *9999 ]] ; then
	EGIT_SUB_PROJECT="core"
	EGIT_URI_APPEND="${PN}"
	KEYWORDS=""
else
	SRC_URI="http://download.enlightenment.org/rel/apps/${PN}/${MY_P}.tar.xz"
	EKEY_STATE="snap"
	KEYWORDS="~amd64 ~arm ~x86"
fi

inherit enlightenment
DESCRIPTION="The Enlightenment window manager"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD-2 GPL-2 LGPL-2.1 ZLIB"
SLOT="0.19"
IUSE=""

RDEPEND="
	>=dev-libs/efl-9999
	>=media-libs/elementary-9999"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
