
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.CategoryMaterial;

@Component
@Transactional
public class CategoryMaterialToStringConverter implements Converter<CategoryMaterial, String> {

	@Override
	public String convert(final CategoryMaterial CategoryMaterial) {
		String result;

		if (CategoryMaterial == null)
			result = null;
		else
			result = String.valueOf(CategoryMaterial.getId());
		return result;
	}
}
