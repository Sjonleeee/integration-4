import { useState } from 'react'
import { useLoaderData } from 'react-router-dom'
import { getProducts } from '../js/designs.js'

export async function loader() {
  console.log('This is the root loader')
  const result = await getProducts()
  return result
}

export default function LastCollection() {
  const lastCollection = useLoaderData()
  const [cartItems, setCartItems] = useState([])

  const addToCart = (item) => {
    const existingItem = cartItems.find((cartItem) => cartItem.id === item.id)

    if (existingItem) {
      // If the item already exists in the cart, update its quantity
      const updatedCartItems = cartItems.map((cartItem) =>
        cartItem.id === item.id
          ? { ...cartItem, quantity: cartItem.quantity + 1 }
          : cartItem,
      )
      setCartItems(updatedCartItems)
    } else {
      // If the item does not exist in the cart, add it with a quantity of 1
      setCartItems([...cartItems, { ...item, quantity: 1 }])
    }
  }

  const removeFromCart = (itemId) => {
    const updatedCartItems = cartItems
      .map((item) => {
        if (item.id === itemId) {
          // If the item matches the removed item, decrease its quantity by 1
          return {
            ...item,
            quantity: item.quantity - 1,
          }
        }
        return item
      })
      .filter((item) => item.quantity > 0) // Remove items with quantity 0

    setCartItems(updatedCartItems)
  }

  return (
    <div>
      <h1>SubmitPage</h1>
      {lastCollection.map((item) => (
        <div key={item.id}>
          <p>title: {item.title}</p>
          <p>designAuthor: {item.designAuthor}</p>
          <p>story: {item.story}</p>
          <p>Price: {item.defaultPrice} euro</p>

          <img src={item.productImage[0].url} width={100} />

          <button onClick={() => addToCart(item)}>Add to Cart</button>
        </div>
      ))}

      <div>
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.title} - {item.defaultPrice} euro (x{item.quantity})
              <p>Made by {item.designAuthor}</p>
              <p>story: {item.story}</p>
              <img src={item.productImage[0].url} width={100} />
              <button onClick={() => removeFromCart(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      </div>
    </div>
  )
}


// import { useLoaderData } from 'react-router-dom'
// import { getProducts } from '../js/designs.js'
// import { useState } from 'react'

// export async function loader() {
//   console.log('This is the root loader')
//   const result = await getProducts()
//   return result
// }

// export default function LastCollection() {
//   const lastCollection = useLoaderData()
//   const [cartItems, setCartItems] = useState([])

//   const addToCart = (item) => {
//     setCartItems((prevCartItems) => [...prevCartItems, item])
//     console.log(`Added ${item.title} to the cart.`)
//   }

//   return (
//     <div>
//       <h1>SubmitPage</h1>
//       {lastCollection.map((item) => (
//         <div key={item.id}>
//           <p> title: {item.title}</p>
//           <p> designAuthor: {item.designAuthor}</p>
//           <p> story: {item.story}</p>
//           <p> Price: {item.defaultPrice} euro</p>

//           <img src={item.productImage[0].url} width={100} />

//           <button onClick={() => addToCart(item)}>Add to cart</button>
//         </div>
//       ))}
//     </div>
//   )
// }
