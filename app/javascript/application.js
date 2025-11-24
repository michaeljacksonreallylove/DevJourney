import React from "react"
import ReactDOM from "react-dom/client"
import "bootstrap"
import "@popperjs/core"
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap-icons/font/bootstrap-icons.css"
import MyHello from "./components/my-hello"

const root = ReactDOM.createRoot(document.querySelector("#app"));
root.render(<MyHello name="あああ" />)