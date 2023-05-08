import React from 'react'

function Subjects(props) {
  return (
    <div>
      <h1>These subjects are from API:</h1>
      {props.subjects.map((subject) => {
        return (
            <div key={subject.id}>
              <p>{subject.name}</p>
            </div>
        )
      })}
    </div>
  )
}

export default Subjects;
