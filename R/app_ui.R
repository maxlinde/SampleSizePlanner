#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    navbarPage(
      title = "Sample Size Planner",
      tabPanel("Home",
               mod_home_ui("home")),
      navbarMenu("Methods",
                 tabPanel("TOST",
                          mod_ssp_tost_ui("tost")),
                 tabPanel("Interval Equivalence BF",
                          mod_ssp_eq_bf_ui("eq_bf")),
                 tabPanel("Classical power",
                          mod_ssp_power_traditional_ui("traditional")),
                 tabPanel("Power curve",
                          mod_ssp_power_curve_ui("curve")),
                 tabPanel("BFDA",
                          mod_ssp_bfda_ui("bfda")),
                 tabPanel(HTML("Predetermined sample</br>size with BF"),
                          mod_ssp_bf_predetermined_ui("bf_predetermined")),
                 tabPanel("AIPE",
                          mod_ssp_aipe_ui("aipe")),
                 tabPanel("APP",
                          mod_ssp_app_ui("app")),
                 tabPanel("ROPE",
                          mod_ssp_rope_ui("rope"))
                 ),
      tabPanel("About",
               includeMarkdown(app_sys("app/www/about.Rmd")))
      ),

    # Enabling waiter JS functions
    waiter::use_waiter(),
    waiter::use_waitress()
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', app_sys('app/www')
  )
 
  tags$head(
    golem::activate_js(),
    rclipboard::rclipboardSetup(),
    # golem::favicon(),
    shinyjs::useShinyjs(),
    tags$script(src = "www/disable_btn.js"),
    # Add custom css stylesheet
    tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css")
  )
}
