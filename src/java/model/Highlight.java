/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author joaov
 */
public class Highlight {

    private String highlightTitle;
    private String highlightDescription;
    private String typeClass;

    public Highlight(String highlightTitle, String highlightDescription, String typeClass) {
        this.highlightTitle = highlightTitle;
        this.highlightDescription = highlightDescription;
        this.typeClass = typeClass;
    }

    public String getHighlightTitle() {
        return highlightTitle;
    }

    public void setHighlightTitle(String highlightTitle) {
        this.highlightTitle = highlightTitle;
    }

    public String getHighlightDescription() {
        return highlightDescription;
    }

    public void setHighlightDescription(String highlightDescription) {
        this.highlightDescription = highlightDescription;
    }

    public String getTypeClass() {
        return typeClass;
    }

    public void setTypeClass(String typeClass) {
        this.typeClass = typeClass;
    }

}
