describe "m grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-m")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.m")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.m"

  it "tokenizes self", ->
    {tokens} = grammar.tokenizeLine('self')
    expect(tokens[0]).toEqual value: 'self', scopes: ['source.m', 'variable.language.self.m']

  it "tokenizes special functions", ->
    {tokens} = grammar.tokenizeLine('require "."')
    expect(tokens[0]).toEqual value: 'require', scopes: ['source.m', 'meta.require.m', 'keyword.other.special-method.m']

    {tokens} = grammar.tokenizeLine('Kernel.require "."')
    expect(tokens[1]).toEqual value: '.', scopes: ['source.m', 'punctuation.separator.method.m']
    expect(tokens[2]).toEqual value: 'require ', scopes: ['source.m']

    {tokens} = grammar.tokenizeLine('Kernel::require "."')
    expect(tokens[1]).toEqual value: '::', scopes: ['source.m', 'punctuation.separator.method.m']
    expect(tokens[2]).toEqual value: 'require ', scopes: ['source.m']

    {tokens} = grammar.tokenizeLine('thing&.call')
    expect(tokens[1]).toEqual value: '&.', scopes: ['source.m', 'punctuation.separator.method.m']
    expect(tokens[2]).toEqual value: 'call', scopes: ['source.m']
