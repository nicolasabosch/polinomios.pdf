pragma solidity ^0.8.12;

contract Estudiantes{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;
    string[] private _Materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre =nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function nombre_completo() public view returns(string memory){
        return string.concat(_nombre, " ", _apellido);
    }

    function apellido() public view returns(string memory){
        return _apellido;
    }

    function curso() public view returns(string memory){
        return _curso;
    }

    function set_nota_materia(string memory materia , uint nota) public{
        require(msg.sender == _docente, "Este valor solo lo puede modificar el docente");
        _notas_materias[materia] = nota;
        _Materias.push(materia);

    }

    function nota_materia(string memory materia)public view returns(uint){
        return _notas_materias[materia];
 
    }

  

    function aprobo(string memory materia)public view returns(bool){
        if (_notas_materias[materia] >= 60 && _notas_materias[materia] <= 100){
            
            return true;
        } 
        return false;
         
        }


    function promedio()public view returns(uint)
    {
    uint _promedio = 0;

    for(uint i = 0; i < _Materias.length ; i++)
    {
         _promedio += _notas_materias[_Materias[i]];


    }
    return _promedio / _Materias.length;
    }
