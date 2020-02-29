Feature: Register into losestudiantes
    As an user I want to authenticate myself within losestudiantes website in order to rate teachers

Scenario Outline: Register failed with wrong inputs

    Given I go to losestudiantes home screen
      When I open the login screen
      And I fill with the <nombre>, <apellido>, <correo>, <universidad>, <departamento>, <programa>, <contraseña>
      And I accept terms and conditions
      And I try to register
      Then I expect to see <error>

      Examples:
      | nombre  | apellido | correo          | universidad                 | departamento | programa | contraseña | error |
      |         |     |    |     |  | |  | "Ingresa tu correo" |
      | Leo | Lopez | l@mail.com | Universidad del Rosario | Estudios Universitarios en Ciencias Sociales | |  | "Ingresa una contraseña" |
      | Leo | Lopez | l@mail.com | Universidad Nacional | | Maestría en Bioinformática | 1234 | "La contraseña debe ser al menos de 8 caracteres" |
      | Leo | Lopez | l | Universidad Nacional | | Maestría en Bioinformática | 1234 | "Ingresa un correo valido" |

Scenario Outline: Register failed by unchecked terms and conditions

      Given I go to losestudiantes home screen
        When I open the login screen
        And I fill with the <nombre>, <apellido>, <correo>, <universidad>, <departamento>, <programa>, <contraseña>
        And I try to register
        Then I expect to see <error>

        Examples:
        | nombre  | apellido | correo          | universidad                 | departamento | programa | contraseña | error |
        | Leo | Lopez | l@mail.com | Universidad del Rosario | Estudios Universitarios en Ciencias Sociales | | 12345678 | "Debes aceptar los términos y condiciones" |

Scenario Outline: Register failed with wrong inputs

    Given I go to losestudiantes home screen
      When I open the login screen
      And I fill with the <nombre>, <apellido>, <correo>, <universidad>, <departamento>, <programa>, <contraseña>
      And I accept terms and conditions
      And I try to register
      Then I expect to see error input

      Examples:
      | nombre  | apellido | correo          | universidad                 | departamento | programa | contraseña |
      |  | Lopez | l@mail.com | Universidad del Rosario | Estudios Universitarios en Ciencias Sociales | | 12345678 |
      | Leo |  | l@mail.com | Universidad del Rosario | Estudios Universitarios en Ciencias Sociales | | 12345678 |
      | Leo | Lopez | l@mail.com | Universidad del Rosario | | | 12345678 |

Scenario Outline: Register failed with existed user

      Given I go to losestudiantes home screen
        When I open the login screen
        And I fill with the <nombre>, <apellido>, <correo>, <universidad>, <departamento>, <programa>, <contraseña>
        And I accept terms and conditions
        And I try to register
        Then I expect to see this <error>

        Examples:
        | nombre      | apellido | correo          | universidad                      | departamento      | programa              | contraseña    | error |
        | Deisy       | Macias | dt.macias@uniandes.edu.co  | Universidad Nacional             | | Maestría en Bioinformática | 123456789  | "Error: Ya existe un"|

Scenario Outline: Register student success

    Given I go to losestudiantes home screen
       When I open the login screen
       And I fill with the <nombre>, <apellido>, <correo>, <universidad>, <departamento>, <programa>, <contraseña>
       And I accept terms and conditions
       And I try to register
       Then I expect to see login success

      Examples:
      | nombre      | apellido | correo          | universidad                      | departamento      | programa              | contraseña    |
      | Maria       | Cardenas | v2@mail.com   | Universidad Nacional             |                   | Maestría en Bioinformática | 123456789  |
      | Tati        | Lopez    | r2@mail.com   | Pontificia Universidad Javeriana | Dpto Comunicación |            | 123456789  |
