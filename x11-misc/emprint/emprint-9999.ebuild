# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
EGIT_REPO_URI="git://git.enlightenment.org/apps/emprint.git"
inherit git-2 enlightenment

DESCRIPTION="utility for taking screenshots of the entire screen"

RDEPEND="x11-libs/libX11
	|| ( dev-libs/ecore[evas] dev-libs/efl )
	"
DEPEND="${RDEPEND}
	x11-proto/xproto"

src_unpack() {
	git-2_src_unpack
}
