import Foundation

print("Final Project in Programming Languages")
let expression = readLine()
print("-------------")

let expressionArr = expression!.components(separatedBy: " ")
//print(expressionArr)
var tokens: [Dictionary<String, String>] = []
var lexicalAnalysis:[String: String] = [
    " ":" ",
]

var dataTypes = [ "int", "byte", "short", "long", "float", "double"]
var operators = ["+","-","*","/","%"]
var terminator = ";"
var equal = "="
let isIdentifier = "(\\w+)"
let isConstantNumber = "[0-9]"
//let text = "It was the best if times"
//let result = text.range(of: pattern, options:.regularExpression)
//print(result!)

extension String {
    func isMatchedBy(regex: String) -> Bool {
        return (self.range(of: regex, options: .regularExpression) ?? nil) != nil
    }
}

func lexicalAnalyzer(){
    print("I. Lexical Analyzer\n")

    for token in expressionArr{

        if(dataTypes.contains(token)){
            tokens.append([token:"Data_type"])
        }else if (token.isMatchedBy(regex: isConstantNumber)){
            let newToken = token.replacingOccurrences(of: ";", with: "")
            tokens.append([newToken:"Numeric_constant"])
        }
        else if (token.isMatchedBy(regex: isIdentifier)){
            tokens.append([token:"Identifier"])
        }

        if(operators.contains(token)){
            tokens.append([token:"operator"])
        }

        if(equal == token){
            tokens.append([token:"Equal_Symbol"])
        }


    }

    let last = expressionArr[expressionArr.count-1]
    if(last.contains(";")){
        tokens.append([";":"Terminator"])
    }

    for token in tokens{
        let keys = token.keys
        let values = token.values

        print(token)
//        print("\(keys) : \(values)")
    }
}

//float n = 10 + 5;

lexicalAnalyzer()
