package ti.ga.builders;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;

import android.util.Log;
import android.text.TextUtils;

import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;

public class EventBuilder implements DictionaryBuilderInterface {
    private String LCAT = "ti.ga.EventBuilder";
    private HitBuilders.EventBuilder builder;

    public EventBuilder(KrollDict properties) {
        Log.d(LCAT, "Initializing event builder proxy with a size of "+properties.size());

        this.builder = new HitBuilders.EventBuilder(properties.getString("name"), properties.getString("action"));
    }

    public void addProduct(Product product) {
        this.builder.addProduct(product);
    }

    public void setProductAction(ProductAction action) {
        this.builder.setProductAction(action);
    }

    public void addPromotion(Promotion promotion) {
        this.builder.addPromotion(promotion);
    }

    public void addImpression(Product product, String impressionList) {
        this.builder.addImpression(product, impressionList);
    }

    public Object getNative() {
        return this.builder;
    }
}
