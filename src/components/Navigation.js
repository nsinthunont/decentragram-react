import { NavLink} from 'react-router-dom';


const Navigation = () => (
  <nav className="max-w-full">
    <ul>
      <li className="flex"><NavLink exact activeClassName="current" to='/'>Home</NavLink></li>
      <li><NavLink exact activeClassName="current" to='/about'>About</NavLink></li>
      <li><NavLink exact activeClassName="current" to='/contact'>Contact</NavLink></li>
    </ul>
  </nav>
);

export default Navigation;