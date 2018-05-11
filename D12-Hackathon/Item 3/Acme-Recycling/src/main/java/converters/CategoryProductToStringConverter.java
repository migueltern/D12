
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.CategoryProduct;

@Component
@Transactional
public class CategoryProductToStringConverter implements Converter<CategoryProduct, String> {

	@Override
	public String convert(final CategoryProduct CategoryProduct) {
		String result;

		if (CategoryProduct == null)
			result = null;
		else
			result = String.valueOf(CategoryProduct.getId());
		return result;
	}
}
