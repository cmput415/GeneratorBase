#include "placeholderLexer.h"
#include "placeholderParser.h"

#include "ANTLRFileStream.h"
#include "CommonTokenStream.h"
#include "tree/ParseTree.h"

int main(int argc, char **argv) {
  // Open the file then parse and lex it.
  antlr4::ANTLRFileStream afs(argv[1]);
  placeholder::placeholderLexer lexer(&afs);
  antlr4::CommonTokenStream tokens(&lexer);
  placeholder::placeholderParser parser(&tokens);

  // Get the root of the parse tree.
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
  return 0;
}
