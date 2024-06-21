package com.example.assignment01.specification.donation;

import com.example.assignment01.entity.Donation;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public class DonationSpecification {
    public static Specification<Donation> buildWhere(String search) {
        if (!StringUtils.hasText(search)) {
            return null;
        }

        final String finalSearch = search.trim().toLowerCase();
        final String likePattern = "%" + finalSearch + "%";

        return (root, query, cb) -> cb.or(
                cb.like(cb.lower(root.get("code")), likePattern),
                cb.like(cb.lower(root.get("name")), likePattern),
                cb.like(cb.lower(root.get("organizationName")), likePattern),
                cb.like(cb.lower(root.get("phoneNumber")), likePattern),
                cb.like(cb.lower(root.get("description")), likePattern)
        );
    }
}
