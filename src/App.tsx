import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';
import { Produto } from './produto.model';

function App() {
  const [produtos, setProdutos] = useState<Array<Produto>>([
    { id: 23, nome: 'Produto teste' }
  ])

  const [novoProduto, setNovoProduto] = useState('')

  function add(): void {
    setProdutos([...produtos, { id: produtos.length + 1, nome: novoProduto }])
    setNovoProduto('')
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

        <div>
          <input type="text"
            value={novoProduto}
            onChange={e => setNovoProduto(e.target.value)}
            onKeyPress={e => e.key === 'Enter' && add()} />
          <button onClick={add}>Add</button>
        </div>

        <ul>
          {produtos.map(produto => (
            <li key={produto.id}>{produto.nome}</li>
          ))}
        </ul>
      </header>
    </div>
  );
}

export default App;
