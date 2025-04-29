function printCalendar(month, year) {
    // Array of month names
    const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  
    // Array of day names
    const daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  
    // Print month and year
    console.log(`\nCalendar for ${months[month - 1]} ${year}\n`);

    // Create a Date object for the first day of the month
    const firstDay = new Date(year, month - 1, 1);
  
    // Get the number of days in the given month
    const daysInMonth = new Date(year, month, 0).getDate();
    
    // Print the header row (days of the week)
    console.log(daysOfWeek.join("\t"));
  
    // Create an array of blanks to align the first day properly
    let calendar = Array(firstDay.getDay()).fill("  ");

    // Fill the calendar array with days of the month
    for (let day = 1; day <= daysInMonth; day++) {
        calendar.push(`${day}`);
    }
  
    // Print the calendar in a grid format
    for (let i = 0; i < calendar.length; i++) {
        process.stdout.write(calendar[i] + "\t\t");
        if (i % 7 === 6) {
            console.log(); // Move to the next line after printing 7 days
        }
    }
    console.log(); // Add an extra newline after the calendar
}

// Example usage: print calendar for March 2025
printCalendar(3, 2025);
