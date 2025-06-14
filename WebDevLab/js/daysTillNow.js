let today = new Date();
let year = today.getFullYear();
let startOfYear = new Date(year, 0, 1);
let daysSinceStartOfYear = Math.floor((today - startOfYear) / (1000 * 60 * 60 * 24));
console.log(`There are ${daysSinceStartOfYear} days since the start of the year ${year}.`);
console.log(`Total milliseconds since the start of the year: ${today - startOfYear}`);