## 1. Load the library
library(shiny)

## 2. Load the data and fit the model at app initialization (only once)
data <- read.csv(file = 'qced_data.csv', header = TRUE)
fitted_model <- lm(BODYFAT ~ ADIPOSITY + NECK + ABDOMEN + FOREARM + WEIGHT_inkg, data = data)

## 3. Define the user interface (UI) for the Shiny app
# For the font and the color style, I choose to use the style of Manchester City as I'm a fan of that soccer team. ;)
ui <- fluidPage(
  # Load Google Fonts for Montserrat
  tags$link(href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap", rel="stylesheet"),
  
  # The title
  div(style = "text-align: center; font-size: 30px; font-weight: bold; color: #1c2c5b; margin-top: 40px; margin-bottom: 30px;",
      "Predict BODYFAT Using MLR Model"),
  
  # Add custom CSS for styling
  tags$style(HTML("
    body {
      background-color: #97c1e7;  /* Light blue background */
      color: #1c2c5b;  /* Dark blue text color */
      font-family: 'Montserrat', sans-serif;  /* Use Montserrat font */
    }
    .btn {
      background-color: #1c2c5b;  /* Dark blue button */
      color: white;  /* White text on buttons */
      font-weight: bold;  /* Make the button text bold */
    }
    .btn:hover {
      background-color: #ffc758;  /* Yellow background on hover */
      color: #ee3124;  /* Red text on hover */
    }
    h2, h3 {
      color: #1c2c5b;  /* Dark blue for headings */
      font-family: 'Montserrat', sans-serif;  /* Font for headings */
      font-weight: bold;  /* Use bold font */
      font-size: 24px;  /* Ensure all h2 titles are same size */
      margin-top: 40px;  /* Ensure the same margin as input title */
      margin-bottom: 20px; /* Consistent bottom margin */
    }
    hr {
      border-top: 2px solid #1c2c5b;  /* Dark blue horizontal line */
    }
    table {
      background-color: white;  /* Set the background color of the table to white */
      color: #1c2c5b;  /* Dark blue text color */
      width: 100%;  /* Ensure table takes up full width */
      border-collapse: collapse;
    }
    table, th, td {
      border: none;  /* Remove borders */
    }
    th, td {
      padding: 8px;
      text-align: left;
    }
    #prediction_result {
      background-color: white;  /* Set white background for prediction result */
      padding: 10px;
      border: none;  /* Remove border */
      border-radius: 4px;
      width: 100%;  /* Ensure both take up full width */
      font-size: 18px;
      font-family: 'Montserrat', sans-serif;  /* Set the font */
      margin-bottom: 0px; /* Add margin to match the input section */
    }
    #bodyfat_table_section {
      background-color: #f1f1f1;  /* Set white background for body fat table */
      padding: 10px;
      border: none;  /* Remove border */
      border-radius: 4px;
      width: 100%;  /* Ensure both take up full width */
      font-size: 16px;  /* Reset body fat table to original size */
      font-family: 'Montserrat', sans-serif;
      margin-top: 5px;  /* Further reduce margin to decrease the distance */
    }
    .input-title {
      font-size: 24px;  /* Keep title font size same */
      text-align: left;  /* Align to the left */
      color: #1c2c5b;  /* Dark blue color */
      margin-top: 40px;  /* Add margin to match spacing with right section */
      margin-bottom: 10px;
      font-weight: bold;
    }
    .input-section {
      background-color: #f1f1f1;
      padding: 20px;
      border-radius: 5px;
      border: 1px solid #d3d3d3;
      margin-bottom: 30px; /* Add margin to match output section */
    }
    .container {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;  /* Ensure alignment is at the top */
    }
    .left-panel {
      width: 45%;  /* Adjust width for the left panel */
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
    }
    .right-panel {
      width: 45%;  /* Adjust width for the right panel */
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
    }
    .output-section {
      width: 100%;
    }
  ")),
  
  div(class = "container",
      div(class = "left-panel",
          div(class = "input-title", "Input the number"),  # Input title
          div(
            class = "input-section",
            # Input fields for the model's independent variables with white background
            # The values chosen are approximately equal to the mean or median from the data.
            numericInput("ADIPOSITY", "Adiposity:", value = 25, min = 0),
            numericInput("NECK", "Neck (cm):", value = 38, min = 0),
            numericInput("ABDOMEN", "Abdomen (cm):", value = 91, min = 0),
            numericInput("FOREARM", "Forearm (cm):", value = 29, min = 0),
            numericInput("WEIGHT_inkg", "Weight (kg):", value = 80, min = 0),
            actionButton("predict", "PREDICT")  # Button to make predictions
          )
      ),
      
      div(class = "right-panel",
          div(class = "output-section",
              h2("Prediction Result"),  # Header for prediction result
              div(id = "prediction_result", verbatimTextOutput("prediction_result"))  # Output for the prediction result
          ),
          
          div(class = "output-section",
              h2("Body Fat Table"),
              div(id = "bodyfat_table_section", tableOutput("bodyfat_table"))  # Ensure body fat table takes full width
          )
      )
  )
)

## 4. Define the server logic for the Shiny app
server <- function(input, output) {
  
  # Observe the "PREDICT" button to make predictions using the fitted model
  observeEvent(input$predict, {
    
    # Check if all input values are greater than zero
    if (any(c(input$ADIPOSITY, input$NECK, input$ABDOMEN, input$FOREARM, input$WEIGHT_inkg) <= 0)) {
      output$prediction_result <- renderText("All input values must be greater than zero.")  # Message if any input is invalid
      return()  # Terminate further code execution if inputs are invalid
    }
    
    # Create a new data frame for prediction
    new_data <- data.frame(
      ADIPOSITY = input$ADIPOSITY,
      NECK = input$NECK,
      ABDOMEN = input$ABDOMEN,
      FOREARM = input$FOREARM,
      WEIGHT_inkg = input$WEIGHT_inkg
    )
    
    # Make predictions using the fitted model
    predicted_value <- predict(fitted_model, newdata = new_data)  # Predict values using pre-fitted model
    output$prediction_result <- renderText(paste("The predicted BODYFAT value is:", round(predicted_value, 2), "%"))  # Display the prediction result
  })
  
  # Define the body fat percentage table
  output$bodyfat_table <- renderTable({
    # Create the table data
    bodyfat_data <- data.frame(
      Age = c("8-11", "12-15", "16-19", "20-39", "40-59", "60-79", "80 and over"),
      BodyFatPercentage = c("28.0%", "25.2%", "22.9%", "26.1%", "28.6%", "30.8%", "30.7%")
    )
    
    # Rename the column names
    colnames(bodyfat_data) <- c("Age", "Body Fat Percentage by Age in Men")
    
    return(bodyfat_data)
  })
}

## 5. Run the Shiny application
shinyApp(ui = ui, server = server)
