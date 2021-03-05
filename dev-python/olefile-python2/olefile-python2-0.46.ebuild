# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit distutils2

MY_PN=olefile
DESCRIPTION="Python package to parse, read and write Microsoft OLE2 files"
HOMEPAGE="https://www.decalage.info/olefile"
SRC_URI="https://github.com/decalage2/${MY_PN}/releases/download/v${PV}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="!dev-python/${MY_PN}[python_targets_python2_7]"

S="${WORKDIR}"/${MY_PN}-${PV}
