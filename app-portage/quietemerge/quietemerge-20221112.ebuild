# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Perform the emerge in Gentoo Linux with pretty output"
HOMEPAGE="https://github.com/ppurka/${PN}"
SRC_URI="https://github.com/ppurka/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""

DEPEND="sys-apps/grep
		sys-apps/portage
		sys-apps/util-linux
		sys-process/procps"

RDEPEND="${DEPEND}"

src_install()
{
	dobin quietemerge
	dodoc README.md
}
