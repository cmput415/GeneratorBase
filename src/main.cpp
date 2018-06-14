#include "GeneratorLexer.h"
#include "GeneratorParser.h"

#include "ANTLRFileStream.h"
#include "CommonTokenStream.h"
#include "tree/ParseTree.h"

#include <iostream>

int main(int argc, char **argv) {
  if (argc < 2) {
    std::cout << "Missing required argument.\n"
              << "Required arguments: <input file path> <output file path>\n";
    return 1;
  }

  // Open the file then parse and lex it.
  antlr4::ANTLRFileStream afs(argv[1]);
  generator::GeneratorLexer lexer(&afs);
  antlr4::CommonTokenStream tokens(&lexer);
  generator::GeneratorParser parser(&tokens);

  // Get the root of the parse tree. Use your base rule name.
  antlr4::tree::ParseTree *tree = parser.file();

  // HOW TO USE A LISTENER
  // Make the listener
  // MyListener listener;
  // Walk the tree
  // antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);

  // HOW TO USE A VISITOR
  // Make the visitor
  // MyVisitor visitor;
  // Visit the tree
  // visitor.visit(tree);

  // HOW TO WRITE OUT.
  // std::ofstream out(argv[3]);
  // out << "This is out...\n";

  return 0;
}
