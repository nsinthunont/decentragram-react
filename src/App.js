import logo from './logo.svg';
import React from 'react';
import Navigation from './components/Navigation.js';
import Home from './components/Home.js';
import About from './components/About.js';
import Contact from './components/Contact.js';
import './App.css';
import { Switch, Route } from 'react-router-dom';

function App(){
  return (
    <div className='app'>
      <Navigation />
      <Switch>
        <Route exact path='/' component={Home}></Route>
        <Route exact path='/about' component={About}></Route>
        <Route exact path='/contact' component={Contact}></Route>
      </Switch>
    </div>
  )
};




export default App;
