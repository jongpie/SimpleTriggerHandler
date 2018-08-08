/******************************************************************************************************
* This file is part of the Simple Trigger handler project, released under the MIT License.            *
* See LICENSE file or go to https://github.com/jongpie/SimpleTriggerHandler for full license details. *
******************************************************************************************************/
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

    protected virtual void executeBeforeInsert(List<Sobject> newRecords) {}
    protected virtual void executeBeforeUpdate(List<Sobject> updatedRecords, Map<Id, Sobject> updatedRecordsById, List<Sobject> oldRecords, Map<Id, Sobject> oldRecordsById) {}
    protected virtual void executeBeforeDelete(List<Sobject> deletedRecords, Map<Id, Sobject> deletedRecordsById) {}
    protected virtual void executeAfterInsert(List<Sobject> newRecords, Map<Id, Sobject> newRecordsById) {}
    protected virtual void executeAfterUpdate(List<Sobject> updatedRecords, Map<Id, Sobject> updatedRecordsById, List<Sobject> oldRecords, Map<Id, Sobject> oldRecordsById) {}
    protected virtual void executeAfterDelete(List<Sobject> deletedRecords, Map<Id, Sobject> deletedRecordsById) {}
    protected virtual void executeAfterUndelete(List<Sobject> undeletedRecords, Map<Id, Sobject> undeletedRecordsById) {}

}