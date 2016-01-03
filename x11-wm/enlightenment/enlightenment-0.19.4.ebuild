# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit enlightenment

DESCRIPTION="The Enlightenment window manager"
HOMEPAGE="http://www.enlightenment.org/"
SRC_URI="http://download.enlightenment.org/rel/apps/enlightenment/${P}.tar.xz"

LICENSE="BSD-2 GPL-2 LGPL-2.1 ZLIB"
SLOT="0.19"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	>=dev-libs/efl-1.12.0
	>=media-libs/elementary-1.12.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
