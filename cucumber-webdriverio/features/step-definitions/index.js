var {Given} = require('cucumber');
var {When} = require('cucumber');
var {Then} = require('cucumber');
var {expect} = require('chai');

Given('I go to losestudiantes home screen', () => {
  browser.url('/');
  if($('button=Cerrar').isDisplayed()) {
    $('button=Cerrar').click();
  }
});

When('I open the login screen', () => {
  
  if($('button=Cuenta').isDisplayed()) {
    $('button=Cuenta').click()
    $('Salir').click()
  };
  const btnIngresar = $('button=Ingresar');
  btnIngresar.waitForExist(5000);
  btnIngresar.waitForDisplayed(5000);
  browser.waitUntil(() => btnIngresar.isClickable());
  btnIngresar.click();
});

When('I try to login', () => {
  var cajaLogIn = $('.cajaLogIn');
  cajaLogIn.waitForExist(5000);
  cajaLogIn.$('button=Ingresar').click();
});

When('I try to register', () => {
  var cajaLogIn = $('.cajaSignUp');
  cajaLogIn.waitForExist(5000);
  cajaLogIn.$('button=Registrarse').click();
});

Then('I expect to not be able to login', () => {
  $('.aviso.alert.alert-danger').waitForDisplayed(5000);
});

/*When(/^I fill with (.*) and (.*)$/ , (email, password) => {
  var cajaLogIn = $('.cajaLogIn');

 var mailInput = cajaLogIn.$('input[name="correo"]');
 mailInput.click();
 mailInput.keys(email);

 var passwordInput = cajaLogIn.$('input[name="password"]');
 passwordInput.click();
 passwordInput.keys(password)
});*/

When(/^I fill with the (.*), (.*), (.*), (.*), (.*), (.*) and (.*)$/ , (nombre, apellido, correo, universidad, departamento, programa, contraseña) => {
   var cajaSignUp = $('.cajaSignUp');
   cajaSignUp.waitForExist(9000);
   cajaSignUp.waitForDisplayed(9000);

   var nombreInput = cajaSignUp.$('input[name="nombre"]');
   nombreInput.waitForExist(8000);
   nombreInput.click();
   nombreInput.keys(nombre);

   var apellidoInput = cajaSignUp.$('input[name="apellido"]');
   apellidoInput.click();
   apellidoInput.keys(apellido)

   var correoInput = cajaSignUp.$('input[name="correo"]');
   correoInput.click();
   correoInput.keys(correo)

   if(programa != ''){
     var acepta = cajaSignUp.$('label=Estudio una maestria');
     acepta.waitForExist(5000);
     acepta.click();
   }

   var universidadInput = cajaSignUp.$('select[name="idUniversidad"]');
   universidadInput.click();
   universidadInput.keys(universidad);
   universidadInput.click();


   if(programa != ''){
     var programaInput = cajaSignUp.$('select[name="idPrograma"]');
     programaInput.click();
     programaInput.keys(programa)
   }

   if(departamento != ''){
     var departamentoInput = cajaSignUp.$('select[name="idDepartamento"]');
     departamentoInput.waitForExist(5000);
     departamentoInput.click();
     departamentoInput.keys(departamento)
   }

   var passwordInput = cajaSignUp.$('input[name="password"]');
   passwordInput.click();
   passwordInput.keys(contraseña)
});

When('I accept terms and conditions', () => {
  var cajaSignUp = $('.cajaSignUp');

  var acepta = cajaSignUp.$('input[name="acepta"]');
  acepta.click();
});

Then('I expect to see {string}', error => {
   $('.aviso.alert.alert-danger').waitForDisplayed(8000);
   var alertText = browser.$('.aviso.alert.alert-danger').getText();
   expect(alertText).to.include(error);
});

Then('I expect to see error input', () => {
  $('.glyphicon.glyphicon-remove.form-control-feedback').waitForDisplayed(5000);
});

Then('I expect to see login success', () => {
 browser.$('button=Cuenta').isDisplayed(5000);
});

Then('I expect to register me', () => {
  browser.$('button=Cuenta').isDisplayed();
});
