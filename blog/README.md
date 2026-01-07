# Blog Articles

This folder contains all blog articles for your portfolio website.

## How to Add a New Blog Post

### 1. Create a New HTML File

Copy the `post-template.html` file and rename it (e.g., `my-article-title.html`).

### 2. Update the Article Content

Edit your new file and update:
- `<title>` tag
- `<meta name="description">` tag
- `.blog-post-title` - Your article title
- `.blog-post-meta` - Date and tags
- `.blog-post-content` - Your article content

### 3. Add the Article to blog.html

Open `/blog.html` and uncomment the blog card example, then update:
- Date
- Tags
- Title
- Excerpt
- Link to your new article file

Example:
```html
<article class="blog-card">
    <div class="blog-card-header">
        <span class="blog-date">January 15, 2025</span>
        <div class="blog-tags">
            <span class="blog-tag">.NET</span>
            <span class="blog-tag">Clean Architecture</span>
        </div>
    </div>
    <h2 class="blog-card-title">
        <a href="blog/my-article-title.html">My Article Title</a>
    </h2>
    <p class="blog-card-excerpt">
        A brief summary of your blog post...
    </p>
    <a href="blog/my-article-title.html" class="blog-read-more">Read more →</a>
</article>
```

### 4. Remove the Empty State

Once you have your first article, remove or comment out the `.blog-empty-state` div in `blog.html`.

## Writing Tips

- Keep titles concise and descriptive
- Write a compelling excerpt (2-3 sentences)
- Use appropriate tags to categorize your content
- Include code examples when relevant
- Add images or diagrams if helpful (place in `/blog/images/` folder)

## Supported Content

The blog template supports:
- Headings (h2, h3)
- Paragraphs
- Lists (ul, ol)
- Code blocks (inline and multi-line)
- Links
- Images

For code syntax highlighting, consider adding a library like Prism.js or highlight.js.
