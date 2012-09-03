monkey = require("../src/monkey")

describe "monkey", ->
    testObj =
        _true       : -> true
        _false      : -> false
        _string     : -> "hi"
        _number     : -> 5
    
    testObj._true().should.equal    true
    testObj._false().should.equal   false
    testObj._string().should.equal  "hi"
    testObj._number().should.equal  5

    it "should be able to patch an object", ->
        monkey.patch testObj, 
            _true       : -> false
            _false      : -> true
            _string     : -> 5
            _number     : -> "hello"
            _new        : -> "a new method!"

        testObj._true().should.equal    false
        testObj._false().should.equal   true
        testObj._string().should.equal  5
        testObj._number().should.equal  "hello"

        # make sure patch does not insert new members
        testObj.should.not.have.property '_new'
        testObj.should.have.property '___monkey'

    it "should be able to unpatch an object", ->
        monkey.unpatch testObj

        testObj._true().should.equal     true
        testObj._false().should.equal    false
        testObj._string().should.equal   "hi"
        testObj._number().should.equal   5

        # make sure monkey removed its own property
        testObj.should.not.have.property '___monkey'

