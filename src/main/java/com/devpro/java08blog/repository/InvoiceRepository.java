/*
 *@author Admin
 *@date Mar 9, 2020
*/
package com.devpro.java08blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer>{

}
