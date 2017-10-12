/**
 * Close the bidding for a vehicle listing and choose the
 * highest bid that is over the asking price
 * @param {org.idb.medrec.UpdateHealthSheet} healthSheetRecord - the closeBidding transaction
 * @transaction
 */
function updateHealthSheet(updateHealthSheet) {
    return getAssetRegistry('org.idb.medrec.HealthSheet')
        .then(function(healthSheetRegistry) {
            return healthSheetRegistry.update(updateHealthSheet.healthSheet);
        }).then(function(){
            var factory = getFactory();

            var basicEvent = factory.newEvent('org.idb.medrec', 'UpdateHealthSheetEvent');
            basicEvent.healthSheet = updateHealthSheet.healthSheet;
            emit(basicEvent);
        });
}