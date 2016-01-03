# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-terms/terminology/terminology-0.5.0.ebuild,v 1.1 2014/03/31 18:07:17 tommy Exp $

EAPI=5

DESCRIPTION="Feature rich terminal emulator using the Enlightenment Foundation Libraries"
HOMEPAGE="http://www.enlightenment.org/p.php?p=about/terminology"
EGIT_SUB_PROJECT="apps"
EGIT_URI_APPEND="${PN}"

inherit enlightenment

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=media-libs/elementary-1.10.0_alpha1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
