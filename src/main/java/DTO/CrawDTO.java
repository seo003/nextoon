package DTO;

public class CrawDTO {
	private String crawTitle;
	private String crawAuthor;
	private String crawWeek;
	private String crawGenre;
	private String crawSummary;
	private String crawUrl;

	public String getCrawTitle() {
		return crawTitle;
	}

	public void setCrawTitle(String crawTitle) {
		this.crawTitle = crawTitle;
	}

	public String getCrawAuthor() {
		return crawAuthor;
	}

	public void setCrawAuthor(String crawAuthor) {
		this.crawAuthor = crawAuthor;
	}

	public String getCrawWeek() {
		return crawWeek;
	}

	public void setCrawWeek(String crawWeek) {
		this.crawWeek = crawWeek;
	}

	public String getCrawGenre() {
		return crawGenre;
	}

	public void setCrawGenre(String crawGenre) {
		this.crawGenre = crawGenre;
	}

	public String getCrawSummary() {
		return crawSummary;
	}

	public void setCrawSummary(String crawSummary) {
		this.crawSummary = crawSummary;
	}

	public String getCrawUrl() {
		return crawUrl;
	}

	public void setCrawUrl(String crawUrl) {
		this.crawUrl = crawUrl;
	}

	@Override
	public String toString() {
		return "crawTitle=" + crawTitle + " crawAuthor=" + crawAuthor + " crawWeek=" + crawWeek + " crawGenre="
				+ crawGenre + " crawSummary=" + crawSummary + " crawUrl=" + crawUrl;
	}
}
