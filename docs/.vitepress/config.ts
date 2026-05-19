import { defineConfig } from "vitepress"

export default defineConfig({
  title: "Arcalos",
  description: "Documentation for the Arcalos Linux distribution",
  base: "/Arcalos/",
  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Install", link: "/install" },
      { text: "ISO", link: "/iso" }
    ],
    sidebar: [
      {
        text: "Getting Started",
        items: [
          { text: "Install (online)", link: "/install" },
          { text: "Build ISO", link: "/iso" }
        ]
      }
    ]
  }
})
