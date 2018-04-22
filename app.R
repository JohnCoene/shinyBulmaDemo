library(shinybulma)
library(shiny)
library(echarts4r)

made_with_bulma <- "https://bulma.io/images/made-with-bulma.png"

ui <- bulmaPage(
  tags$head(
    tags$script(
      src = "https://cdnjs.cloudflare.com/ajax/libs/prism/1.14.0/prism.min.js"
    ),
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "https://cdnjs.cloudflare.com/ajax/libs/prism/1.14.0/themes/prism.min.css"
    )
  ),
  bulmaNavbar(
    bulmaNavbarBrand(
      bulmaNavbarItem(
        "shinybulma",
        href = "Home" # links to home tab
      ),
      bulmaNavbarBurger() # burger menu for small devices
    ),
    bulmaNavbarMenu(
      bulmaNavbarItem(
        "Home"
      ),
      bulmaNavbarItem(
        "Grid"
      ),
      bulmaNavbarItem(
        "Components"
      )
    )
  ),
  bulmaNav(
    "Home",
    bulmaHero(
      fullheight = TRUE,
      color = "primary",
      bulmaHeroBody(
        bulmaContainer(
          bulmaTitle("shinybulma"),
          bulmaSubtitle("a shiny framework")
        )
      )
    ),
    bulmaSection(
      bulmaContainer(
        bulmaTitle("Installation"),
        p("You can install", code("shinybulma"), "from github with"),
        p(
          pre(
            code(
              class = 'language-r',
              "devtool::install_github('JohnCoene/shinybulma')"
            )
          )
        )
      )
    ),
    bulmaSection(
      bulmaContainer(
        bulmaTitle("Get Started"),
        bulmaSubtitle("Your first app"),
        p(
          pre(
            code(
              class = 'language-r',
              "library(shiny)",
              "library(shinybulma)",
              "ui <- bulmaPage(
                  bulmaContainer(
                    bulmaTitle('shinybulma'),
                    plotOutput('plot')
                  )
              )",
              "server <- function(input, output){
                  output$plot <- renderPlot({
                    plot(mtcars$mpg, mtcars$qsec)
                  })
              }",
              "shinyApp(ui, server)"
            )
          )
        )
      )
    )
  ),
  bulmaNav(
    "Grid",
    bulmaSection(
      bulmaContainer(
        bulmaTitle("Grid & Columns"),
        bulmaSubtitle("Straightforward layouts"),
        p(
          "You can wrap elements in", code("bulmaContainer"), 
          "to add a", code("<div class='container'></div>"), "."),
        p("To use the grid, simply use", code("bulmaColumn"),
          "which you must wrap in", code("bulmaColumns"), "."),
        pre(
          code(
            class = "language-r",
            "bulmaColumns(
              bulmaColumn('First column'),
              bulmaColumn('Second column')
            )"
          )
        ),
        p(
          "Columns folow the traditional 12-columns schema and, in",
          code("shinybulma"), "are optional."
        )
      )
    ),
    bulmaSection(
      bulmaContainer(
        bulmaTitle("Example"),
        bulmaColumns(
          bulmaColumn(
            "First Column",
            tags$img(
              src = made_with_bulma
            )
          ),
          bulmaColumn(
            "Second Column",
            tags$img(
              src = made_with_bulma
            )
          ),
          bulmaColumn(
            "Third Column",
            tags$img(
              src = made_with_bulma
            )
          )
        )
      )
    )
  ),
  bulmaNav(
    "Components",
    bulmaContainer(
      bulmaTitle("Components"),
      bulmaSubtitle("Box"),
      bulmaBox(
        bulmaBoxMedia(
          src = "https://bulma.io/images/placeholders/128x128.png",
          pre(
            code(
              class = "language-r",
              '
bulmaBox(
  bulmaBoxMedia(
    src = "https://bulma.io/images/placeholders/128x128.png",
    "Box Content"
  )
)'
            )
          )
        )
      ),
      bulmaSubtitle("Card"),
      bulmaColumns(
        bulmaColumn(
          bulmaCard(
            bulmaCardHeader(
              bulmaCardHeaderTitle(
                "Card title"
              )
            ),
            bulmaCardContent(
              "Content of the card."
            ),
            bulmaCardFooter(
              bulmaCardFooterItem(
                "Item 1"
              ),
              bulmaCardFooterItem(
                "Item 2"
              )
            )
          )
        ),
        bulmaColumn(
          pre(
            code(
              class = "language-r",
              '
bulmaCard(
 bulmaCardHeader(
   bulmaCardHeaderTitle(
     "Card title"
   )
 ),
 bulmaCardContent(
   "Content of the card."
 ),
 bulmaCardFooter(
   bulmaCardFooterItem(
     "Item 1"
   ),
   bulmaCardFooterItem(
     "Item 2"
   )
 )
)
              '
            )
          )
        )
      ),
    bulmaSubtitle("Hero"),
    bulmaHero(
      fullheight = TRUE,
      color = "danger",
      bulmaHeroBody(
        bulmaContainer(
          bulmaTitle("Hello Bulma*"),
          bulmaSubtitle("shinybulma*"),
          pre(
            code(
              class = "language-r",
              '
              bulmaHeroBody(
                bulmaContainer(
                  bulmaTitle("Hello Bulma*"),
                  bulmaSubtitle("shinybulma*")
                )
              )
              '
            )
          )
        )
      )
    ),
    bulmaSubtitle("Levels"),
    bulmaLevel(
      bulmaLevelItem("Tweets", "3'456"),
      bulmaLevelItem("Following", 765),
      bulmaLevelItem("Followers", "2'134")
    ),
    bulmaLevelOutput("levels"),
    pre(
      code(
        '
        bulmaLevelOutput("levels") # in ui

        # in server
        output$levels <- renderBulmaLevel({
          bulmaLevel(
            bulmaLevelItem("Tweets", sample(100:5000, 1)),
            bulmaLevelItem("Following", sample(100:5000, 1)),
            bulmaLevelItem("Followers", sample(100:5000, 1))
          )
        })
        '
      )
    ),
    bulmaSubtitle("Message"),
    bulmaColumns(
      bulmaColumn(
        bulmaMessage(
          color = NULL, 
          size = "large", 
          header = TRUE, 
          header_title = "A message",
          "Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. 
            Pellentesque risus mi, tempus 
            quis placerat ut, porta nec nulla. 
            Vestibulum rhoncus ac ex sit amet 
            fringilla. Nullam gravida purus diam, 
            et dictum felis venenatis efficitur. 
            Aenean ac eleifend lacus, in mollis 
            lectus. Donec sodales, arcu et 
            sollicitudin porttitor, tortor urna 
            tempor ligula, id porttitor mi magna a 
            neque. Donec dui urna, vehicula et 
            sem eget, facilisis sodales sem."
        )
      ),
      bulmaColumn(
        pre(
          code(
            '
    bulmaMessage(
      size = "large", 
      header = TRUE, 
      header_title = "The title",
      "The content of the message"
    )
            '
          )
        )
      )
    ),
    bulmaSubtitle("Sidebar"),
    bulmaSidebarTrigger(),
    bulmaSidebar(
      header_title = "Sidebar",
      bulmaSubtitle("Works with inputs"),
      bulmaSliderInput("slider", color = "warning", 10, 3, 150)
    ),
    bulmaColumns(
      bulmaColumn(
        plotOutput("sideBarPlot")
      ),
      bulmaColumn(
        pre(
          code(
            '
    # in ui
    bulmaSidebarTrigger()
    bulmaSidebar(
      bulmaContainer(
        header_title = "Sidebar",
        bulmaSubtitle("Works with inputs"),
        bulmaSliderInput("slider", color = "warning", 10, 3, 150)
      )
    )
            '
          )
        )
      )
    )
    )
  ),
  bulmaFooter(
    bulmaColumns(
      centered = FALSE,
      bulmaColumn(
        "shinybulma",
        width = 2
      ),
      bulmaColumn(width = 8),
      bulmaColumn(
        width = 2,
        a(
          href = "https://bulma.io",
          img(
            src = made_with_bulma
          )
        )
      )
    )
  )
)

server <- function(input, output) {
  
  data <- reactive({
    rnorm(input$slider, 20, 4)
  })
  
  output$sideBarPlot <- renderPlot({
    hist(data())
  })
  
  output$levels <- renderBulmaLevel({
    bulmaLevel(
      bulmaLevelItem("Tweets", sample(100:5000, 1)),
      bulmaLevelItem("Following", sample(100:5000, 1)),
      bulmaLevelItem("Followers", sample(100:5000, 1))
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

