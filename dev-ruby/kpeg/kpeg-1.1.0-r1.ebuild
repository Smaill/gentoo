# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A simple PEG library for Ruby"
HOMEPAGE="https://github.com/evanphx/kpeg"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ia64 ~mips ~ppc ~ppc64 s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"

PATCHES=( "${FILESDIR}/${P}-utf8.patch" )

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'gem "minitest", "~>5.0"; Dir["test/test_*.rb"].each{|f| require f}' || die
}
