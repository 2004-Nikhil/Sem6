class Person {
    constructor(firstName, lastName) {
        this._firstName = firstName; // Convention: Use "_" for internal properties
        this._lastName = lastName;
    }

    // Getter for full name
    get fullName() {
        return `${this._firstName} ${this._lastName}`;
    }

    // Setter for full name
    set fullName(name) {
        const parts = name.trim().split(/\s+/); // Trim & split by spaces
        if (parts.length === 2) {
            this._firstName = parts[0];
            this._lastName = parts[1];
        } else {
            throw new Error("Please provide both first and last name.");
        }
    }
}

// Creating an object
const person1 = new Person("John", "Doe");
console.log(person1.fullName); // Output: John Doe

// Using the setter to modify the name
person1.fullName = "Jane Smith";
console.log(person1.fullName); // Output: Jane Smith

// Invalid name example (Throws an error)
try {
    person1.fullName = "SingleName"; 
} catch (error) {
    console.error(error.message); // Output: Please provide both first and last name.
}
