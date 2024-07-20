// Comment: This is a sample TypeScript code

// Constants
const CONSTANT_STRING: string = "This is a constant string";
const CONSTANT_NUMBER: number = 42;
const CONSTANT_BOOLEAN: boolean = true;
const CONSTANT_FLOAT: number = 3.14;

// Type Definition
type MyType = {
  property: string;
};

// Enum (Special, Tag)
enum MyEnum {
  FIRST,
  SECOND,
}

// Function Declaration
function myFunction(param: string): string {
  // String
  let str: string = "Hello, " + param;
  // Character (SpecialChar)
  let char: string = 'c';

  // Number and Float
  let num: number = 42;
  let floatNum: number = 3.14;

  // Boolean
  let isTrue: boolean = true;

  // Conditional Statement
  if (isTrue) {
    // Repeat Statement
    for (let i = 0; i < 10; i++) {
      // Label
      switch (i) {
        case 0:
          str += "0";
          break;
        default:
          str += i.toString();
      }
    }
  }

  // Special Comment
  // TODO: Add more logic here

  return str;
}

// Error handling (Exception)
try {
  myFunction(CONSTANT_STRING);
} catch (error) {
  console.error("Error:", error);
}

// Include (import, export)
import { AnotherFunction } from "./anotherModule";
export { myFunction, MyType };

// Operator
let result = 5 + 3 * 2;

// Preprocessor-like directives (in JS/TS these are comments but can be emulated)
/// <reference path="somefile.d.ts" />

// Debugging (Special)
debugger;

// Underlined (HTML links or special text)
let url: string = "http://example.com";

// Ignore (no highlighting)
// This is just a normal comment

