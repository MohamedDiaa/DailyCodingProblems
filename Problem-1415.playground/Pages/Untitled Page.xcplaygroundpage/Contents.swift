import Foundation


//        This problem was asked by Stripe.
//        Write a function to flatten a nested dictionary. Namespace the keys with a period.
//        For example, given the following dictionary:
//
//        {
//            "key": 3,
//            "foo": {
//                "a": 5,
//                "bar": {
//                    "baz": 8
//                }
//            }
//        }
//        it should become:
//
//        {
//            "key": 3,
//            "foo.a": 5,
//            "foo.bar.baz": 8
//        }
//
//      You can assume keys do not contain dots in them, i.e. no clobbering will occur.


let dictionary: [String: Any] = [
    "key": 3,
    "foo": [
        "a": 5,
        "bar": [
            "baz": 8
        ]
    ]
]


func flattenDictionary(_ dictionary: [String: Any], parentKey: String = "", separator: String = ".") -> [String: Any] {
    var flattenedDictionary = [String: Any]()

    for (key, value) in dictionary {
        let newKey = parentKey.isEmpty ? key : "\(parentKey)\(separator)\(key)"

        if let nestedDictionary = value as? [String: Any] {
            let nestedFlattenedDictionary = flattenDictionary(nestedDictionary, parentKey: newKey, separator: separator)
            flattenedDictionary.merge(nestedFlattenedDictionary) { current, _ in current }
        } else {
            flattenedDictionary[newKey] = value
        }
    }

    return flattenedDictionary
}

// Example usage:
let nestedDictionary: [String: Any] = [
    "key": 3,
    "foo": [
        "a": 5,
        "bar": [
            "baz": 8
        ]
    ]
]

let flattenedDictionary = flattenDictionary(nestedDictionary)
print(flattenedDictionary)
