package lk.ijse.cms.model;

public class StatusCount {
    private int pending;
    private int resolved;
    private int inProgress;
    private int totalCount;

    public StatusCount(int pending, int resolved, int inProgress, int totalCount) {
        this.pending = pending;
        this.resolved = resolved;
        this.inProgress = inProgress;
        this.totalCount = totalCount;
    }

    // Getters and Setters
    public int getPending() {
        return pending;
    }

    public void setPending(int pending) {
        this.pending = pending;
    }

    public int getResolved() {
        return resolved;
    }

    public void setResolved(int resolved) {
        this.resolved = resolved;
    }

    public int getInProgress() {
        return inProgress;
    }

    public void setInProgress(int inProgress) {
        this.inProgress = inProgress;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}