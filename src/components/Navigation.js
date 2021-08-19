import { NavLink} from 'react-router-dom';
import './Navigation.css'

const Navigation = () => (
  <nav className="w-full flex align-center justify-center bg-white border-b-2 border-gray-100">
    <div className="wrapper flex justify-between">
      <h1 className="p-4 m-0 text-2xl">Decentragram</h1>
      <ul className="flex">
        <li className="flex p-4"><NavLink exact activeClassName="current" to='/'>Home</NavLink></li>
        <li className="flex p-4"><NavLink exact activeClassName="current" to='/create-post'>Create New Post</NavLink></li>
        <li className="flex p-4"><NavLink exact activeClassName="current" to='/my-posts'>My Posts</NavLink></li>
      </ul>
    </div>
  </nav>
);

export default Navigation;