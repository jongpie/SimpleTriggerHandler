public abstract class TriggerHandler {

    public void execute() {
        switch on Trigger.operationType {
            when BEFORE_INSERT  { this.executeBeforeInsert(Trigger.new); }
            when BEFORE_UPDATE  { this.executeBeforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap); }
            when BEFORE_DELETE  { this.executeBeforeDelete(Trigger.old, Trigger.oldMap); }
            when AFTER_INSERT   { this.executeAfterInsert(Trigger.new, Trigger.newMap); }
            when AFTER_UPDATE   { this.executeAfterUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap); }
            when AFTER_DELETE   { this.executeAfterDelete(Trigger.old, Trigger.oldMap); }
            when AFTER_UNDELETE { this.executeAfterUndelete(Trigger.new, Trigger.newMap); }
        }
    }

    protected virtual void executeBeforeInsert(List<Sobject> newRecordList) {}
    protected virtual void executeBeforeUpdate(List<Sobject> updatedRecordList, Map<Id, Sobject> updatedRecordMap, List<Sobject> oldRecordList, Map<Id, Sobject> oldRecordMap) {}
    protected virtual void executeBeforeDelete(List<Sobject> deletedRecordList, Map<Id, Sobject> deletedRecordMap) {}
    protected virtual void executeAfterInsert(List<Sobject> newRecordList, Map<Id, Sobject> newRecordMap) {}
    protected virtual void executeAfterUpdate(List<Sobject> updatedRecordList, Map<Id, Sobject> updatedRecordMap, List<Sobject> oldRecordList, Map<Id, Sobject> oldRecordMap) {}
    protected virtual void executeAfterDelete(List<Sobject> deletedRecordList, Map<Id, Sobject> deletedRecordMap) {}
    protected virtual void executeAfterUndelete(List<Sobject> undeletedRecordList, Map<Id, Sobject> undeletedRecordMap) {}

}