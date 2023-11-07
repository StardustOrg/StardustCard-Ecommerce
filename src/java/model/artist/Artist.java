/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.artist;

/**
 *
 * @author Yanna
 */
public class Artist {

    private long id;
    private long groupId;
    private String name;
    private String iconURL;
    private String coverURL;

    public Artist() {
    }

    public Artist(long id, String name, String iconURL, String coverURL, long groupId) {
        this.id = id;
        this.name = name;
        this.iconURL = iconURL;
        this.coverURL = coverURL;
        this.groupId = groupId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getGroupId() {
        return groupId;
    }

    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return iconURL;
    }

    public void setIcon(String iconURL) {
        this.iconURL = iconURL;
    }
    
    public String getCover() {
        return coverURL;
    }
    
    public void setCover(String coverURL) {
        this.coverURL = coverURL;
    }

}
