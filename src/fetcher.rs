use reqwest::{Client, Proxy};
use tokio::time::Instant;

pub struct Fetcher {
    client: Client,
}

impl Fetcher {
    // Constructor to create a new Fetcher instance
    pub fn new() -> Self {
        let proxy = Proxy::all("socks5h://127.0.0.1:9050")
            .expect("tor proxy should be there");
        let client = Client::builder()
            .proxy(proxy)
            .build()
            .expect("should be able to build reqwest client");

        Fetcher { client }
    }

    // The fetch method
    pub async fn fetch<S: Into<String>>(
        &self,
        url: S,
    ) -> Result<String, reqwest::Error> {
        let instant = Instant::now();
        let res = self.client.get(url.into()).send().await?;
        println!("Status: {}, Time: {}", res.status(), instant.elapsed().as_millis());

        let text = res.text().await?;
        Ok(text)
    }
}
