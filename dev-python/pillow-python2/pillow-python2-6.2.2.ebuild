# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='tk?,threads(+)'

inherit distutils2 eutils

MY_PN=Pillow
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python Imaging Library (fork)"
HOMEPAGE="https://python-pillow.org/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="imagequant jpeg2k lcms tiff tk truetype webp zlib"

RDEPEND="
	!dev-python/${MY_PN}[python_targets_python2_7]
	dev-python/olefile-python2
	imagequant? ( media-gfx/libimagequant:0 )
	virtual/jpeg:0
	jpeg2k? ( media-libs/openjpeg:2= )
	lcms? ( media-libs/lcms:2= )
	tiff? ( media-libs/tiff:0=[jpeg] )
	truetype? ( media-libs/freetype:2= )
	webp? ( media-libs/libwebp:0= )
	zlib? ( sys-libs/zlib:0= )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	# raqm not in portage yet
	distutils2_src_compile \
		--disable-raqm \
		$(use_enable truetype freetype) \
		$(use_enable jpeg2k jpeg2000) \
		$(use_enable lcms) \
		$(use_enable tiff) \
		$(use_enable imagequant) \
		$(use_enable webp) \
		$(use_enable webp webpmux) \
		$(use_enable zlib)
}

python_install() {
	python_doheader src/libImaging/*.h
	distutils2_python_install
}
