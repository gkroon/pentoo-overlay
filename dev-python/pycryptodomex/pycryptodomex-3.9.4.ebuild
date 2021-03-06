# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7,8} pypy{,3} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="A self-contained cryptographic library for Python"
HOMEPAGE="https://www.pycryptodome.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2 Unlicense"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"

RDEPEND="${PYTHON_DEPS}
	dev-libs/gmp:0
	virtual/python-cffi[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

python_test() {
	esetup.py test
}
