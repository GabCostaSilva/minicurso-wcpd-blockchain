pragma solidity ^0.4.20;

contract DiaZero {
    
    address comprador;
    address vendedor;
    
    struct Imovel {
        address proprietario;
        uint preco;
        uint matricula;
        bool aVenda;
    }
    
    uint qtdImoveis;
    mapping (uint => Imovel) imoveis;
    
    // constructor
    function DiaZero() public{
        qtdImoveis = 0;
    }
    
    function publicarImovel(uint _preco) public{
        Imovel imovel = imoveis[++qtdImoveis];
        imovel.proprietario = msg.sender;
        imovel.matricula = qtdImoveis;
        imovel.aVenda = true;
        imovel.preco = _preco;
    }
    
    function comprarImovel() public{
        
    }
    
    function consultarProprietario(uint _matricula) view returns (address, uint, uint, bool) {
        Imovel imovel = imoveis[_matricula];
        
        address proprietario = imovel.proprietario;
        uint preco = imovel.preco;
        uint matricula = imovel.matricula;
        bool aVenda = imovel.aVenda;
        
        return (proprietario, preco, matricula, aVenda);
    }
    
}