// Generated by CoffeeScript 1.6.3
(function() {
  var Employee, chris;

  Employee = (function() {
    function Employee(id, firstName, lastName) {
      this.id = id;
      this.firstName = firstName;
      this.lastName = lastName;
    }

    Employee.prototype.fullName = function() {
      return "" + this.firstName + " " + this.lastName;
    };

    return Employee;

  })();

  chris = new Employee(1, 'Chris', 'Hatfield');

  console.log(chris.fullName());

}).call(this);

/*
//@ sourceMappingURL=employee.map
*/
