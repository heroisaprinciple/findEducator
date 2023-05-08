import './App.css';
import axios from "axios";
import Subjects from "./components/subjects";
import { useEffect, useState } from "react";

const API_URL = "http://localhost:3000/api/v1/subjects" // move to env (only host)

function getAPIData() {
    return axios.get(API_URL).then((response) => response.data)
}

function App() {
    const [subjects, setSubjects] = useState([])

    useEffect(() => {
        let mounted = true;
        getAPIData().then((items) => {
            if (mounted) {
                setSubjects(items)
            }
        });
        return () => (mounted = false);
    }, []);

  return (
    <div className="App">
      <h1>Subjects</h1>
        <Subjects subjects={subjects}/>
    </div>
  );
}

export default App;
