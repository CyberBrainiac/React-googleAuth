import Cart from "./cart/Cart"
import Logo from "@/components/logo/Logo"
import Nav from "./nav/Nav"
import Search from "./search/Search"
import "./header.scss"

export default function Header() {
  return(
    <header className="header">
			<Logo />
			<Nav />
			<div className="header_search-cart-wrap">
				<Search />
				<Cart />
			</div>
    </header>
  )
}