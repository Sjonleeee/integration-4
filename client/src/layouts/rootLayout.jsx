import { Outlet } from "react-router-dom";
import Navbar from "../components/Nav.jsx";
import Footer from "../components/Footer.jsx";
import { useLayoutEffect } from "react";

export default function Root() {
  useLayoutEffect(() => {
    const cursorOutline = document.querySelector(".cursor-outline");
    const cursorCenter = document.querySelector(".cursor-center");
    const links = Array.from(document.querySelectorAll("a, button"));

    window.addEventListener("mousemove", (e) => {
      const x = e.clientX;
      const y = e.clientY;

      cursorCenter.style.left = `${x}px`;
      cursorCenter.style.top = `${y}px`;

      cursorOutline.style.left = `${x}px`;
      cursorOutline.style.top = `${y}px`;

      cursorOutline.animate(
        {
          left: `${x}px`,
          top: `${y}px`,
        },
        { duration: 300 }
      );

      links.forEach((link) => {
        link.addEventListener("mouseover", () => {
          cursorCenter.classList.add("grow");
        });
        link.addEventListener("mouseleave", () => {
          cursorCenter.classList.remove("grow");
        });
      });
    });

    window.addEventListener("click", () => {
      cursorCenter.classList.add("clickCenter");
      cursorOutline.classList.add("clickOutline");
      setTimeout(() => {
        cursorCenter.classList.remove("clickCenter");
        cursorOutline.classList.remove("clickOutline");
      }, 200);
    });
  }, []);

  return (
    <>
      <div class="cursor-center"></div>
      <div class="cursor-outline"></div>
      <Navbar />
      <Outlet />
      <Footer />
    </>
  );
}
