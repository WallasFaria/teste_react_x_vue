import React from 'react';
import logo from './logo.svg';
import './App.css';
import { Produto } from './produto.model';

function App() {
  const p: Produto = { id: 23, nome: 'Produto teste' }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
          <br />
          {p.nome}, id: {p.id}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
