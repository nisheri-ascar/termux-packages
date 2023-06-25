TERMUX_PKG_HOMEPAGE="https://playit.gg"
TERMUX_PKG_DESCRIPTION="playit.gg is a global proxy that allows anyone to host a server without port forwarding."
TERMUX_PKG_LICENSE=TERMUX_PKG_HOMEPAGE="https://playit.gg"
TERMUX_PKG_DESCRIPTION="playit.gg is a global proxy that allows anyone to host a server without port forwarding."
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="@nisheri-ascar"
TERMUX_PKG_VERSION=0.9.3
TERMUX_PKG_SRCURL=https://github.com/playit-cloud/playit-agent/archive/refs/tags/v0.9.3.tar.gz
TERMUX_PKG_MAINTAINER="@nisheri-ascar"
TERMUX_PKG_VERSION=0.9.3
TERMUX_PKG_SRCURL=https://github.com/playit-cloud/playit-agent/archive/refs/tags/v0.9.3.tar.gz
TERMUX_PKG_SHA256=541a6803504b46677ee3b47e5e71bb78ded30c54e132581a10e780f67a62444f

termux_step_pre_configure() {
	termux_setup_rust

	if [ "$TERMUX_ARCH" = "x86_64" ]; then
		local libdir=target/$CARGO_TARGET_NAME/release/deps
		mkdir -p $libdir
		pushd $libdir
		RUSTFLAGS+=" -C link-arg=$($CC -print-libgcc-file-name)"
		echo "INPUT(-l:libunwind.a)" > libgcc.so
		popd
	fi
}
