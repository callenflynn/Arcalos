import { defineConfig } from "vitepress"

export default defineConfig({
  title: "Arcalos",
  description: "A sleek, modern, and opinionated Linux",
  base: "/Arcalos/",
  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Install options", link: "/installation-options" },
      { text: "Install", link: "/install" },
      { text: "ISO", link: "/iso" }
    ],
    sidebar: [
      {
        text: "Getting Started",
        items: [
          { text: "Installation options", link: "/installation-options" },
          { text: "Install (online)", link: "/install" },
          { text: "Build ISO", link: "/iso" }
        ]
      }
    ]
  }
})
