import Foundation

// https:// bartoszmilewski.com/2014/11/04/category-the-essence-of-composition/

// Implement, as best as you can, the identity function in your favorite language (or the second favorite, if your favorite language happens to be Haskell).

func id<T, U>(closure: T -> U) -> T -> U {
    return closure
}

func test (lhs: Int, rhs: Int) -> Void { }
id(test)

// Implement the composition function in your favorite language. It takes two functions as arguments and returns a function that is their composition.
infix operator ◦ { associativity left }
func ◦<A, B, C>(f: A -> B, g: B -> C) -> A -> C {
    return { a in
        g(f(a))
    }
}

// Write a program that tries to test that your composition function respects identity.
// f . id == f
// id . f == f

func f(operand: Int) -> Int {
    return operand + 1
}

// f ◦ id //  Seems to be a limiation of Swift's type system and generics.
// id ◦ f //  Seems to be a limiation of Swift's type system and generics.

// Is the world-wide web a category in any sense? Are links morphisms?
// Is Facebook a category, with people as objects and friendships as morphisms?
// When is a directed graph a category?

/*
 
 The web isn't a category because for a site A that links to site B, which links to site C, there are cases where A doesn't link to C (which is a requirement of the definition of a category).
 
 Facebook is not a category, either, for similar reasons.
 
 A directed graph is a category when its only edges connect vertices to themselves, for example. My graph theory is too rusty to make a general answer.
 
 */
