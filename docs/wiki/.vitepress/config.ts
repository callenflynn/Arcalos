import { defineConfig } from "vitepress"

export default defineConfig({
  title: "Arcalos Wiki",
  description: "Arcalos community documentation and guides",
  base: "/Arcalos/wiki/",
  ignoreDeadLinks: "localhostLinks",
  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Back to Docs", link: "../" }
    ],
    sidebar: [
      {
        text: "Documentation",
        items: [
          { text: "Welcome", link: "/" }
        ]
      }
    ]
  }
})
