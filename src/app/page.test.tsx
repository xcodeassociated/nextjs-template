import '@testing-library/jest-dom'
import { render, screen, waitFor } from '@testing-library/react'
import Page from '../app/page'

describe('Page', () => {
  it('renders', async () => {
    render(<Page />)

    await waitFor(() => {
      expect(screen.getByText(/test-softeno/i)).toBeInTheDocument()
    })
  })
  it('some logic', () => {
    expect(1).toEqual(1)
  })
})
