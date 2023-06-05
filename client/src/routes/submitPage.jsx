import { useLoaderData } from 'react-router-dom'
import Dropzone from '../components/dropzone'

// import { getDesigns } from '../js/designs'

// // Loader
export const loader = async () => {
  console.log('This is the root loader')
  // const result = await getDesigns();
  return
}

export default function SubmitPage() {
  const data = useLoaderData()
  const design = data.map((design) => ({
    ...design,
  }))
  console.log(data)
  return (
    <section className="section">
      <div className="container">
        <h1 className="title">Submit a Design</h1>
        <Dropzone />
      </div>
    </section>
  )
}
