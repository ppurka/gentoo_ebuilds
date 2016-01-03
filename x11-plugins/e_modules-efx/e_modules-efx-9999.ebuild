# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
if [[ "${PV}" == "9999" ]] ; then
	EGIT_SUB_PROJECT="devs/discomfitor"
	EGIT_URI_APPEND="${PN#e_modules-}"
else
	die "not good"
fi

inherit enlightenment
DESCRIPTION="EFL effects made easy"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="BSD-2 GPL-2 LGPL-2.1 ZLIB"
SLOT="0.19"
IUSE=""

DEPEND="x11-wm/enlightenment:0.19"
RDEPEND="${DEPEND}"
