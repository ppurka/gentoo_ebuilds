# Copyright 2000-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5
inherit eutils virtualx

DESCRIPTION="ROX-Filer a drag and drop spatial file manager"
HOMEPAGE="http://rox.sourceforge.net/desktop"
SRC_URI="mirror://sourceforge/rox/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

COMMON_DEPEND="dev-lang/perl
	dev-libs/libxml2:2
	gnome-base/libglade:2.0
	x11-libs/gtk+:2"
RDEPEND="${COMMON_DEPEND}
	x11-misc/shared-mime-info"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

src_prepare() {
	cd ROX-Filer
	mkdir build
	sed -i -e 's:g_strdup(getenv("APP_DIR")):"/usr/share/rox":' src/main.c || die "sed failed"
}

src_configure() {
	cd ROX-Filer
	pushd build
	../src/configure --prefix=/usr LIBS="-lm -ldl" || die "configure failed"
	popd
}

src_compile() {
	cd ROX-Filer
	pushd build
	emake
	popd
}

src_install() {
	cd ROX-Filer
	dodir /usr/share/applications  /usr/share/pixmaps  /usr/share/rox/Help
	insinto /usr/share/rox
	doins -r Messages Options.xml ROX images style.css .DirIcon Templates.ui
	insinto /usr/share/rox/Help
	doins Help/*.html Help/README*

	doman ../rox.1

	newbin ROX-Filer rox

	cd ${D}/usr/share/rox/ROX/MIME || die "MIME directory missing"
	ln -sv text-x-{diff,patch}.png                       &&
	ln -sv application-x-font-{afm,type1}.png			 &&
	ln -sv application-xml{,-dtd}.png					 &&
	ln -sv application-xml{,-external-parsed-entity}.png &&
	ln -sv application-{,rdf+}xml.png					 &&
	ln -sv application-x{ml,-xbel}.png					 &&
	ln -sv application-{x-shell,java}script.png			 &&
	ln -sv application-x-{bzip,xz}-compressed-tar.png	 &&
	ln -sv application-x-{bzip,lzma}-compressed-tar.png  &&
	ln -sv application-x-{bzip-compressed-tar,lzo}.png	 &&
	ln -sv application-x-{bzip,xz}.png					 &&
	ln -sv application-x-{gzip,lzma}.png				 &&
	ln -sv application-{msword,rtf}.png || die "symlinking failed"

	dosym /usr/share/rox/.DirIcon /usr/share/pixmaps/rox.png

	insinto /usr/share/applications
	doins   "${FILESDIR}"/rox.desktop
}
