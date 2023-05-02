import React from 'react'

function Users(props) {
  return (
    <div>
      <h1>These users are from API:</h1>
      {props.users.map((user) => {
        return (
            <div key={user.id}>
              <p>{user.name}</p>
            </div>
        )
      })}
    </div>
  )
}

export default Users;
