# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="Guess the natural language of a text"
HOMEPAGE="https://bitbucket.org/spirit/guess_language"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://bitbucket.org/spirit/guess_language/get/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/pyenchant
	dev-python/3to2
	"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/spirit-guess_language-371c78028f5c
